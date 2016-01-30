using UnityEngine;
using System.Collections;
using UnityEditor;

[CustomEditor(typeof(WaypointScript))]
public class WaypointEditor : Editor 
{
	float movementAmount = 1.0f;

	public override void OnInspectorGUI()
	{
		DrawDefaultInspector();

		WaypointScript myScript = (WaypointScript)target;

		GUILayout.BeginHorizontal();
		GUILayout.Label("Movement amount");
		string movementText = GUILayout.TextField(movementAmount.ToString("0.00"));
		GUILayout.EndHorizontal();

		float newMovementAmount;
		if (float.TryParse(movementText, out newMovementAmount))
		{
			movementAmount = newMovementAmount;
		}

		if(GUILayout.Button("Up"))
		{
			myScript.Move(new Vector2(0, movementAmount));
		}

		GUILayout.BeginHorizontal();

		if(GUILayout.Button("Left"))
		{
			myScript.Move(new Vector2(-movementAmount, 0));
		}

		if(GUILayout.Button("Right"))
		{
			myScript.Move(new Vector2(movementAmount, 0));
		}

		GUILayout.EndHorizontal();

		if(GUILayout.Button("Down"))
		{
			myScript.Move(new Vector2(0, -movementAmount));
		}
	}
}
