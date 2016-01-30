using UnityEngine;
using System.Collections;
using DG;
using DG.Tweening;

enum MovementType
{
	Normal, Cylinder, None
}

[RequireComponent(typeof(CylinderMovement))]
[RequireComponent(typeof(NormalMovement))]
[RequireComponent(typeof(Rigidbody))]

public class PlayerController : MonoBehaviour 
{
	CylinderMovement cylinderMovement;
	NormalMovement normalMovement;
	Rigidbody rigidBody;
	CameraController cam;

	MovementType _movementType;
	MovementType movementType
	{
		set
		{
			_movementType = value;

			if (value == MovementType.Normal)
			{
				rigidBody.isKinematic = false;
				this.normalMovement.enabled = true;
				this.cylinderMovement.enabled = false;
			}
			else if (value == MovementType.Cylinder)
			{
				rigidBody.isKinematic = true;
				this.normalMovement.enabled = false;
				this.cylinderMovement.enabled = true;
			}
			else
			{
				rigidBody.isKinematic = true;
				this.normalMovement.enabled = false;
				this.cylinderMovement.enabled = false;
			}
		}

		get 
		{
			return _movementType;
		}
	}

	void Start() 
	{
		this.cylinderMovement = GetComponent<CylinderMovement>();
		this.normalMovement = GetComponent<NormalMovement>();
		this.rigidBody = GetComponent<Rigidbody>();
		this.cam = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<CameraController>();

		movementType = MovementType.Normal;
	}

	void OnTriggerEnter(Collider other)
	{
		UndergroundEntrance entrance = other.GetComponent<UndergroundEntrance>();
		if (entrance && movementType == MovementType.Normal)
		{
			EnterUnderground(entrance);
		}
	}

	void EnterUnderground(UndergroundEntrance entrance)
	{
		movementType = MovementType.None;
		cam.cameraMode = CameraMode.Manual;

		WaypointScript waypoint = entrance.firstWaypoint;
		Transform pivot = waypoint.transform.parent;

		float timeEntrance = 0.2f;
		float timeWait = 0.3f;
		float timeDescend = 1.0f;

		Sequence seq = DOTween.Sequence();
		seq.Append(transform.DOMove(entrance.transform.position, timeEntrance));
		seq.AppendInterval(timeWait);
		seq.Append(transform.DOMove(waypoint.transform.position, timeDescend));

		float distance = 10;

		Vector3 waypointPos = waypoint.transform.position;
		Vector3 pivotPoint = new Vector3(pivot.position.x, waypointPos.y, pivot.position.z);
		Vector3 radialVector = (waypointPos - pivotPoint).normalized;
		Vector3 camPoint = waypointPos + radialVector * distance;

		Quaternion camRotation = Quaternion.LookRotation(-radialVector);

		seq.Insert(timeEntrance + timeWait, cam.transform.DOMove(camPoint, timeDescend));
		seq.Insert(timeEntrance + timeWait, cam.transform.DORotateQuaternion(camRotation, timeDescend));

		seq.AppendCallback(() => {
			movementType = MovementType.Cylinder;
			cam.pivot = pivot;
			cam.cameraMode = CameraMode.BelowGround;
		});
	}

	public void ExitUnderground(UndergroundEntrance entrance)
	{
		movementType = MovementType.None;
		cam.cameraMode = CameraMode.Manual;

		float timeAscend = 1.0f;
		float timeWait = 0.3f;
		float timeExit = 0.5f;

		Sequence seq = DOTween.Sequence();

		seq.Append(transform.DOMove(entrance.transform.position, timeAscend));
		seq.AppendInterval(timeWait);
		seq.Append(transform.DOMove(entrance.exitPoint.position, timeExit));

		seq.Insert(0, cam.transform.DOMove(entrance.exitPoint.position + cam.abovegroundOffset, timeAscend));
		seq.Insert(0, cam.transform.DORotate(cam.abovegroundRotation, timeAscend));

		seq.AppendCallback(() => {
			movementType = MovementType.Normal;
			cam.cameraMode = CameraMode.AboveGround;
		});
	}
}
