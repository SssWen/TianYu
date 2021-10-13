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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _CharacterSkinColorScale;
uniform 	mediump vec4 _EyebrowTilingOffset;
uniform 	mediump vec4 _EyebrowHSV;
uniform 	mediump float _DarkCharacterScale;
uniform 	mediump float _DarkCharacterCtrl;
uniform 	mediump float _AutoExposure;
uniform 	mediump float _AutoExposure_Intensity;
uniform 	mediump float _OutputAlpha;
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
	UNITY_UNIFORM vec4 _WorldSpaceLightPos0;
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
UNITY_BINDING(2) uniform UnityLight0 {
#endif
	UNITY_UNIFORM mediump vec4 _LightColor0;
	UNITY_UNIFORM mediump vec4 _SpecColor;
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
UNITY_LOCATION(7) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(8) uniform mediump sampler2D _AutoExposureTex;
in highp vec3 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_6;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vs_TEXCOORD4.z<0.5);
#else
    u_xlatb0 = vs_TEXCOORD4.z<0.5;
#endif
    u_xlat6 = (-vs_TEXCOORD4.z) + 1.0;
    u_xlat0.x = (u_xlatb0) ? u_xlat6 : vs_TEXCOORD4.z;
    u_xlat16_1.x = u_xlat0.x + _EyebrowTilingOffset.z;
    u_xlat16_1.y = vs_TEXCOORD4.w + _EyebrowTilingOffset.w;
    u_xlat16_1.xy = u_xlat16_1.xy * _EyebrowTilingOffset.xy;
    u_xlat16_0 = texture(_EyebrowMask, u_xlat16_1.xy);
    u_xlat16_1 = u_xlat16_0 * _MainColor;
    u_xlat16_2.xy = u_xlat16_0.yz * _MainColor.yz + (-u_xlat16_1.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb18 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_14 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_14);
    u_xlat16_3.xy = u_xlat16_0.zy * _MainColor.zy + u_xlat16_2.xy;
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_3.zw = vec2(u_xlat16_14) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_3.xyw);
    u_xlat16_2.w = (-u_xlat16_1.x);
    u_xlat16_4.yzw = u_xlat16_2.yzw + u_xlat16_3.yzx;
    u_xlat16_4.x = u_xlat16_0.x * _MainColor.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x>=u_xlat16_3.x);
#else
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_3.x;
#endif
    u_xlat16_2.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_8.x = u_xlat16_2.x * u_xlat16_4.w + u_xlat16_1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyw;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_8.x);
    u_xlat16_8.x = (-u_xlat16_2.z) + u_xlat16_8.x;
    u_xlat16_14 = u_xlat16_2.x + (-u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_14 * 6.0 + 9.99999975e-05;
    u_xlat16_0.x = u_xlat16_8.x / u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_2.w;
    u_xlat16_8.x = abs(u_xlat16_0.x) + _EyebrowHSV.x;
    u_xlat16_3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_3.xyz = fract(u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_3.xyz = abs(u_xlat16_0.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_2.y = u_xlat16_14 / u_xlat16_8.x;
    u_xlat16_2.xy = u_xlat16_2.xy + _EyebrowHSV.zy;
    u_xlat16_8.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + (-u_xlat16_1.xyz);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.800000012<_FacialParams.z);
#else
    u_xlatb0 = 0.800000012<_FacialParams.z;
#endif
    u_xlat16_20 = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_0.x = texture(_ParamTex2, vs_TEXCOORD4.xy).w;
    u_xlat16_20 = u_xlat16_0.x * u_xlat16_20;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _MainColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_20) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_0.x = texture(_FaceMaskTex, vs_TEXCOORD4.xy).y;
    u_xlat16_20 = u_xlat16_0.x * _EyebrowHSV.w;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.x = _FacialParams.y * -3.0 + 3.0;
    u_xlat5.x = vs_TEXCOORD0.z;
    u_xlat5.y = vs_TEXCOORD1.z;
    u_xlat5.z = vs_TEXCOORD2.z;
    u_xlat16_20 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat16_20 = u_xlat16_20 + u_xlat16_20;
    u_xlat16_3.xyz = u_xlat5.xyz * (-vec3(u_xlat16_20)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_0.xyz = textureLod(_Cube, u_xlat16_3.xyz, u_xlat0.x).xyz;
    u_xlat16_20 = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_3.xyz = vec3(u_xlat16_20) * vs_TEXCOORD6.xyz;
    u_xlat16_20 = dot(u_xlat16_3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_20);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_20;
    u_xlat16_20 = u_xlat16_20 * _LipCubeIntensity;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_HDRTexEnable<0.5);
#else
    u_xlatb18 = _HDRTexEnable<0.5;
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat5.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat16_0.xyz = texture(_BumpMap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz;
    u_xlat16_4.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_3.xyz * _FacialParams.xxx + u_xlat16_2.xyz;
    u_xlat16_4.z = 1.0;
    u_xlat16_3.x = dot(vs_TEXCOORD0.xyz, u_xlat16_4.xyz);
    u_xlat16_3.y = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat16_3.z = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat16_0.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat5.xyz;
    u_xlat16_20 = dot(u_xlat5.xyz, u_xlat16_0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat5.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD3.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD3.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat18 = texture(_LightTexture0, vec2(u_xlat18)).x;
    u_xlat16_3.xyz = vec3(u_xlat18) * _LightColor0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _CharacterSkinColorScale.xyz;
    u_xlat16_5.xy = texture(_ParamTex, vs_TEXCOORD4.xy).zw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx;
    u_xlat16_3.xyz = vec3(u_xlat16_20) * u_xlat16_3.xyz;
    u_xlat5.xzw = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat5.xzw, u_xlat5.xzw);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xzw = vec3(u_xlat18) * u_xlat5.xzw;
    u_xlat16_20 = dot(u_xlat5.xzw, u_xlat16_0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_0.x = u_xlat16_20 * 0.425000012;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_20;
    u_xlat16_0.x = u_xlat16_20 * u_xlat16_20 + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_5.y;
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _RimColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.x = texture(_AutoExposureTex, vec2(0.5, 0.5)).x;
    u_xlat16_0.x = u_xlat16_0.x * 5.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_6 = _AutoExposure_Intensity * -0.300000012 + 1.0;
    u_xlat16_6 = float(1.0) / u_xlat16_6;
    u_xlat16_12 = _AutoExposure_Intensity + 1.0;
    u_xlat16_12 = float(1.0) / u_xlat16_12;
    u_xlat16_6 = (-u_xlat16_12) + u_xlat16_6;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_6 + u_xlat16_12;
    u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_AutoExposure, _AutoExposure, _AutoExposure));
    u_xlat16_0.x = (-_DarkCharacterScale) * _DarkCharacterCtrl + 1.0;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz;
    SV_Target0.x = _OutputAlpha * (-u_xlat16_0.x) + u_xlat16_0.x;
    SV_Target0.yz = u_xlat16_0.yz;
    SV_Target0.w = 1.0;
    return;
}