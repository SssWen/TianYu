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
    vec3 worldPos = vec3(vs_TEXCOORD0.w,vs_TEXCOORD1.w,vs_TEXCOORD2.w);
    // u_xlat0 = worldPos;
    // u_xlat0.xyz = (-worldPos) + _WorldSpaceCameraPos.xyz;
    vec3 viewDir = (-worldPos) + _WorldSpaceCameraPos.xyz;
    //u_xlat0 =  _WorldSpaceCameraPos - worldPos;
    u_xlat54 = dot(viewDir, viewDir);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat1.xyz = vec3(u_xlat54) * viewDir;
    // u_xlat1 = viewDir = normalize(_WorldSpaceCameraPos - worldPos);
    vec3 viewDirection = u_xlat1.xyz;

    // u_xlat16_2.xy = texture(_FaceMaskTex, vs_TEXCOORD3.xy).xy;
    vec2 FaceMaskTexColor = texture(_FaceMaskTex, vs_TEXCOORD3.xy).xy;
    vec4 mainTexColor = texture(_MainTex, vs_TEXCOORD3.xy);//u_xlat16_3
    // u_xlat16_4 = texture(_BumpMap, vs_TEXCOORD3.xy);
    vec4 _BumpMapTex = texture(_BumpMap, vs_TEXCOORD3.xy);
    vec4 Normal = _BumpMapTex;
    Normal.xy = Normal.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);//u_xlat16_5.xy
    vec4 _ParamTexColor = texture(_ParamTex, vs_TEXCOORD3.xy); //u_xlat16_6
 
    vec4 _ParamTex2Color = texture(_ParamTex2, vs_TEXCOORD3.xy);//u_xlat16_38 xw ???
// #ifdef UNITY_ADRENO_ES3
//     u_xlatb55 = !!(0.800000012<_FacialParams.z);
// #else
//     u_xlatb55 = 0.800000012<_FacialParams.z;
// #endif
//     u_xlat16_59 = (u_xlatb55) ? 0.0 : 1.0;    
//     u_xlat16_59 = _ParamTex2Color.w * u_xlat16_59;

    // vec3 mainColor = mainTexColor.xyz * _MainColor.xyz + (-mainTexColor.xyz);    
    // mainColor = vec3(u_xlat16_59) * mainColor.xyz + mainTexColor.xyz;    // u_xlat16_59 = 0.0;
    vec3 mainColor =  mainTexColor.xyz;

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
    u_xlat16_59 = FaceMaskTexColor.y * _EyebrowHSV.w;
    u_xlat16_10.xyz = (-mainColor.xyz) + u_xlat16_10.xyz;    
    vec3 eyeBrow = vec3(u_xlat16_59) * u_xlat16_10.xyz;
    vec3 diffuseParam1 = eyeBrow + mainColor;

    vec2 poreUV  = vs_TEXCOORD3.xy * _SSSPoreParam.xx;
    poreUV = poreUV * vec2(10.0, 10.0);
    // u_xlat16_8 = texture(_PoreTex, u_xlat16_10.xy);
    vec4 PoreTexColor = texture(_PoreTex, poreUV);
    // u_xlat16_10.xy = PoreTexColor.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    // u_xlat16_46.xy = PoreTexColor.xy + vec2(-1.0, -1.0);
    // u_xlat16_46.xy = _BumpMapTex.ww * (PoreTexColor.xy + vec2(-1.0, -1.0)) + vec2(1.0, 1.0);
    vec2 facePore = _BumpMapTex.ww * (PoreTexColor.xy + vec2(-1.0, -1.0)) + vec2(1.0, 1.0);
    // u_xlat16_10.xy = (-Normal.xy) + u_xlat16_10.xy;
    // u_xlat16_11.xy = u_xlat16_4.ww * u_xlat16_10.xy + Normal.xy; // 去掉眼角一些高光
    // u_xlat16_11.xy =  Normal.xy;
    // u_xlat16_11.z = 1.0;
    Normal.z = 1.0;
    u_xlat16_12.x = dot(vs_TEXCOORD0.xyz, Normal.xyz);//u_xlat16_11
    u_xlat16_12.y = dot(vs_TEXCOORD1.xyz, Normal.xyz);
    u_xlat16_12.z = dot(vs_TEXCOORD2.xyz, Normal.xyz);
    // normal

    // u_xlat16_59 = _BumpMapTex.z * _FacialParams.x;
    float FacialControl = _BumpMapTex.z * _FacialParams.x;
    // u_xlat16_61 = (-mainTexColor.w) + _FacialParams.y; // mainTex.w
    // u_xlat16_5.w
    FacialControl = FacialControl * (_FacialParams.y - mainTexColor.w) + mainTexColor.w; // specularW
    u_xlat16_5.z = 1.0;
    Normal.z = 1.0;
    u_xlat16_11.x = dot(vs_TEXCOORD0.xyz, Normal.xyz);// u_xlat16_5
    u_xlat16_11.y = dot(vs_TEXCOORD1.xyz, Normal.xyz);
    u_xlat16_11.z = dot(vs_TEXCOORD2.xyz, Normal.xyz);// dot(TtoW0,Normal)

    u_xlat16_55 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_3 = vec4(u_xlat16_55) * u_xlat16_11.zyxx;
    // normal = normalize(normal);
    

    // u_xlat16_5.x ????
    // u_xlat16_5.x = 1.0
    u_xlat16_5.x = 1.0;
    u_xlat16_23.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_23.x + _LightShadowData.x;
    

    u_xlat16_23.x = dot(_CharacterLightDir.xyz, u_xlat16_3.zyx);//normal
    float LdotN = dot(_CharacterLightDir.xyz, u_xlat16_3.zyx);//normal
    // LdotN
    // u_xlat16_23.x = dot(_CharacterLightDir.zyx, u_xlat16_3.xyw);
