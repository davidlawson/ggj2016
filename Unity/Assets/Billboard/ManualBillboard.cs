using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class ManualBillboard : MonoBehaviour 
{
	Camera cam;

	void Start()
	{
		cam = GameObject.Find("Main Camera").GetComponent<Camera>();
	}

	void Update()
	{
		transform.LookAt(transform.position + cam.transform.rotation * Vector3.forward);
	}
}
