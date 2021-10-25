using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PassLightParam : MonoBehaviour
{
    //public Material skinTransparent;
    public Light m_Light;
    Matrix4x4 lightProjMatrix;
    void Start()
    {
        m_Light = transform.GetComponent<Light>();
        lightProjMatrix = Matrix4x4.identity;


    }

    // Update is called once per frame
    void Update()
    {
        Shader.SetGlobalColor("_SpotLightColor", transform.GetComponent<Light>().color);
        //skinTransparent.SetVector("_LightPosition", SpotLight.GetComponent<Transform>().position);
        //skinTransparent.SetFloat("_SpotLightRange", SpotLight.GetComponent<Light>().range);
        //skinTransparent.SetMatrix("_worldToLight", transform.worldToLocalMatrix);
       // Shader.SetGlobalMatrix("_worldToLight", transform.GetComponent<Light>().worldToShadowMatrix);

        float val = 1f / m_Light.range;
        Vector3 scale = new Vector3(val, val, val);
        var lightRangeMatrix = Matrix4x4.Scale(scale);


        float d = Mathf.Deg2Rad * m_Light.spotAngle * 0.5f;
        d = Mathf.Cos(d) / Mathf.Sin(d);
        lightProjMatrix[3, 2] = 2f / d;


        Shader.SetGlobalMatrix("_worldToLight", lightRangeMatrix * lightProjMatrix * transform.worldToLocalMatrix);

        //skinTransparent.SetMatrix("_worldToLight", SpotLight.GetComponent<Renderer>().worldToLocalMatrix);
    }
}
