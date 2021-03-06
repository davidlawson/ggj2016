﻿using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Rigidbody))]
[RequireComponent(typeof(CapsuleCollider))]

public class NormalMovement : MonoBehaviour 
{
	Rigidbody rb;
	Animator anim;

	BallInteraction ballInteraction;

	public float speedWithBall = 4.0f;
	public float speedWithoutBall = 7.0f;
	public float gravity = 20.0f;
	public float maxVelocityChange = 1.0f;

	public float mouseXMin = -30, mouseXMax = 50;

	bool grounded = false;

	public float mouseSensitivity = 4.0f;

	void Awake() 
	{
		GameObject charSprite = transform.GetChild(0).FindChild("Character Sprite").gameObject;

		rb = GetComponent<Rigidbody>();
		anim = charSprite.GetComponent<Animator>();
		ballInteraction = GetComponent<BallInteraction>();
	}
	
	void FixedUpdate()
	{
		if (grounded) 
		{
			// Calculate how fast we should be moving
			Vector3 targetVelocity = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical"));

			if (targetVelocity.magnitude > 0)
			{
				anim.SetBool("Walking", true);

				if (targetVelocity.x > 0)
				{
					transform.localScale = new Vector3(1, 1, 1);
				}
				else if (targetVelocity.x < 0)
				{
					transform.localScale = new Vector3(-1, 1, 1);
				}
					
				anim.SetBool("FacingAway", targetVelocity.z > 0);	
				anim.SetBool("MovingSideways", targetVelocity.x > 0 || targetVelocity.x < 0);

				targetVelocity.Normalize();
				//targetVelocity = transform.TransformDirection(targetVelocity);
				targetVelocity *= ballInteraction.carryingBall ? speedWithBall : speedWithoutBall;

				// Apply a force that attempts to reach our target velocity
				Vector3 velocity = rb.velocity;
				Vector3 velocityChange = (targetVelocity - velocity);
				velocityChange.x = Mathf.Clamp(velocityChange.x, -maxVelocityChange, maxVelocityChange);
				velocityChange.z = Mathf.Clamp(velocityChange.z, -maxVelocityChange, maxVelocityChange);
				velocityChange.y = 0;
				rb.AddForce(velocityChange, ForceMode.VelocityChange);
			}
			else
			{
				anim.SetBool("Walking", false);
			}
		}

		// We apply gravity manually for more tuning control
		rb.AddForce(new Vector3 (0, -gravity * rb.mass, 0));
		
		grounded = false;
	}
	
	void OnCollisionStay(Collision collisionInfo) 
	{
		if (collisionInfo.gameObject.layer == LayerMask.NameToLayer("Terrain"))
			grounded = true;    
	}
}
