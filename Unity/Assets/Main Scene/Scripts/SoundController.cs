using UnityEngine;
using System.Collections;

public class SoundController : MonoBehaviour 
{
	public AudioSource walkingAudioSource,
		oneShotAudioSource;

	NormalMovement normalMovement;
	CylinderMovement cylinderMovement;

	BallInteraction ballInteraction;
	Rigidbody rb;

	public AudioClip walkWithBall, walkWithoutBall,
		pickUpBall, putDownBall,
		walkUnderground,
		teleport;

	void Start()
	{
		this.ballInteraction = GetComponent<BallInteraction>();
		this.rb = GetComponent<Rigidbody>();
		this.normalMovement = GetComponent<NormalMovement>();
		this.cylinderMovement = GetComponent<CylinderMovement>();
	}

	void Update() 
	{
		if (this.normalMovement.enabled)
		{
			if (this.rb.velocity.magnitude > 0.1f)
			{
				if (this.ballInteraction.carryingBall)
				{
					ChangeToClip(walkingAudioSource, walkWithBall, true);
				}
				else
				{
					ChangeToClip(walkingAudioSource, walkWithoutBall, true);
				}
			}
			else
			{
				walkingAudioSource.Stop();
			}
		}
		else if (this.cylinderMovement.enabled)
		{
			Direction dir = this.cylinderMovement.currentDirection;
			if (dir == Direction.Left || dir == Direction.Right)
			{
				ChangeToClip(walkingAudioSource, walkUnderground, true);
			}
			else
			{
				walkingAudioSource.Stop();
			}
		}
	}

	void ChangeToClip(AudioSource source, AudioClip clip, bool loop)
	{
		if (source.isPlaying && source.clip == clip)
			return;

		source.clip = clip;
		source.loop = loop;
		source.Play();
	}

	public void PlayPickupBall()
	{
		oneShotAudioSource.PlayOneShot(pickUpBall);
	}

	public void PlayPutDownBall()
	{
		oneShotAudioSource.PlayOneShot(putDownBall);
	}

	public void PlayTeleport()
	{
		oneShotAudioSource.PlayOneShot(teleport);
	}
}
