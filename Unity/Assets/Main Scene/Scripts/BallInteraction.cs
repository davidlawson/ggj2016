using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class BallInteraction : MonoBehaviour 
{
	GameObject ball;

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

			//ball.GetComponentInChildren<SpriteRenderer>().enabled = !_carryingBall;
			ball.SetActive(!_carryingBall);

			if (!_carryingBall)
			{
				Vector3 newPos = ball.transform.position;
				newPos.x = transform.position.x;
				newPos.z = transform.position.z;
				newPos += dropOffset;
				ball.transform.position = newPos;
			}
		}
	}

	void Start()
	{
		this.ball = GameObject.FindWithTag("Ball");
	}

	void Update()
	{
		if (Input.GetKeyDown("e"))
		{
			if (canPickup)
			{
				canPickup = false;
				carryingBall = true;
			}
			else if (carryingBall)
			{
				carryingBall = false;
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
