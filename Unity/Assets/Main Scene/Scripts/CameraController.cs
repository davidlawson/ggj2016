using UnityEngine;
using System.Collections;

public enum CameraMode
{
	AboveGround, BelowGround, Manual
}

public class CameraController : MonoBehaviour 
{
	public CameraMode cameraMode = CameraMode.AboveGround;
	Transform cylinders;
	Transform player;

	public Transform pivot;
	public float undergroundDistance = 10.0f;

	public Vector3 abovegroundOffset = new Vector3(0, 3.5f, -7);
	public Vector3 abovegroundRotation = new Vector3(25, 0, 0);

	void Start () 
	{
		this.player = GameObject.FindWithTag("Player").transform;
		this.cylinders = GameObject.Find("Cylinders").transform;
	}

	void Update() 
	{
		if (cameraMode == CameraMode.AboveGround)
		{
			transform.localEulerAngles = abovegroundRotation;
			transform.position = cylinders.transform.position + abovegroundOffset;
		}
		else if (cameraMode == CameraMode.BelowGround)
		{
			Vector3 pivotPoint = new Vector3(pivot.position.x, player.position.y, pivot.position.z);
			Vector3 radialVector = (player.position - pivotPoint).normalized;
			Vector3 camPos = player.position + radialVector * undergroundDistance;

			transform.position = camPos;
			transform.LookAt(pivotPoint);
		}
	}
}
