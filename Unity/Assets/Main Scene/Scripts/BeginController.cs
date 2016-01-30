using UnityEngine;
using System.Collections;
using DG.Tweening;

public class BeginController : MonoBehaviour {

	public CanvasGroup beginScreen;

	void Start()
	{
		beginScreen.alpha = 1.0f;
	}

	public void BeginGame()
	{
		beginScreen.interactable = false;
		beginScreen.DOFade(0.0f, 1.0f);

		GameObject.FindWithTag("Player").GetComponent<PlayerController>().movementType = MovementType.Normal;
	}
}
