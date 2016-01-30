using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using DG.Tweening;

public class BallInteraction : MonoBehaviour 
{
	GameObject ball;
	Animator anim;
	PlayerController player;
	CylinderController cylinderController;

	public Text pickupText;
	public Text dropText;

	public Vector3 dropOffset;

	bool _canPickup = false;
	bool canPickup
	{
		set
		{
			_canPickup = value;
			this.pickupText.enabled = value;
		}

		get { return _canPickup; }
	}
		
	bool carryingBall;

	void PutDownRock()
	{
		carryingBall = false;
		this.dropText.enabled = false;
		player.movementType = MovementType.None;
		anim.SetTrigger("PutDownRock");
	}

	public void PutDownRockAlmost()
	{
		//todo temp!!!
		if (carryingBall)
			return;
		
		Vector3 newPos = ball.transform.position;
		newPos.x = transform.position.x;
		newPos.z = transform.position.z;

		if (transform.localScale.x > 0)
			newPos += dropOffset;
		else
			newPos -= dropOffset;
		
		ball.transform.position = newPos;

		ball.SetActive(true);

		cylinderController.enabled = false;

		Sequence seq = DOTween.Sequence();
		seq.Append(cylinderController.transform.DOMove(new Vector3(ball.transform.position.x, 0, ball.transform.position.z), 0.5f));
		seq.AppendCallback(() => {
			cylinderController.enabled = true;
		});
	}

	public void PutDownRockCompletion()
	{
		player.movementType = MovementType.Normal;
	}

	void PickUpRock()
	{
		// Snap to rock
		transform.position = new Vector3(ball.transform.position.x, transform.position.y, ball.transform.position.z);

		player.movementType = MovementType.None;

		anim.SetTrigger("PickUpRock");
		ball.SetActive(false);
		canPickup = false;
		carryingBall = true;
	}

	public void PickUpRockCompletion()
	{
		player.movementType = MovementType.Normal;
		this.dropText.enabled = true;
	}

	void Start()
	{
		this.ball = GameObject.FindWithTag("Ball");
		this.player = GetComponent<PlayerController>();
		this.cylinderController = GameObject.Find("Cylinders").GetComponent<CylinderController>();

		GameObject charSprite = transform.FindChild("Character Sprite").gameObject;
		anim = charSprite.GetComponent<Animator>();
	}

	void Update()
	{
		if (Input.GetKeyDown("e") && player.movementType == MovementType.Normal)
		{
			if (canPickup)
			{
				PickUpRock();
			}
			else if (carryingBall)
			{
				PutDownRock();
			}
		}
	}
	
	void OnTriggerEnter(Collider col)
	{
		if (col.tag == "Ball" && !carryingBall)
		{
			canPickup = true;
		}
	}

	void OnTriggerStay(Collider col)
	{
		if (col.tag == "Ball" && !carryingBall)
		{
			canPickup = true;
		}
	}

	void OnTriggerExit(Collider col)
	{
		if (col.tag == "Ball" && !carryingBall)
		{
			canPickup = false;
		}
	}
}
