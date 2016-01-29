using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Rigidbody))]
[RequireComponent(typeof(CapsuleCollider))]

public class PlayerMovement : MonoBehaviour 
{
	Rigidbody rb;
	Camera cam;

	public float speed = 10.0f;
	public float gravity = 10.0f;
	public float maxVelocityChange = 10.0f;
	public bool canJump = true;
	public float jumpHeight = 2.0f;

	public float mouseXMin, mouseXMax;

	bool grounded = false;
	bool shouldJump = false;
	bool firstUpdate = true;

	public float mouseSensitivity = 2.0f;

	void Awake() 
	{
		rb = GetComponent<Rigidbody>();
		cam = GetComponentInChildren<Camera>();

		Cursor.visible = false;
	}

	void Update()
	{
		if (Input.GetKeyDown("space"))
		{
			shouldJump = true;
		}

		transform.localEulerAngles += new Vector3(0, Input.GetAxis("Mouse X"), 0) * mouseSensitivity;

		Vector3 desiredRotation = cam.transform.localEulerAngles + new Vector3(-Input.GetAxis("Mouse Y"), 0, 0) * mouseSensitivity;
		desiredRotation.x = ClampAngle(desiredRotation.x, mouseXMin, mouseXMax);
		cam.transform.localRotation = Quaternion.Euler(desiredRotation);
	}
	
	void FixedUpdate()
	{
		if (firstUpdate)
		{
			Input.GetAxis("Mouse X");
			Input.GetAxis("Mouse Y");
			firstUpdate = false;
			return;
		}

		if (grounded) 
		{
			// Calculate how fast we should be moving
			Vector3 targetVelocity = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical"));
			targetVelocity.Normalize();
			targetVelocity = transform.TransformDirection(targetVelocity);
			targetVelocity *= speed;
			
			// Apply a force that attempts to reach our target velocity
			Vector3 velocity = rb.velocity;
			Vector3 velocityChange = (targetVelocity - velocity);
			velocityChange.x = Mathf.Clamp(velocityChange.x, -maxVelocityChange, maxVelocityChange);
			velocityChange.z = Mathf.Clamp(velocityChange.z, -maxVelocityChange, maxVelocityChange);
			velocityChange.y = 0;
			rb.AddForce(velocityChange, ForceMode.VelocityChange);
			
			// Jump
			if (canJump && shouldJump) 
			{
				rb.velocity = new Vector3(velocity.x, CalculateJumpVerticalSpeed(), velocity.z);
			}
		}

		// We apply gravity manually for more tuning control
		rb.AddForce(new Vector3 (0, -gravity * rb.mass, 0));
		
		grounded = false;
		shouldJump = false;
	}
	
	void OnCollisionStay(Collision collisionInfo) 
	{
		if (collisionInfo.gameObject.layer == LayerMask.NameToLayer("Terrain"))
			grounded = true;    
	}
	
	float CalculateJumpVerticalSpeed() 
	{
		// From the jump height and gravity we deduce the upwards speed 
		// for the character to reach at the apex.
		return Mathf.Sqrt(2 * jumpHeight * gravity);
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
