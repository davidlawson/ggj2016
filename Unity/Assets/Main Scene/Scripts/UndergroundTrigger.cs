using UnityEngine;
using System.Collections;
using DG.Tweening;

public class UndergroundTrigger : MonoBehaviour 
{
	GameObject ballObject;

	public MeshRenderer insideRenderer;
	public Transform outsideTransform;

	public GameObject entrance;

	// Use this for initialization
	void Start() 
	{
		this.ballObject = GameObject.FindWithTag("Ball");
	}

	public void AnimateReveal()
	{
		outsideTransform.DOMoveY(-40, 3.0f);
		foreach (Material mat in insideRenderer.materials)
		{
			if (mat.name.Contains("Grass"))
				continue;
			
			mat.DOFloat(1 - 16, "_WorldClip", 3.0f);
		}

		entrance.SetActive(true);
	}

	public void AnimateHiding()
	{
		outsideTransform.DOMoveY(-24, 3.0f);
		foreach (Material mat in insideRenderer.materials)
		{
			if (mat.name.Contains("Grass"))
				continue;

			mat.DOFloat(1, "_WorldClip", 3.0f);
		}

		entrance.SetActive(false);
	}
}
