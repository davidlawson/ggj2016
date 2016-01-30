using UnityEngine;
using System.Collections;

public class PlayerAnimation : MonoBehaviour {

	public void PutDownRockAlmost()
	{
		GetComponentInParent<BallInteraction>().PutDownRockAlmost();
	}
}
