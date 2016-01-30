using UnityEngine;
using System.Collections;

public class BallController : MonoBehaviour {

	Transform player;
	SpriteRenderer rend;

	// Use this for initialization
	void Start () 
	{
		this.player = GameObject.FindWithTag("Player").transform;
		this.rend = GetComponentInChildren<SpriteRenderer>();
	}
	
	// Update is called once per frame
	void Update () 
	{
		if (this.player.position.z > transform.position.z)
		{
			rend.sortingOrder = 3;
		}
		else
		{
			rend.sortingOrder = -1;
		}
	}
}
