using UnityEngine;
using System.Collections;

public class CylinderMovement : MonoBehaviour 
{
	public Transform pivot;

	public float movementSpeed;

	Vector2 movementDirection;
	Direction controlDirection;

	WaypointScript currentWaypoint = null;

	bool canCollide = true;

	PlayerController player;
	Animator anim;

	public Direction currentDirection;

	void OnTriggerStay(Collider other)
	{
		if (!this.enabled)
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
		
		canCollide = true;
	}

	void Collide(Collider other)
	{
		//Debug.Log("Hit Waypoint");

		currentWaypoint = other.GetComponent<WaypointScript>();
		transform.position = currentWaypoint.transform.position;
	}

	void Start()
	{
		this.player = GetComponent<PlayerController>();

		GameObject charSprite = transform.GetChild(0).FindChild("Character Sprite").gameObject;
		anim = charSprite.GetComponent<Animator>();
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
				Move(movementDirection);
				AnimateMove(dir);
			}
			else if (dir == controlDirection.Opposite())
			{
				//Debug.Log("Moving Backwards");
				canCollide = true;
				Move(-movementDirection);
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

		float radialSpeed = movementSpeed / radius;

		transform.RotateAround(this.pivot.position, Vector3.up, radialSpeed * direction.x * Mathf.Rad2Deg);
		transform.Translate(new Vector3(0, direction.y * this.movementSpeed, 0));
	}
}
