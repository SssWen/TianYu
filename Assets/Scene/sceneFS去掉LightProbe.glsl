#version 310 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable

 precision highp atomic_uint;
#endif

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
vec2 ImmCB_0_0_0[12];
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _CharacterLightningStrength;
uniform 	mediump vec4 _CharacterGlobalParams;
uniform 	mediump vec4 _CharacterSkinColorScale;
uniform 	mediump vec4 _EyebrowTilingOffset;
uniform 	mediump vec4 _EyebrowHSV;
uniform 	mediump vec4 _HighlightColor;
uniform 	mediump float _DarkCharacterScale;
uniform 	mediump float _DarkCharacterCtrl;
uniform 	mediump float _AutoExposure;
uniform 	mediump float _AutoExposure_Intensity;
uniform 	mediump float _OutputAlpha;
uniform 	mediump vec4 _FogInfo2;
uniform 	mediump vec4 _FogInfo3;
uniform 	mediump vec4 _FogInfo4;
uniform 	mediump vec4 _FogColor1;
uniform 	mediump vec4 _FogColor2;
uniform 	mediump vec4 _FogColor3;
uniform 	mediump float _SoftShadowType;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowBias;
uniform 	mediump float PANGU_CHARACTER_SOFT_SHADOW_SOFTNESS;
uniform 	mediump vec3 _CharacterLightDir;
uniform 	mediump float _VlmScale;
uniform 	mediump float _VolumetricShadow;
uniform 	mediump vec4 _SSSLightColor2;
uniform 	mediump vec4 _CharacterGameSpecColor;
uniform 	mediump float CharacterShadowAdd;
uniform 	mediump vec4 _SSSGameDiffParam3;
uniform 	mediump vec4 _SSSGameDiffParam4;
uniform 	mediump vec4 _SSSGameColorParam;
uniform 	mediump vec4 _SSSSpecParam;
uniform 	mediump vec4 _SSSPoreParam;
uniform 	mediump float _LipCubeIntensity;
uniform 	mediump float _HDRTexEnable;
uniform 	mediump vec4 _FacialParams;
uniform 	mediump vec4 _RimColorGame;
uniform 	mediump float _RimPowerGame;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityLighting {
#endif
	UNITY_UNIFORM mediump vec4 _WorldSpaceLightPos0;
	UNITY_UNIFORM vec4 _LightPositionRange;
	UNITY_UNIFORM vec4 _LightProjectionParams;
	UNITY_UNIFORM vec4 unity_4LightPosX0;
	UNITY_UNIFORM vec4 unity_4LightPosY0;
	UNITY_UNIFORM vec4 unity_4LightPosZ0;
	UNITY_UNIFORM mediump vec4 unity_4LightAtten0;
	UNITY_UNIFORM mediump vec4 unity_LightColor[8];
	UNITY_UNIFORM vec4 unity_LightPosition[8];
	UNITY_UNIFORM mediump vec4 unity_LightAtten[8];
	UNITY_UNIFORM vec4 unity_SpotDirection[8];
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
	UNITY_UNIFORM mediump vec4 unity_OcclusionMaskSelector;
	UNITY_UNIFORM mediump vec4 unity_ProbesOcclusion;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityShadows {
#endif
	UNITY_UNIFORM vec4 unity_ShadowSplitSpheres[4];
	UNITY_UNIFORM vec4 unity_ShadowSplitSqRadii;
	UNITY_UNIFORM vec4 unity_LightShadowBias;
	UNITY_UNIFORM vec4 _LightSplitsNear;
	UNITY_UNIFORM vec4 _LightSplitsFar;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
	UNITY_UNIFORM mediump vec4 _LightShadowData;
	UNITY_UNIFORM vec4 unity_ShadowFadeCenterAndType;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(3) uniform VlmSH {
#endif
	UNITY_UNIFORM mediump vec4 _VlmValues[7];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _FaceMaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ParamTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ParamTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _EyebrowMask;
UNITY_LOCATION(6) uniform mediump samplerCube _Cube;
UNITY_LOCATION(7) uniform mediump sampler2D _PoreTex;
UNITY_LOCATION(8) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SSSTex;
UNITY_LOCATION(10) uniform mediump sampler2D _AutoExposureTex;
UNITY_LOCATION(11) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform mediump sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec2 u_xlat14;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
float u_xlat17;
mediump vec2 u_xlat16_17;
vec2 u_xlat18;
mediump vec2 u_xlat16_18;
uint u_xlatu18;
bvec2 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_23;
float u_xlat30;
mediump float u_xlat16_30;
mediump vec2 u_xlat16_31;
vec2 u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_34;
mediump vec2 u_xlat16_38;
float u_xlat45;
mediump float u_xlat16_45;
float u_xlat47;
mediump float u_xlat16_47;
float u_xlat48;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_51;
mediump float u_xlat16_53;
void main()
{

    // u_xlat0.x = vs_TEXCOORD0.w;
    // u_xlat0.y = vs_TEXCOORD1.w;
    // u_xlat0.z = vs_TEXCOORD2.w;
    // u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;

    vec3 worldPos = vec3(vs_TEXCOORD0.w,vs_TEXCOORD1.w,vs_TEXCOORD2.w);
    vec3 viewDir = (-worldPos) + _WorldSpaceCameraPos.xyz;

    u_xlat45 = dot(viewDir.xyz, viewDir.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    // u_xlat0.xyz = vec3(u_xlat45) * viewDir.xyz;
    viewDir.xyz = vec3(u_xlat45) * viewDir.xyz;
    // u_xlat16_1.xy = texture(_FaceMaskTex, vs_TEXCOORD3.xy).xy;
    vec2 FaceMaskTexColor = texture(_FaceMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_3 = texture(_BumpMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_31.xy = texture(_ParamTex, vs_TEXCOORD3.xy).yw;
    u_xlat16_3.xy = texture(_ParamTex2, vs_TEXCOORD3.xy).yw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.800000012<_FacialParams.z);
#else
    u_xlatb5 = 0.800000012<_FacialParams.z;
#endif
    u_xlat16_49 = (u_xlatb5) ? 0.0 : 1.0;
    u_xlat16_49 = u_xlat16_3.y * u_xlat16_49;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _MainColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz + u_xlat16_2.xyz;



    u_xlat16_49 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat16_8.xyz = vec3(u_xlat16_49) * vs_TEXCOORD5.xyz;



    u_xlat2.x = vs_TEXCOORD0.z;
    u_xlat2.y = vs_TEXCOORD1.z;
    u_xlat2.z = vs_TEXCOORD2.z;
    u_xlat16_49 = dot(u_xlat16_8.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_51 = u_xlat16_51 * _LipCubeIntensity;
    u_xlat16_8.x = dot((-vs_TEXCOORD5.xyz), u_xlat2.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat2.xyz * (-u_xlat16_8.xxx) + (-vs_TEXCOORD5.xyz);
    u_xlat16 = _FacialParams.y * -3.0 + 3.0;
    u_xlat16_2.xyz = textureLod(_Cube, u_xlat16_8.xyz, u_xlat16).xyz;
    u_xlat2.xyz = vec3(u_xlat16_49) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_HDRTexEnable<0.5);
#else
    u_xlatb16 = _HDRTexEnable<0.5;
#endif
    u_xlat10.xyz = u_xlat2.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : u_xlat10.xyz;
    u_xlat16_8.xyz = u_xlat2.xyz * vec3(u_xlat16_51);
    u_xlat16_8.xyz = u_xlat16_3.zzz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * _FacialParams.xxx + u_xlat16_6.xyz;
    u_xlat16_8.xy = vs_TEXCOORD3.xy * _SSSPoreParam.xx;
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(10.0, 10.0);
    u_xlat16_5 = texture(_PoreTex, u_xlat16_8.xy);
    u_xlat16_8.xy = u_xlat16_5.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_38.xy = u_xlat16_5.xy + vec2(-1.0, -1.0);
    u_xlat16_38.xy = u_xlat16_3.ww * u_xlat16_38.xy + vec2(1.0, 1.0);
    u_xlat16_8.xy = (-u_xlat16_4.xy) + u_xlat16_8.xy;
    u_xlat16_9.xy = u_xlat16_3.ww * u_xlat16_8.xy + u_xlat16_4.xy;
    u_xlat16_9.z = 1.0;
    u_xlat16_11.x = dot(vs_TEXCOORD0.xyz, u_xlat16_9.xyz);
    u_xlat16_11.y = dot(vs_TEXCOORD1.xyz, u_xlat16_9.xyz);
    u_xlat16_11.z = dot(vs_TEXCOORD2.xyz, u_xlat16_9.xyz);
    u_xlat16_49 = u_xlat16_3.z * _FacialParams.x;
    u_xlat16_51 = (-u_xlat16_2.w) + _FacialParams.y;
    u_xlat16_4.w = u_xlat16_49 * u_xlat16_51 + u_xlat16_2.w;
    u_xlat16_4.z = 1.0;
    u_xlat16_9.x = dot(vs_TEXCOORD0.xyz, u_xlat16_4.xyz);
    u_xlat16_9.y = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat16_9.z = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat16_16 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_16 = inversesqrt(u_xlat16_16);
    u_xlat16_2.xyz = vec3(u_xlat16_16) * u_xlat16_9.xyz;

    
    //     //ENDIF
    //     }
    // //ENDIF
    // }
    // 去掉阴影
    u_xlat16_4.x  = 1.0;


    u_xlat16_19.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_19.x + _LightShadowData.x;
    u_xlat16_18.xy = (-vec2(vec2(_VolumetricShadow, _VolumetricShadow))) * vec2(0.600000024, 0.300000012) + vec2(1.0, 1.0);

    // 去掉 light probe 影响小
    // u_xlat16_5 = u_xlat16_2.zyxx * vec4(-0.325735003, 0.325735003, 0.325735003, -0.273137003);
    // u_xlat16_5.w = u_xlat16_2.z * u_xlat16_5.w;
    // u_xlat16_19.xy = u_xlat16_2.zx * vec2(-0.273137003, 0.273137003);
    // u_xlat16_16 = u_xlat16_2.y * u_xlat16_2.y;
    // u_xlat16_16 = u_xlat16_16 * 3.0 + -1.0;
    // u_xlat7.y = u_xlat16_16 * 0.0788479969;
    // u_xlat16_7.xz = u_xlat16_2.yy * u_xlat16_19.xy;
    // u_xlat16_19.x = u_xlat16_2.z * u_xlat16_2.z;
    // u_xlat16_19.x = u_xlat16_2.x * u_xlat16_2.x + (-u_xlat16_19.x);
    // u_xlat7.w = u_xlat16_19.x * 0.136568502;
    // u_xlat16_19.x = dot(u_xlat16_5, _VlmValues[0]);
    // u_xlat7.xz = u_xlat16_7.xz;
    // u_xlat16_34 = dot(u_xlat7, _VlmValues[1]);
    // u_xlat16_19.x = u_xlat16_34 + u_xlat16_19.x;

    // u_xlat16_9.x = _VlmValues[6].x * 0.282094985 + u_xlat16_19.x;
    // u_xlat16_19.x = dot(u_xlat16_5, _VlmValues[2]);
    // u_xlat16_34 = dot(u_xlat7, _VlmValues[3]);
    // u_xlat16_19.x = u_xlat16_34 + u_xlat16_19.x;
    // u_xlat16_9.y = _VlmValues[6].y * 0.282094985 + u_xlat16_19.x;
    // u_xlat16_19.x = dot(u_xlat16_5, _VlmValues[4]);
    // u_xlat16_34 = dot(u_xlat7, _VlmValues[5]);
    // u_xlat16_19.x = u_xlat16_34 + u_xlat16_19.x;
    // u_xlat16_9.z = _VlmValues[6].z * 0.282094985 + u_xlat16_19.x;


    u_xlat16_9.xyz = vec3(0.0,0.0,0.0);
    u_xlat16_12.xyz = u_xlat16_9.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat16_12.xyz = u_xlat16_9.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_9.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat16_9.xyz = u_xlat16_12.xyz / u_xlat16_9.xyz;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_VlmScale, _VlmScale, _VlmScale));
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + _SSSLightColor2.xyz;
  


    u_xlat16_19.x = dot(viewDir.xyz, _CharacterLightDir.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_34 = dot(_CharacterLightDir.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_34 * 0.800000012 + 0.199999988;
    u_xlat16_51 = u_xlat16_34 / u_xlat16_51;
    u_xlat16_16 = u_xlat16_51 + -0.150000006;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_47 = (-u_xlat16_16) + 1.0;
    u_xlat14.x = u_xlat16_34 * u_xlat16_47 + u_xlat16_16;
    u_xlat14.y = 0.0;
    u_xlat16_14.xyz = texture(_SSSTex, u_xlat14.xy).xyz;
    u_xlat16_51 = dot(_MainColor.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat16_8.x = u_xlat16_3.x * u_xlat16_51;
    u_xlat16_16 = (-u_xlat16_3.x) * u_xlat16_51 + 0.0500000007;
    u_xlat16_16 = FaceMaskTexColor.x * u_xlat16_16 + u_xlat16_8.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_18.x + CharacterShadowAdd;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_47 = (-u_xlat16_18.y) + u_xlat16_4.x;
    u_xlat16_47 = _CharacterGlobalParams.x * u_xlat16_47 + u_xlat16_18.y;
    u_xlat16_47 = min(u_xlat16_18.y, u_xlat16_47);
    u_xlat16_4.x = (-u_xlat16_47) + u_xlat16_4.x;
    u_xlat16_4.x = FaceMaskTexColor.x * u_xlat16_4.x + u_xlat16_47;
    u_xlat16_47 = u_xlat16_34 + 0.300000012;
    u_xlat16_47 = min(u_xlat16_47, 1.0);
    u_xlat16_47 = min(u_xlat16_47, u_xlat16_4.x);
    u_xlat16_4.x = dot(viewDir.xyz, u_xlat16_2.xyz);
    u_xlat16_51 = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_51, 0.200000003);

    u_xlat16_17.xy = u_xlat16_19.xx * vec2(0.150000036, 0.899999976) + vec2(0.649999976, 0.100000001);

    u_xlat16_3.x = (-u_xlat16_17.x) + 1.0;
    u_xlat16_17.x = u_xlat16_2.x * u_xlat16_3.x + u_xlat16_17.x;

    u_xlat16_2.x = u_xlat16_2.x * 0.599999964 + 0.300000012;
    u_xlat16_8.x = min(u_xlat16_17.x, 1.0);

    u_xlat16_8.y = 0.0;
    u_xlat16_3.xyz = texture(_SSSTex, u_xlat16_8.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_2.xxx + (-u_xlat16_3.xyz);
    u_xlat16_12.xyz = FaceMaskTexColor.xxx * u_xlat16_12.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xy = (-u_xlat16_19.xx) + vec2(1.0, 1.89999998);
    u_xlat16_1.x = u_xlat16_2.x * 0.100000001 + 1.0;
    u_xlat16_8.x = u_xlat16_47 * _SSSGameDiffParam3.y;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_8.xxx;
    u_xlat16_13.xyz = u_xlat16_2.yyy * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_1.x * _SSSGameDiffParam3.z;
    u_xlat16_12.xyz = u_xlat16_8.xxx * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _SSSGameDiffParam4.xxx * vec3(1.20000005, 1.20000005, 1.20000005) + _CharacterSkinColorScale.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _SSSGameDiffParam3.xxx;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_9.xyz;
    u_xlat16_1.x = u_xlat16_19.x / u_xlat16_17.y;
    u_xlat16_19.x = u_xlat16_1.x + _SSSGameDiffParam4.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_19.x * _SSSGameDiffParam4.z;
    u_xlat16_19.x = u_xlat16_16 * u_xlat16_19.x;
    u_xlat16_12.xyz = u_xlat16_19.xxx * _SSSGameColorParam.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _CharacterSkinColorScale.xyz;
    u_xlat16_1.x = u_xlat16_47 + 0.300000012;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xxx * u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_19.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_6.xyz = u_xlat16_19.xxx * u_xlat16_11.xyz;
    u_xlat16_4.xy = (-u_xlat16_4.xw) + vec2(1.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_4.y, 0.0500000007);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_19.xz = u_xlat16_1.xx * vec2(-0.699999988, 10.0);
    u_xlat16_4.y = u_xlat16_31.y * u_xlat16_19.x + u_xlat16_1.x;
    u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
    u_xlat1.y = u_xlat16_4.y * u_xlat16_4.y + 0.00999999978;
    u_xlat16_19.x = min(u_xlat16_19.z, 1.0);
    u_xlat16_19.x = (-u_xlat16_1.x) + u_xlat16_19.x;
    u_xlat16_4.y = u_xlat16_31.y * u_xlat16_19.x + u_xlat16_1.x;
    u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
    u_xlat1.x = u_xlat16_4.y * u_xlat16_4.y + 0.00999999978;
    u_xlat0.w = 0.300000012;
    u_xlat0.xz = viewDir.xz;
    u_xlat16_9.xyz = viewDir.xyz * vec3(1.0, 2.0, 1.0) + u_xlat0.xwz;
    u_xlat16_19.x = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
    u_xlat16_9.xyz = u_xlat16_19.xxx * u_xlat16_9.xyz;
    u_xlat16_19.x = dot(u_xlat16_9.xyz, u_xlat16_6.xyz);
    u_xlat16_49 = dot(u_xlat16_9.xyz, viewDir.xyz);
    u_xlat0.x = u_xlat16_19.x * u_xlat1.y + (-u_xlat16_19.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_19.x + 1.0;
    u_xlat16_15 = u_xlat16_49 * -5.55472994 + -6.98316002;
    u_xlat16_15 = u_xlat16_49 * u_xlat16_15;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat0.y = u_xlat16_15 * 0.959999979 + 0.0399999991;
    u_xlat30 = u_xlat16_19.x * u_xlat1.x + (-u_xlat16_19.x);
    u_xlat0.z = u_xlat30 * u_xlat16_19.x + 1.0;
    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz;
    u_xlat0.xz = max(u_xlat0.xz, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xyz = u_xlat0.xyz * vec3(3.14159298, 0.25, 3.14159298);
    u_xlat0.xz = u_xlat1.yx / u_xlat0.xz;
    u_xlat30 = u_xlat0.y * u_xlat0.z;
    u_xlat16_6.xyz = vec3(u_xlat30) * vec3(2.0, 1.79999995, 1.60000002);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat0.yyy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_31.xxx * u_xlat16_6.xyz;
    u_xlat16_19.x = u_xlat16_38.y + u_xlat16_38.x;
    u_xlat16_6.xyz = u_xlat16_19.xxx * u_xlat16_6.xyz;
    u_xlat16_8.xyz = _CharacterGameSpecColor.xyz * _SSSSpecParam.yyy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _SSSGameDiffParam4.www;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_19.x = u_xlat16_47 * u_xlat16_34;
    u_xlat16_0.x = u_xlat16_19.x * 0.699999988 + 0.300000012;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_19.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + u_xlat16_0.xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz + u_xlat16_19.xyz;
    u_xlat16_6.x = _CharacterLightningStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x + 1.0;
    u_xlat16_8.xyz = u_xlat16_4.xxx * _HighlightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _HighlightColor.www;
    u_xlat16_4.xyz = u_xlat16_19.xyz * u_xlat16_6.xxx + u_xlat16_8.xyz;
    u_xlat16_49 = (-u_xlat16_51) + 1.0;
    u_xlat16_0.x = u_xlat16_49 * 0.425000012;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_49;
    u_xlat16_0.x = u_xlat16_49 * u_xlat16_49 + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_31.y;
    u_xlat16_0.x = u_xlat16_0.x * _RimPowerGame;
    u_xlat16_4.xyz = u_xlat16_0.xxx * _RimColorGame.xyz + u_xlat16_4.xyz;



    SV_Target0.xyz = u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;

   
}