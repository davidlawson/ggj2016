using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class BallInteraction : MonoBehaviour 
{
	GameObject ball;
	Animator anim;
	PlayerController player;

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

	bool _carryingBall;
	bool carryingBall
	{
		get { return _carryingBall; }
		set
		{
			_carryingBall = value;
			this.dropText.enabled = _carryingBall;
		}
	}

	void PutRockDown()
	{
		carryingBall = false;
		player.movementType = MovementType.None;
		anim.SetTrigger("PutRockDown");
	}

	public void PutRockDownCompletion()
	{
		player.movementType = MovementType.Normal;

		Vector3 newPos = ball.transform.position;
		newPos.x = transform.position.x;
		newPos.z = transform.position.z;
		newPos += dropOffset;
		ball.transform.position = newPos;

		ball.SetActive(true);
	}

	void PickUpRock()
	{
		ball.SetActive(false);
		canPickup = false;
		carryingBall = true;
	}

	void Start()
	{
		this.ball = GameObject.FindWithTag("Ball");
		this.player = GetComponent<PlayerController>();

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
				PutRockDown();
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
