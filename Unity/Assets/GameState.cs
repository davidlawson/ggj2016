using UnityEngine;
using System.Collections;

public class GameState : MonoBehaviour 
{
	int _gemsCollected;
	public int gemsCollected
	{
		set 
		{ 
			_gemsCollected = value; 

			if (_gemsCollected == 3)
			{
				GameObject.Find("CreditsController").GetComponent<CreditsController>().ShowCredits();
			}
		}
		get { return _gemsCollected; }
	}
}
