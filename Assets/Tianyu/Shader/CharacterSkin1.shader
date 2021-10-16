// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Low/Tianyu Shaders/Character/CharacterSkin1"
{
    Properties
    {
        // _Mode ("__mode", Float) = 0
        // _SrcBlend ("__src", Float) = 1
        // _DstBlend ("__dst", Float) = 0
        // _ZWrite ("__zw", Float) = 1
        // _ColorMask ("__cm", Float) = 15        
        // _StencilRef ("__stencil_ref", Float) = 0
        // [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull Mode", Float) = 2
        _SSSTex ("SSSTex", 2D) =  "white" { }
        
        _MainColor ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" { }
        _BumpMap ("Normal", 2D) = "bump" { }
        _ParamTex ("SSSScale(R), SpecScale(G), AO(B)", 2D) = "white" { }
        _ParamTex2 ("Smoothness(R), DecalMask(B), MainColorMask(A)", 2D) = "white" { }
        // _SSSScaleTex ("SSSScale(R)", 2D) = "white" { }
        // _AOScale ("AO Scale", Range(0, 1)) = 1
        // _SSSMaskTex ("SSS Mask", 2D) = "black" { }
        _Cube ("Reflection Cubemap", Cube) = "" { }
        _LipCubeIntensity ("Lip Cube Intensity", Range(0, 1)) = 1
        _PoreTex ("Pore Tex", 2D) = "white" { }
        _SSSLightColor ("SSS Light Color", Vector) = (0.99216,0.89412,0.8941,1)
        // _SSSLightColor2 ("SSS Light Color Game", Vector) = (1,1,1,1)
        _SSSSpecParam ("SSS Face Spec Param", Vector) = (1.35,1,0,2.0)
        _SSSDiffParam ("SSS Face Diff Param", Vector) = (1.50,1.15,0,0.4)
        _SSSPoreParam ("SSS Face Pore Param", Vector) = (1,1,1,1)
        _SSSGameDiffParam1 ("SSS Body Diff Param1", Vector) = (0.2,0.6,0.1,1)
        _SSSGameDiffParam2 ("SSS Body Diff Param2", Vector) = (0.4,0.4,2.5,1)
        _SSSGameDiffParam3 ("SSS Body Diff Param1 Game", Vector) = (1.34,0.79,0.8,1.0)
        _SSSGameDiffParam4 ("SSS Body Diff Param2 Game", Vector) = (0.31,0.1,5.0,0.8)
        _SSSGameColorParam ("SSS Body Color Param", Color) = (0.25,0,0,0)
        _RimColor ("Glow Color", Color) = (0,0,0,1)
        [PowerSlider(3.0)] _RimPower ("Glow Power", Range(0, 10)) = 1
        _RimColorGame ("Glow Color", Color) = (0,0,0,1)
        [PowerSlider(3.0)] _RimPowerGame ("Glow Power", Range(0, 10)) = 1
        [Header(Facial)] _EyebrowMask ("Eyebrow Mask", 2D) = "black" { }
        // _MainColorMask ("MainColorMask", 2D) = "white" { }
        // _EyebrowTilingOffset ("EyebrowTilingOffset", Vector) = (1,1,0,0)
        // _EyebrowHSV ("Eyebrow HSV", Vector) = (0,0,1,0)
        _FacialParams ("FacialParams x: LipSmoothnessFromNormal y: FacialLipSmoothness z: BlockMainColor, w: DecalEnableMask", Vector) = (1.0,0.665,1.0,1.0)
        // [Header(Decal)] _DecalTex ("Decal Tex", 2D) = "black" { }
        // _DecalNormalTex ("Decal Normal Tex", 2D) = "black" { }
        // _DecalTypePara ("Decal Para", Vector) = (1,1,1,0)
        // _DecalTransform ("Decal Transform", Vector) = (0,1,0,0)
        // _DecalColor ("Decal Color", Color) = (1,1,1,1)
        // [Header(SparkleSkin)] _StarMask ("_StarMask", 2D) = "black" { }
        // _StarParamMouth ("Star Mouth Parameters", Vector) = (100,0.466,2.55,0.3)
        // _StarParam2Mouth ("Star Mouth Parameters2", Vector) = (14,0.48,3.8,0)
        // _StarParamEye ("Star Eye Parameters", Vector) = (100,0.466,2.55,0.3)
        // _StarParamRightEye ("Star Eye Right Parameters", Vector) = (100,0.466,2.55,0.3)
        // _StarParam2Eye ("Star Eye Parameters2", Vector) = (14,0.48,3.8,0)
        // _StarParamFace ("Star Face Parameters", Vector) = (100,0.466,2.55,0.3)
        // _StarParam2Face ("Star Face Parameters2", Vector) = (14,0.48,3.8,0)
        // _ColorMouth ("Color Mouth", Color) = (1,1,1,1)
        // _ColorEye ("Color Eye Left", Color) = (1,1,1,1)
        // _ColorEyeRight ("Color Eye Right", Color) = (1,1,1,1)
        _ColorFace ("Color Face", Color) = (1,1,1,1)
        [Header(Rim)] _RimColorBlend ("Rim Color Blend", Color) = (1,1,1,1)
        _RimColorAdd ("Rim Color Add", Color) = (1,1,1,1)
        _RimCompositeParamsA ("Composite A", Vector) = (0,0,0,0)
        _RimCompositeParamsB ("Composite B", Vector) = (0,0,0,0)
        [Header(Dissolve)] _DissolveParam ("Dissolve Param", Vector) = (0,0.001,0,0)
        _BurnParam ("Burn Param", Vector) = (1,0,0,0)
        _BurnDissolveTex ("Dissolve Texture", 2D) = "white" { }
        _BurnRamp ("Burn Ramp (RGB)", 2D) = "white" { }
        // [Header(UFX)] [Toggle(_UNIVERSAL_FX_ON)] _UFX_ON ("UFX ON", Float) = 0
        // __UFX_Color ("__UFX_Color", Color) = (1,1,1,1)
        // __UFX_Alpha ("__UFX_Alpha", Float) = 1
        // __UFX_Brightness ("__UFX_Brightness", Float) = 1
        // _UFX_Color ("UFX Color", Vector) = (1,1,1,1)
        // _UFX_Tex ("UFX Tex", 2D) = "white" { }
        // _UFX_Ramp ("UFX Ramp", 2D) = "white" { }
        // _UFX_Mask ("UFX Mask", 2D) = "white" { }
        // _UFX_Params0 ("UFX Params0", Vector) = (0,0,0,0)
        // _UFX_Params1 ("UFX Params1", Vector) = (0,0,0,0)
        [Header(Misc)] _FaceMaskTex ("FaceMaskTex", 2D) = "white" { }
        _HighlightColor ("Highlight Color", Color) = (0,0,0,0)
        _SSSWrite ("sssWrite", Float) = 0
        _LODFade ("_LODCrossFade", Vector) = (15,0,0,0)
        _CharacterGameSpecColor ("_CharacterGameSpecColor", Color) = (1,1,1,1)
        _DarkCharacterCtrl ("_DarkCharacterCtrl", Float) = 1
        
    }
    SubShader
    {
        // Tags { "LightMode"="ForwardBase" "RenderType" = "Opaque" "QUEUE" = "Geometry"}
      Tags { "RenderType"="Opaque" "Queue" = "Geometry+2" "RenderPipeline"="UniversalPipeline"}
        Pass
        {
			Tags { "LightMode"="UniversalForward" }
			HLSLPROGRAM
            #pragma target 3.0
          
            #pragma vertex vert
            #pragma fragment frag
            // #define UNITY_INV_PI 1/3.14            
            // #define EVALUATE_SH_MIXED
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"            
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
                float4 vertex : SV_POSITION;                        
		        float4 TtoW0  : TEXCOORD0;  
			    float4 TtoW1  : TEXCOORD1;  
			    float4 TtoW2  : TEXCOORD2;
			    float4 uv     : TEXCOORD3;
                float4 fog    : TEXCOORD4;    
			    float3 viewDir: TEXCOORD5;
			    float3 SH     : TEXCOORD6;
			    
            };
            float4 _MainColor;
            float4 _CharacterGlobalParams;
            float4 _CharacterSkinColorScale;
            float4 _EyebrowTilingOffset;
            float4 _EyebrowHSV;
            float4 _HighlightColor;
            float _DarkCharacterScale;
            float _DarkCharacterCtrl;
            float _AutoExposure;
            float _AutoExposure_Intensity;
            float _OutputAlpha;
            float4 _FogInfo2;
            float4 _FogInfo3;
            float4 _FogInfo4;
            float4 _FogColor1;
            float4 _FogColor2;
            float4 _FogColor3;
            float3 _CharacterLightDir;
            float _VolumetricShadow;
            float4 _StarParamEye;
            float4 _StarParamRightEye;
            float4 _StarParamMouth;
            float4 _StarParamFace;
            float4 _StarParam2Eye;
            float4 _StarParam2Mouth;
            float4 _StarParam2Face;
            float4 _ColorEye;
            float4 _ColorEyeRight;
            float4 _ColorFace;
            float4 _ColorMouth;
            float4 _SSSLightColor2;
            float4 _CharacterGameSpecColor;
            float CharacterShadowAdd;
            float4 _SSSGameDiffParam3;
            float4 _SSSGameDiffParam4;
            float4 _SSSGameColorParam;
            float4 _SSSSpecParam;
            float4 _SSSLightColor;
            float4 _DecalTex_ST;
            float4 _DecalTransform;
            float4 _DecalColor;
            float4 _DecalTypePara;
            float4 _FacialParams;
            float4 _RimColorGame;
            float _RimPowerGame;
            float4 _SSSDiffParam;
            float4 _SSSPoreParam;


            sampler2D _FaceMaskTex;
            sampler2D _MainTex;
            sampler2D _BumpMap;
            sampler2D _ParamTex;
            sampler2D _ParamTex2;
            sampler2D _EyebrowMask;
            sampler2D _DecalTex;
            sampler2D _SSSTex;
            sampler2D _PoreTex;
            sampler2D _StarMask;
            sampler2D _AutoExposureTex;
                                
            
          
            v2f vert (appdata v)
            {
                v2f o;
                float4 worldPos = mul(unity_ObjectToWorld, v.vertex);
                o.vertex = TransformObjectToHClip(v.vertex.xyz);

                float3 worldTangent = mul(UNITY_MATRIX_M, float4(v.tangent.xyz, 0.0)).xyz;
                worldTangent = normalize(worldTangent);                
                float3 worldNormal = TransformObjectToWorldNormal(v.normal);                 
                // unity_WorldTransformParams.w
				float3 worldBinormal = cross(worldNormal, worldTangent) * v.tangent.w*unity_WorldTransformParams.w;  
                o.TtoW0 = float4(worldTangent.x,worldBinormal.x, worldNormal.x,worldPos.x);
				o.TtoW1 = float4(worldTangent.y,worldBinormal.y, worldNormal.y,worldPos.y);
				o.TtoW2 = float4(worldTangent.z,worldBinormal.z, worldNormal.z,worldPos.z);               
                // o.viewDir = GetCameraPositionWS() - worldPos.xyz;
                o.viewDir = (float3(-10.447,11.046,-136.34) - worldPos.xyz);
                // o.viewDir = ( worldPos.xyz);
                o.fog = float4(0,0,0,0);
                o.uv = float4(v.uv0, v.uv1);
                // o.SH = SampleSHVertex(worldNormal);
                o.SH = SHEvalLinearL2(worldNormal, unity_SHBr, unity_SHBg, unity_SHBb, unity_SHC);                          
                return o;
            }
            float SphericalGaussianFresnelFunction(float LdotH,float SpecularColor)
            {	
                float power = ((-5.55473 * LdotH) - 6.98316) * LdotH;
                return SpecularColor + (1 - SpecularColor)  * pow(2,power);
            }
            float TrowbridgeReitzNormalDistribution(float NdotH, float roughness)
            {
                float roughnessSqr = roughness*roughness;
                float Distribution = NdotH*NdotH * (roughnessSqr-1.0) + 1.0;
                return roughnessSqr / (3.1415926535 * Distribution*Distribution);
            }
            float4 frag (v2f i) : SV_Target
            {                 
                
                _SSSDiffParam = float4(1.50,1.15,0,0.4);
                float3 worldPos = float3(i.TtoW0.w,i.TtoW1.w,i.TtoW2.w);
                // float3 viewDirection = normalize(_WorldSpaceCameraPos - worldPos);
                // Light light = GetMainLight();
                float3 worldCameraPos = float3(0.0,1.18,1.03);
                float3 viewDirection = normalize(worldCameraPos - worldPos); // ?????

                float2 FaceMaskTexColor = tex2D(_FaceMaskTex, i.uv.xy);
                float4 mainTexColor = tex2D(_MainTex, i.uv.xy);//u_xlat16_3
                float4 Normal = tex2D(_BumpMap, i.uv.xy); //xy normal, z mask w mask
                float4 _BumpMapTex = Normal;

                _SSSPoreParam.x = 1.5;
                float2 poreUV  = i.uv.xy * _SSSPoreParam.x;
                poreUV = poreUV * float2(10.0, 10.0);
                float4 PoreTexColor = tex2D(_PoreTex, poreUV);
                float2 facePore = _BumpMapTex.ww * (PoreTexColor.xy + float2(-1.0, -1.0)) + float2(1.0, 1.0);
                float4 _ParamTexColor = tex2D(_ParamTex, i.uv.xy); //u_xlat16_6
            
                float4 _ParamTex2Color = tex2D(_ParamTex2, i.uv.xy);//u_xlat16_38 xw ???
                float3 mainColor =  mainTexColor.xyz;

             
                Normal.xy = Normal.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float3 normal_1 = float3(Normal.xy,1.0);                
                float3 worldNormal = normalize(half3(dot(i.TtoW0.xyz, normal_1), dot(i.TtoW1.xyz, normal_1), dot(i.TtoW2.xyz, normal_1)));
                _CharacterLightDir.xyz = float3(-0.09052,0.44179,0.89254);
                float LdotN = saturate(dot(_CharacterLightDir.xyz, worldNormal));
                float2 lutXY = float2(LdotN*0.5+0.5,0.0);

                float3 eyeBrow = float3(0,0,0);
                float3 diffuseParam1 = eyeBrow + mainColor;
                _CharacterSkinColorScale.xyz = float3(1,1,1);
                _SSSLightColor.xyz = float3(0.99216,0.89412,0.8941);
                float3 skinLightColor = _CharacterSkinColorScale.xyz * _SSSLightColor.xyz; //u_xlat16_11
            
                float _ParamTexColorZ = _ParamTexColor.z * 0.636900008;//u_xlat16_10.x
            
                float3 SSSlut1 = tex2D(_SSSTex, lutXY).xyz;//u_xlat16_17
                float3 sssDiff = skinLightColor.xyz * float3(2.0, 2.0, 2.0) + float3(_ParamTexColorZ,_ParamTexColorZ,_ParamTexColorZ);    
                sssDiff.xyz = _ParamTexColor.xxx * sssDiff.xyz; // 区域X
                sssDiff.xyz = sssDiff.xyz * _SSSDiffParam.x;
                
                float3 sssSkinColor1 = skinLightColor.xyz * _SSSDiffParam.y; // u_xlat16_29                

             
                float _SSSDiffParamW = _ParamTexColorZ * _SSSDiffParam.w; //u_xlat16_66
                sssSkinColor1.xyz = sssSkinColor1.xyz * SSSlut1.xyz + float3(_SSSDiffParamW,_SSSDiffParamW,_SSSDiffParamW);
                

                sssDiff.xyz = sssDiff.xyz * _CharacterSkinColorScale.xyz;
                sssDiff.xyz = sssDiff.xyz * _MainColor.xyz;
                sssDiff.xyz = sssDiff.xyz * float3(0.25, 0.0, 0.0) + sssSkinColor1;
                float3 diffuseParma2 = sssDiff.xyz;
                
                float3 diffuse = diffuseParam1 * diffuseParma2;
                // diffuse = specular * float3(u_xlat55) + diffuse; // specular + diffuse;

// --------------------------Specular + diffuse ------------------------------
                _FacialParams = float4(1.0,0.665,1.0,1.0);
                float FacialControl = _BumpMapTex.z * _FacialParams.x;
                                
                FacialControl = FacialControl * (_FacialParams.y - mainTexColor.w) + mainTexColor.w; // specularW
      
                float VdotN = dot(viewDirection.xyz, worldNormal); // normal 改
                return float4(viewDirection,1);
                return float4(VdotN,VdotN,VdotN,1);
                float VdotNN = VdotN;
                VdotNN = saturate(VdotNN);    
                
                        
                // u_xlat16_5.x = 1.0 -VdotN;
                // u_xlat16_5.w = (-u_xlat16_5.w) + 1.0;    
                FacialControl = 1.0- FacialControl;


                FacialControl = max(FacialControl, 0.0500000007);
                FacialControl = min(FacialControl, 1.0);
                float roughness = _ParamTexColor.w * (FacialControl * -0.31099999) + FacialControl; //u_xlat16_38.x;
                // u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;    
                // u_xlat16_5.x = (1.0 - VdotN)*(1.0 - VdotN);
                roughness = roughness * roughness;
                float roughnessSqr = roughness * roughness + 0.00999999978;


                float3 facePore1 = facePore.x * float3(1.0, 0.5, 0.25);
                float3 facePore2 = facePore.y * float3(0.0, 0.25, 0.300000012);    
                
                float VdotNN2 = (1.0 - VdotN)*(1.0 - VdotN);
                float3 faceP = (-facePore.x) * float3(1.0, 0.5, 0.25) + float3(0.5, 0.5, 0.5);
                facePore1 = VdotNN2 * faceP + facePore1;

                float3 tttt = (-facePore.y) * float3(0.0, 0.25, 0.300000012) + float3(0.5, 0.5, 0.5);                
                facePore2 = VdotNN2 * tttt + facePore2.xyz;



                float H = viewDirection + _CharacterLightDir.xyz;
                H = normalize(H);
                float NdotH = dot(H, worldNormal.xyz);// u_xlat16_12
                float VdotH = dot(H, viewDirection.xyz);
                float Distribution = NdotH * NdotH * (roughnessSqr - 1.0) + 1.0;
                // u_xlat16_0.x = Distribution * Distribution
                Distribution = Distribution * Distribution;
                Distribution = max(Distribution, 9.99999975e-05);

                
                float power = ((-5.55473 * VdotH) - 6.98316) * VdotH;    
                float SpecularColor = 0.0399999991;    
                float SphericalGaussianFresnelFunction = exp2(power) * (1.0-SpecularColor) + SpecularColor;
                
                float TrowbridgeReitzNormalDistribution = roughnessSqr / (Distribution * 3.14159298);//SpecularDistribution
                float F = 0.25 * SphericalGaussianFresnelFunction * TrowbridgeReitzNormalDistribution;        


                float skinLightColorX = skinLightColor.x * 4.0;
                skinLightColorX = LdotN * skinLightColorX;
                F = skinLightColorX * F;


                
                float EdgeControl = 0.05;
                float SpecParam1 = min(F * 0.5, 6.0);

                
                float edg = _ParamTexColor.z * EdgeControl * 0.899999976;
                float t = 1.0 - _ParamTexColor.w;
                
                float3 specColorL = facePore2 * _ParamTexColor.www + float3(t,t,t); // u_xlat16_11.xxx;
                specColorL.xyz = edg * specColorL.xyz;


                float lum = dot(float3(_ParamTexColorZ,_ParamTexColorZ,_ParamTexColorZ), float3(0.300000012, 0.589999974, 0.109999999));
                
                EdgeControl = _ParamTexColorZ * EdgeControl;

                float3 faceEdgeC = facePore1 * EdgeControl;
                faceEdgeC = faceEdgeC * float3(15.0, 15.0, 15.0);
                faceEdgeC = _ParamTexColor.www * faceEdgeC;
                
                float3 specLerp = specColorL.xyz * lum + faceEdgeC.xyz;
                specLerp = specLerp*_SSSSpecParam.w;    
                specLerp = specLerp*(1.0 - FaceMaskTexColor.x);

                float3 specularParam2 = _BumpMapTex.www * specLerp;

                SpecParam1 = SpecParam1 * _SSSSpecParam.y;    

                float3 specular = SpecParam1 * _ParamTexColor.yyy ;//+ specularParam2;                
                
                diffuse =  specular;
                return float4(specular,1);
                
            }
            ENDHLSL
        }
    }
}



// /*
// SV_Target0.w = 1.0;
// SV_Target0.xyz = u_xlat16_19.xyz;
// return ;
// */