using UnityEngine;
using System.Collections;
using DG.Tweening;
using Colorful;

public class BeginController : MonoBehaviour {

	public CanvasGroup beginScreen;
	public GaussianBlur cameraBlur;

	void Start()
	{
		beginScreen.alpha = 1.0f;

		cameraBlur.enabled = true;
		cameraBlur.Amount = 0.5f;
	}

	public void BeginGame()
	{
		Sequence seq = DOTween.Sequence();

		beginScreen.interactable = false;

		seq.Append(beginScreen.DOFade(0.0f, 3.0f));
		seq.Insert(0, DOTween.To(() => cameraBlur.Amount, x => cameraBlur.Amount = x, 0.0f, 3.0f));

		seq.AppendCallback(() => {
			GameObject.FindWithTag("Player").GetComponent<PlayerController>().movementType = MovementType.Normal;
		});
	}
}
