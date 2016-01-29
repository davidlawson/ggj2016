using UnityEngine;
using System.Collections.Generic;

[ExecuteInEditMode]
public class BillboardRotation : MonoBehaviour 
{
	public List<Sprite> sprites;

	Transform player;
	SpriteRenderer renderer;

	void Start()
	{
		this.player = GameObject.FindWithTag("Player").transform;
		this.renderer = GetComponentInChildren<SpriteRenderer>();
	}

	void Update()
	{
		if (this.sprites.Count == 0)
			return;

		float angle = Mathf.Repeat(GetAngle() + 180 + (360 / this.sprites.Count / 2), 360);

		int index = Mathf.FloorToInt(this.sprites.Count * angle / 360);
		this.renderer.sprite = sprites[index];
	}

	float GetAngle()
	{
		// this object is always at the origin of its own coordinate system
		Vector3 difference3D = this.transform.InverseTransformPoint(player.position);
		float differenceX = difference3D.x;
		float differenceZ = difference3D.z;
		return Mathf.Atan2(differenceZ, differenceX) * Mathf.Rad2Deg;
	}
}
