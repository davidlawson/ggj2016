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

	SoundController soundController;

	public UndergroundTrigger lastTrigger;
	public UndergroundTrigger insideTrigger;

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
		
	public bool carryingBall;

	void Start()
	{
		this.ball = GameObject.FindWithTag("Ball");
		this.player = GetComponent<PlayerController>();
		this.cylinderController = GameObject.Find("Cylinders").GetComponent<CylinderController>();
		this.soundController = GetComponent<SoundController>();

		GameObject charSprite = transform.GetChild(0).FindChild("Character Sprite").gameObject;
		anim = charSprite.GetComponent<Animator>();
	}

	void PutDownRock()
	{
		soundController.PlayPutDownBall();

		carryingBall = false;
		this.dropText.enabled = false;
		player.movementType = MovementType.None;
		anim.SetTrigger("PutDownRock");

		Vector3 newPos = ball.transform.position;
		newPos.x = transform.position.x;
		newPos.y = cylinderController.transform.position.y;
		newPos.z = transform.position.z;

		Vector3 offset;

		if (transform.localScale.x > 0)
			offset = dropOffset;
		else
			offset = -dropOffset;

		newPos += offset;

		cylinderController.enabled = false;
		cylinderController.transform.DOMove(newPos, 1.0f);
	}

	public void PutDownRockAlmost()
	{
		Vector3 newPos = ball.transform.position;
		newPos.x = transform.position.x;
		newPos.z = transform.position.z;

		Vector3 offset;

		if (transform.localScale.x > 0)
			offset = dropOffset;
		else
			offset = -dropOffset;

		newPos += offset;
		
		ball.transform.position = newPos;

		ball.SetActive(true);

		cylinderController.enabled = true;
		transform.DOMove(transform.position - offset, 0.5f);

		if (insideTrigger != null)
		{
			insideTrigger.AnimateReveal();
		}
	}

	public void PutDownRockCompletion()
	{
		player.movementType = MovementType.Normal;
	}

	void PickUpRock()
	{
		soundController.PlayPickupBall();

		// quick fix glitch eyes flashing
		player.ShowMovingEyes(false);

		// Snap to rock
		transform.position = new Vector3(ball.transform.position.x, transform.position.y, ball.transform.position.z);

		player.movementType = MovementType.None;

		anim.SetTrigger("PickUpRock");
		ball.SetActive(false);
		canPickup = false;
		carryingBall = true;

		if (insideTrigger != null)
		{
			insideTrigger.AnimateHiding();
		}
	}

	public void PickUpRockCompletion()
	{
		player.movementType = MovementType.Normal;
		this.dropText.enabled = true;
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

		UndergroundTrigger trig = col.GetComponent<UndergroundTrigger>();
		if (trig)
		{
			insideTrigger = trig;
			lastTrigger = trig;
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

		UndergroundTrigger trig = col.GetComponent<UndergroundTrigger>();
		if (trig)
			insideTrigger = null;
	}
}
