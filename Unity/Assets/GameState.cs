using UnityEngine;
using System.Collections;

public class GameState : MonoBehaviour 
{
	public Transform player;
	public Transform a;
	public SpriteRenderer playerSprite;
	public SpriteRenderer ballSprite;

	public float divisor;

	int _gemsCollected;
	public int gemsCollected
	{
		set 
		{ 
			_gemsCollected = value; 

			if (_gemsCollected == 1)
			{
				GameObject.Find("CreditsController").GetComponent<CreditsController>().ShowCredits();
			}
		}
		get { return _gemsCollected; }
	}

	void Update()
	{
		float dA = (a.position - player.position).magnitude;

		SetHue(1);
		SetSaturation(Mathf.Clamp01(1 - dA / divisor));
	}

	void SetHue(float hue)
	{
		playerSprite.material.SetFloat("_Hue", hue);
		ballSprite.material.SetFloat("_Hue", hue);
	}

	void SetSaturation(float sat)
	{
		playerSprite.material.SetFloat("_Saturation", sat);
		ballSprite.material.SetFloat("_Saturation", sat);
	}
}
