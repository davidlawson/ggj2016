using UnityEngine;
using System.Collections;

public class PlayerAnimation : MonoBehaviour {

	public void PutRockDownAlmost()
	{
		GetComponentInParent<BallInteraction>().PutRockDownAlmost();
	}
}
