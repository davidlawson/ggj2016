using UnityEngine;
using System.Collections;

public class CylinderController : MonoBehaviour 
{
	GameObject ball;
	Transform player;

	// Use this for initialization
	void Start () 
	{
		this.ball = GameObject.FindWithTag("Ball");
		this.player = GameObject.FindWithTag("Player").transform;
	}
	
	// Update is called once per frame
	void FixedUpdate() 
	{
		if (this.ball.activeSelf)
		{
			transform.position = new Vector3(this.ball.transform.position.x, 0, this.ball.transform.position.z);
		}
		else
		{
			transform.position = new Vector3(this.player.position.x, 0, this.player.position.z);
		}
	}
}
