using UnityEngine;
using System.Collections;

public class EyeMovement : MonoBehaviour {

	float multiplier = 0.00005f;
	float maxDistance = 0.03f;
	Transform eye;

	// Use this for initialization
	void Start() 
	{
		this.eye = this.transform.GetChild(0);
	}
	
	// Update is called once per frame
	void Update()
	{
		Vector3 mousePos = new Vector3(Input.mousePosition.x - Screen.width/2, Input.mousePosition.y - Screen.height/2, 0);
		Vector3 movement = mousePos * multiplier;
		if (movement.magnitude > maxDistance)
		{
			movement = movement.normalized * maxDistance;
		}

		if (this.transform.parent.parent.localScale.x < 0)
		{
			movement.x *= -1;
		}

		this.eye.transform.localPosition = movement;
	}
}
