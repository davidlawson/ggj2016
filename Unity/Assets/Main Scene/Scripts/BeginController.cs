using UnityEngine;
using System.Collections;
using DG.Tweening;

public class BeginController : MonoBehaviour {

	public CanvasGroup beginScreen;

	public void BeginGame()
	{
		//Sequence seq = DOTween.Sequence();
		beginScreen.DOFade(0.0f, 3.0f);
	}
}
