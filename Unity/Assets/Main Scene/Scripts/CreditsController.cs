using UnityEngine;
using System.Collections;
using Colorful;
using DG.Tweening;

public class CreditsController : MonoBehaviour 
{
	public CanvasGroup canvasGroup;
	public GaussianBlur cameraBlur;

	public void ShowCredits()
	{
		GameObject.FindWithTag("Player").GetComponent<PlayerController>().movementType = MovementType.None;

		cameraBlur.Amount = 0;
		cameraBlur.enabled = true;

		DOTween.To(() => cameraBlur.Amount, x => cameraBlur.Amount = x, 1.0f, 3.0f);
		canvasGroup.DOFade(1.0f, 3.0f);
	}
}
