using UnityEngine;
using System.Collections;

public class ManualBillboard : MonoBehaviour 
{
	Camera cam;

	void Start()
	{
		cam = GameObject.FindWithTag("MainCamera").GetComponent<Camera>();
	}

	void Update()
	{
		transform.LookAt(transform.position + cam.transform.rotation * Vector3.forward);
	}
}
