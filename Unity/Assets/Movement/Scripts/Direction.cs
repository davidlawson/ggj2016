using UnityEngine;
using System.Collections;

public enum Direction
{
	None, Left, Right, Up, Down
}

static class DirectionMethods
{
	public static Direction Opposite(this Direction dir)
	{
		switch (dir)
		{
			case Direction.Left:
				return Direction.Right;
			case Direction.Right:
				return Direction.Left;
			case Direction.Up:
				return Direction.Down;
			case Direction.Down:
				return Direction.Up;
			default:
				return Direction.None;
		}
	}
}