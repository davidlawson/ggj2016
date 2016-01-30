using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Rigidbody))]
[RequireComponent(typeof(CapsuleCollider))]

public class NormalMovement : MonoBehaviour 
{
	Rigidbody rb;
	Animator anim;

	public float speed = 10.0f;
	public float gravity = 20.0f;
	public float maxVelocityChange = 1.0f;

	public float mouseXMin = -30, mouseXMax = 50;

	bool grounded = false;

	public float mouseSensitivity = 4.0f;

	void Awake() 
	{
		GameObject charSprite = transform.FindChild("Character Sprite").gameObject;

		rb = GetComponent<Rigidbody>();
		anim = charSprite.GetComponent<Animator>();
	}

	void Update()
	{
		//transform.localEulerAngles += new Vector3(0, Input.GetAxis("Mouse X"), 0) * mouseSensitivity;
		//Vector3 desiredRotation = cam.transform.localEulerAngles + new Vector3(-Input.GetAxis("Mouse Y"), 0, 0) * mouseSensitivity;
		//desiredRotation.x = ClampAngle(desiredRotation.x, mouseXMin, mouseXMax);
		//cam.transform.localRotation = Quaternion.Euler(desiredRotation);
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

				targetVelocity.Normalize();
				//targetVelocity = transform.TransformDirection(targetVelocity);
				targetVelocity *= speed;

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

		float flipTolerance = 0.1f;
		if (rb.velocity.x < -flipTolerance)
			transform.localScale = new Vector3(-1, 1, 1);
		else if (rb.velocity.x > flipTolerance)
			transform.localScale = new Vector3(1, 1, 1);
	}
	
	void OnCollisionStay(Collision collisionInfo) 
	{
		if (collisionInfo.gameObject.layer == LayerMask.NameToLayer("Terrain"))
			grounded = true;    
	}

	public static float ClampAngle(
		float currentValue,
		float minAngle,
		float maxAngle,
		float clampAroundAngle = 0) 
	{
		float angle = currentValue - (clampAroundAngle + 180);
		
		while (angle < 0)
			angle += 360;
		
		angle = Mathf.Repeat(angle, 360);
		
		return Mathf.Clamp(
			angle - 180,
			minAngle,
			maxAngle) + 360 + clampAroundAngle;
	}
}
