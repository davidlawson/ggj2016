using UnityEngine;
using System.Collections;

public class GameState : MonoBehaviour 
{
	public Transform player;
	public Transform a, b, c;
	public SpriteRenderer playerSprite;
	public SpriteRenderer ballSprite;

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

	void Update()
	{
		float dA = (a.position - player.position).magnitude;
		float dB = (b.position - player.position).magnitude;
		float dC = (c.position - player.position).magnitude;

		if (dA > dB && dA > dC)
		{
			// A closest
		}
		else if (dB > dA && dB > dC)
		{
			// B closest
		}
		else if (dC > dA && dC > dB)
		{
			// C closest
		}
	}
}
