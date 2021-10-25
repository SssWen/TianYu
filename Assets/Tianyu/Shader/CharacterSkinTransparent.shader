// Shader "Low/Tianyu Shaders/Character/CharacterSkinTransparent" {
Shader "Low/Tianyu Shaders/Character/CharacterSkinTransparent"
{
    Properties
    {   
        _MainColor ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" { }
        _BumpMap ("Normal", 2D) = "bump" { }
        _ParamTex ("SSSScale(R), SpecScale(G), AO(B)", 2D) = "white" { }
        _ParamTex2 ("Smoothness(R), DecalMask(B), MainColorMask(A)", 2D) = "white" { }
        _LightTexture ("LightTexture", 2D) = "white" {}
        // _LipCubeIntensity ("Lip Cube Intensity", Range(0, 1)) = 1
        // [Header(Facial)] _EyebrowMask ("Eyebrow Mask", 2D) = "black" { }
        // [Header(Misc)] _FaceMaskTex ("FaceMaskTex", 2D) = "white" { }
        [PowerSlider(3.0)] _RimPower ("Glow Power", Range(0, 10)) = 0.5
        _RimColor ("Glow Color", Color) = (0.04092, 0.07819, 0.11697, 1)
        // [HDR]_MainLightColor ("_MainLightColor", Color) = (5.54975,5.54975,5.54975)
        
        // _EyebrowTilingOffset ("EyebrowTilingOffset", Vector) = (1,1,0,0)
        // _EyebrowHSV ("Eyebrow HSV", Vector) = (0,0,1,0)
        // _FacialParams ("FacialParams x: LipSmoothnessFromNormal y: FacialLipSmoothness z: BlockMainColor, w: DecalEnableMask", Vector) = (1.0,0.665,1.0,1.0)  
    }
    SubShader
    {
        // Tags { "LightMode"="ForwardBase" "RenderType" = "Opaque" "QUEUE" = "Geometry"}
        Tags { "RenderType"="Transparent" "Queue" = "Transparent" "RenderPipeline"="UniversalPipeline"}
        Pass
        {
			Tags { "LightMode"="UniversalForward" }
            Cull back
            Blend One One
			HLSLPROGRAM
            #pragma target 3.0
          
            #pragma vertex vert
            #pragma fragment frag
            // #define UNITY_INV_PI 1/3.14            
            // #define EVALUATE_SH_MIXED
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct appdata
            {
                float4 vertex  : POSITION;                
                float4 tangent : TANGENT;
                float3 normal  : NORMAL;
                float2 uv0     : TEXCOORD0;
                float2 uv1     : TEXCOORD1;
            };

            struct v2f
            {                
                float4 vertex           : SV_POSITION;                        
		        float3 worldTangent     : TEXCOORD0;  
			    float3 worldBinormal    : TEXCOORD1;  
			    float3 worldNormal      : TEXCOORD2;
			    float3 worldPos         : TEXCOORD3;
                float4 uv               : TEXCOORD4;
			    float3 worldView        : TEXCOORD6;
            };

            float4 _MainColor;
            // float4 _EyebrowTilingOffset;
            // float4 _EyebrowHSV;
            // float4 _FacialParams;
            // float _LipCubeIntensity;
            float _RimPower;
            float4 _RimColor;
            float4 _SpotLightColor;
            float4 _SpotLightDir;
            // float4 _MainLightColor;
            // float4 _LightPosition;
            // float _SpotLightRange;
            float4x4 _worldToLight;

            // sampler2D _FaceMaskTex;
            sampler2D _MainTex;
            sampler2D _BumpMap;
            sampler2D _ParamTex;
            sampler2D _ParamTex2;
            sampler2D _LightTexture;
            // sampler2D _EyebrowMask;
                                
            v2f vert (appdata v)
            {
                v2f o;
                float3 worldPos = TransformObjectToWorld(v.vertex.xyz);
                o.worldPos = worldPos;
                o.vertex = TransformObjectToHClip(v.vertex.xyz);
                float3 viewDir = _WorldSpaceCameraPos - worldPos;
                o.worldView = viewDir;

                VertexNormalInputs normalInputs = GetVertexNormalInputs(v.normal, v.tangent);
                o.worldNormal = normalInputs.normalWS;
                o.worldTangent = normalInputs.tangentWS;
                o.worldBinormal = normalInputs.bitangentWS;
                
                o.uv = float4(v.uv0, v.uv1);                
                return o;
            }
            
            float4 frag (v2f i) : SV_Target
            {
                half3 albedo = tex2D(_MainTex, i.uv.xy).xyz;
               
                half3 worldNormal = i.worldNormal;
                half3 worldView = i.worldView;
                worldView = normalize(worldView);
                
                half3 normalori = tex2D(_BumpMap, i.uv.xy).xyz;
                
                half3 normal;
                normal.xy = normalori * 2.0 - 1.0;
                normal.z = 1.0;
                

                float3x3 rotation = float3x3(i.worldTangent, i.worldBinormal, i.worldNormal);
                half3 bumpNormal = normalize(mul(normal, rotation));
// _SpotLightDir.xyz = _WorldSpaceCameraPos.xyz;
                half3 lightDir = _SpotLightDir.xyz - i.worldPos;
                lightDir = normalize(lightDir);

                float LdotN = saturate(dot(lightDir, bumpNormal));

                float4 posLS = mul(_worldToLight, float4(i.worldPos,1.0));
                // float3 posLS = i.worldPos;
                // posLS = normalize(posLS);
                float poslengthPow = dot(posLS.xyz, posLS.xyz);
                // return half4(poslengthPow,poslengthPow,poslengthPow, 1);

                half brightness = tex2D(_LightTexture, float2(poslengthPow, poslengthPow)).x;
                // return half4(brightness, brightness, brightness, 1.0);
                // _MainLightColor.xyz = float3(5.54975,5.54975,5.54975);
                _MainLightColor.xyz = _SpotLightColor.xyz;
                // _MainLightColor.xyz = float3(5.54975,5.54975,5.54975);
                half3 lightColor = brightness * _MainLightColor.xyz;

                // half3 lightColor = 0.5 * _MainLightColor.xyz;
                // lightColor *= _CharacterSkinColorScale.xyz;
                half2 param2 = tex2D(_ParamTex, i.uv.xy).zw;
                lightColor *= param2.x;
                lightColor *= LdotN;

                float BumpVdotN = saturate(dot(worldView, bumpNormal));
                float OneNdotV = 1.0 - BumpVdotN;                
                
                // float value6 = OneNdotV * OneNdotV * 0.425000012;
                // value6 += OneNdotV*OneNdotV;
                // value6 *= param2.y*_RimPower*_RimColor.xyz;//Spec                
                // half3 mixcolor1 = value6 ;

                half3 mixcolor1 = 1.425000012* OneNdotV * OneNdotV * param2.y*_RimPower*_RimColor.xyz;

                half3 finalcolor = lightColor * albedo + mixcolor1;

                return half4(finalcolor, 1.0);
            }
            ENDHLSL
        }
    }
}






