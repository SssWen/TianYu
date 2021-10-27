// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Low/Tianyu Shaders/Character/CharacterSkin"
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
        _SSSLightColor ("SSS Light Color", Vector) = (1,1,1,1)
        // _SSSLightColor2 ("SSS Light Color Game", Vector) = (1,1,1,1)
        _SSSSpecParam ("SSS Face Spec Param", Vector) = (1.35,1,0,2.0)
        _SSSDiffParam ("SSS Face Diff Param", Vector) = (1,1,1,1)
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
        _FacialParams ("FacialParams x: LipSmoothnessFromNormal y: FacialLipSmoothness z: BlockMainColor, w: DecalEnableMask", Vector) = (0,0.5,0,1)
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
        Tags { "LightMode"="ForwardBase" "RenderType" = "Opaque" "QUEUE" = "Geometry"}

        Pass
        {
			Tags { "LightMode"="UniversalForward" }
			HLSLPROGRAM
            #pragma target 3.0
          
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_INV_PI 1/3.14            
            #define EVALUATE_SH_MIXED
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
            float4 _DecalTex_ST;
            float4 _DecalTransform;
            float4 _DecalColor;
            float4 _DecalTypePara;
            float4 _FacialParams;
            float4 _RimColorGame;
            float _RimPowerGame;


            sampler2D _FaceMaskTex;
            sampler2D _MainTex;
            sampler2D _BumpMap;
            sampler2D _ParamTex;
            sampler2D _ParamTex2;
            sampler2D _EyebrowMask;
            sampler2D _DecalTex;
            sampler2D _SSSTex;
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
                float4 Normal = tex2D(_BumpMap, i.uv.xy); //xy normal, z mask w mask
                Normal.xy = Normal.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
                float3 normal_1 = float3(Normal.xy,1.0);                
                float3 worldNormal = normalize(half3(dot(i.TtoW0.xyz, normal_1), dot(i.TtoW1.xyz, normal_1), dot(i.TtoW2.xyz, normal_1)));
                float3 worldPos = float3(i.TtoW0.w,i.TtoW1.w,i.TtoW2.w);                                                        
                float3 cam = float3(-10.447,11.045,-136.348);
                cam = cam - worldPos;
                float3 viewDirection = normalize(i.viewDir);  
  
                _CharacterLightDir.xyz = _MainLightPosition.xyz;

                
                // return float4(viewDirection,1.0);
                float VdotL = saturate(dot(viewDirection, _CharacterLightDir.xyz));   
    // u_xlat16_19.x = dot(u_xlat0.xyz, _CharacterLightDir.xyz);
                // VdotL = SRGBToLinear(VdotL);
                // return float4(VdotL,VdotL,VdotL,1.0);

        //
                float VdotN = saturate(dot(viewDirection, worldNormal));

                VdotN = max(VdotN, 0.200000003);                
                float VdotN_1 = VdotN * 0.599999964 + 0.300000012;

                float3 diffuse = float3(0,0,0);
                float3 specular = float3(0,0,0);

                float NdotL = dot(worldNormal.xyz, _CharacterLightDir.xyz);
                NdotL = saturate(NdotL);   
                float lutUVX = NdotL / (NdotL * 0.8 + 0.2) - 0.15;                
                lutUVX = saturate(lutUVX);
                lutUVX = lerp(lutUVX,1,NdotL);

                //  return float4(lutUVX,lutUVX,lutUVX,1.0);
                //  return float4(NdotL,NdotL,NdotL,1.0);
                float3 SSSlut1 = tex2D(_SSSTex,float2(lutUVX,0) ).xyz;
                // float3 SSSlut1 = tex2D(_SSSTex,float2(0.5,0) ).xyz;
                // SSSlut1= pow(SSSlut1,2.2);                
                
                float SkinControl = NdotL + 0.300000012;
                SkinControl = min(SkinControl, 1.0);

                float2 lutUV2XY = VdotL * float2(0.150000036, 0.899999976) + float2(0.649999976, 0.100000001);
                lutUV2XY.x = VdotN*(1 - lutUV2XY.x) + lutUV2XY.x;
                lutUV2XY.x = min(lutUV2XY.x,1);                
                float3 SSSlut2 = tex2D(_SSSTex, float2(lutUV2XY.x,0));// u_xlat16_8



                _SSSGameDiffParam3 = float4(1.34,0.79,0.8,1.0);
                float SkinControlB = SkinControl*_SSSGameDiffParam3.y;
                float3 SSSLUT1Color = SSSlut1.xyz * SkinControlB;

                // return float4(SSSLUT1Color,1);

                SSSLUT1Color = (1.89999998 - VdotL)* SSSLUT1Color.xyz;
                SSSLUT1Color = saturate(SSSLUT1Color);


                // return float4(SSSLUT1Color,1); // ok
                float SkinControlA = saturate(SkinControl + 0.300000012);
                

                float2 _FacialMask = tex2D(_ParamTex2, i.uv.xy).yw; //y 鼻子和嘴巴 w扣掉了脖子
                float2 FaceMaskTex = tex2D(_FaceMaskTex, i.uv.xy).xy;
                _FacialMask.y = _FacialMask.y * step(_FacialParams.z,0.800000012);
                float luminance = dot(_MainColor.xyz, float3(0.300000012, 0.589999974, 0.109999999));
                float _FacialMaskXLum = _FacialMask.x * luminance;
                float FaceMaskLum = (-_FacialMask.x) * luminance + 0.0500000007;
                FaceMaskLum = FaceMaskTex.x * FaceMaskLum + _FacialMaskXLum;

                _SSSGameDiffParam4 = float4(0.31,0.1,5.0,0.8);
                float parma1 = VdotL / lutUV2XY.y;
                float SSSGameDiffParam = parma1 + _SSSGameDiffParam4.y;
                SSSGameDiffParam = saturate(SSSGameDiffParam);
                SSSGameDiffParam = SSSGameDiffParam *_SSSGameDiffParam4.z;
                SSSGameDiffParam = FaceMaskLum * SSSGameDiffParam;
                float3 CharacterSkinColor = SSSGameDiffParam * _SSSGameColorParam.xyz;
                CharacterSkinColor = SkinControlA * CharacterSkinColor;

                float4 _MainColorTemp = tex2D(_MainTex, i.uv.xy);
                
                
                float3 LUT2Color = FaceMaskTex.x * (VdotN_1 - SSSlut2.xyz) + SSSlut2.xyz;

                float VdotL_1 = (1-VdotL) * 0.100000001 + 1.0;
                float SSSDiffParam3Z = VdotL_1 * _SSSGameDiffParam3.z;
                LUT2Color = SSSDiffParam3Z * LUT2Color + SSSLUT1Color.xyz;



                _SSSLightColor2 = float4(0.8784,0.8784,0.8784,0.0);
                float3  _SSSLightColor2Skin =  _SSSLightColor2.xyz;

                _CharacterSkinColorScale = float4(0.385,0.334,0.293,1.0);
                float3 SkinColor4 = _SSSGameDiffParam4.x * float3(1.20000005, 1.20000005, 1.20000005) + _CharacterSkinColorScale.xyz;    
                _SSSLightColor2Skin.xyz = _SSSLightColor2Skin * SkinColor4.xyz;    
                _SSSLightColor2Skin.xyz = _SSSLightColor2Skin * _SSSGameDiffParam3.x;    
                float3 diffParam3 = LUT2Color.xyz * _SSSLightColor2Skin;

     
                
                diffuse = diffParam3 * _MainColorTemp.xyz + CharacterSkinColor.xyz;
                
                return float4(diffuse.xyz,1);            
// ---------------------------------------specular----------------------

                float2 paramTex = tex2D(_ParamTex,i.uv.xy).yw;
                float3 viewDirFace = viewDirection.xyz * float3(1.0, 2.0, 1.0) + float3(viewDirection.x,0.300000012,viewDirection.z);
                viewDirFace = normalize(viewDirFace);                
                float NdotVPore = dot(worldNormal.xyz, viewDirFace.xyz); // 使用worldNormal代替
                float NdotH = NdotVPore;

                float LdotH = dot(viewDirFace.xyz, viewDirection.xyz); 

       
                float FresnelFunction = SphericalGaussianFresnelFunction(LdotH,0.0399999991); // yy
 
                float glossness = _MainColorTemp.w; // 1 - glossness 暂时去掉嘴巴高光计算,-A通道specular + 0.621
                float roughness = 1 - glossness;
                roughness = max(roughness , 0.0500000007); // u_xlat16_4.y = Normal.w
                roughness = min(roughness, 1.0); // u_xlat16_1 NormalW
                // roughness = ParamTex.y * NormalW_1 + roughness; // 暂时去掉遮罩 roughness               
                roughness = roughness*roughness;
                float SpecularDistribution = TrowbridgeReitzNormalDistribution(NdotH,roughness);
                // float F = SpecularDistribution * FresnelFunction;
                // float F =  SpecularDistribution*FresnelFunction*0.3 *10; // _MainColor.a;测试
                float F =  SpecularDistribution*FresnelFunction*0.3;
                F = paramTex.x * F;
                float3 specularColor = float3(F,F,F);
                // specularColor = specularColor*10;
                // 去掉mask区域改变
                _SSSSpecParam = float4(1.35,1,0,2.0);
                float3 gameSpecColor = _CharacterGameSpecColor.xyz * _SSSSpecParam.yyy;
                // u_xlat16_8.xyz = u_xlat16_8.xyz * _SSSGameDiffParam4.www;
                gameSpecColor.xyz = gameSpecColor.xyz * _SSSGameDiffParam4.www;

                // u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
                specularColor = specularColor.xyz * gameSpecColor.xyz;
                
                

                float SkinControlNdotL = SkinControl * NdotL; // 
                specular.xyz = lerp(0.3,1,SkinControlNdotL) * specularColor.xyz;

                diffuse = diffuse + specular;
                diffuse= SRGBToLinear(diffuse);
                return float4(diffuse,1);
                // return float4(diffuse+specular,1);
                
          
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