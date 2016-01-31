using UnityEngine;
using System.Collections;
using DG.Tweening;

public class CylinderMovement : MonoBehaviour 
{
	public Transform pivot;

	public float upDownSpeed = 0.08f, leftRightSpeed = 0.04f;

	Vector2 movementDirection;
	Direction controlDirection;

	public WaypointScript currentWaypoint = null;

	public WaypointScript waypointQuickFix = null;

	bool canCollide = true;

	PlayerController player;
	Animator anim;

	public Direction currentDirection;

	SoundController soundController;

	Transform ballTransform;
	BallInteraction ballInteraction;
	CameraController cameraController;

	bool shouldTeleport;

	void Start()
	{
		this.player = GetComponent<PlayerController>();
		this.soundController = GetComponent<SoundController>();
		this.ballTransform = GameObject.FindWithTag("Ball").transform;
		this.ballInteraction = GetComponent<BallInteraction>();
		this.cameraController = Camera.main.GetComponent<CameraController>();

		GameObject charSprite = transform.GetChild(0).FindChild("Character Sprite").gameObject;
		anim = charSprite.GetComponent<Animator>();
	}

	void OnTriggerEnter(Collider other)
	{
		if (!this.enabled)
			return;

		WaypointScript waypoint = other.GetComponent<WaypointScript>();

		if (!waypoint)
			return;

		waypointQuickFix = waypoint;
	}

	void OnTriggerStay(Collider other)
	{
		if (!this.enabled)
			return;

		WaypointScript waypoint = other.GetComponent<WaypointScript>();

		if (!waypoint)
			return;

		if (canCollide)
		{
			float distance = (other.transform.position - transform.position).magnitude;

			if (distance < 0.1f)
			{
				Collide(other);
				canCollide = false;
			}
		}
	}

	void OnTriggerExit(Collider other)
	{
		if (!this.enabled)
			return;

		waypointQuickFix = null;
		
		canCollide = true;
	}

	void Collide(Collider other)
	{
		//Debug.Log("Hit Waypoint");

		currentWaypoint = other.GetComponent<WaypointScript>();
		transform.position = currentWaypoint.transform.position;

		if (currentWaypoint.isGem)
		{
			shouldTeleport = true;
		}
	}

	void LateUpdate()
	{
		if (shouldTeleport)
		{
			anim.SetBool("Walking", false);
			anim.SetBool("Climbing", false);

			player.movementType = MovementType.None;
			this.cameraController.cameraMode = CameraMode.Manual;

			Sequence seq = DOTween.Sequence();
			seq.Append(this.cameraController.GetComponent<Camera>().DOShakePosition(2.0f, 2, 20));
			seq.AppendCallback(() => {
				player.transform.position = ballTransform.position - ballInteraction.dropOffset;
				player.transform.GetChild(0).localScale = Vector3.one;
				player.transform.localEulerAngles = Vector3.zero;

				anim.SetTrigger("ReturnedToGround");

				this.cameraController.cameraMode = CameraMode.AboveGround;
				player.movementType = MovementType.Normal;

				GameObject.Find("GameState").GetComponent<GameState>().gemsCollected++;

				ballInteraction.lastTrigger.GetComponent<MeshCollider>().enabled = false;
				ballInteraction.lastTrigger.AnimateHiding();
			});

			soundController.PlayTeleport();

			shouldTeleport = false;
		}
	}

	Direction GetInputDirection()
	{
		Direction dir = Direction.None;

		if (Input.GetKey("up") || Input.GetKey("w"))
			dir = Direction.Up;
		else if (Input.GetKey("down") || Input.GetKey("s"))
			dir = Direction.Down;
		else if (Input.GetKey("left") || Input.GetKey("a"))
			dir = Direction.Left;
		else if (Input.GetKey("right") || Input.GetKey("d"))
			dir = Direction.Right;

		return dir;
	}

	void FixedUpdate()
	{
		Direction dir = GetInputDirection();

		if (waypointQuickFix && waypointQuickFix.leftTarget && waypointQuickFix.rightTarget && waypointQuickFix.upTarget && dir == Direction.Up)
		{
			transform.position = waypointQuickFix.transform.position;
			currentWaypoint = waypointQuickFix;
			waypointQuickFix = null;
		}
		else if (waypointQuickFix && waypointQuickFix.leftTarget && waypointQuickFix.rightTarget && waypointQuickFix.downTarget && dir == Direction.Down)
		{
			transform.position = waypointQuickFix.transform.position;
			currentWaypoint = waypointQuickFix;
			waypointQuickFix = null;
		}

		if (currentWaypoint != null)
		{
			if (dir != Direction.None)
			{
				if (dir == Direction.Up && currentWaypoint.upExit)
				{
					this.player.ExitUnderground(currentWaypoint.upExit);
				}

				Vector2 possibleDirection = currentWaypoint.GetDirection(dir);

				if (possibleDirection != Vector2.zero)
				{
					//Debug.Log("Leaving Waypoint");

					if (dir == Direction.Up || dir == Direction.Down)
					{
						transform.localScale = new Vector3(currentWaypoint.ropeOnLeft ? 1 : -1, 1, 1);
					}

					movementDirection = possibleDirection;
					controlDirection = dir;
					currentWaypoint = null;
				}
			}
		}

		if (currentWaypoint == null && dir != Direction.None)
		{
			if (dir == controlDirection)
			{
				//Debug.Log("Moving Fowards");

				if (dir == Direction.Up || dir == Direction.Down)
					Move(movementDirection * upDownSpeed);
				else
					Move(movementDirection * leftRightSpeed);
				
				AnimateMove(dir);
			}
			else if (dir == controlDirection.Opposite())
			{
				//Debug.Log("Moving Backwards");
				canCollide = true;

				if (dir == Direction.Up || dir == Direction.Down)
					Move(-movementDirection * upDownSpeed);
				else
					Move(-movementDirection * leftRightSpeed);

				AnimateMove(dir);
			}
		}

		if (dir == Direction.None)
		{
			AnimateMove(dir);
		}
	}

	void AnimateMove(Direction dir)
	{
		this.currentDirection = dir;

		if (dir == Direction.Up)
		{
			anim.SetBool("Walking", false);
			anim.SetBool("Climbing", true);
			anim.SetBool("ClimbingUp", true);
		}
		else if (dir == Direction.Down)
		{
			anim.SetBool("Walking", false);
			anim.SetBool("Climbing", true);
			anim.SetBool("ClimbingUp", false);
		}
		else if (dir == Direction.Left)
		{
			anim.SetBool("Climbing", false);
			anim.SetBool("Walking", true);
			transform.localScale = new Vector3(-1, 1, 1);
		}
		else if (dir == Direction.Right)
		{
			anim.SetBool("Climbing", false);
			anim.SetBool("Walking", true);
			transform.localScale = new Vector3(1, 1, 1);
		}
		else
		{
			anim.SetBool("Climbing", false);
			anim.SetBool("Walking", false);
		}
	}

	void Move(Vector2 direction)
	{
		float radius = pivot.localScale.x / 2;

		float radialSpeed = 1.0f / radius;

		transform.RotateAround(this.pivot.position, Vector3.up, radialSpeed * direction.x * Mathf.Rad2Deg);
		transform.Translate(new Vector3(0, direction.y, 0));
	}
}