#ifdef UNITY_ADRENO_ES3
    LdotN = min(max(LdotN, 0.0), 1.0);
#else
    LdotN = clamp(LdotN, 0.0, 1.0);
#endif
    // u_xlat20.xz = u_xlat16_23.xx * vec2(0.5, 0.600000024) + vec2(0.5, 0.200000003);        
    vec2 lutXY = vec2(LdotN*0.5+0.5,0.0);
    vec3 skinLightColor = _CharacterSkinColorScale.xyz * _SSSLightColor.xyz; //u_xlat16_11

    u_xlat16_5.x = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_12.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz;
    vec3 worldNormal = u_xlat16_12.xyz;
    // u_xlat16_12 = worldNormal

    // u_xlat16_5.x = dot(viewDirection.zyx, u_xlat16_3.xyw);
    // u_xlat16_5.x = dot(viewDirection.xyz, u_xlat16_3.zyx); // normal 改
    float VdotN = dot(viewDirection.xyz, u_xlat16_3.zyx); // normal 改
    u_xlat16_41 = VdotN;
    float VdotNN = VdotN;
#ifdef UNITY_ADRENO_ES3
    VdotNN = min(max(VdotNN, 0.0), 1.0);
#else
    VdotNN = clamp(VdotNN, 0.0, 1.0);
#endif

    u_xlat16_5.x = 1.0 -VdotN;
    // u_xlat16_5.w = (-u_xlat16_5.w) + 1.0;    
    FacialControl = 1.0- FacialControl;


    FacialControl = max(FacialControl, 0.0500000007);
    FacialControl = min(FacialControl, 1.0);
    float roughness = _ParamTexColor.w * (FacialControl * -0.31099999) + FacialControl; //u_xlat16_38.x;
    // u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;    
    // u_xlat16_5.x = (1.0 - VdotN)*(1.0 - VdotN);
    roughness = roughness * roughness;
    float roughnessSqr = roughness * roughness + 0.00999999978;

    vec3 facePore1 = facePore.x * vec3(1.0, 0.5, 0.25);
    vec3 facePore2 = facePore.y * vec3(0.0, 0.25, 0.300000012);    
    
    float VdotNN2 = (1.0 - VdotN)*(1.0 - VdotN);
    u_xlat16_13.xyz = (-facePore.x) * vec3(1.0, 0.5, 0.25) + vec3(0.5, 0.5, 0.5);
    facePore1 = vec3(VdotNN2) * u_xlat16_13.xyz + facePore1;

    vec3 tttt = (-facePore.y) * vec3(0.0, 0.25, 0.300000012) + vec3(0.5, 0.5, 0.5);
    // u_xlat16_16.xyz = vec3(VdotNN2) * u_xlat16_16.xyz + facePore2.xyz;
    facePore2 = vec3(VdotNN2) * tttt + facePore2.xyz;

    float _ParamTexColorZ = _ParamTexColor.z * 0.636900008;//u_xlat16_10.x
    // u_xlat20.z = 0.0; lutXY
    vec3 SSSlut1 = texture(_SSSTex, lutXY).xyz;//u_xlat16_17
    vec3 sssDiff = skinLightColor.xyz * vec3(2.0, 2.0, 2.0) + vec3(_ParamTexColorZ);    
    sssDiff.xyz = _ParamTexColor.xxx * sssDiff.xyz; // 区域X
    sssDiff.xyz = sssDiff.xyz * _SSSDiffParam.xxx;
    
    vec3 sssSkinColor1 = skinLightColor.xyz * _SSSDiffParam.yyy; // u_xlat16_29
    // u_xlat16_66 = _ParamTexColorZ * _SSSDiffParam.w;
    float _SSSDiffParamW = _ParamTexColorZ * _SSSDiffParam.w; //u_xlat16_66
    sssSkinColor1.xyz = sssSkinColor1.xyz * SSSlut1.xyz + vec3(_SSSDiffParamW);




    sssDiff.xyz = sssDiff.xyz * _CharacterSkinColorScale.xyz;
    sssDiff.xyz = sssDiff.xyz * _MainColor.xyz;
    sssDiff.xyz = sssDiff.xyz * vec3(0.25, 0.0, 0.0) + sssSkinColor1;
    vec3 diffuseParma2 = sssDiff.xyz;


    float skinLightColorX = skinLightColor.x * 4.0;
    skinLightColorX = LdotN * skinLightColorX;
    // u_xlat16_11.xyz = viewDir * vec3(u_xlat54) + _CharacterLightDir.xyz;
    u_xlat16_11.xyz = viewDirection + _CharacterLightDir.xyz;
