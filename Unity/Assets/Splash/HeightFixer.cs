using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class HeightFixer : MonoBehaviour 
{
	void Start () {
		GetComponent<Image>().rectTransform.sizeDelta = new Vector2(Screen.height, Screen.height * 9 / 16) * 2;
	}
}
