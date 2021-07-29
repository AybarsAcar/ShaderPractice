using UnityEngine;

[ExecuteInEditMode]
public class NormalPlay : MonoBehaviour
{
  [SerializeField] private Vector3 normal = new Vector3(0, 1, 0);

  [Range(1.0f, 10.0f)] [SerializeField] private float xMod = 1;

  [Range(1.0f, 10.0f)] [SerializeField] private float yMod = 1;

  [Range(1.0f, 10.0f)] [SerializeField] private float zMod = 1;


  void Update()
  {
    Vector3 result = new Vector3(normal.x * xMod, normal.y * yMod, normal.z * zMod);
    Debug.DrawRay(this.transform.position, result, Color.red);
  }
}