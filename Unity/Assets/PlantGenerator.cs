using UnityEngine;
using System.Collections;

public class PlantGenerator : MonoBehaviour {

	public GameObject[] plantPrefabs;

	public int number;
	public float boxSize;

	void Start () 
	{
		for (int i = 0; i < number; i++)
		{
			int plantIndex = Random.Range(0, plantPrefabs.Length);
			GameObject plant = plantPrefabs[plantIndex];
			GameObject newPlant = Instantiate<GameObject>(plant);
			newPlant.transform.SetParent(transform, true);
			newPlant.transform.position = new Vector3(
				Random.Range(-boxSize, boxSize), 
				0, 
				Random.Range(-boxSize, boxSize)
			);
		}
	}
}
