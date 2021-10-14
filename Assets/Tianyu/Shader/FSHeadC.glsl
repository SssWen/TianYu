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
uniform 	mediump vec4 _SSSDiffParam;
uniform 	mediump vec4 _SSSLightColor;
uniform 	mediump vec4 _SSSSpecParam;
uniform 	mediump vec4 _SSSPoreParam;
uniform 	mediump float _LipCubeIntensity;
uniform 	mediump float _HDRTexEnable;
uniform 	mediump vec4 _FacialParams;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
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
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
bvec3 u_xlatb20;
mediump vec2 u_xlat16_23;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
mediump float u_xlat16_37;
float u_xlat38;
mediump vec2 u_xlat16_38;
float u_xlat40;
bool u_xlatb40;
mediump float u_xlat16_41;
mediump vec2 u_xlat16_46;
float u_xlat54;
float u_xlat55;
mediump float u_xlat16_55;
bool u_xlatb55;
float u_xlat56;
uint u_xlatu56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
mediump float u_xlat16_64;
mediump float u_xlat16_66;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.w;
    u_xlat0.y = vs_TEXCOORD1.w;
    u_xlat0.z = vs_TEXCOORD2.w; 
    // u_xlat0 = worldPos;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat1.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    // u_xlat1 = viewDir = normalize(_WorldSpaceCameraPos - worldPos);

    u_xlat16_2.xy = texture(_FaceMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_4 = texture(_BumpMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_6 = texture(_ParamTex, vs_TEXCOORD3.xy);
    u_xlat16_38.xy = texture(_ParamTex2, vs_TEXCOORD3.xy).xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.800000012<_FacialParams.z);
#else
    u_xlatb55 = 0.800000012<_FacialParams.z;
#endif
    u_xlat16_59 = (u_xlatb55) ? 0.0 : 1.0;
    u_xlat16_59 = u_xlat16_38.y * u_xlat16_59;
    u_xlat16_7.xyz = u_xlat16_3.xyz * _MainColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(vs_TEXCOORD3.z<0.5);
#else
    u_xlatb55 = vs_TEXCOORD3.z<0.5;
#endif
    u_xlat56 = (-vs_TEXCOORD3.z) + 1.0;
    u_xlat55 = (u_xlatb55) ? u_xlat56 : vs_TEXCOORD3.z;
    u_xlat16_8.x = u_xlat55 + _EyebrowTilingOffset.z;
    u_xlat16_8.y = vs_TEXCOORD3.w + _EyebrowTilingOffset.w;
    u_xlat16_8.xy = u_xlat16_8.xy * _EyebrowTilingOffset.xy;
    u_xlat16_8 = texture(_EyebrowMask, u_xlat16_8.xy);
    u_xlat16_9 = u_xlat16_8 * _MainColor;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat16_9.y>=u_xlat16_9.z);
#else
    u_xlatb55 = u_xlat16_9.y>=u_xlat16_9.z;
#endif
    u_xlat16_59 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat16_10.xy = u_xlat16_8.yz * _MainColor.yz + (-u_xlat16_9.zy);
    u_xlat16_46.x = float(1.0);
    u_xlat16_46.y = float(-1.0);
    u_xlat16_10.xy = vec2(u_xlat16_59) * u_xlat16_10.xy;
    u_xlat16_11.xy = u_xlat16_8.zy * _MainColor.zy + u_xlat16_10.xy;
    u_xlat16_11.zw = vec2(u_xlat16_59) * u_xlat16_46.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat16_9.x>=u_xlat16_11.x);
#else
    u_xlatb55 = u_xlat16_9.x>=u_xlat16_11.x;
