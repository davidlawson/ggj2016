using UnityEngine;
using System.Collections;

public class WaypointScript : MonoBehaviour 
{
	public WaypointScript leftTarget, rightTarget, upTarget, downTarget;
	public UndergroundEntrance upExit;

	public Vector2 GetDirection(Direction direction)
	{
		if (direction == Direction.Left && leftTarget != null)
		{
			return TowardsWaypoint(leftTarget);
		}
		else if (direction == Direction.Right && rightTarget != null)
		{
			return TowardsWaypoint(rightTarget);
		}
		else if (direction == Direction.Up && upTarget != null)
		{
			return TowardsWaypoint(upTarget);
		}
		else if (direction == Direction.Down && downTarget != null)
		{
			return TowardsWaypoint(downTarget);
		}

		return Vector2.zero;
	}

	Vector2 TowardsWaypoint(WaypointScript target)
	{
		float r = GetRadius();
		float theta = Mathf.Atan2(target.transform.localPosition.z, target.transform.localPosition.x)
		              - Mathf.Atan2(transform.localPosition.z, transform.localPosition.x);

		return new Vector2(
			-r * theta,
			target.transform.position.y - transform.position.y
		).normalized;
	}

	void Update()
	{
	
	}

	float GetRadius()
	{
		return transform.parent.localScale.x / 2;
	}

	public void Move(Vector2 direction)
	{
		float radius = GetRadius();
		float radialMovement = direction.x / radius;

		transform.RotateAround(
			transform.parent.position, 
			Vector3.up, 
			-radialMovement * Mathf.Rad2Deg
		);

		transform.Translate(new Vector3(0, direction.y, 0));
	}
}
