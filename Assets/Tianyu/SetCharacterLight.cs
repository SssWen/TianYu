using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[ExecuteInEditMode]
public class SetCharacterLight : MonoBehaviour
{

    public Light directionLight;
    public Light spotLight;
        
    Matrix4x4 lightProjMatrix;
    [ColorUsage(true, true)]
    private Color spotLightColor = new Color(5.54975f, 5.54975f, 5.54975f,1);
//    private 
    // Start is called before the first frame update
    void Start()
    {
        // spotLight = transform.GetComponent<Light>();                
        lightProjMatrix = Matrix4x4.identity;
    }
    // Update is called once per frame
    void Update()
    {
        Shader.SetGlobalColor("_SpotLightColor", spotLightColor);
        Shader.SetGlobalVector("_SpotLightDir", -spotLight.transform.forward);

        float val = 1f / spotLight.range;
        Vector3 scale = new Vector3(val, val, val);
        var lightRangeMatrix = Matrix4x4.Scale(scale);


        float d = Mathf.Deg2Rad * spotLight.spotAngle * 0.5f;
        d = Mathf.Cos(d) / Mathf.Sin(d);
        lightProjMatrix[3, 2] = 2f / d;

        Shader.SetGlobalMatrix("_worldToLight", lightRangeMatrix * lightProjMatrix * transform.worldToLocalMatrix);
        Shader.SetGlobalVector("_CharacterLightDir", -directionLight.transform.forward);
        // Shader.SetGlobalVector("_CharacterLightDir", directionLight.transform.position);
        // Debug.Log(-directionLight.transform.forward);
    }
}