#endif
    u_xlat16_59 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat16_10.xyz = (-u_xlat16_11.xyw);
    u_xlat16_10.w = (-u_xlat16_9.x);
    u_xlat16_8.x = u_xlat16_8.x * _MainColor.x + u_xlat16_10.x;
    u_xlat16_8.yzw = u_xlat16_10.yzw + u_xlat16_11.yzx;
    u_xlat16_10.xyz = vec3(u_xlat16_59) * u_xlat16_8.xyz + u_xlat16_11.xyw;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_8.w + u_xlat16_9.x;
    u_xlat16_61 = min(u_xlat16_10.y, u_xlat16_59);
    u_xlat16_61 = (-u_xlat16_61) + u_xlat16_10.x;
    u_xlat16_59 = (-u_xlat16_10.y) + u_xlat16_59;
    u_xlat16_55 = u_xlat16_61 * 6.0 + 9.99999975e-05;
    u_xlat16_55 = u_xlat16_59 / u_xlat16_55;
    u_xlat16_55 = u_xlat16_55 + u_xlat16_10.z;
    u_xlat16_59 = u_xlat16_10.x + 9.99999975e-05;
    u_xlat16_59 = u_xlat16_61 / u_xlat16_59;
    u_xlat16_61 = abs(u_xlat16_55) + _EyebrowHSV.x;
    u_xlat16_59 = u_xlat16_59 + _EyebrowHSV.y;
    u_xlat16_10.x = u_xlat16_10.x + _EyebrowHSV.z;
    u_xlat16_28.xyz = vec3(u_xlat16_61) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_28.xyz = fract(u_xlat16_28.xyz);
    u_xlat16_3.xyz = u_xlat16_28.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_28.xyz = abs(u_xlat16_3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28.xyz = min(max(u_xlat16_28.xyz, 0.0), 1.0);
#else
    u_xlat16_28.xyz = clamp(u_xlat16_28.xyz, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = u_xlat16_28.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_28.xyz = vec3(u_xlat16_59) * u_xlat16_28.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_28.xyz + (-u_xlat16_9.xyz);
    u_xlat16_10.xyz = u_xlat16_9.www * u_xlat16_10.xyz + u_xlat16_9.xyz;
    u_xlat16_59 = u_xlat16_2.y * _EyebrowHSV.w;
    u_xlat16_10.xyz = (-u_xlat16_7.xyz) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_10.xyz + u_xlat16_7.xyz;
    u_xlat16_59 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_10.xyz = vec3(u_xlat16_59) * vs_TEXCOORD5.xyz;
    u_xlat3.x = vs_TEXCOORD0.z;
    u_xlat3.y = vs_TEXCOORD1.z;
    u_xlat3.z = vs_TEXCOORD2.z;
    u_xlat16_59 = dot(u_xlat16_10.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_61 = u_xlat16_61 * _LipCubeIntensity;
    u_xlat16_10.x = dot((-vs_TEXCOORD5.xyz), u_xlat3.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_10.xyz = u_xlat3.xyz * (-u_xlat16_10.xxx) + (-vs_TEXCOORD5.xyz);
    u_xlat55 = _FacialParams.y * -3.0 + 3.0;
    u_xlat16_3.xyz = textureLod(_Cube, u_xlat16_10.xyz, u_xlat55).xyz;
    u_xlat3.xyz = vec3(u_xlat16_59) * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(_HDRTexEnable<0.5);
#else
    u_xlatb55 = _HDRTexEnable<0.5;
#endif
    u_xlat9.xyz = u_xlat3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat3.xyz = (bool(u_xlatb55)) ? u_xlat3.xyz : u_xlat9.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * vec3(u_xlat16_61);
    u_xlat16_10.xyz = u_xlat16_4.zzz * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * _FacialParams.xxx + u_xlat16_7.xyz;
    u_xlat16_10.xy = vs_TEXCOORD3.xy * _SSSPoreParam.xx;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(10.0, 10.0);
    u_xlat16_8 = texture(_PoreTex, u_xlat16_10.xy);
    u_xlat16_10.xy = u_xlat16_8.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_46.xy = u_xlat16_8.xy + vec2(-1.0, -1.0);
    u_xlat16_46.xy = u_xlat16_4.ww * u_xlat16_46.xy + vec2(1.0, 1.0);
    u_xlat16_10.xy = (-u_xlat16_5.xy) + u_xlat16_10.xy;
    u_xlat16_11.xy = u_xlat16_4.ww * u_xlat16_10.xy + u_xlat16_5.xy;
    u_xlat16_11.z = 1.0;
    u_xlat16_12.x = dot(vs_TEXCOORD0.xyz, u_xlat16_11.xyz);
    u_xlat16_12.y = dot(vs_TEXCOORD1.xyz, u_xlat16_11.xyz);
    u_xlat16_12.z = dot(vs_TEXCOORD2.xyz, u_xlat16_11.xyz);
    u_xlat16_59 = u_xlat16_4.z * _FacialParams.x;
    u_xlat16_61 = (-u_xlat16_3.w) + _FacialParams.y;
    u_xlat16_5.w = u_xlat16_59 * u_xlat16_61 + u_xlat16_3.w;
    u_xlat16_5.z = 1.0;
    u_xlat16_11.x = dot(vs_TEXCOORD0.xyz, u_xlat16_5.xyz);
    u_xlat16_11.y = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat16_11.z = dot(vs_TEXCOORD2.xyz, u_xlat16_5.xyz);
    u_xlat16_55 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_3 = vec4(u_xlat16_55) * u_xlat16_11.zyxx;



    // u_xlat16_5.x 头发阴影
    // u_xlat16_5.x = 1.0
    u_xlat16_5.x = 1.0;
    u_xlat16_23.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_23.x + _LightShadowData.x;
    u_xlat16_55 = (-_VolumetricShadow) * 0.600000024 + 1.0;
    u_xlat16_23.x = dot(_CharacterLightDir.zyx, u_xlat16_3.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23.x = min(max(u_xlat16_23.x, 0.0), 1.0);
#else
    u_xlat16_23.x = clamp(u_xlat16_23.x, 0.0, 1.0);
#endif
    u_xlat20.xz = u_xlat16_23.xx * vec2(0.5, 0.600000024) + vec2(0.5, 0.200000003);
    u_xlat16_38.x = u_xlat16_38.x * -0.399999976 + 1.0;
    u_xlat38 = min(u_xlat16_38.x, u_xlat20.z);
    u_xlat38 = u_xlat38 + 0.100000001;
    u_xlat38 = max(u_xlat38, 0.0);
    u_xlat38 = u_xlat38 + -0.100000001;
    u_xlat16_55 = (-u_xlat16_5.x) * u_xlat16_55 + 1.0;
    u_xlat55 = (-u_xlat16_55) * u_xlat38 + 1.0;



    u_xlat16_11.xyz = _CharacterSkinColorScale.xyz * _SSSLightColor.xyz;
    u_xlat16_5.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_12.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz;
    u_xlat16_5.x = dot(u_xlat1.zyx, u_xlat16_3.xyw);
    u_xlat16_41 = u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_5.xw = (-u_xlat16_5.xw) + vec2(1.0, 1.0);
    u_xlat16_38.x = max(u_xlat16_5.w, 0.0500000007);
    u_xlat16_38.x = min(u_xlat16_38.x, 1.0);
    u_xlat16_59 = u_xlat16_38.x * -0.31099999;
    u_xlat16_5.w = u_xlat16_6.w * u_xlat16_59 + u_xlat16_38.x;
    u_xlat16_5.xw = u_xlat16_5.xw * u_xlat16_5.xw;
    u_xlat16_4.x = u_xlat16_5.w * u_xlat16_5.w + 0.00999999978;
    u_xlat16_14.xyz = u_xlat16_46.xxx * vec3(1.0, 0.5, 0.25);
    u_xlat16_15.xyz = u_xlat16_46.yyy * vec3(0.0, 0.25, 0.300000012);
    u_xlat16_59 = (-u_xlat16_41) + 1.0;
    u_xlat16_61 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_13.xyz = (-u_xlat16_46.xxx) * vec3(1.0, 0.5, 0.25) + vec3(0.5, 0.5, 0.5);
    u_xlat16_13.xyz = vec3(u_xlat16_61) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_16.xyz = (-u_xlat16_46.yyy) * vec3(0.0, 0.25, 0.300000012) + vec3(0.5, 0.5, 0.5);
    u_xlat16_16.xyz = vec3(u_xlat16_61) * u_xlat16_16.xyz + u_xlat16_15.xyz;
    u_xlat16_10.x = u_xlat16_6.z * 0.636900008;
    u_xlat20.z = 0.0;
    u_xlat16_17.xyz = texture(_SSSTex, u_xlat20.xz).xyz;
    u_xlat16_28.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_10.xxx;
    u_xlat16_28.xyz = u_xlat16_6.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * _SSSDiffParam.xxx;
    u_xlat16_29.xyz = u_xlat16_11.xyz * _SSSDiffParam.yyy;
    u_xlat16_66 = u_xlat16_10.x * _SSSDiffParam.w;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_17.xyz + vec3(u_xlat16_66);
    u_xlat16_28.xyz = u_xlat16_28.xyz * _CharacterSkinColorScale.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * _MainColor.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.25, 0.0, 0.0) + u_xlat16_29.xyz;
    u_xlat16_28.xyz = vec3(u_xlat55) * u_xlat16_28.xyz;



    u_xlat16_20.x = u_xlat16_11.x * 4.0;
    u_xlat16_20.x = u_xlat16_23.x * u_xlat16_20.x;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(u_xlat54) + _CharacterLightDir.xyz;
    u_xlat16_23.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_11.xyz = u_xlat16_23.xxx * u_xlat16_11.xyz;
    u_xlat16_23.x = dot(u_xlat16_11.xyz, u_xlat16_12.xyz);
    u_xlat16_11.x = dot(u_xlat16_11.xyz, u_xlat1.xyz);
    u_xlat16_0.x = u_xlat16_23.x * u_xlat16_4.x + (-u_xlat16_23.x);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_23.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat16_18 = u_xlat16_11.x * -5.55472994 + -6.98316002;
    u_xlat16_18 = u_xlat16_11.x * u_xlat16_18;
    u_xlat16_18 = exp2(u_xlat16_18);
    u_xlat0.y = u_xlat16_18 * 0.959999979 + 0.0399999991;
    u_xlat0.xy = u_xlat0.xy * vec2(3.14159298, 0.25);
    u_xlat0.x = u_xlat16_4.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_23.x = u_xlat16_20.x * u_xlat0.x;
    u_xlat16_0 = u_xlat16_38.xxxx * vec4(-1.0, -0.0274999999, -0.572000027, 0.0219999999) + vec4(1.0, 0.0425000004, 1.03999996, -0.0399999991);
    u_xlat16_11.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_1.x = u_xlat16_41 * -9.27999973;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_0.x + u_xlat16_0.y;
    u_xlat16_1.xy = u_xlat16_1.xx * vec2(-1.03999996, 1.03999996) + u_xlat16_0.zw;
    u_xlat16_41 = u_xlat16_1.x * 0.0399999991 + u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_23.x * 0.5;
    u_xlat16_1.x = min(u_xlat16_1.x, 6.0);
    u_xlat16_23.x = u_xlat16_41 * 0.899999976;
    u_xlat16_23.x = u_xlat16_6.z * u_xlat16_23.x;
    u_xlat16_11.x = (-u_xlat16_6.w) + 1.0;
    u_xlat16_11.xyz = u_xlat16_16.xyz * u_xlat16_6.www + u_xlat16_11.xxx;
    u_xlat16_11.xyz = u_xlat16_23.xxx * u_xlat16_11.xyz;
    u_xlat16_23.x = dot(u_xlat16_10.xxx, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat16_41 = u_xlat16_10.x * u_xlat16_41;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat16_41);
    u_xlat16_20.xyz = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_20.xyz = u_xlat16_6.www * u_xlat16_20.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_23.xxx + u_xlat16_20.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _SSSSpecParam.www;
    u_xlat16_11.xyz = u_xlat16_2.xxx * (-u_xlat16_11.xyz) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_4.www * u_xlat16_11.xyz;
    u_xlat16_23.x = u_xlat16_1.x * _SSSSpecParam.y;
    u_xlat16_11.xyz = u_xlat16_23.xxx * u_xlat16_6.yyy + u_xlat16_11.xyz;
    vec3 specular = u_xlat16_11.xyz;
    vec3 diffuse = u_xlat16_7.xyz * u_xlat16_28.xyz;
    diffuse = specular * vec3(u_xlat55) + diffuse.xyz; // specular + diffuse;
    SV_Target0.xyz = diffuse;

    SV_Target0.w = 1.0;
    return;
}