//  H = viewDirection + _CharacterLightDir.xyz;

    u_xlat16_23.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    vec3 H = u_xlat16_23.xxx * u_xlat16_11.xyz;
    // H = normalize(H);    


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
    F = skinLightColorX * F;

    // u_xlat16_0 = FacialControl * vec4(-1.0, -0.0274999999, -0.572000027, 0.0219999999) + vec4(1.0, 0.0425000004, 1.03999996, -0.0399999991);
    
    u_xlat16_0.x = FacialControl * -1.0 + 1.0;
    u_xlat16_0.y = FacialControl *  -0.0274999999 + 0.0425000004;
    u_xlat16_0.z = FacialControl *  -0.572000027 + 1.03999996;
    u_xlat16_0.w = FacialControl *  0.0219999999 - 0.0399999991;

    u_xlat16_11.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_1.x = VdotNN * -9.27999973;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_0.x + u_xlat16_0.y;
    u_xlat16_1.xy = u_xlat16_1.xx * vec2(-1.03999996, 1.03999996) + u_xlat16_0.zw;
    u_xlat16_41 = u_xlat16_1.x * 0.0399999991 + u_xlat16_1.y;    

    u_xlat16_41 = 0.05;
    float EdgeControl = u_xlat16_41;
    float SpecParam1 = min(F * 0.5, 6.0);


    
    float edg = _ParamTexColor.z * EdgeControl * 0.899999976;
    float t = 1.0 - _ParamTexColor.w;
    // u_xlat16_11.xyz = facePore2 * _ParamTexColor.www + vec3(t,t,t); // u_xlat16_11.xxx;
    vec3 specColorL = facePore2 * _ParamTexColor.www + vec3(t,t,t); // u_xlat16_11.xxx;
    specColorL.xyz = edg * specColorL.xyz;


    float lum = dot(vec3(_ParamTexColorZ,_ParamTexColorZ,_ParamTexColorZ), vec3(0.300000012, 0.589999974, 0.109999999));
    
    EdgeControl = _ParamTexColorZ * EdgeControl;

    vec3 faceEdgeC = facePore1 * vec3(EdgeControl);
    faceEdgeC = faceEdgeC * vec3(15.0, 15.0, 15.0);
    faceEdgeC = _ParamTexColor.www * faceEdgeC;
    
    vec3 specLerp = specColorL.xyz * lum + faceEdgeC.xyz;
    specLerp = specLerp*_SSSSpecParam.w;    
    specLerp = specLerp*(1.0 - FaceMaskTexColor.x);

    vec3 specularParam2 = _BumpMapTex.www * specLerp;

    SpecParam1 = SpecParam1 * _SSSSpecParam.y;    

    vec3 specular = SpecParam1 * _ParamTexColor.yyy + specularParam2;
    vec3 diffuse = diffuseParam1 * diffuseParma2;
    diffuse = specular  + diffuse; // specular + diffuse;
    SV_Target0.xyz = diffuse;

    SV_Target0.w = 1.0;
    return;
}