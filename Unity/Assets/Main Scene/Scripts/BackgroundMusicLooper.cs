using UnityEngine;
using System.Collections;

public class BackgroundMusicLooper : MonoBehaviour 
{
	AudioSource source;

	void Start() 
	{
		this.source = GetComponent<AudioSource>();
		this.source.Play();
		Invoke("LoopSound", this.source.clip.length);
	}

	void LoopSound()
	{
		this.source.time = 73.874f;
		this.source.Play();
	}
}
