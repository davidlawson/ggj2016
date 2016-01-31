using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class SplashController : MonoBehaviour {

	public float delay;

	void Start() 
	{
		Invoke("Transition", delay);
	}
	
	void Transition()
	{
		SceneManager.LoadScene(1);
	}
}
