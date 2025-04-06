#version 430
//#include <required.glsl> // [HACK 4/6/2023] See SCC shader_merger.cpp
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//sampler sampler Tweak_N158SmpSC 0:27
//sampler sampler alphaTexSmpSC 0:28
//sampler sampler inputTexSmpSC 0:29
//sampler sampler intensityTextureSmpSC 0:30
//sampler sampler maskFacePartsSmpSC 0:31
//sampler sampler output_0SmpSC 0:32
//sampler sampler output_1SmpSC 0:33
//sampler sampler sc_OITCommonSampler 0:36
//sampler sampler sc_ScreenTextureSmpSC 0:38
//sampler sampler texWarpOutSmpSC 0:41
//sampler sampler z_hitIdAndBarycentricSmp 0:42
//sampler sampler z_rayDirectionsSmpSC 0:43
//texture texture2D Tweak_N158 0:3:0:27
//texture texture2D alphaTex 0:4:0:28
//texture texture2D inputTex 0:5:0:29
//texture texture2D intensityTexture 0:6:0:30
//texture texture2D maskFaceParts 0:7:0:31
//texture texture2D output_0 0:8:0:32
//texture texture2D output_1 0:9:0:33
//texture texture2D sc_OITAlpha0 0:12:0:36
//texture texture2D sc_OITAlpha1 0:13:0:36
//texture texture2D sc_OITDepthHigh0 0:14:0:36
//texture texture2D sc_OITDepthHigh1 0:15:0:36
//texture texture2D sc_OITDepthLow0 0:16:0:36
//texture texture2D sc_OITDepthLow1 0:17:0:36
//texture texture2D sc_OITFilteredDepthBoundsTexture 0:18:0:36
//texture texture2D sc_OITFrontDepthTexture 0:19:0:36
//texture texture2D sc_ScreenTexture 0:21:0:38
//texture texture2D texWarpOut 0:24:0:41
//texture utexture2D z_hitIdAndBarycentric 0:25:0:42
//texture texture2D z_rayDirections 0:26:0:43
//texture texture2DArray Tweak_N158ArrSC 0:44:0:27
//texture texture2DArray alphaTexArrSC 0:45:0:28
//texture texture2DArray inputTexArrSC 0:46:0:29
//texture texture2DArray intensityTextureArrSC 0:47:0:30
//texture texture2DArray maskFacePartsArrSC 0:48:0:31
//texture texture2DArray output_0ArrSC 0:49:0:32
//texture texture2DArray output_1ArrSC 0:50:0:33
//texture texture2DArray sc_ScreenTextureArrSC 0:53:0:38
//texture texture2DArray texWarpOutArrSC 0:54:0:41
//ssbo int layoutIndices 0:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVertices 0:1:4 {
//float _Vertices 0:[]:4
//}
//ssbo float layoutVerticesPN 0:2:4 {
//float _VerticesPN 0:[]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 0
//spec_const bool BLEND_MODE_BRIGHT 1
//spec_const bool BLEND_MODE_COLOR 2
//spec_const bool BLEND_MODE_COLOR_BURN 3
//spec_const bool BLEND_MODE_COLOR_DODGE 4
//spec_const bool BLEND_MODE_DARKEN 5
//spec_const bool BLEND_MODE_DIFFERENCE 6
//spec_const bool BLEND_MODE_DIVIDE 7
//spec_const bool BLEND_MODE_DIVISION 8
//spec_const bool BLEND_MODE_EXCLUSION 9
//spec_const bool BLEND_MODE_FORGRAY 10
//spec_const bool BLEND_MODE_HARD_GLOW 11
//spec_const bool BLEND_MODE_HARD_LIGHT 12
//spec_const bool BLEND_MODE_HARD_MIX 13
//spec_const bool BLEND_MODE_HARD_PHOENIX 14
//spec_const bool BLEND_MODE_HARD_REFLECT 15
//spec_const bool BLEND_MODE_HUE 16
//spec_const bool BLEND_MODE_INTENSE 17
//spec_const bool BLEND_MODE_LIGHTEN 18
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19
//spec_const bool BLEND_MODE_LUMINOSITY 20
//spec_const bool BLEND_MODE_NEGATION 21
//spec_const bool BLEND_MODE_NOTBRIGHT 22
//spec_const bool BLEND_MODE_OVERLAY 23
//spec_const bool BLEND_MODE_PIN_LIGHT 24
//spec_const bool BLEND_MODE_REALISTIC 25
//spec_const bool BLEND_MODE_SATURATION 26
//spec_const bool BLEND_MODE_SOFT_LIGHT 27
//spec_const bool BLEND_MODE_SUBTRACT 28
//spec_const bool BLEND_MODE_VIVID_LIGHT 29
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30
//spec_const bool SC_DISABLE_FRUSTUM_CULLING 31
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N158 32
//spec_const bool SC_USE_CLAMP_TO_BORDER_alphaTex 33
//spec_const bool SC_USE_CLAMP_TO_BORDER_inputTex 34
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 35
//spec_const bool SC_USE_CLAMP_TO_BORDER_maskFaceParts 36
//spec_const bool SC_USE_CLAMP_TO_BORDER_output_0 37
//spec_const bool SC_USE_CLAMP_TO_BORDER_output_1 38
//spec_const bool SC_USE_CLAMP_TO_BORDER_texWarpOut 39
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N158 40
//spec_const bool SC_USE_UV_MIN_MAX_alphaTex 41
//spec_const bool SC_USE_UV_MIN_MAX_inputTex 42
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 43
//spec_const bool SC_USE_UV_MIN_MAX_maskFaceParts 44
//spec_const bool SC_USE_UV_MIN_MAX_output_0 45
//spec_const bool SC_USE_UV_MIN_MAX_output_1 46
//spec_const bool SC_USE_UV_MIN_MAX_texWarpOut 47
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N158 48
//spec_const bool SC_USE_UV_TRANSFORM_alphaTex 49
//spec_const bool SC_USE_UV_TRANSFORM_inputTex 50
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 51
//spec_const bool SC_USE_UV_TRANSFORM_maskFaceParts 52
//spec_const bool SC_USE_UV_TRANSFORM_output_0 53
//spec_const bool SC_USE_UV_TRANSFORM_output_1 54
//spec_const bool SC_USE_UV_TRANSFORM_texWarpOut 55
//spec_const bool Tweak_N10 56
//spec_const bool Tweak_N109 57
//spec_const bool Tweak_N15 58
//spec_const bool Tweak_N158HasSwappedViews 59
//spec_const bool Tweak_N2 60
//spec_const bool Tweak_N54 61
//spec_const bool Tweak_N6 62
//spec_const bool Tweak_N82 63
//spec_const bool UseViewSpaceDepthVariant 64
//spec_const bool alphaTexHasSwappedViews 65
//spec_const bool inputTexHasSwappedViews 66
//spec_const bool intensityTextureHasSwappedViews 67
//spec_const bool maskFacePartsHasSwappedViews 68
//spec_const bool output_0HasSwappedViews 69
//spec_const bool output_1HasSwappedViews 70
//spec_const bool sc_BlendMode_Add 71
//spec_const bool sc_BlendMode_AddWithAlphaFactor 72
//spec_const bool sc_BlendMode_AlphaTest 73
//spec_const bool sc_BlendMode_AlphaToCoverage 74
//spec_const bool sc_BlendMode_ColoredGlass 75
//spec_const bool sc_BlendMode_Custom 76
//spec_const bool sc_BlendMode_Max 77
//spec_const bool sc_BlendMode_Min 78
//spec_const bool sc_BlendMode_Multiply 79
//spec_const bool sc_BlendMode_MultiplyOriginal 80
//spec_const bool sc_BlendMode_Normal 81
//spec_const bool sc_BlendMode_PremultipliedAlpha 82
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 83
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 84
//spec_const bool sc_BlendMode_Screen 85
//spec_const bool sc_BlendMode_Software 86
//spec_const bool sc_DepthOnly 87
//spec_const bool sc_FramebufferFetch 88
//spec_const bool sc_GetFramebufferColorInvalidUsageMarker 89
//spec_const bool sc_IsEditor 90
//spec_const bool sc_MotionVectorsPass 91
//spec_const bool sc_OITCompositingPass 92
//spec_const bool sc_OITDepthBoundsPass 93
//spec_const bool sc_OITDepthGatherPass 94
//spec_const bool sc_OITDepthPrepass 95
//spec_const bool sc_OITFrontLayerPass 96
//spec_const bool sc_OITMaxLayers4Plus1 97
//spec_const bool sc_OITMaxLayers8 98
//spec_const bool sc_OITMaxLayersVisualizeLayerCount 99
//spec_const bool sc_ProjectiveShadowsCaster 100
//spec_const bool sc_ProjectiveShadowsReceiver 101
//spec_const bool sc_ProxyAlphaOne 102
//spec_const bool sc_RenderAlphaToColor 103
//spec_const bool sc_ScreenTextureHasSwappedViews 104
//spec_const bool sc_ShaderComplexityAnalyzer 105
//spec_const bool sc_TAAEnabled 106
//spec_const bool sc_UseFramebufferFetchMarker 107
//spec_const bool sc_VertexBlending 108
//spec_const bool sc_VertexBlendingUseNormals 109
//spec_const bool texWarpOutHasSwappedViews 110
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N158 111
//spec_const int SC_SOFTWARE_WRAP_MODE_U_alphaTex 112
//spec_const int SC_SOFTWARE_WRAP_MODE_U_inputTex 113
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 114
//spec_const int SC_SOFTWARE_WRAP_MODE_U_maskFaceParts 115
//spec_const int SC_SOFTWARE_WRAP_MODE_U_output_0 116
//spec_const int SC_SOFTWARE_WRAP_MODE_U_output_1 117
//spec_const int SC_SOFTWARE_WRAP_MODE_U_texWarpOut 118
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N158 119
//spec_const int SC_SOFTWARE_WRAP_MODE_V_alphaTex 120
//spec_const int SC_SOFTWARE_WRAP_MODE_V_inputTex 121
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 122
//spec_const int SC_SOFTWARE_WRAP_MODE_V_maskFaceParts 123
//spec_const int SC_SOFTWARE_WRAP_MODE_V_output_0 124
//spec_const int SC_SOFTWARE_WRAP_MODE_V_output_1 125
//spec_const int SC_SOFTWARE_WRAP_MODE_V_texWarpOut 126
//spec_const int Tweak_N158Layout 127
//spec_const int alphaTexLayout 128
//spec_const int inputTexLayout 129
//spec_const int intensityTextureLayout 130
//spec_const int maskFacePartsLayout 131
//spec_const int output_0Layout 132
//spec_const int output_1Layout 133
//spec_const int sc_DepthBufferMode 134
//spec_const int sc_RenderingSpace 135
//spec_const int sc_ScreenTextureLayout 136
//spec_const int sc_ShaderCacheConstant 137
//spec_const int sc_SkinBonesCount 138
//spec_const int sc_StereoRenderingMode 139
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 140
//spec_const int sc_StereoViewID 141
//spec_const int texWarpOutLayout 142
//SG_REFLECTION_END
#if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
#ifdef VERTEX_SHADER
    #define scOutPos(clipPosition) gl_Position=clipPosition
    #define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
    #ifndef sc_EnableInstancing
        #define sc_EnableInstancing 1
    #endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
    #define sc_CanUseTextureLod 1
#else
    #ifdef FRAGMENT_SHADER
        #if defined(GL_EXT_shader_texture_lod)
            #extension GL_EXT_shader_texture_lod : require
            #define sc_CanUseTextureLod 1
            #define texture2DLod texture2DLodEXT
        #endif
    #endif
#endif
#if defined(sc_EnableMultiviewStereoRendering)
    #define sc_StereoRenderingMode sc_StereoRendering_Multiview
    #define sc_NumStereoViews 2
    #extension GL_OVR_multiview2 : require
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #define sc_LocalInstanceID sc_GlobalInstanceID
        #define sc_StereoViewID int(gl_ViewID_OVR)
    #endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
    #ifndef sc_EnableInstancing
        #error Instanced-clipped stereo rendering requires enabled instancing.
    #endif
    #ifndef sc_EnableStereoClipDistance
        #define sc_StereoRendering_IsClipDistanceEnabled 0
    #else
        #define sc_StereoRendering_IsClipDistanceEnabled 1
    #endif
    #define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
    #define sc_NumStereoClipPlanes 1
    #define sc_NumStereoViews 2
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
        #ifdef GL_ARB_draw_instanced
            #extension GL_ARB_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDARB
        #endif
        #ifdef GL_EXT_draw_instanced
            #extension GL_EXT_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDEXT
        #endif
        #ifndef sc_InstanceID
            #define sc_InstanceID gl_InstanceID
        #endif
        #ifndef sc_GlobalInstanceID
            #ifdef sc_EnableInstancingFallback
                #define sc_GlobalInstanceID (sc_FallbackInstanceID)
                #define sc_LocalInstanceID (sc_FallbackInstanceID)
            #else
                #define sc_GlobalInstanceID gl_InstanceID
                #define sc_LocalInstanceID gl_InstanceID
            #endif
        #endif
    #endif
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #ifndef sc_CanUseTextureLod
    #define sc_CanUseTextureLod 1
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef FRAGMENT_SHADER
        #ifdef GL_OES_standard_derivatives
            #extension GL_OES_standard_derivatives : require
            #define sc_CanUseStandardDerivatives 1
        #endif
    #endif
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
#endif
#ifdef GL_ES
    #ifdef sc_FramebufferFetch
        #if defined(GL_EXT_shader_framebuffer_fetch)
            #extension GL_EXT_shader_framebuffer_fetch : require
        #elif defined(GL_ARM_shader_framebuffer_fetch)
            #extension GL_ARM_shader_framebuffer_fetch : require
        #else
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #endif
    #ifdef GL_FRAGMENT_PRECISION_HIGH
        #define sc_FragmentPrecision highp
    #else
        #define sc_FragmentPrecision mediump
    #endif
    #ifdef FRAGMENT_SHADER
        precision highp int;
        precision highp float;
    #endif
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableMultiviewStereoRendering
        layout(num_views=sc_NumStereoViews) in;
    #endif
#endif
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
    #if __VERSION__==100||defined(SCC_VALIDATION)
        #define sampler2DArray vec2
        #define sampler3D vec3
        #define samplerCube vec4
        vec4 texture3D(vec3 s,vec3 uv)                       { return vec4(0.0); }
        vec4 texture3D(vec3 s,vec3 uv,float bias)           { return vec4(0.0); }
        vec4 texture3DLod(vec3 s,vec3 uv,float bias)        { return vec4(0.0); }
        vec4 texture3DLodEXT(vec3 s,vec3 uv,float lod)      { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv)                  { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv,float bias)      { return vec4(0.0); }
        vec4 texture2DArrayLod(vec2 s,vec3 uv,float lod)    { return vec4(0.0); }
        vec4 texture2DArrayLodEXT(vec2 s,vec3 uv,float lod) { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv)                     { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv,float lod)          { return vec4(0.0); }
        vec4 textureCubeLod(vec4 s,vec3 uv,float lod)       { return vec4(0.0); }
        vec4 textureCubeLodEXT(vec4 s,vec3 uv,float lod)    { return vec4(0.0); }
        #if defined(VERTEX_SHADER)||!sc_CanUseTextureLod
            #define texture2DLod(s,uv,lod)      vec4(0.0)
            #define texture2DLodEXT(s,uv,lod)   vec4(0.0)
        #endif
    #elif __VERSION__>=300
        #define texture3D texture
        #define textureCube texture
        #define texture2DArray texture
        #define texture2DLod textureLod
        #define texture3DLod textureLod
        #define texture2DLodEXT textureLod
        #define texture3DLodEXT textureLod
        #define textureCubeLod textureLod
        #define textureCubeLodEXT textureLod
        #define texture2DArrayLod textureLod
        #define texture2DArrayLodEXT textureLod
    #endif
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
struct sc_Vertex_t
{
vec4 position;
vec3 normal;
vec3 tangent;
vec2 texture0;
vec2 texture1;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_StereoViewID
#define sc_StereoViewID 0
#endif
#ifndef sc_RenderingSpace
#define sc_RenderingSpace -1
#endif
#ifndef sc_TAAEnabled
#define sc_TAAEnabled 0
#elif sc_TAAEnabled==1
#undef sc_TAAEnabled
#define sc_TAAEnabled 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_ShaderCacheConstant
#define sc_ShaderCacheConstant 0
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef sc_VertexBlending
#define sc_VertexBlending 0
#elif sc_VertexBlending==1
#undef sc_VertexBlending
#define sc_VertexBlending 1
#endif
#ifndef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 0
#elif sc_VertexBlendingUseNormals==1
#undef sc_VertexBlendingUseNormals
#define sc_VertexBlendingUseNormals 1
#endif
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef SC_DISABLE_FRUSTUM_CULLING
#define SC_DISABLE_FRUSTUM_CULLING 0
#elif SC_DISABLE_FRUSTUM_CULLING==1
#undef SC_DISABLE_FRUSTUM_CULLING
#define SC_DISABLE_FRUSTUM_CULLING 1
#endif
#ifndef sc_DepthBufferMode
#define sc_DepthBufferMode 0
#endif
#ifndef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 0
#elif sc_ProjectiveShadowsReceiver==1
#undef sc_ProjectiveShadowsReceiver
#define sc_ProjectiveShadowsReceiver 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
struct sc_PointLight_t
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
vec3 direction;
vec3 position;
vec4 color;
};
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
layout(binding=0,std430) readonly buffer layoutIndices
{
uint _Triangles[];
} layoutIndices_obj;
layout(binding=1,std430) readonly buffer layoutVertices
{
float _Vertices[];
} layoutVertices_obj;
layout(binding=2,std430) readonly buffer layoutVerticesPN
{
float _VerticesPN[];
} layoutVerticesPN_obj;
uniform vec4 sc_EnvmapDiffuseDims;
uniform vec4 sc_EnvmapSpecularDims;
uniform vec4 sc_ScreenTextureDims;
uniform bool isProxyMode;
uniform bool noEarlyZ;
uniform vec4 z_rayDirectionsDims;
uniform mat4 sc_ModelMatrix;
uniform mat4 sc_ProjectorMatrix;
uniform vec2 sc_TAAJitterOffset;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform vec4 sc_UniformConstants;
uniform vec4 sc_BoneMatrices[(sc_SkinBonesCount*3)+1];
uniform mat3 sc_SkinBonesNormalMatrices[sc_SkinBonesCount+1];
uniform vec4 weights0;
uniform vec4 weights1;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform float sc_DisableFrustumCullingMarker;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform mat3 sc_NormalMatrix;
uniform vec4 intensityTextureDims;
uniform int PreviewEnabled;
uniform vec4 inputTexDims;
uniform vec4 alphaTexDims;
uniform vec4 texWarpOutDims;
uniform vec4 output_1Dims;
uniform vec4 output_0Dims;
uniform vec4 maskFacePartsDims;
uniform vec4 Tweak_N158Dims;
uniform float depthRef;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed;
uniform vec4 sc_Time;
uniform float overrideTimeDelta;
uniform sc_PointLight_t sc_PointLights[sc_PointLightsCount+1];
uniform sc_DirectionalLight_t sc_DirectionalLights[sc_DirectionalLightsCount+1];
uniform sc_AmbientLight_t sc_AmbientLights[sc_AmbientLightsCount+1];
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec4 sc_EnvmapDiffuseSize;
uniform vec4 sc_EnvmapDiffuseView;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapSpecularView;
uniform vec3 sc_EnvmapRotation;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform vec4 sc_GeometryInfo;
uniform mat4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelMatrixInverse;
uniform mat3 sc_NormalMatrixInverse;
uniform mat4 sc_PrevFrameModelMatrix;
uniform mat4 sc_PrevFrameModelMatrixInverse;
uniform vec3 sc_LocalAabbMin;
uniform vec3 sc_LocalAabbMax;
uniform vec3 sc_WorldAabbMin;
uniform vec3 sc_WorldAabbMax;
uniform vec4 sc_WindowToViewportTransform;
uniform vec4 sc_CurrentRenderTargetDims;
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform float shaderComplexityValue;
uniform vec4 weights2;
uniform int sc_FallbackInstanceID;
uniform float _sc_framebufferFetchMarker;
uniform float strandWidth;
uniform float strandTaper;
uniform vec4 sc_StrandDataMapTextureSize;
uniform float clumpInstanceCount;
uniform float clumpRadius;
uniform float clumpTipScale;
uniform float hairstyleInstanceCount;
uniform float hairstyleNoise;
uniform vec4 sc_ScreenTextureSize;
uniform vec4 sc_ScreenTextureView;
uniform int instance_id;
uniform int lray_triangles_last;
uniform bool has_animated_pn;
uniform int emitter_stride;
uniform int proxy_offset_position;
uniform int proxy_offset_normal;
uniform int proxy_offset_tangent;
uniform int proxy_offset_color;
uniform int proxy_offset_texture0;
uniform int proxy_offset_texture1;
uniform int proxy_offset_texture2;
uniform int proxy_offset_texture3;
uniform int proxy_format_position;
uniform int proxy_format_normal;
uniform int proxy_format_tangent;
uniform int proxy_format_color;
uniform int proxy_format_texture0;
uniform int proxy_format_texture1;
uniform int proxy_format_texture2;
uniform int proxy_format_texture3;
uniform vec4 z_rayDirectionsSize;
uniform vec4 z_rayDirectionsView;
uniform float correctedIntensity;
uniform vec4 intensityTextureSize;
uniform vec4 intensityTextureView;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float reflBlurWidth;
uniform float reflBlurMinRough;
uniform float reflBlurMaxRough;
uniform int PreviewNodeID;
uniform float alphaTestThreshold;
uniform vec4 inputTexSize;
uniform vec4 inputTexView;
uniform mat3 inputTexTransform;
uniform vec4 inputTexUvMinMax;
uniform vec4 inputTexBorderColor;
uniform vec4 alphaTexSize;
uniform vec4 alphaTexView;
uniform mat3 alphaTexTransform;
uniform vec4 alphaTexUvMinMax;
uniform vec4 alphaTexBorderColor;
uniform vec4 texWarpOutSize;
uniform vec4 texWarpOutView;
uniform mat3 texWarpOutTransform;
uniform vec4 texWarpOutUvMinMax;
uniform vec4 texWarpOutBorderColor;
uniform vec4 wrapOutMax;
uniform vec4 wrapOutMin;
uniform vec4 output_1Size;
uniform vec4 output_1View;
uniform mat3 output_1Transform;
uniform vec4 output_1UvMinMax;
uniform vec4 output_1BorderColor;
uniform vec4 warpMax;
uniform vec4 warpMin;
uniform float warp_intensity;
uniform vec3 alphaMax;
uniform vec3 alphaMin;
uniform float Tweak_N110;
uniform vec4 output_0Size;
uniform vec4 output_0View;
uniform mat3 output_0Transform;
uniform vec4 output_0UvMinMax;
uniform vec4 output_0BorderColor;
uniform vec4 colorMax;
uniform vec4 colorMin;
uniform float intensity;
uniform vec4 maskFacePartsSize;
uniform vec4 maskFacePartsView;
uniform mat3 maskFacePartsTransform;
uniform vec4 maskFacePartsUvMinMax;
uniform vec4 maskFacePartsBorderColor;
uniform vec4 Tweak_N158Size;
uniform vec4 Tweak_N158View;
uniform mat3 Tweak_N158Transform;
uniform vec4 Tweak_N158UvMinMax;
uniform vec4 Tweak_N158BorderColor;
uniform float darkenAlpha;
uniform float lightenAlpha;
uniform vec4 Port_Import_N058;
uniform vec4 Port_Import_N059;
uniform vec4 Port_Import_N060;
uniform vec2 Port_Input1_N096;
uniform vec4 Port_Import_N072;
uniform vec4 Port_Import_N073;
uniform vec4 Port_Import_N074;
uniform vec4 Port_Input1_N137;
uniform vec3 Port_Import_N064;
uniform vec3 Port_Import_N065;
uniform vec3 Port_Import_N066;
uniform vec3 Port_Import_N037;
uniform mat4 Port_Value_N099;
uniform vec4 Port_Column0_N102;
uniform vec4 Port_Column1_N102;
uniform vec4 Port_Column2_N102;
uniform vec4 Port_Column3_N102;
uniform float Port_Import_N119;
uniform vec2 Port_Import_N120;
uniform vec2 Port_Import_N122;
uniform float Port_Input1_N127;
uniform vec2 Port_Import_N130;
uniform float Port_Input1_N133;
uniform float Port_Input2_N135;
uniform vec2 Port_Import_N104;
uniform float Port_Value2_N105;
uniform float Port_Value3_N105;
uniform float Port_Import_N048;
uniform vec2 Port_Import_N063;
uniform vec2 Port_Import_N112;
uniform float Port_Input1_N117;
uniform vec2 Port_Import_N029;
uniform float Port_Input1_N014;
uniform float Port_Input2_N003;
uniform vec2 Port_Input1_N143;
uniform vec2 Port_Input2_N143;
uniform vec3 Port_Import_N034;
uniform vec4 Port_Import_N044;
uniform vec4 Port_Import_N051;
uniform vec4 Port_Import_N049;
uniform vec3 Port_Import_N031;
uniform vec4 Port_Import_N019;
uniform vec3 Port_Import_N020;
uniform float Port_Value2_N017;
out float varClipDistance;
flat out int varStereoViewID;
in vec4 boneData;
in vec3 blendShape0Pos;
in vec3 blendShape0Normal;
in vec3 blendShape1Pos;
in vec3 blendShape1Normal;
in vec3 blendShape2Pos;
in vec3 blendShape2Normal;
in vec3 blendShape3Pos;
in vec3 blendShape4Pos;
in vec3 blendShape5Pos;
in vec4 position;
in vec3 normal;
in vec4 tangent;
in vec2 texture0;
in vec2 texture1;
out vec3 varPos;
out vec3 varNormal;
out vec4 varTangent;
out vec4 varPackedTex;
out vec4 varScreenPos;
out vec2 varScreenTexturePos;
out vec2 varShadowTex;
out float varViewSpaceDepth;
out vec4 varColor;
in vec4 color;
out vec4 PreviewVertexColor;
out float PreviewVertexSaved;
in vec3 positionNext;
in vec3 positionPrevious;
in vec4 strandProperties;
void sc_SetClipDistancePlatform(float dstClipDistance)
{
    #if sc_StereoRenderingMode==sc_StereoRendering_InstancedClipped&&sc_StereoRendering_IsClipDistanceEnabled
        gl_ClipDistance[0]=dstClipDistance;
    #endif
}
void sc_SetClipDistance(float dstClipDistance)
{
#if (sc_StereoRendering_IsClipDistanceEnabled==1)
{
sc_SetClipDistancePlatform(dstClipDistance);
}
#else
{
varClipDistance=dstClipDistance;
}
#endif
}
void sc_SetClipDistance(vec4 clipPosition)
{
#if (sc_StereoRenderingMode==1)
{
sc_SetClipDistance(dot(clipPosition,sc_StereoClipPlanes[sc_StereoViewID]));
}
#endif
}
void sc_SetClipPosition(vec4 clipPosition)
{
#if (sc_ShaderCacheConstant!=0)
{
clipPosition.x+=(sc_UniformConstants.x*float(sc_ShaderCacheConstant));
}
#endif
#if (sc_StereoRenderingMode>0)
{
varStereoViewID=sc_StereoViewID;
}
#endif
sc_SetClipDistance(clipPosition);
gl_Position=clipPosition;
}
void blendTargetShapeWithNormal(inout sc_Vertex_t v,vec3 position_1,vec3 normal_1,float weight)
{
vec3 l9_0=v.position.xyz+(position_1*weight);
v=sc_Vertex_t(vec4(l9_0.x,l9_0.y,l9_0.z,v.position.w),v.normal,v.tangent,v.texture0,v.texture1);
v.normal+=(normal_1*weight);
}
void sc_GetBoneMatrix(int index,out vec4 m0,out vec4 m1,out vec4 m2)
{
int l9_0=3*index;
m0=sc_BoneMatrices[l9_0];
m1=sc_BoneMatrices[l9_0+1];
m2=sc_BoneMatrices[l9_0+2];
}
vec3 skinVertexPosition(int i,vec4 v)
{
vec3 l9_0;
#if (sc_SkinBonesCount>0)
{
vec4 param_1;
vec4 param_2;
vec4 param_3;
sc_GetBoneMatrix(i,param_1,param_2,param_3);
l9_0=vec3(dot(v,param_1),dot(v,param_2),dot(v,param_3));
}
#else
{
l9_0=v.xyz;
}
#endif
return l9_0;
}
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=sc_StereoViewID;
}
#endif
return l9_0;
}
void main()
{
if (isProxyMode)
{
sc_SetClipPosition(vec4(position.xy,depthRef+(1e-10*position.z),1.0+(1e-10*position.w)));
return;
}
PreviewVertexColor=vec4(0.5);
PreviewVertexSaved=0.0;
vec4 l9_0;
#if (sc_IsEditor&&SC_DISABLE_FRUSTUM_CULLING)
{
vec4 l9_1=position;
l9_1.x=position.x+sc_DisableFrustumCullingMarker;
l9_0=l9_1;
}
#else
{
l9_0=position;
}
#endif
vec2 l9_2;
vec2 l9_3;
vec3 l9_4;
vec3 l9_5;
vec4 l9_6;
#if (sc_VertexBlending)
{
vec2 l9_7;
vec2 l9_8;
vec3 l9_9;
vec3 l9_10;
vec4 l9_11;
#if (sc_VertexBlendingUseNormals)
{
sc_Vertex_t l9_12=sc_Vertex_t(l9_0,normal,tangent.xyz,texture0,texture1);
blendTargetShapeWithNormal(l9_12,blendShape0Pos,blendShape0Normal,weights0.x);
blendTargetShapeWithNormal(l9_12,blendShape1Pos,blendShape1Normal,weights0.y);
blendTargetShapeWithNormal(l9_12,blendShape2Pos,blendShape2Normal,weights0.z);
l9_11=l9_12.position;
l9_10=l9_12.normal;
l9_9=l9_12.tangent;
l9_8=l9_12.texture0;
l9_7=l9_12.texture1;
}
#else
{
vec3 l9_14=(((((l9_0.xyz+(blendShape0Pos*weights0.x)).xyz+(blendShape1Pos*weights0.y)).xyz+(blendShape2Pos*weights0.z)).xyz+(blendShape3Pos*weights0.w)).xyz+(blendShape4Pos*weights1.x)).xyz+(blendShape5Pos*weights1.y);
l9_11=vec4(l9_14.x,l9_14.y,l9_14.z,l9_0.w);
l9_10=normal;
l9_9=tangent.xyz;
l9_8=texture0;
l9_7=texture1;
}
#endif
l9_6=l9_11;
l9_5=l9_10;
l9_4=l9_9;
l9_3=l9_8;
l9_2=l9_7;
}
#else
{
l9_6=l9_0;
l9_5=normal;
l9_4=tangent.xyz;
l9_3=texture0;
l9_2=texture1;
}
#endif
vec3 l9_15;
vec3 l9_16;
vec4 l9_17;
#if (sc_SkinBonesCount>0)
{
vec4 l9_18;
#if (sc_SkinBonesCount>0)
{
vec4 l9_19=vec4(1.0,fract(boneData.yzw));
vec4 l9_20=l9_19;
l9_20.x=1.0-dot(l9_19.yzw,vec3(1.0));
l9_18=l9_20;
}
#else
{
l9_18=vec4(0.0);
}
#endif
int l9_21=int(boneData.x);
int l9_22=int(boneData.y);
int l9_23=int(boneData.z);
int l9_24=int(boneData.w);
vec3 l9_25=(((skinVertexPosition(l9_21,l9_6)*l9_18.x)+(skinVertexPosition(l9_22,l9_6)*l9_18.y))+(skinVertexPosition(l9_23,l9_6)*l9_18.z))+(skinVertexPosition(l9_24,l9_6)*l9_18.w);
l9_17=vec4(l9_25.x,l9_25.y,l9_25.z,l9_6.w);
l9_16=((((sc_SkinBonesNormalMatrices[l9_21]*l9_5)*l9_18.x)+((sc_SkinBonesNormalMatrices[l9_22]*l9_5)*l9_18.y))+((sc_SkinBonesNormalMatrices[l9_23]*l9_5)*l9_18.z))+((sc_SkinBonesNormalMatrices[l9_24]*l9_5)*l9_18.w);
l9_15=((((sc_SkinBonesNormalMatrices[l9_21]*l9_4)*l9_18.x)+((sc_SkinBonesNormalMatrices[l9_22]*l9_4)*l9_18.y))+((sc_SkinBonesNormalMatrices[l9_23]*l9_4)*l9_18.z))+((sc_SkinBonesNormalMatrices[l9_24]*l9_4)*l9_18.w);
}
#else
{
l9_17=l9_6;
l9_16=l9_5;
l9_15=l9_4;
}
#endif
#if (sc_RenderingSpace==3)
{
varPos=vec3(0.0);
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==4)
{
varPos=vec3(0.0);
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==2)
{
varPos=l9_17.xyz;
varNormal=l9_16;
varTangent=vec4(l9_15.x,l9_15.y,l9_15.z,varTangent.w);
}
#else
{
#if (sc_RenderingSpace==1)
{
varPos=(sc_ModelMatrix*l9_17).xyz;
varNormal=sc_NormalMatrix*l9_16;
vec3 l9_26=sc_NormalMatrix*l9_15;
varTangent=vec4(l9_26.x,l9_26.y,l9_26.z,varTangent.w);
}
#endif
}
#endif
}
#endif
}
#endif
bool l9_27=PreviewEnabled==1;
vec2 l9_28;
if (l9_27)
{
vec2 l9_29=l9_3;
l9_29.x=1.0-l9_3.x;
l9_28=l9_29;
}
else
{
l9_28=l9_3;
}
varColor=color;
vec3 l9_30=varPos;
vec3 l9_31=varNormal;
vec3 l9_32;
vec3 l9_33;
vec3 l9_34;
if (l9_27)
{
l9_34=varTangent.xyz;
l9_33=varNormal;
l9_32=varPos;
}
else
{
l9_34=varTangent.xyz;
l9_33=l9_31;
l9_32=l9_30;
}
varPos=l9_32;
varNormal=normalize(l9_33);
vec3 l9_35=normalize(l9_34);
varTangent=vec4(l9_35.x,l9_35.y,l9_35.z,varTangent.w);
varTangent.w=tangent.w;
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
vec4 l9_36;
#if (sc_RenderingSpace==3)
{
l9_36=sc_ProjectionMatrixInverseArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_37;
#if (sc_RenderingSpace==2)
{
l9_37=sc_ViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
vec4 l9_38;
#if (sc_RenderingSpace==1)
{
l9_38=sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17;
}
#else
{
l9_38=l9_17;
}
#endif
l9_37=l9_38;
}
#endif
l9_36=l9_37;
}
#endif
varViewSpaceDepth=-l9_36.z;
}
#endif
vec4 l9_39;
#if (sc_RenderingSpace==3)
{
l9_39=l9_17;
}
#else
{
vec4 l9_40;
#if (sc_RenderingSpace==4)
{
l9_40=(sc_ModelViewMatrixArray[sc_GetStereoViewIndex()]*l9_17)*vec4(1.0/sc_Camera.aspect,1.0,1.0,1.0);
}
#else
{
vec4 l9_41;
#if (sc_RenderingSpace==2)
{
l9_41=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
vec4 l9_42;
#if (sc_RenderingSpace==1)
{
l9_42=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(varPos,1.0);
}
#else
{
l9_42=vec4(0.0);
}
#endif
l9_41=l9_42;
}
#endif
l9_40=l9_41;
}
#endif
l9_39=l9_40;
}
#endif
varPackedTex=vec4(l9_28,l9_2);
#if (sc_ProjectiveShadowsReceiver)
{
vec4 l9_43;
#if (sc_RenderingSpace==1)
{
l9_43=sc_ModelMatrix*l9_17;
}
#else
{
l9_43=l9_17;
}
#endif
vec4 l9_44=sc_ProjectorMatrix*l9_43;
varShadowTex=((l9_44.xy/vec2(l9_44.w))*0.5)+vec2(0.5);
}
#endif
vec4 l9_45;
#if (sc_DepthBufferMode==1)
{
vec4 l9_46;
if (sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].w!=0.0)
{
vec4 l9_47=l9_39;
l9_47.z=((log2(max(sc_Camera.clipPlanes.x,1.0+l9_39.w))*(2.0/log2(sc_Camera.clipPlanes.y+1.0)))-1.0)*l9_39.w;
l9_46=l9_47;
}
else
{
l9_46=l9_39;
}
l9_45=l9_46;
}
#else
{
l9_45=l9_39;
}
#endif
vec4 l9_48;
#if (sc_TAAEnabled)
{
vec2 l9_49=l9_45.xy+(sc_TAAJitterOffset*l9_45.w);
l9_48=vec4(l9_49.x,l9_49.y,l9_45.z,l9_45.w);
}
#else
{
l9_48=l9_45;
}
#endif
sc_SetClipPosition(l9_48);
}
#elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
#define sc_StereoRendering_Disabled 0
#define sc_StereoRendering_InstancedClipped 1
#define sc_StereoRendering_Multiview 2
#ifdef GL_ES
    #define SC_GLES_VERSION_20 2000
    #define SC_GLES_VERSION_30 3000
    #define SC_GLES_VERSION_31 3100
    #define SC_GLES_VERSION_32 3200
#endif
#ifdef VERTEX_SHADER
    #define scOutPos(clipPosition) gl_Position=clipPosition
    #define MAIN main
#endif
#ifdef SC_ENABLE_INSTANCED_RENDERING
    #ifndef sc_EnableInstancing
        #define sc_EnableInstancing 1
    #endif
#endif
#define mod(x,y) (x-y*floor((x+1e-6)/y))
#if defined(GL_ES)&&(__VERSION__<300)&&!defined(GL_OES_standard_derivatives)
#define dFdx(A) (A)
#define dFdy(A) (A)
#define fwidth(A) (A)
#endif
#if __VERSION__<300
#define isinf(x) (x!=0.0&&x*2.0==x ? true : false)
#define isnan(x) (x>0.0||x<0.0||x==0.0 ? false : true)
#define inverse(M) M
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef sc_EnableStereoClipDistance
        #if defined(GL_APPLE_clip_distance)
            #extension GL_APPLE_clip_distance : require
        #elif defined(GL_EXT_clip_cull_distance)
            #extension GL_EXT_clip_cull_distance : require
        #else
            #error Clip distance is requested but not supported by this device.
        #endif
    #endif
#else
    #ifdef sc_EnableStereoClipDistance
        #error Clip distance is requested but not supported by this device.
    #endif
#endif
#ifdef sc_EnableFeatureLevelES3
    #ifdef VERTEX_SHADER
        #define attribute in
        #define varying out
    #endif
    #ifdef FRAGMENT_SHADER
        #define varying in
    #endif
    #define gl_FragColor sc_FragData0
    #define texture2D texture
    #define texture2DLod textureLod
    #define texture2DLodEXT textureLod
    #define textureCubeLodEXT textureLod
    #define sc_CanUseTextureLod 1
#else
    #ifdef FRAGMENT_SHADER
        #if defined(GL_EXT_shader_texture_lod)
            #extension GL_EXT_shader_texture_lod : require
            #define sc_CanUseTextureLod 1
            #define texture2DLod texture2DLodEXT
        #endif
    #endif
#endif
#if defined(sc_EnableMultiviewStereoRendering)
    #define sc_StereoRenderingMode sc_StereoRendering_Multiview
    #define sc_NumStereoViews 2
    #extension GL_OVR_multiview2 : require
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #define sc_LocalInstanceID sc_GlobalInstanceID
        #define sc_StereoViewID int(gl_ViewID_OVR)
    #endif
#elif defined(sc_EnableInstancedClippedStereoRendering)
    #ifndef sc_EnableInstancing
        #error Instanced-clipped stereo rendering requires enabled instancing.
    #endif
    #ifndef sc_EnableStereoClipDistance
        #define sc_StereoRendering_IsClipDistanceEnabled 0
    #else
        #define sc_StereoRendering_IsClipDistanceEnabled 1
    #endif
    #define sc_StereoRenderingMode sc_StereoRendering_InstancedClipped
    #define sc_NumStereoClipPlanes 1
    #define sc_NumStereoViews 2
    #ifdef VERTEX_SHADER
        #ifdef sc_EnableInstancingFallback
            #define sc_GlobalInstanceID (sc_FallbackInstanceID*2+gl_InstanceID)
        #else
            #define sc_GlobalInstanceID gl_InstanceID
        #endif
        #ifdef sc_EnableFeatureLevelES3
            #define sc_LocalInstanceID (sc_GlobalInstanceID/2)
            #define sc_StereoViewID (sc_GlobalInstanceID%2)
        #else
            #define sc_LocalInstanceID int(sc_GlobalInstanceID/2.0)
            #define sc_StereoViewID int(mod(sc_GlobalInstanceID,2.0))
        #endif
    #endif
#else
    #define sc_StereoRenderingMode sc_StereoRendering_Disabled
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableInstancing
        #ifdef GL_ES
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)
                #define gl_InstanceID (0)
            #endif
        #else
            #if defined(sc_EnableFeatureLevelES2)&&!defined(GL_EXT_draw_instanced)&&!defined(GL_ARB_draw_instanced)&&!defined(GL_EXT_gpu_shader4)
                #define gl_InstanceID (0)
            #endif
        #endif
        #ifdef GL_ARB_draw_instanced
            #extension GL_ARB_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDARB
        #endif
        #ifdef GL_EXT_draw_instanced
            #extension GL_EXT_draw_instanced : require
            #define gl_InstanceID gl_InstanceIDEXT
        #endif
        #ifndef sc_InstanceID
            #define sc_InstanceID gl_InstanceID
        #endif
        #ifndef sc_GlobalInstanceID
            #ifdef sc_EnableInstancingFallback
                #define sc_GlobalInstanceID (sc_FallbackInstanceID)
                #define sc_LocalInstanceID (sc_FallbackInstanceID)
            #else
                #define sc_GlobalInstanceID gl_InstanceID
                #define sc_LocalInstanceID gl_InstanceID
            #endif
        #endif
    #endif
#endif
#ifdef VERTEX_SHADER
    #if (__VERSION__<300)&&!defined(GL_EXT_gpu_shader4)
        #define gl_VertexID (0)
    #endif
#endif
#ifndef GL_ES
        #extension GL_EXT_gpu_shader4 : enable
    #extension GL_ARB_shader_texture_lod : enable
    #ifndef texture2DLodEXT
        #define texture2DLodEXT texture2DLod
    #endif
    #ifndef sc_CanUseTextureLod
    #define sc_CanUseTextureLod 1
    #endif
    #define precision
    #define lowp
    #define mediump
    #define highp
    #define sc_FragmentPrecision
#endif
#ifdef sc_EnableFeatureLevelES3
    #define sc_CanUseSampler2DArray 1
#endif
#if defined(sc_EnableFeatureLevelES2)&&defined(GL_ES)
    #ifdef FRAGMENT_SHADER
        #ifdef GL_OES_standard_derivatives
            #extension GL_OES_standard_derivatives : require
            #define sc_CanUseStandardDerivatives 1
        #endif
    #endif
    #ifdef GL_EXT_texture_array
        #extension GL_EXT_texture_array : require
        #define sc_CanUseSampler2DArray 1
    #else
        #define sc_CanUseSampler2DArray 0
    #endif
#endif
#ifdef GL_ES
    #ifdef sc_FramebufferFetch
        #if defined(GL_EXT_shader_framebuffer_fetch)
            #extension GL_EXT_shader_framebuffer_fetch : require
        #elif defined(GL_ARM_shader_framebuffer_fetch)
            #extension GL_ARM_shader_framebuffer_fetch : require
        #else
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #endif
    #ifdef GL_FRAGMENT_PRECISION_HIGH
        #define sc_FragmentPrecision highp
    #else
        #define sc_FragmentPrecision mediump
    #endif
    #ifdef FRAGMENT_SHADER
        precision highp int;
        precision highp float;
    #endif
#endif
#ifdef VERTEX_SHADER
    #ifdef sc_EnableMultiviewStereoRendering
        layout(num_views=sc_NumStereoViews) in;
    #endif
#endif
#if __VERSION__>100
    #define SC_INT_FALLBACK_FLOAT int
    #define SC_INTERPOLATION_FLAT flat
    #define SC_INTERPOLATION_CENTROID centroid
#else
    #define SC_INT_FALLBACK_FLOAT float
    #define SC_INTERPOLATION_FLAT
    #define SC_INTERPOLATION_CENTROID
#endif
#ifndef sc_NumStereoViews
    #define sc_NumStereoViews 1
#endif
#ifndef sc_CanUseSampler2DArray
    #define sc_CanUseSampler2DArray 0
#endif
    #if __VERSION__==100||defined(SCC_VALIDATION)
        #define sampler2DArray vec2
        #define sampler3D vec3
        #define samplerCube vec4
        vec4 texture3D(vec3 s,vec3 uv)                       { return vec4(0.0); }
        vec4 texture3D(vec3 s,vec3 uv,float bias)           { return vec4(0.0); }
        vec4 texture3DLod(vec3 s,vec3 uv,float bias)        { return vec4(0.0); }
        vec4 texture3DLodEXT(vec3 s,vec3 uv,float lod)      { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv)                  { return vec4(0.0); }
        vec4 texture2DArray(vec2 s,vec3 uv,float bias)      { return vec4(0.0); }
        vec4 texture2DArrayLod(vec2 s,vec3 uv,float lod)    { return vec4(0.0); }
        vec4 texture2DArrayLodEXT(vec2 s,vec3 uv,float lod) { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv)                     { return vec4(0.0); }
        vec4 textureCube(vec4 s,vec3 uv,float lod)          { return vec4(0.0); }
        vec4 textureCubeLod(vec4 s,vec3 uv,float lod)       { return vec4(0.0); }
        vec4 textureCubeLodEXT(vec4 s,vec3 uv,float lod)    { return vec4(0.0); }
        #if defined(VERTEX_SHADER)||!sc_CanUseTextureLod
            #define texture2DLod(s,uv,lod)      vec4(0.0)
            #define texture2DLodEXT(s,uv,lod)   vec4(0.0)
        #endif
    #elif __VERSION__>=300
        #define texture3D texture
        #define textureCube texture
        #define texture2DArray texture
        #define texture2DLod textureLod
        #define texture3DLod textureLod
        #define texture2DLodEXT textureLod
        #define texture3DLodEXT textureLod
        #define textureCubeLod textureLod
        #define textureCubeLodEXT textureLod
        #define texture2DArrayLod textureLod
        #define texture2DArrayLodEXT textureLod
    #endif
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#if sc_ExporterVersion<224
#define MAIN main
#endif
    #ifndef sc_FramebufferFetch
    #define sc_FramebufferFetch 0
    #elif sc_FramebufferFetch==1
    #undef sc_FramebufferFetch
    #define sc_FramebufferFetch 1
    #endif
    #if !defined(GL_ES)&&__VERSION__<420
        #ifdef FRAGMENT_SHADER
            #define sc_FragData0 gl_FragData[0]
            #define sc_FragData1 gl_FragData[1]
            #define sc_FragData2 gl_FragData[2]
            #define sc_FragData3 gl_FragData[3]
        #endif
        mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
        #define gl_LastFragData (getFragData())
        #if sc_FramebufferFetch
            #error Framebuffer fetch is requested but not supported by this device.
        #endif
    #elif defined(sc_EnableFeatureLevelES3)
        #if sc_FragDataCount>=1
            #define sc_DeclareFragData0(StorageQualifier) layout(location=0) StorageQualifier sc_FragmentPrecision vec4 sc_FragData0
        #endif
        #if sc_FragDataCount>=2
            #define sc_DeclareFragData1(StorageQualifier) layout(location=1) StorageQualifier sc_FragmentPrecision vec4 sc_FragData1
        #endif
        #if sc_FragDataCount>=3
            #define sc_DeclareFragData2(StorageQualifier) layout(location=2) StorageQualifier sc_FragmentPrecision vec4 sc_FragData2
        #endif
        #if sc_FragDataCount>=4
            #define sc_DeclareFragData3(StorageQualifier) layout(location=3) StorageQualifier sc_FragmentPrecision vec4 sc_FragData3
        #endif
        #ifndef sc_DeclareFragData0
            #define sc_DeclareFragData0(_) const vec4 sc_FragData0=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData1
            #define sc_DeclareFragData1(_) const vec4 sc_FragData1=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData2
            #define sc_DeclareFragData2(_) const vec4 sc_FragData2=vec4(0.0)
        #endif
        #ifndef sc_DeclareFragData3
            #define sc_DeclareFragData3(_) const vec4 sc_FragData3=vec4(0.0)
        #endif
        #if sc_FramebufferFetch
            #ifdef GL_EXT_shader_framebuffer_fetch
                sc_DeclareFragData0(inout);
                sc_DeclareFragData1(inout);
                sc_DeclareFragData2(inout);
                sc_DeclareFragData3(inout);
                mediump mat4 getFragData() { return mat4(sc_FragData0,sc_FragData1,sc_FragData2,sc_FragData3); }
                #define gl_LastFragData (getFragData())
            #elif defined(GL_ARM_shader_framebuffer_fetch)
                sc_DeclareFragData0(out);
                sc_DeclareFragData1(out);
                sc_DeclareFragData2(out);
                sc_DeclareFragData3(out);
                mediump mat4 getFragData() { return mat4(gl_LastFragColorARM,vec4(0.0),vec4(0.0),vec4(0.0)); }
                #define gl_LastFragData (getFragData())
            #endif
        #else
            #ifdef sc_EnableFeatureLevelES3
                sc_DeclareFragData0(out);
                sc_DeclareFragData1(out);
                sc_DeclareFragData2(out);
                sc_DeclareFragData3(out);
                mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
                #define gl_LastFragData (getFragData())
            #endif
        #endif
    #elif defined(sc_EnableFeatureLevelES2)
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #else
        #define sc_FragData0 gl_FragColor
        mediump mat4 getFragData() { return mat4(vec4(0.0),vec4(0.0),vec4(0.0),vec4(0.0)); }
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
struct RayHitPayload
{
vec3 viewDirWS;
vec3 positionWS;
vec3 normalWS;
vec4 tangentWS;
vec4 color;
vec2 uv0;
vec2 uv1;
vec2 uv2;
vec2 uv3;
uvec2 id;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
vec2 gScreenCoord;
vec2 Surface_UVCoord0;
};
#ifndef sc_StereoRenderingMode
#define sc_StereoRenderingMode 0
#endif
#ifndef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 0
#elif sc_ScreenTextureHasSwappedViews==1
#undef sc_ScreenTextureHasSwappedViews
#define sc_ScreenTextureHasSwappedViews 1
#endif
#ifndef sc_ScreenTextureLayout
#define sc_ScreenTextureLayout 0
#endif
#ifndef sc_NumStereoViews
#define sc_NumStereoViews 1
#endif
#ifndef sc_BlendMode_Normal
#define sc_BlendMode_Normal 0
#elif sc_BlendMode_Normal==1
#undef sc_BlendMode_Normal
#define sc_BlendMode_Normal 1
#endif
#ifndef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 0
#elif sc_BlendMode_AlphaToCoverage==1
#undef sc_BlendMode_AlphaToCoverage
#define sc_BlendMode_AlphaToCoverage 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 0
#elif sc_BlendMode_PremultipliedAlphaHardware==1
#undef sc_BlendMode_PremultipliedAlphaHardware
#define sc_BlendMode_PremultipliedAlphaHardware 1
#endif
#ifndef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 0
#elif sc_BlendMode_PremultipliedAlphaAuto==1
#undef sc_BlendMode_PremultipliedAlphaAuto
#define sc_BlendMode_PremultipliedAlphaAuto 1
#endif
#ifndef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 0
#elif sc_BlendMode_PremultipliedAlpha==1
#undef sc_BlendMode_PremultipliedAlpha
#define sc_BlendMode_PremultipliedAlpha 1
#endif
#ifndef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 0
#elif sc_BlendMode_AddWithAlphaFactor==1
#undef sc_BlendMode_AddWithAlphaFactor
#define sc_BlendMode_AddWithAlphaFactor 1
#endif
#ifndef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 0
#elif sc_BlendMode_AlphaTest==1
#undef sc_BlendMode_AlphaTest
#define sc_BlendMode_AlphaTest 1
#endif
#ifndef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 0
#elif sc_BlendMode_Multiply==1
#undef sc_BlendMode_Multiply
#define sc_BlendMode_Multiply 1
#endif
#ifndef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 0
#elif sc_BlendMode_MultiplyOriginal==1
#undef sc_BlendMode_MultiplyOriginal
#define sc_BlendMode_MultiplyOriginal 1
#endif
#ifndef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 0
#elif sc_BlendMode_ColoredGlass==1
#undef sc_BlendMode_ColoredGlass
#define sc_BlendMode_ColoredGlass 1
#endif
#ifndef sc_BlendMode_Add
#define sc_BlendMode_Add 0
#elif sc_BlendMode_Add==1
#undef sc_BlendMode_Add
#define sc_BlendMode_Add 1
#endif
#ifndef sc_BlendMode_Screen
#define sc_BlendMode_Screen 0
#elif sc_BlendMode_Screen==1
#undef sc_BlendMode_Screen
#define sc_BlendMode_Screen 1
#endif
#ifndef sc_BlendMode_Min
#define sc_BlendMode_Min 0
#elif sc_BlendMode_Min==1
#undef sc_BlendMode_Min
#define sc_BlendMode_Min 1
#endif
#ifndef sc_BlendMode_Max
#define sc_BlendMode_Max 0
#elif sc_BlendMode_Max==1
#undef sc_BlendMode_Max
#define sc_BlendMode_Max 1
#endif
#ifndef sc_MotionVectorsPass
#define sc_MotionVectorsPass 0
#elif sc_MotionVectorsPass==1
#undef sc_MotionVectorsPass
#define sc_MotionVectorsPass 1
#endif
#ifndef sc_StereoRendering_IsClipDistanceEnabled
#define sc_StereoRendering_IsClipDistanceEnabled 0
#endif
#ifndef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 0
#elif sc_ShaderComplexityAnalyzer==1
#undef sc_ShaderComplexityAnalyzer
#define sc_ShaderComplexityAnalyzer 1
#endif
#ifndef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 0
#elif sc_UseFramebufferFetchMarker==1
#undef sc_UseFramebufferFetchMarker
#define sc_UseFramebufferFetchMarker 1
#endif
#ifndef sc_FramebufferFetch
#define sc_FramebufferFetch 0
#elif sc_FramebufferFetch==1
#undef sc_FramebufferFetch
#define sc_FramebufferFetch 1
#endif
#ifndef sc_IsEditor
#define sc_IsEditor 0
#elif sc_IsEditor==1
#undef sc_IsEditor
#define sc_IsEditor 1
#endif
#ifndef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 0
#elif sc_GetFramebufferColorInvalidUsageMarker==1
#undef sc_GetFramebufferColorInvalidUsageMarker
#define sc_GetFramebufferColorInvalidUsageMarker 1
#endif
#ifndef sc_BlendMode_Software
#define sc_BlendMode_Software 0
#elif sc_BlendMode_Software==1
#undef sc_BlendMode_Software
#define sc_BlendMode_Software 1
#endif
#ifndef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 0
#elif sc_ProxyAlphaOne==1
#undef sc_ProxyAlphaOne
#define sc_ProxyAlphaOne 1
#endif
#ifndef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 0
#elif intensityTextureHasSwappedViews==1
#undef intensityTextureHasSwappedViews
#define intensityTextureHasSwappedViews 1
#endif
#ifndef intensityTextureLayout
#define intensityTextureLayout 0
#endif
#ifndef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 0
#elif BLEND_MODE_REALISTIC==1
#undef BLEND_MODE_REALISTIC
#define BLEND_MODE_REALISTIC 1
#endif
#ifndef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 0
#elif BLEND_MODE_FORGRAY==1
#undef BLEND_MODE_FORGRAY
#define BLEND_MODE_FORGRAY 1
#endif
#ifndef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 0
#elif BLEND_MODE_NOTBRIGHT==1
#undef BLEND_MODE_NOTBRIGHT
#define BLEND_MODE_NOTBRIGHT 1
#endif
#ifndef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 0
#elif BLEND_MODE_DIVISION==1
#undef BLEND_MODE_DIVISION
#define BLEND_MODE_DIVISION 1
#endif
#ifndef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 0
#elif BLEND_MODE_BRIGHT==1
#undef BLEND_MODE_BRIGHT
#define BLEND_MODE_BRIGHT 1
#endif
#ifndef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 0
#elif BLEND_MODE_INTENSE==1
#undef BLEND_MODE_INTENSE
#define BLEND_MODE_INTENSE 1
#endif
#ifndef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 0
#elif SC_USE_UV_TRANSFORM_intensityTexture==1
#undef SC_USE_UV_TRANSFORM_intensityTexture
#define SC_USE_UV_TRANSFORM_intensityTexture 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_U_intensityTexture -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_intensityTexture
#define SC_SOFTWARE_WRAP_MODE_V_intensityTexture -1
#endif
#ifndef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 0
#elif SC_USE_UV_MIN_MAX_intensityTexture==1
#undef SC_USE_UV_MIN_MAX_intensityTexture
#define SC_USE_UV_MIN_MAX_intensityTexture 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 0
#elif SC_USE_CLAMP_TO_BORDER_intensityTexture==1
#undef SC_USE_CLAMP_TO_BORDER_intensityTexture
#define SC_USE_CLAMP_TO_BORDER_intensityTexture 1
#endif
#ifndef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 0
#elif BLEND_MODE_LIGHTEN==1
#undef BLEND_MODE_LIGHTEN
#define BLEND_MODE_LIGHTEN 1
#endif
#ifndef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 0
#elif BLEND_MODE_DARKEN==1
#undef BLEND_MODE_DARKEN
#define BLEND_MODE_DARKEN 1
#endif
#ifndef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 0
#elif BLEND_MODE_DIVIDE==1
#undef BLEND_MODE_DIVIDE
#define BLEND_MODE_DIVIDE 1
#endif
#ifndef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 0
#elif BLEND_MODE_AVERAGE==1
#undef BLEND_MODE_AVERAGE
#define BLEND_MODE_AVERAGE 1
#endif
#ifndef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 0
#elif BLEND_MODE_SUBTRACT==1
#undef BLEND_MODE_SUBTRACT
#define BLEND_MODE_SUBTRACT 1
#endif
#ifndef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 0
#elif BLEND_MODE_DIFFERENCE==1
#undef BLEND_MODE_DIFFERENCE
#define BLEND_MODE_DIFFERENCE 1
#endif
#ifndef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 0
#elif BLEND_MODE_NEGATION==1
#undef BLEND_MODE_NEGATION
#define BLEND_MODE_NEGATION 1
#endif
#ifndef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 0
#elif BLEND_MODE_EXCLUSION==1
#undef BLEND_MODE_EXCLUSION
#define BLEND_MODE_EXCLUSION 1
#endif
#ifndef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 0
#elif BLEND_MODE_OVERLAY==1
#undef BLEND_MODE_OVERLAY
#define BLEND_MODE_OVERLAY 1
#endif
#ifndef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 0
#elif BLEND_MODE_SOFT_LIGHT==1
#undef BLEND_MODE_SOFT_LIGHT
#define BLEND_MODE_SOFT_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 0
#elif BLEND_MODE_HARD_LIGHT==1
#undef BLEND_MODE_HARD_LIGHT
#define BLEND_MODE_HARD_LIGHT 1
#endif
#ifndef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 0
#elif BLEND_MODE_COLOR_DODGE==1
#undef BLEND_MODE_COLOR_DODGE
#define BLEND_MODE_COLOR_DODGE 1
#endif
#ifndef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 0
#elif BLEND_MODE_COLOR_BURN==1
#undef BLEND_MODE_COLOR_BURN
#define BLEND_MODE_COLOR_BURN 1
#endif
#ifndef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 0
#elif BLEND_MODE_LINEAR_LIGHT==1
#undef BLEND_MODE_LINEAR_LIGHT
#define BLEND_MODE_LINEAR_LIGHT 1
#endif
#ifndef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 0
#elif BLEND_MODE_VIVID_LIGHT==1
#undef BLEND_MODE_VIVID_LIGHT
#define BLEND_MODE_VIVID_LIGHT 1
#endif
#ifndef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 0
#elif BLEND_MODE_PIN_LIGHT==1
#undef BLEND_MODE_PIN_LIGHT
#define BLEND_MODE_PIN_LIGHT 1
#endif
#ifndef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 0
#elif BLEND_MODE_HARD_MIX==1
#undef BLEND_MODE_HARD_MIX
#define BLEND_MODE_HARD_MIX 1
#endif
#ifndef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 0
#elif BLEND_MODE_HARD_REFLECT==1
#undef BLEND_MODE_HARD_REFLECT
#define BLEND_MODE_HARD_REFLECT 1
#endif
#ifndef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 0
#elif BLEND_MODE_HARD_GLOW==1
#undef BLEND_MODE_HARD_GLOW
#define BLEND_MODE_HARD_GLOW 1
#endif
#ifndef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 0
#elif BLEND_MODE_HARD_PHOENIX==1
#undef BLEND_MODE_HARD_PHOENIX
#define BLEND_MODE_HARD_PHOENIX 1
#endif
#ifndef BLEND_MODE_HUE
#define BLEND_MODE_HUE 0
#elif BLEND_MODE_HUE==1
#undef BLEND_MODE_HUE
#define BLEND_MODE_HUE 1
#endif
#ifndef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 0
#elif BLEND_MODE_SATURATION==1
#undef BLEND_MODE_SATURATION
#define BLEND_MODE_SATURATION 1
#endif
#ifndef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 0
#elif BLEND_MODE_COLOR==1
#undef BLEND_MODE_COLOR
#define BLEND_MODE_COLOR 1
#endif
#ifndef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 0
#elif BLEND_MODE_LUMINOSITY==1
#undef BLEND_MODE_LUMINOSITY
#define BLEND_MODE_LUMINOSITY 1
#endif
#ifndef sc_SkinBonesCount
#define sc_SkinBonesCount 0
#endif
#ifndef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#elif UseViewSpaceDepthVariant==1
#undef UseViewSpaceDepthVariant
#define UseViewSpaceDepthVariant 1
#endif
#ifndef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 0
#elif sc_OITDepthGatherPass==1
#undef sc_OITDepthGatherPass
#define sc_OITDepthGatherPass 1
#endif
#ifndef sc_OITCompositingPass
#define sc_OITCompositingPass 0
#elif sc_OITCompositingPass==1
#undef sc_OITCompositingPass
#define sc_OITCompositingPass 1
#endif
#ifndef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 0
#elif sc_OITDepthBoundsPass==1
#undef sc_OITDepthBoundsPass
#define sc_OITDepthBoundsPass 1
#endif
#ifndef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 0
#elif sc_OITMaxLayers4Plus1==1
#undef sc_OITMaxLayers4Plus1
#define sc_OITMaxLayers4Plus1 1
#endif
#ifndef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 0
#elif sc_OITMaxLayersVisualizeLayerCount==1
#undef sc_OITMaxLayersVisualizeLayerCount
#define sc_OITMaxLayersVisualizeLayerCount 1
#endif
#ifndef sc_OITMaxLayers8
#define sc_OITMaxLayers8 0
#elif sc_OITMaxLayers8==1
#undef sc_OITMaxLayers8
#define sc_OITMaxLayers8 1
#endif
#ifndef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 0
#elif sc_OITFrontLayerPass==1
#undef sc_OITFrontLayerPass
#define sc_OITFrontLayerPass 1
#endif
#ifndef sc_OITDepthPrepass
#define sc_OITDepthPrepass 0
#elif sc_OITDepthPrepass==1
#undef sc_OITDepthPrepass
#define sc_OITDepthPrepass 1
#endif
#ifndef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 0
#elif ENABLE_STIPPLE_PATTERN_TEST==1
#undef ENABLE_STIPPLE_PATTERN_TEST
#define ENABLE_STIPPLE_PATTERN_TEST 1
#endif
#ifndef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 0
#elif sc_ProjectiveShadowsCaster==1
#undef sc_ProjectiveShadowsCaster
#define sc_ProjectiveShadowsCaster 1
#endif
#ifndef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 0
#elif sc_RenderAlphaToColor==1
#undef sc_RenderAlphaToColor
#define sc_RenderAlphaToColor 1
#endif
#ifndef sc_BlendMode_Custom
#define sc_BlendMode_Custom 0
#elif sc_BlendMode_Custom==1
#undef sc_BlendMode_Custom
#define sc_BlendMode_Custom 1
#endif
#ifndef inputTexHasSwappedViews
#define inputTexHasSwappedViews 0
#elif inputTexHasSwappedViews==1
#undef inputTexHasSwappedViews
#define inputTexHasSwappedViews 1
#endif
#ifndef inputTexLayout
#define inputTexLayout 0
#endif
#ifndef alphaTexHasSwappedViews
#define alphaTexHasSwappedViews 0
#elif alphaTexHasSwappedViews==1
#undef alphaTexHasSwappedViews
#define alphaTexHasSwappedViews 1
#endif
#ifndef alphaTexLayout
#define alphaTexLayout 0
#endif
#ifndef texWarpOutHasSwappedViews
#define texWarpOutHasSwappedViews 0
#elif texWarpOutHasSwappedViews==1
#undef texWarpOutHasSwappedViews
#define texWarpOutHasSwappedViews 1
#endif
#ifndef texWarpOutLayout
#define texWarpOutLayout 0
#endif
#ifndef output_1HasSwappedViews
#define output_1HasSwappedViews 0
#elif output_1HasSwappedViews==1
#undef output_1HasSwappedViews
#define output_1HasSwappedViews 1
#endif
#ifndef output_1Layout
#define output_1Layout 0
#endif
#ifndef output_0HasSwappedViews
#define output_0HasSwappedViews 0
#elif output_0HasSwappedViews==1
#undef output_0HasSwappedViews
#define output_0HasSwappedViews 1
#endif
#ifndef output_0Layout
#define output_0Layout 0
#endif
#ifndef maskFacePartsHasSwappedViews
#define maskFacePartsHasSwappedViews 0
#elif maskFacePartsHasSwappedViews==1
#undef maskFacePartsHasSwappedViews
#define maskFacePartsHasSwappedViews 1
#endif
#ifndef maskFacePartsLayout
#define maskFacePartsLayout 0
#endif
#ifndef Tweak_N158HasSwappedViews
#define Tweak_N158HasSwappedViews 0
#elif Tweak_N158HasSwappedViews==1
#undef Tweak_N158HasSwappedViews
#define Tweak_N158HasSwappedViews 1
#endif
#ifndef Tweak_N158Layout
#define Tweak_N158Layout 0
#endif
#ifndef Tweak_N10
#define Tweak_N10 0
#elif Tweak_N10==1
#undef Tweak_N10
#define Tweak_N10 1
#endif
#ifndef Tweak_N15
#define Tweak_N15 0
#elif Tweak_N15==1
#undef Tweak_N15
#define Tweak_N15 1
#endif
#ifndef Tweak_N2
#define Tweak_N2 0
#elif Tweak_N2==1
#undef Tweak_N2
#define Tweak_N2 1
#endif
#ifndef Tweak_N82
#define Tweak_N82 0
#elif Tweak_N82==1
#undef Tweak_N82
#define Tweak_N82 1
#endif
#ifndef SC_USE_UV_TRANSFORM_texWarpOut
#define SC_USE_UV_TRANSFORM_texWarpOut 0
#elif SC_USE_UV_TRANSFORM_texWarpOut==1
#undef SC_USE_UV_TRANSFORM_texWarpOut
#define SC_USE_UV_TRANSFORM_texWarpOut 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_texWarpOut
#define SC_SOFTWARE_WRAP_MODE_U_texWarpOut -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_texWarpOut
#define SC_SOFTWARE_WRAP_MODE_V_texWarpOut -1
#endif
#ifndef SC_USE_UV_MIN_MAX_texWarpOut
#define SC_USE_UV_MIN_MAX_texWarpOut 0
#elif SC_USE_UV_MIN_MAX_texWarpOut==1
#undef SC_USE_UV_MIN_MAX_texWarpOut
#define SC_USE_UV_MIN_MAX_texWarpOut 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_texWarpOut
#define SC_USE_CLAMP_TO_BORDER_texWarpOut 0
#elif SC_USE_CLAMP_TO_BORDER_texWarpOut==1
#undef SC_USE_CLAMP_TO_BORDER_texWarpOut
#define SC_USE_CLAMP_TO_BORDER_texWarpOut 1
#endif
#ifndef SC_USE_UV_TRANSFORM_output_1
#define SC_USE_UV_TRANSFORM_output_1 0
#elif SC_USE_UV_TRANSFORM_output_1==1
#undef SC_USE_UV_TRANSFORM_output_1
#define SC_USE_UV_TRANSFORM_output_1 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_output_1
#define SC_SOFTWARE_WRAP_MODE_U_output_1 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_output_1
#define SC_SOFTWARE_WRAP_MODE_V_output_1 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_output_1
#define SC_USE_UV_MIN_MAX_output_1 0
#elif SC_USE_UV_MIN_MAX_output_1==1
#undef SC_USE_UV_MIN_MAX_output_1
#define SC_USE_UV_MIN_MAX_output_1 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_output_1
#define SC_USE_CLAMP_TO_BORDER_output_1 0
#elif SC_USE_CLAMP_TO_BORDER_output_1==1
#undef SC_USE_CLAMP_TO_BORDER_output_1
#define SC_USE_CLAMP_TO_BORDER_output_1 1
#endif
#ifndef Tweak_N6
#define Tweak_N6 0
#elif Tweak_N6==1
#undef Tweak_N6
#define Tweak_N6 1
#endif
#ifndef Tweak_N54
#define Tweak_N54 0
#elif Tweak_N54==1
#undef Tweak_N54
#define Tweak_N54 1
#endif
#ifndef Tweak_N109
#define Tweak_N109 0
#elif Tweak_N109==1
#undef Tweak_N109
#define Tweak_N109 1
#endif
#ifndef SC_USE_UV_TRANSFORM_inputTex
#define SC_USE_UV_TRANSFORM_inputTex 0
#elif SC_USE_UV_TRANSFORM_inputTex==1
#undef SC_USE_UV_TRANSFORM_inputTex
#define SC_USE_UV_TRANSFORM_inputTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_inputTex
#define SC_SOFTWARE_WRAP_MODE_U_inputTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_inputTex
#define SC_SOFTWARE_WRAP_MODE_V_inputTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_inputTex
#define SC_USE_UV_MIN_MAX_inputTex 0
#elif SC_USE_UV_MIN_MAX_inputTex==1
#undef SC_USE_UV_MIN_MAX_inputTex
#define SC_USE_UV_MIN_MAX_inputTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_inputTex
#define SC_USE_CLAMP_TO_BORDER_inputTex 0
#elif SC_USE_CLAMP_TO_BORDER_inputTex==1
#undef SC_USE_CLAMP_TO_BORDER_inputTex
#define SC_USE_CLAMP_TO_BORDER_inputTex 1
#endif
#ifndef SC_USE_UV_TRANSFORM_alphaTex
#define SC_USE_UV_TRANSFORM_alphaTex 0
#elif SC_USE_UV_TRANSFORM_alphaTex==1
#undef SC_USE_UV_TRANSFORM_alphaTex
#define SC_USE_UV_TRANSFORM_alphaTex 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_alphaTex
#define SC_SOFTWARE_WRAP_MODE_U_alphaTex -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_alphaTex
#define SC_SOFTWARE_WRAP_MODE_V_alphaTex -1
#endif
#ifndef SC_USE_UV_MIN_MAX_alphaTex
#define SC_USE_UV_MIN_MAX_alphaTex 0
#elif SC_USE_UV_MIN_MAX_alphaTex==1
#undef SC_USE_UV_MIN_MAX_alphaTex
#define SC_USE_UV_MIN_MAX_alphaTex 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_alphaTex
#define SC_USE_CLAMP_TO_BORDER_alphaTex 0
#elif SC_USE_CLAMP_TO_BORDER_alphaTex==1
#undef SC_USE_CLAMP_TO_BORDER_alphaTex
#define SC_USE_CLAMP_TO_BORDER_alphaTex 1
#endif
#ifndef SC_USE_UV_TRANSFORM_output_0
#define SC_USE_UV_TRANSFORM_output_0 0
#elif SC_USE_UV_TRANSFORM_output_0==1
#undef SC_USE_UV_TRANSFORM_output_0
#define SC_USE_UV_TRANSFORM_output_0 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_output_0
#define SC_SOFTWARE_WRAP_MODE_U_output_0 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_output_0
#define SC_SOFTWARE_WRAP_MODE_V_output_0 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_output_0
#define SC_USE_UV_MIN_MAX_output_0 0
#elif SC_USE_UV_MIN_MAX_output_0==1
#undef SC_USE_UV_MIN_MAX_output_0
#define SC_USE_UV_MIN_MAX_output_0 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_output_0
#define SC_USE_CLAMP_TO_BORDER_output_0 0
#elif SC_USE_CLAMP_TO_BORDER_output_0==1
#undef SC_USE_CLAMP_TO_BORDER_output_0
#define SC_USE_CLAMP_TO_BORDER_output_0 1
#endif
#ifndef sc_DepthOnly
#define sc_DepthOnly 0
#elif sc_DepthOnly==1
#undef sc_DepthOnly
#define sc_DepthOnly 1
#endif
#ifndef SC_USE_UV_TRANSFORM_maskFaceParts
#define SC_USE_UV_TRANSFORM_maskFaceParts 0
#elif SC_USE_UV_TRANSFORM_maskFaceParts==1
#undef SC_USE_UV_TRANSFORM_maskFaceParts
#define SC_USE_UV_TRANSFORM_maskFaceParts 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_maskFaceParts
#define SC_SOFTWARE_WRAP_MODE_U_maskFaceParts -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_maskFaceParts
#define SC_SOFTWARE_WRAP_MODE_V_maskFaceParts -1
#endif
#ifndef SC_USE_UV_MIN_MAX_maskFaceParts
#define SC_USE_UV_MIN_MAX_maskFaceParts 0
#elif SC_USE_UV_MIN_MAX_maskFaceParts==1
#undef SC_USE_UV_MIN_MAX_maskFaceParts
#define SC_USE_UV_MIN_MAX_maskFaceParts 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_maskFaceParts
#define SC_USE_CLAMP_TO_BORDER_maskFaceParts 0
#elif SC_USE_CLAMP_TO_BORDER_maskFaceParts==1
#undef SC_USE_CLAMP_TO_BORDER_maskFaceParts
#define SC_USE_CLAMP_TO_BORDER_maskFaceParts 1
#endif
#ifndef SC_USE_UV_TRANSFORM_Tweak_N158
#define SC_USE_UV_TRANSFORM_Tweak_N158 0
#elif SC_USE_UV_TRANSFORM_Tweak_N158==1
#undef SC_USE_UV_TRANSFORM_Tweak_N158
#define SC_USE_UV_TRANSFORM_Tweak_N158 1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_U_Tweak_N158
#define SC_SOFTWARE_WRAP_MODE_U_Tweak_N158 -1
#endif
#ifndef SC_SOFTWARE_WRAP_MODE_V_Tweak_N158
#define SC_SOFTWARE_WRAP_MODE_V_Tweak_N158 -1
#endif
#ifndef SC_USE_UV_MIN_MAX_Tweak_N158
#define SC_USE_UV_MIN_MAX_Tweak_N158 0
#elif SC_USE_UV_MIN_MAX_Tweak_N158==1
#undef SC_USE_UV_MIN_MAX_Tweak_N158
#define SC_USE_UV_MIN_MAX_Tweak_N158 1
#endif
#ifndef SC_USE_CLAMP_TO_BORDER_Tweak_N158
#define SC_USE_CLAMP_TO_BORDER_Tweak_N158 0
#elif SC_USE_CLAMP_TO_BORDER_Tweak_N158==1
#undef SC_USE_CLAMP_TO_BORDER_Tweak_N158
#define SC_USE_CLAMP_TO_BORDER_Tweak_N158 1
#endif
#ifndef sc_PointLightsCount
#define sc_PointLightsCount 0
#endif
#ifndef sc_DirectionalLightsCount
#define sc_DirectionalLightsCount 0
#endif
#ifndef sc_AmbientLightsCount
#define sc_AmbientLightsCount 0
#endif
struct sc_PointLight_t
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
vec3 direction;
vec3 position;
vec4 color;
};
struct sc_DirectionalLight_t
{
vec3 direction;
vec4 color;
};
struct sc_AmbientLight_t
{
vec3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
vec3 color;
float sharpness;
vec3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
vec3 ambientLight;
};
struct sc_Camera_t
{
vec3 position;
float aspect;
vec2 clipPlanes;
};
layout(binding=1,std430) readonly buffer layoutVertices
{
float _Vertices[];
} layoutVertices_obj;
layout(binding=2,std430) readonly buffer layoutVerticesPN
{
float _VerticesPN[];
} layoutVerticesPN_obj;
layout(binding=0,std430) readonly buffer layoutIndices
{
uint _Triangles[];
} layoutIndices_obj;
uniform vec4 sc_EnvmapDiffuseDims;
uniform vec4 sc_EnvmapSpecularDims;
uniform vec4 sc_ScreenTextureDims;
uniform bool isProxyMode;
uniform bool noEarlyZ;
uniform vec4 z_rayDirectionsDims;
uniform vec4 sc_CurrentRenderTargetDims;
uniform mat4 sc_ProjectionMatrixArray[sc_NumStereoViews];
uniform float sc_ShadowDensity;
uniform vec4 sc_ShadowColor;
uniform mat4 sc_ViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameViewProjectionMatrixArray[sc_NumStereoViews];
uniform mat4 sc_PrevFrameModelMatrix;
uniform mat4 sc_ModelMatrixInverse;
uniform float shaderComplexityValue;
uniform float _sc_framebufferFetchMarker;
uniform float _sc_GetFramebufferColorInvalidUsageMarker;
uniform int emitter_stride;
uniform int proxy_offset_position;
uniform int proxy_format_position;
uniform int proxy_offset_normal;
uniform int proxy_format_normal;
uniform int proxy_offset_tangent;
uniform int proxy_format_tangent;
uniform int proxy_offset_color;
uniform int proxy_format_color;
uniform int proxy_offset_texture0;
uniform int proxy_format_texture0;
uniform int proxy_offset_texture1;
uniform int proxy_format_texture1;
uniform int proxy_offset_texture2;
uniform int proxy_format_texture2;
uniform int proxy_offset_texture3;
uniform int proxy_format_texture3;
uniform int lray_triangles_last;
uniform int instance_id;
uniform bool has_animated_pn;
uniform mat4 sc_ModelMatrix;
uniform mat3 sc_NormalMatrix;
uniform vec4 intensityTextureDims;
uniform float correctedIntensity;
uniform mat3 intensityTextureTransform;
uniform vec4 intensityTextureUvMinMax;
uniform vec4 intensityTextureBorderColor;
uniform float alphaTestThreshold;
uniform vec4 inputTexDims;
uniform vec4 alphaTexDims;
uniform vec4 texWarpOutDims;
uniform vec4 output_1Dims;
uniform vec4 output_0Dims;
uniform vec4 maskFacePartsDims;
uniform vec4 Tweak_N158Dims;
uniform vec4 wrapOutMax;
uniform vec4 wrapOutMin;
uniform vec4 warpMax;
uniform vec4 warpMin;
uniform float warp_intensity;
uniform mat3 texWarpOutTransform;
uniform vec4 texWarpOutUvMinMax;
uniform vec4 texWarpOutBorderColor;
uniform vec2 Port_Input1_N096;
uniform mat3 output_1Transform;
uniform vec4 output_1UvMinMax;
uniform vec4 output_1BorderColor;
uniform vec4 Port_Input1_N137;
uniform vec3 alphaMax;
uniform vec3 alphaMin;
uniform float Tweak_N110;
uniform float Port_Input1_N127;
uniform float Port_Input1_N133;
uniform float Port_Input1_N117;
uniform mat4 Port_Value_N099;
uniform mat4 sc_ModelViewProjectionMatrixArray[sc_NumStereoViews];
uniform vec4 Port_Column0_N102;
uniform vec4 Port_Column1_N102;
uniform vec4 Port_Column2_N102;
uniform vec4 Port_Column3_N102;
uniform float Port_Input2_N135;
uniform float Port_Value2_N105;
uniform float Port_Value3_N105;
uniform float Port_Input1_N014;
uniform float Port_Input2_N003;
uniform vec2 Port_Input1_N143;
uniform vec2 Port_Input2_N143;
uniform mat3 inputTexTransform;
uniform vec4 inputTexUvMinMax;
uniform vec4 inputTexBorderColor;
uniform vec4 colorMax;
uniform vec4 colorMin;
uniform mat3 alphaTexTransform;
uniform vec4 alphaTexUvMinMax;
uniform vec4 alphaTexBorderColor;
uniform mat3 output_0Transform;
uniform vec4 output_0UvMinMax;
uniform vec4 output_0BorderColor;
uniform float intensity;
uniform float darkenAlpha;
uniform float lightenAlpha;
uniform int overrideTimeEnabled;
uniform float overrideTimeElapsed;
uniform vec4 sc_Time;
uniform float overrideTimeDelta;
uniform float Port_Value2_N017;
uniform mat3 maskFacePartsTransform;
uniform vec4 maskFacePartsUvMinMax;
uniform vec4 maskFacePartsBorderColor;
uniform mat3 Tweak_N158Transform;
uniform vec4 Tweak_N158UvMinMax;
uniform vec4 Tweak_N158BorderColor;
uniform int PreviewEnabled;
uniform sc_PointLight_t sc_PointLights[sc_PointLightsCount+1];
uniform sc_DirectionalLight_t sc_DirectionalLights[sc_DirectionalLightsCount+1];
uniform sc_AmbientLight_t sc_AmbientLights[sc_AmbientLightsCount+1];
uniform sc_LightEstimationData_t sc_LightEstimationData;
uniform vec4 sc_EnvmapDiffuseSize;
uniform vec4 sc_EnvmapDiffuseView;
uniform vec4 sc_EnvmapSpecularSize;
uniform vec4 sc_EnvmapSpecularView;
uniform vec3 sc_EnvmapRotation;
uniform float sc_EnvmapExposure;
uniform vec3 sc_Sh[9];
uniform float sc_ShIntensity;
uniform vec4 sc_UniformConstants;
uniform vec4 sc_GeometryInfo;
uniform mat4 sc_ModelViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ModelViewMatrixInverseArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixArray[sc_NumStereoViews];
uniform mat3 sc_ViewNormalMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ProjectionMatrixInverseArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixArray[sc_NumStereoViews];
uniform mat4 sc_ViewMatrixInverseArray[sc_NumStereoViews];
uniform mat3 sc_NormalMatrixInverse;
uniform mat4 sc_PrevFrameModelMatrixInverse;
uniform vec3 sc_LocalAabbMin;
uniform vec3 sc_LocalAabbMax;
uniform vec3 sc_WorldAabbMin;
uniform vec3 sc_WorldAabbMax;
uniform vec4 sc_WindowToViewportTransform;
uniform sc_Camera_t sc_Camera;
uniform mat4 sc_ProjectorMatrix;
uniform float sc_DisableFrustumCullingMarker;
uniform vec4 sc_BoneMatrices[(sc_SkinBonesCount*3)+1];
uniform mat3 sc_SkinBonesNormalMatrices[sc_SkinBonesCount+1];
uniform vec4 weights0;
uniform vec4 weights1;
uniform vec4 weights2;
uniform vec4 sc_StereoClipPlanes[sc_NumStereoViews];
uniform int sc_FallbackInstanceID;
uniform vec2 sc_TAAJitterOffset;
uniform float strandWidth;
uniform float strandTaper;
uniform vec4 sc_StrandDataMapTextureSize;
uniform float clumpInstanceCount;
uniform float clumpRadius;
uniform float clumpTipScale;
uniform float hairstyleInstanceCount;
uniform float hairstyleNoise;
uniform vec4 sc_ScreenTextureSize;
uniform vec4 sc_ScreenTextureView;
uniform vec4 z_rayDirectionsSize;
uniform vec4 z_rayDirectionsView;
uniform vec4 intensityTextureSize;
uniform vec4 intensityTextureView;
uniform float reflBlurWidth;
uniform float reflBlurMinRough;
uniform float reflBlurMaxRough;
uniform int PreviewNodeID;
uniform vec4 inputTexSize;
uniform vec4 inputTexView;
uniform vec4 alphaTexSize;
uniform vec4 alphaTexView;
uniform vec4 texWarpOutSize;
uniform vec4 texWarpOutView;
uniform vec4 output_1Size;
uniform vec4 output_1View;
uniform vec4 output_0Size;
uniform vec4 output_0View;
uniform vec4 maskFacePartsSize;
uniform vec4 maskFacePartsView;
uniform vec4 Tweak_N158Size;
uniform vec4 Tweak_N158View;
uniform vec4 Port_Import_N058;
uniform vec4 Port_Import_N059;
uniform vec4 Port_Import_N060;
uniform vec4 Port_Import_N072;
uniform vec4 Port_Import_N073;
uniform vec4 Port_Import_N074;
uniform vec3 Port_Import_N064;
uniform vec3 Port_Import_N065;
uniform vec3 Port_Import_N066;
uniform vec3 Port_Import_N037;
uniform float Port_Import_N119;
uniform vec2 Port_Import_N120;
uniform vec2 Port_Import_N122;
uniform vec2 Port_Import_N130;
uniform vec2 Port_Import_N104;
uniform float Port_Import_N048;
uniform vec2 Port_Import_N063;
uniform vec2 Port_Import_N112;
uniform vec2 Port_Import_N029;
uniform vec3 Port_Import_N034;
uniform vec4 Port_Import_N044;
uniform vec4 Port_Import_N051;
uniform vec4 Port_Import_N049;
uniform vec3 Port_Import_N031;
uniform vec4 Port_Import_N019;
uniform vec3 Port_Import_N020;
uniform float depthRef;
uniform usampler2D z_hitIdAndBarycentric;
uniform sampler2D z_rayDirections;
uniform sampler2D inputTex;
uniform sampler2DArray inputTexArrSC;
uniform sampler2D output_1;
uniform sampler2DArray output_1ArrSC;
uniform sampler2D texWarpOut;
uniform sampler2DArray texWarpOutArrSC;
uniform sampler2D output_0;
uniform sampler2DArray output_0ArrSC;
uniform sampler2D alphaTex;
uniform sampler2DArray alphaTexArrSC;
uniform sampler2D maskFaceParts;
uniform sampler2DArray maskFacePartsArrSC;
uniform sampler2D Tweak_N158;
uniform sampler2DArray Tweak_N158ArrSC;
uniform sampler2D sc_ScreenTexture;
uniform sampler2DArray sc_ScreenTextureArrSC;
uniform sampler2D intensityTexture;
uniform sampler2DArray intensityTextureArrSC;
uniform sampler2D sc_OITFrontDepthTexture;
uniform sampler2D sc_OITDepthHigh0;
uniform sampler2D sc_OITDepthLow0;
uniform sampler2D sc_OITAlpha0;
uniform sampler2D sc_OITDepthHigh1;
uniform sampler2D sc_OITDepthLow1;
uniform sampler2D sc_OITAlpha1;
uniform sampler2D sc_OITFilteredDepthBoundsTexture;
flat in int varStereoViewID;
in vec2 varShadowTex;
in float varClipDistance;
in float varViewSpaceDepth;
in vec4 PreviewVertexColor;
in float PreviewVertexSaved;
in vec4 varPackedTex;
in vec3 varPos;
in vec3 varNormal;
in vec4 varTangent;
in vec4 varScreenPos;
in vec2 varScreenTexturePos;
in vec4 varColor;
int sc_GetStereoViewIndex()
{
int l9_0;
#if (sc_StereoRenderingMode==0)
{
l9_0=0;
}
#else
{
l9_0=varStereoViewID;
}
#endif
return l9_0;
}
vec2 sc_SamplingCoordsGlobalToView(vec3 uvi,int renderingLayout,int viewIndex)
{
if (renderingLayout==1)
{
uvi.y=((2.0*uvi.y)+float(viewIndex))-1.0;
}
return uvi.xy;
}
vec2 sc_ScreenCoordsGlobalToView(vec2 uv)
{
vec2 l9_0;
#if (sc_StereoRenderingMode==1)
{
l9_0=sc_SamplingCoordsGlobalToView(vec3(uv,0.0),1,sc_GetStereoViewIndex());
}
#else
{
l9_0=uv;
}
#endif
return l9_0;
}
vec3 interp_float3_animated(vec3 brc,ivec3 indices,int offset)
{
ivec3 l9_0=(indices*ivec3(6))+ivec3(offset);
int l9_1=l9_0.x;
int l9_2=l9_0.y;
int l9_3=l9_0.z;
return ((vec3(layoutVerticesPN_obj._VerticesPN[l9_1],layoutVerticesPN_obj._VerticesPN[l9_1+1],layoutVerticesPN_obj._VerticesPN[l9_1+2])*brc.x)+(vec3(layoutVerticesPN_obj._VerticesPN[l9_2],layoutVerticesPN_obj._VerticesPN[l9_2+1],layoutVerticesPN_obj._VerticesPN[l9_2+2])*brc.y))+(vec3(layoutVerticesPN_obj._VerticesPN[l9_3],layoutVerticesPN_obj._VerticesPN[l9_3+1],layoutVerticesPN_obj._VerticesPN[l9_3+2])*brc.z);
}
vec4 fetch_unorm_byte4(int offset)
{
uint l9_0=floatBitsToUint(layoutVertices_obj._Vertices[offset]);
return vec4(float(l9_0&255u),float((l9_0>>uint(8))&255u),float((l9_0>>uint(16))&255u),float((l9_0>>uint(24))&255u))/vec4(255.0);
}
RayHitPayload GetHitData(ivec2 screenPos)
{
ivec2 l9_0=screenPos;
uvec4 l9_1=texelFetch(z_hitIdAndBarycentric,l9_0,0);
uvec2 l9_2=l9_1.xy;
if (l9_1.x!=uint(instance_id))
{
return RayHitPayload(vec3(0.0),vec3(0.0),vec3(0.0),vec4(0.0),vec4(0.0),vec2(0.0),vec2(0.0),vec2(0.0),vec2(0.0),l9_2);
}
vec2 l9_3=unpackHalf2x16(l9_1.z|(l9_1.w<<uint(16)));
float l9_4=l9_3.x;
float l9_5=l9_3.y;
float l9_6=(1.0-l9_4)-l9_5;
vec3 l9_7=vec3(l9_6,l9_4,l9_5);
ivec2 l9_8=screenPos;
vec4 l9_9=texelFetch(z_rayDirections,l9_8,0);
float l9_10=l9_9.x;
float l9_11=l9_9.y;
float l9_12=(1.0-abs(l9_10))-abs(l9_11);
vec3 l9_13=vec3(l9_10,l9_11,l9_12);
float l9_14=clamp(-l9_12,0.0,1.0);
float l9_15;
if (l9_10>=0.0)
{
l9_15=-l9_14;
}
else
{
l9_15=l9_14;
}
float l9_16;
if (l9_11>=0.0)
{
l9_16=-l9_14;
}
else
{
l9_16=l9_14;
}
vec2 l9_17=vec2(l9_15,l9_16);
vec2 l9_18=l9_13.xy+l9_17;
uint l9_19=min(l9_1.y,uint(lray_triangles_last))*6u;
uint l9_20=l9_19&4294967292u;
uint l9_21=l9_20/4u;
uint l9_22=layoutIndices_obj._Triangles[l9_21];
uint l9_23=l9_21+1u;
uint l9_24=layoutIndices_obj._Triangles[l9_23];
uvec4 l9_25=(uvec4(l9_22,l9_22,l9_24,l9_24)&uvec4(65535u,4294967295u,65535u,4294967295u))>>uvec4(0u,16u,0u,16u);
ivec3 l9_26;
if (l9_19==l9_20)
{
l9_26=ivec3(l9_25.xyz);
}
else
{
l9_26=ivec3(l9_25.yzw);
}
vec3 l9_27;
if (has_animated_pn)
{
l9_27=interp_float3_animated(l9_7,l9_26,0);
}
else
{
int l9_28=(l9_26.x*emitter_stride)+proxy_offset_position;
int l9_29=(l9_26.y*emitter_stride)+proxy_offset_position;
int l9_30=(l9_26.z*emitter_stride)+proxy_offset_position;
vec3 l9_31;
if (proxy_format_position==5)
{
l9_31=((vec3(layoutVertices_obj._Vertices[l9_28],layoutVertices_obj._Vertices[l9_28+1],layoutVertices_obj._Vertices[l9_28+2])*l9_6)+(vec3(layoutVertices_obj._Vertices[l9_29],layoutVertices_obj._Vertices[l9_29+1],layoutVertices_obj._Vertices[l9_29+2])*l9_4))+(vec3(layoutVertices_obj._Vertices[l9_30],layoutVertices_obj._Vertices[l9_30+1],layoutVertices_obj._Vertices[l9_30+2])*l9_5);
}
else
{
vec3 l9_32;
if (proxy_format_position==6)
{
l9_32=((vec3(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_28])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_28+1])).x)*l9_6)+(vec3(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_29])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_29+1])).x)*l9_4))+(vec3(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_30])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_30+1])).x)*l9_5);
}
else
{
l9_32=vec3(1.0,0.0,0.0);
}
l9_31=l9_32;
}
l9_27=(sc_ModelMatrix*vec4(l9_31,1.0)).xyz;
}
vec3 l9_33;
if (proxy_offset_normal>0)
{
vec3 l9_34;
if (has_animated_pn)
{
l9_34=interp_float3_animated(l9_7,l9_26,3);
}
else
{
int l9_35=(l9_26.x*emitter_stride)+proxy_offset_normal;
int l9_36=(l9_26.y*emitter_stride)+proxy_offset_normal;
int l9_37=(l9_26.z*emitter_stride)+proxy_offset_normal;
vec3 l9_38;
if (proxy_format_normal==5)
{
l9_38=((vec3(layoutVertices_obj._Vertices[l9_35],layoutVertices_obj._Vertices[l9_35+1],layoutVertices_obj._Vertices[l9_35+2])*l9_6)+(vec3(layoutVertices_obj._Vertices[l9_36],layoutVertices_obj._Vertices[l9_36+1],layoutVertices_obj._Vertices[l9_36+2])*l9_4))+(vec3(layoutVertices_obj._Vertices[l9_37],layoutVertices_obj._Vertices[l9_37+1],layoutVertices_obj._Vertices[l9_37+2])*l9_5);
}
else
{
vec3 l9_39;
if (proxy_format_normal==6)
{
l9_39=((vec3(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_35])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_35+1])).x)*l9_6)+(vec3(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_36])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_36+1])).x)*l9_4))+(vec3(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_37])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_37+1])).x)*l9_5);
}
else
{
l9_39=vec3(1.0,0.0,0.0);
}
l9_38=l9_39;
}
l9_34=normalize(sc_NormalMatrix*l9_38);
}
l9_33=l9_34;
}
else
{
l9_33=vec3(1.0,0.0,0.0);
}
vec4 l9_40;
if ((!has_animated_pn)&&(proxy_offset_tangent>0))
{
int l9_41=(l9_26.x*emitter_stride)+proxy_offset_tangent;
int l9_42=(l9_26.y*emitter_stride)+proxy_offset_tangent;
int l9_43=(l9_26.z*emitter_stride)+proxy_offset_tangent;
vec4 l9_44;
if (proxy_format_tangent==5)
{
l9_44=((vec4(layoutVertices_obj._Vertices[l9_41],layoutVertices_obj._Vertices[l9_41+1],layoutVertices_obj._Vertices[l9_41+2],layoutVertices_obj._Vertices[l9_41+3])*l9_6)+(vec4(layoutVertices_obj._Vertices[l9_42],layoutVertices_obj._Vertices[l9_42+1],layoutVertices_obj._Vertices[l9_42+2],layoutVertices_obj._Vertices[l9_42+3])*l9_4))+(vec4(layoutVertices_obj._Vertices[l9_43],layoutVertices_obj._Vertices[l9_43+1],layoutVertices_obj._Vertices[l9_43+2],layoutVertices_obj._Vertices[l9_43+3])*l9_5);
}
else
{
vec4 l9_45;
if (proxy_format_tangent==6)
{
l9_45=((vec4(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_41])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_41+1])))*l9_6)+(vec4(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_42])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_42+1])))*l9_4))+(vec4(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_43])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_43+1])))*l9_5);
}
else
{
vec4 l9_46;
if (proxy_format_tangent==2)
{
l9_46=((fetch_unorm_byte4(l9_41)*l9_6)+(fetch_unorm_byte4(l9_42)*l9_4))+(fetch_unorm_byte4(l9_43)*l9_5);
}
else
{
l9_46=vec4(1.0,0.0,0.0,0.0);
}
l9_45=l9_46;
}
l9_44=l9_45;
}
l9_40=vec4(normalize(sc_NormalMatrix*l9_44.xyz),l9_44.w);
}
else
{
l9_40=vec4(1.0,0.0,0.0,1.0);
}
vec4 l9_47;
if (proxy_format_color>0)
{
int l9_48=(l9_26.x*emitter_stride)+proxy_offset_color;
int l9_49=(l9_26.y*emitter_stride)+proxy_offset_color;
int l9_50=(l9_26.z*emitter_stride)+proxy_offset_color;
vec4 l9_51;
if (proxy_format_color==5)
{
l9_51=((vec4(layoutVertices_obj._Vertices[l9_48],layoutVertices_obj._Vertices[l9_48+1],layoutVertices_obj._Vertices[l9_48+2],layoutVertices_obj._Vertices[l9_48+3])*l9_6)+(vec4(layoutVertices_obj._Vertices[l9_49],layoutVertices_obj._Vertices[l9_49+1],layoutVertices_obj._Vertices[l9_49+2],layoutVertices_obj._Vertices[l9_49+3])*l9_4))+(vec4(layoutVertices_obj._Vertices[l9_50],layoutVertices_obj._Vertices[l9_50+1],layoutVertices_obj._Vertices[l9_50+2],layoutVertices_obj._Vertices[l9_50+3])*l9_5);
}
else
{
vec4 l9_52;
if (proxy_format_color==6)
{
l9_52=((vec4(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_48])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_48+1])))*l9_6)+(vec4(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_49])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_49+1])))*l9_4))+(vec4(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_50])),unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_50+1])))*l9_5);
}
else
{
vec4 l9_53;
if (proxy_format_color==2)
{
l9_53=((fetch_unorm_byte4(l9_48)*l9_6)+(fetch_unorm_byte4(l9_49)*l9_4))+(fetch_unorm_byte4(l9_50)*l9_5);
}
else
{
l9_53=vec4(1.0,0.0,0.0,0.0);
}
l9_52=l9_53;
}
l9_51=l9_52;
}
l9_47=l9_51;
}
else
{
l9_47=vec4(0.0);
}
ivec3 l9_54=l9_26%ivec3(2);
vec2 l9_55=vec2(dot(l9_7,vec3(ivec3(1)-l9_54)),0.0);
vec2 l9_56;
if (proxy_format_texture0>0)
{
int l9_57=(l9_26.x*emitter_stride)+proxy_offset_texture0;
int l9_58=(l9_26.y*emitter_stride)+proxy_offset_texture0;
int l9_59=(l9_26.z*emitter_stride)+proxy_offset_texture0;
vec2 l9_60;
if (proxy_format_texture0==5)
{
l9_60=((vec2(layoutVertices_obj._Vertices[l9_57],layoutVertices_obj._Vertices[l9_57+1])*l9_6)+(vec2(layoutVertices_obj._Vertices[l9_58],layoutVertices_obj._Vertices[l9_58+1])*l9_4))+(vec2(layoutVertices_obj._Vertices[l9_59],layoutVertices_obj._Vertices[l9_59+1])*l9_5);
}
else
{
vec2 l9_61;
if (proxy_format_texture0==6)
{
l9_61=((unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_57]))*l9_6)+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_58]))*l9_4))+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_59]))*l9_5);
}
else
{
l9_61=vec2(1.0,0.0);
}
l9_60=l9_61;
}
l9_56=l9_60;
}
else
{
l9_56=l9_55;
}
vec2 l9_62;
if (proxy_format_texture1>0)
{
int l9_63=(l9_26.x*emitter_stride)+proxy_offset_texture1;
int l9_64=(l9_26.y*emitter_stride)+proxy_offset_texture1;
int l9_65=(l9_26.z*emitter_stride)+proxy_offset_texture1;
vec2 l9_66;
if (proxy_format_texture1==5)
{
l9_66=((vec2(layoutVertices_obj._Vertices[l9_63],layoutVertices_obj._Vertices[l9_63+1])*l9_6)+(vec2(layoutVertices_obj._Vertices[l9_64],layoutVertices_obj._Vertices[l9_64+1])*l9_4))+(vec2(layoutVertices_obj._Vertices[l9_65],layoutVertices_obj._Vertices[l9_65+1])*l9_5);
}
else
{
vec2 l9_67;
if (proxy_format_texture1==6)
{
l9_67=((unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_63]))*l9_6)+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_64]))*l9_4))+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_65]))*l9_5);
}
else
{
l9_67=vec2(1.0,0.0);
}
l9_66=l9_67;
}
l9_62=l9_66;
}
else
{
l9_62=l9_55;
}
vec2 l9_68;
if (proxy_format_texture2>0)
{
int l9_69=(l9_26.x*emitter_stride)+proxy_offset_texture2;
int l9_70=(l9_26.y*emitter_stride)+proxy_offset_texture2;
int l9_71=(l9_26.z*emitter_stride)+proxy_offset_texture2;
vec2 l9_72;
if (proxy_format_texture2==5)
{
l9_72=((vec2(layoutVertices_obj._Vertices[l9_69],layoutVertices_obj._Vertices[l9_69+1])*l9_6)+(vec2(layoutVertices_obj._Vertices[l9_70],layoutVertices_obj._Vertices[l9_70+1])*l9_4))+(vec2(layoutVertices_obj._Vertices[l9_71],layoutVertices_obj._Vertices[l9_71+1])*l9_5);
}
else
{
vec2 l9_73;
if (proxy_format_texture2==6)
{
l9_73=((unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_69]))*l9_6)+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_70]))*l9_4))+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_71]))*l9_5);
}
else
{
l9_73=vec2(1.0,0.0);
}
l9_72=l9_73;
}
l9_68=l9_72;
}
else
{
l9_68=l9_55;
}
vec2 l9_74;
if (proxy_format_texture3>0)
{
int l9_75=(l9_26.x*emitter_stride)+proxy_offset_texture3;
int l9_76=(l9_26.y*emitter_stride)+proxy_offset_texture3;
int l9_77=(l9_26.z*emitter_stride)+proxy_offset_texture3;
vec2 l9_78;
if (proxy_format_texture3==5)
{
l9_78=((vec2(layoutVertices_obj._Vertices[l9_75],layoutVertices_obj._Vertices[l9_75+1])*l9_6)+(vec2(layoutVertices_obj._Vertices[l9_76],layoutVertices_obj._Vertices[l9_76+1])*l9_4))+(vec2(layoutVertices_obj._Vertices[l9_77],layoutVertices_obj._Vertices[l9_77+1])*l9_5);
}
else
{
vec2 l9_79;
if (proxy_format_texture3==6)
{
l9_79=((unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_75]))*l9_6)+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_76]))*l9_4))+(unpackHalf2x16(floatBitsToUint(layoutVertices_obj._Vertices[l9_77]))*l9_5);
}
else
{
l9_79=vec2(1.0,0.0);
}
l9_78=l9_79;
}
l9_74=l9_78;
}
else
{
l9_74=l9_55;
}
return RayHitPayload(-normalize(vec3(l9_18.x,l9_18.y,l9_13.z)),l9_27,l9_33,l9_40,l9_47,l9_56,l9_62,l9_68,l9_74,l9_2);
}
int inputTexGetStereoViewIndex()
{
int l9_0;
#if (inputTexHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void sc_SoftwareWrapEarly(inout float uv,int softwareWrapMode)
{
if (softwareWrapMode==1)
{
uv=fract(uv);
}
else
{
if (softwareWrapMode==2)
{
float l9_0=fract(uv);
uv=mix(l9_0,1.0-l9_0,clamp(step(0.25,fract((uv-l9_0)*0.5)),0.0,1.0));
}
}
}
void sc_ClampUV(inout float value,float minValue,float maxValue,bool useClampToBorder,inout float clampToBorderFactor)
{
float l9_0=clamp(value,minValue,maxValue);
float l9_1=step(abs(value-l9_0),9.9999997e-06);
clampToBorderFactor*=(l9_1+((1.0-float(useClampToBorder))*(1.0-l9_1)));
value=l9_0;
}
vec2 sc_TransformUV(vec2 uv,bool useUvTransform,mat3 uvTransform)
{
if (useUvTransform)
{
uv=vec2((uvTransform*vec3(uv,1.0)).xy);
}
return uv;
}
void sc_SoftwareWrapLate(inout float uv,int softwareWrapMode,bool useClampToBorder,inout float clampToBorderFactor)
{
if ((softwareWrapMode==0)||(softwareWrapMode==3))
{
sc_ClampUV(uv,0.0,1.0,useClampToBorder,clampToBorderFactor);
}
}
vec3 sc_SamplingCoordsViewToGlobal(vec2 uv,int renderingLayout,int viewIndex)
{
vec3 l9_0;
if (renderingLayout==0)
{
l9_0=vec3(uv,0.0);
}
else
{
vec3 l9_1;
if (renderingLayout==1)
{
l9_1=vec3(uv.x,(uv.y*0.5)+(0.5-(float(viewIndex)*0.5)),0.0);
}
else
{
l9_1=vec3(uv,float(viewIndex));
}
l9_0=l9_1;
}
return l9_0;
}
int output_1GetStereoViewIndex()
{
int l9_0;
#if (output_1HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
int texWarpOutGetStereoViewIndex()
{
int l9_0;
#if (texWarpOutHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void Node83_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (Tweak_N82)
{
vec4 l9_0;
#if (texWarpOutLayout==2)
{
float l9_1=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).x);
float l9_2=l9_1;
float l9_3=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_texWarpOut)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_texWarpOut)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,texWarpOutUvMinMax.x,texWarpOutUvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_texWarpOut)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,texWarpOutUvMinMax.y,texWarpOutUvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_texWarpOut)!=0),texWarpOutTransform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).x,(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0)&&(!(int(SC_USE_UV_MIN_MAX_texWarpOut)!=0)),l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).y,(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0)&&(!(int(SC_USE_UV_MIN_MAX_texWarpOut)!=0)),l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),texWarpOutLayout,texWarpOutGetStereoViewIndex());
vec4 l9_22=texture(texWarpOutArrSC,l9_21,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_texWarpOut)
{
l9_23=mix(texWarpOutBorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
l9_0=l9_23;
}
#else
{
float l9_24=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_24,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).x);
float l9_25=l9_24;
float l9_26=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).y);
float l9_27=l9_26;
vec2 l9_28;
float l9_29;
#if (SC_USE_UV_MIN_MAX_texWarpOut)
{
bool l9_30;
#if (SC_USE_CLAMP_TO_BORDER_texWarpOut)
{
l9_30=ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).x==3;
}
#else
{
l9_30=(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0);
}
#endif
float l9_31=l9_25;
float l9_32=1.0;
sc_ClampUV(l9_31,texWarpOutUvMinMax.x,texWarpOutUvMinMax.z,l9_30,l9_32);
float l9_33=l9_31;
float l9_34=l9_32;
bool l9_35;
#if (SC_USE_CLAMP_TO_BORDER_texWarpOut)
{
l9_35=ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).y==3;
}
#else
{
l9_35=(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0);
}
#endif
float l9_36=l9_27;
float l9_37=l9_34;
sc_ClampUV(l9_36,texWarpOutUvMinMax.y,texWarpOutUvMinMax.w,l9_35,l9_37);
l9_29=l9_37;
l9_28=vec2(l9_33,l9_36);
}
#else
{
l9_29=1.0;
l9_28=vec2(l9_25,l9_27);
}
#endif
vec2 l9_38=sc_TransformUV(l9_28,(int(SC_USE_UV_TRANSFORM_texWarpOut)!=0),texWarpOutTransform);
float l9_39=l9_38.x;
float l9_40=l9_29;
sc_SoftwareWrapLate(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).x,(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0)&&(!(int(SC_USE_UV_MIN_MAX_texWarpOut)!=0)),l9_40);
float l9_41=l9_38.y;
float l9_42=l9_40;
sc_SoftwareWrapLate(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_texWarpOut,SC_SOFTWARE_WRAP_MODE_V_texWarpOut).y,(int(SC_USE_CLAMP_TO_BORDER_texWarpOut)!=0)&&(!(int(SC_USE_UV_MIN_MAX_texWarpOut)!=0)),l9_42);
float l9_43=l9_42;
vec3 l9_44=sc_SamplingCoordsViewToGlobal(vec2(l9_39,l9_41),texWarpOutLayout,texWarpOutGetStereoViewIndex());
vec4 l9_45=texture(texWarpOut,l9_44.xy,0.0);
vec4 l9_46;
#if (SC_USE_CLAMP_TO_BORDER_texWarpOut)
{
l9_46=mix(texWarpOutBorderColor,l9_45,vec4(l9_43));
}
#else
{
l9_46=l9_45;
}
#endif
l9_0=l9_46;
}
#endif
Value1=((l9_0*(wrapOutMax-wrapOutMin))+wrapOutMin).xy*Port_Input1_N096;
Result=Value1;
}
#else
{
vec4 l9_47;
#if (output_1Layout==2)
{
float l9_48=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_48,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_49=l9_48;
float l9_50=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_51=l9_50;
vec2 l9_52;
float l9_53;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_54;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_54=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_54=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_55=l9_49;
float l9_56=1.0;
sc_ClampUV(l9_55,output_1UvMinMax.x,output_1UvMinMax.z,l9_54,l9_56);
float l9_57=l9_55;
float l9_58=l9_56;
bool l9_59;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_59=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_59=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_60=l9_51;
float l9_61=l9_58;
sc_ClampUV(l9_60,output_1UvMinMax.y,output_1UvMinMax.w,l9_59,l9_61);
l9_53=l9_61;
l9_52=vec2(l9_57,l9_60);
}
#else
{
l9_53=1.0;
l9_52=vec2(l9_49,l9_51);
}
#endif
vec2 l9_62=sc_TransformUV(l9_52,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_63=l9_62.x;
float l9_64=l9_53;
sc_SoftwareWrapLate(l9_63,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_64);
float l9_65=l9_62.y;
float l9_66=l9_64;
sc_SoftwareWrapLate(l9_65,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_66);
float l9_67=l9_66;
vec3 l9_68=sc_SamplingCoordsViewToGlobal(vec2(l9_63,l9_65),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_69=texture(output_1ArrSC,l9_68,0.0);
vec4 l9_70;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_70=mix(output_1BorderColor,l9_69,vec4(l9_67));
}
#else
{
l9_70=l9_69;
}
#endif
l9_47=l9_70;
}
#else
{
float l9_71=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_71,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_72=l9_71;
float l9_73=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_73,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_74=l9_73;
vec2 l9_75;
float l9_76;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_77;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_77=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_77=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_78=l9_72;
float l9_79=1.0;
sc_ClampUV(l9_78,output_1UvMinMax.x,output_1UvMinMax.z,l9_77,l9_79);
float l9_80=l9_78;
float l9_81=l9_79;
bool l9_82;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_82=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_82=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_83=l9_74;
float l9_84=l9_81;
sc_ClampUV(l9_83,output_1UvMinMax.y,output_1UvMinMax.w,l9_82,l9_84);
l9_76=l9_84;
l9_75=vec2(l9_80,l9_83);
}
#else
{
l9_76=1.0;
l9_75=vec2(l9_72,l9_74);
}
#endif
vec2 l9_85=sc_TransformUV(l9_75,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_86=l9_85.x;
float l9_87=l9_76;
sc_SoftwareWrapLate(l9_86,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_87);
float l9_88=l9_85.y;
float l9_89=l9_87;
sc_SoftwareWrapLate(l9_88,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_89);
float l9_90=l9_89;
vec3 l9_91=sc_SamplingCoordsViewToGlobal(vec2(l9_86,l9_88),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_92=texture(output_1,l9_91.xy,0.0);
vec4 l9_93;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_93=mix(output_1BorderColor,l9_92,vec4(l9_90));
}
#else
{
l9_93=l9_92;
}
#endif
l9_47=l9_93;
}
#endif
Default=((((l9_47*(warpMax-warpMin))+warpMin)*Port_Input1_N137)*vec4(warp_intensity)).xy;
Result=Default;
}
#endif
}
void Node1_If_else(float Bool1,vec2 Value1,vec2 Default,out vec2 Result,ssGlobals Globals)
{
#if (Tweak_N2)
{
vec2 param_3;
Node83_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
Value1=param_3+Globals.Surface_UVCoord0;
Result=Value1;
}
#else
{
Default=Globals.Surface_UVCoord0;
Result=Default;
}
#endif
}
int output_0GetStereoViewIndex()
{
int l9_0;
#if (output_0HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void Node135_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
#if (Tweak_N109)
{
vec2 l9_0=Globals.Surface_UVCoord0;
vec2 l9_1=min(vec2(1.0)-l9_0,l9_0);
vec4 l9_2;
#if (output_1Layout==2)
{
float l9_3=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_4=l9_3;
float l9_5=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_5,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_6=l9_5;
vec2 l9_7;
float l9_8;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_9;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_9=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_9=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_10=l9_4;
float l9_11=1.0;
sc_ClampUV(l9_10,output_1UvMinMax.x,output_1UvMinMax.z,l9_9,l9_11);
float l9_12=l9_10;
float l9_13=l9_11;
bool l9_14;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_14=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_14=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_15=l9_6;
float l9_16=l9_13;
sc_ClampUV(l9_15,output_1UvMinMax.y,output_1UvMinMax.w,l9_14,l9_16);
l9_8=l9_16;
l9_7=vec2(l9_12,l9_15);
}
#else
{
l9_8=1.0;
l9_7=vec2(l9_4,l9_6);
}
#endif
vec2 l9_17=sc_TransformUV(l9_7,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_18=l9_17.x;
float l9_19=l9_8;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_19);
float l9_20=l9_17.y;
float l9_21=l9_19;
sc_SoftwareWrapLate(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_21);
float l9_22=l9_21;
vec3 l9_23=sc_SamplingCoordsViewToGlobal(vec2(l9_18,l9_20),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_24=texture(output_1ArrSC,l9_23,0.0);
vec4 l9_25;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_25=mix(output_1BorderColor,l9_24,vec4(l9_22));
}
#else
{
l9_25=l9_24;
}
#endif
l9_2=l9_25;
}
#else
{
float l9_26=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_27=l9_26;
float l9_28=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_29=l9_28;
vec2 l9_30;
float l9_31;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_32;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_32=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_32=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_33=l9_27;
float l9_34=1.0;
sc_ClampUV(l9_33,output_1UvMinMax.x,output_1UvMinMax.z,l9_32,l9_34);
float l9_35=l9_33;
float l9_36=l9_34;
bool l9_37;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_37=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_37=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_38=l9_29;
float l9_39=l9_36;
sc_ClampUV(l9_38,output_1UvMinMax.y,output_1UvMinMax.w,l9_37,l9_39);
l9_31=l9_39;
l9_30=vec2(l9_35,l9_38);
}
#else
{
l9_31=1.0;
l9_30=vec2(l9_27,l9_29);
}
#endif
vec2 l9_40=sc_TransformUV(l9_30,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_41=l9_40.x;
float l9_42=l9_31;
sc_SoftwareWrapLate(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_42);
float l9_43=l9_40.y;
float l9_44=l9_42;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_44);
float l9_45=l9_44;
vec3 l9_46=sc_SamplingCoordsViewToGlobal(vec2(l9_41,l9_43),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_47=texture(output_1,l9_46.xy,0.0);
vec4 l9_48;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_48=mix(output_1BorderColor,l9_47,vec4(l9_45));
}
#else
{
l9_48=l9_47;
}
#endif
l9_2=l9_48;
}
#endif
Input1=min((Tweak_N110*max(min(l9_1.x,l9_1.y),Port_Input1_N127))/length(((((l9_2*(warpMax-warpMin))+warpMin)*Port_Input1_N137)*vec4(warp_intensity)).xy),Port_Input1_N133);
Output=Input1;
}
#else
{
Output=Input2;
}
#endif
}
void Node3_Conditional(float Input0,float Input1,float Input2,out float Output,ssGlobals Globals)
{
#if (Tweak_N109)
{
vec2 l9_0=Globals.gScreenCoord;
vec2 l9_1=min(vec2(1.0)-l9_0,l9_0);
vec4 l9_2;
#if (output_1Layout==2)
{
float l9_3=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_4=l9_3;
float l9_5=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_5,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_6=l9_5;
vec2 l9_7;
float l9_8;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_9;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_9=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_9=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_10=l9_4;
float l9_11=1.0;
sc_ClampUV(l9_10,output_1UvMinMax.x,output_1UvMinMax.z,l9_9,l9_11);
float l9_12=l9_10;
float l9_13=l9_11;
bool l9_14;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_14=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_14=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_15=l9_6;
float l9_16=l9_13;
sc_ClampUV(l9_15,output_1UvMinMax.y,output_1UvMinMax.w,l9_14,l9_16);
l9_8=l9_16;
l9_7=vec2(l9_12,l9_15);
}
#else
{
l9_8=1.0;
l9_7=vec2(l9_4,l9_6);
}
#endif
vec2 l9_17=sc_TransformUV(l9_7,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_18=l9_17.x;
float l9_19=l9_8;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_19);
float l9_20=l9_17.y;
float l9_21=l9_19;
sc_SoftwareWrapLate(l9_20,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_21);
float l9_22=l9_21;
vec3 l9_23=sc_SamplingCoordsViewToGlobal(vec2(l9_18,l9_20),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_24=texture(output_1ArrSC,l9_23,0.0);
vec4 l9_25;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_25=mix(output_1BorderColor,l9_24,vec4(l9_22));
}
#else
{
l9_25=l9_24;
}
#endif
l9_2=l9_25;
}
#else
{
float l9_26=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_27=l9_26;
float l9_28=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_28,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_29=l9_28;
vec2 l9_30;
float l9_31;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_32;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_32=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_32=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_33=l9_27;
float l9_34=1.0;
sc_ClampUV(l9_33,output_1UvMinMax.x,output_1UvMinMax.z,l9_32,l9_34);
float l9_35=l9_33;
float l9_36=l9_34;
bool l9_37;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_37=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_37=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_38=l9_29;
float l9_39=l9_36;
sc_ClampUV(l9_38,output_1UvMinMax.y,output_1UvMinMax.w,l9_37,l9_39);
l9_31=l9_39;
l9_30=vec2(l9_35,l9_38);
}
#else
{
l9_31=1.0;
l9_30=vec2(l9_27,l9_29);
}
#endif
vec2 l9_40=sc_TransformUV(l9_30,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_41=l9_40.x;
float l9_42=l9_31;
sc_SoftwareWrapLate(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_42);
float l9_43=l9_40.y;
float l9_44=l9_42;
sc_SoftwareWrapLate(l9_43,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_44);
float l9_45=l9_44;
vec3 l9_46=sc_SamplingCoordsViewToGlobal(vec2(l9_41,l9_43),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_47=texture(output_1,l9_46.xy,0.0);
vec4 l9_48;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_48=mix(output_1BorderColor,l9_47,vec4(l9_45));
}
#else
{
l9_48=l9_47;
}
#endif
l9_2=l9_48;
}
#endif
float param_3;
Node135_Conditional(1.0,1.0,Port_Input2_N135,param_3,Globals);
vec2 l9_49=((((l9_2*(warpMax-warpMin))+warpMin)*Port_Input1_N137)*vec4(warp_intensity)).xy*vec2(param_3);
vec4 l9_50=vec4(l9_49.x,l9_49.y,vec4(0.0).z,vec4(0.0).w);
l9_50.z=Port_Value2_N105;
vec4 l9_51=l9_50;
l9_51.w=Port_Value3_N105;
Input1=min((Tweak_N110*max(min(l9_1.x,l9_1.y),Port_Input1_N117))/length((((Port_Value_N099*sc_ModelViewProjectionMatrixArray[sc_GetStereoViewIndex()])*mat4(Port_Column0_N102,Port_Column1_N102,Port_Column2_N102,Port_Column3_N102))*l9_51).xy),Port_Input1_N014);
Output=Input1;
}
#else
{
Output=Input2;
}
#endif
}
void Node94_If_else(float Bool1,vec3 Value1,vec3 Default,out vec3 Result,ssGlobals Globals)
{
#if (Tweak_N54)
{
vec4 l9_0;
#if (output_1Layout==2)
{
float l9_1=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_1,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_2=l9_1;
float l9_3=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_3,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_4=l9_3;
vec2 l9_5;
float l9_6;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_7;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_7=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_7=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_8=l9_2;
float l9_9=1.0;
sc_ClampUV(l9_8,output_1UvMinMax.x,output_1UvMinMax.z,l9_7,l9_9);
float l9_10=l9_8;
float l9_11=l9_9;
bool l9_12;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_12=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_12=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_13=l9_4;
float l9_14=l9_11;
sc_ClampUV(l9_13,output_1UvMinMax.y,output_1UvMinMax.w,l9_12,l9_14);
l9_6=l9_14;
l9_5=vec2(l9_10,l9_13);
}
#else
{
l9_6=1.0;
l9_5=vec2(l9_2,l9_4);
}
#endif
vec2 l9_15=sc_TransformUV(l9_5,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_16=l9_15.x;
float l9_17=l9_6;
sc_SoftwareWrapLate(l9_16,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_17);
float l9_18=l9_15.y;
float l9_19=l9_17;
sc_SoftwareWrapLate(l9_18,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_19);
float l9_20=l9_19;
vec3 l9_21=sc_SamplingCoordsViewToGlobal(vec2(l9_16,l9_18),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_22=texture(output_1ArrSC,l9_21,0.0);
vec4 l9_23;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_23=mix(output_1BorderColor,l9_22,vec4(l9_20));
}
#else
{
l9_23=l9_22;
}
#endif
l9_0=l9_23;
}
#else
{
float l9_24=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_24,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_25=l9_24;
float l9_26=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_26,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_27=l9_26;
vec2 l9_28;
float l9_29;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_30;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_30=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_30=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_31=l9_25;
float l9_32=1.0;
sc_ClampUV(l9_31,output_1UvMinMax.x,output_1UvMinMax.z,l9_30,l9_32);
float l9_33=l9_31;
float l9_34=l9_32;
bool l9_35;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_35=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_35=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_36=l9_27;
float l9_37=l9_34;
sc_ClampUV(l9_36,output_1UvMinMax.y,output_1UvMinMax.w,l9_35,l9_37);
l9_29=l9_37;
l9_28=vec2(l9_33,l9_36);
}
#else
{
l9_29=1.0;
l9_28=vec2(l9_25,l9_27);
}
#endif
vec2 l9_38=sc_TransformUV(l9_28,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_39=l9_38.x;
float l9_40=l9_29;
sc_SoftwareWrapLate(l9_39,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_40);
float l9_41=l9_38.y;
float l9_42=l9_40;
sc_SoftwareWrapLate(l9_41,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_42);
float l9_43=l9_42;
vec3 l9_44=sc_SamplingCoordsViewToGlobal(vec2(l9_39,l9_41),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_45=texture(output_1,l9_44.xy,0.0);
vec4 l9_46;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_46=mix(output_1BorderColor,l9_45,vec4(l9_43));
}
#else
{
l9_46=l9_45;
}
#endif
l9_0=l9_46;
}
#endif
vec4 l9_47=l9_0*(warpMax-warpMin);
vec4 l9_48=((l9_47+warpMin)*Port_Input1_N137)*vec4(warp_intensity);
float param_3;
Node135_Conditional(1.0,1.0,Port_Input2_N135,param_3,Globals);
vec2 l9_49=l9_48.xy*vec2(param_3);
vec4 l9_50=vec4(l9_49.x,l9_49.y,vec4(0.0).z,vec4(0.0).w);
l9_50.z=Port_Value2_N105;
vec4 l9_51=l9_50;
l9_51.w=Port_Value3_N105;
float param_8;
Node3_Conditional(1.0,1.0,Port_Input2_N003,param_8,Globals);
float l9_52=param_8;
vec2 l9_53=Globals.gScreenCoord;
vec2 l9_54=clamp(((((Port_Value_N099*sc_ModelViewProjectionMatrixArray[sc_GetStereoViewIndex()])*mat4(Port_Column0_N102,Port_Column1_N102,Port_Column2_N102,Port_Column3_N102))*l9_51).xy*vec2(l9_52))+l9_53,Port_Input1_N143,Port_Input2_N143);
vec4 l9_55;
#if (inputTexLayout==2)
{
float l9_56=l9_54.x;
sc_SoftwareWrapEarly(l9_56,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_57=l9_56;
float l9_58=l9_54.y;
sc_SoftwareWrapEarly(l9_58,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_59=l9_58;
vec2 l9_60;
float l9_61;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_62;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_62=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_62=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_63=l9_57;
float l9_64=1.0;
sc_ClampUV(l9_63,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_62,l9_64);
float l9_65=l9_63;
float l9_66=l9_64;
bool l9_67;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_67=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_67=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_68=l9_59;
float l9_69=l9_66;
sc_ClampUV(l9_68,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_67,l9_69);
l9_61=l9_69;
l9_60=vec2(l9_65,l9_68);
}
#else
{
l9_61=1.0;
l9_60=vec2(l9_57,l9_59);
}
#endif
vec2 l9_70=sc_TransformUV(l9_60,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_71=l9_70.x;
float l9_72=l9_61;
sc_SoftwareWrapLate(l9_71,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_72);
float l9_73=l9_70.y;
float l9_74=l9_72;
sc_SoftwareWrapLate(l9_73,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_74);
float l9_75=l9_74;
vec3 l9_76=sc_SamplingCoordsViewToGlobal(vec2(l9_71,l9_73),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_77=texture(inputTexArrSC,l9_76,0.0);
vec4 l9_78;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_78=mix(inputTexBorderColor,l9_77,vec4(l9_75));
}
#else
{
l9_78=l9_77;
}
#endif
l9_55=l9_78;
}
#else
{
float l9_79=l9_54.x;
sc_SoftwareWrapEarly(l9_79,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_80=l9_79;
float l9_81=l9_54.y;
sc_SoftwareWrapEarly(l9_81,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_82=l9_81;
vec2 l9_83;
float l9_84;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_85;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_85=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_85=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_86=l9_80;
float l9_87=1.0;
sc_ClampUV(l9_86,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_85,l9_87);
float l9_88=l9_86;
float l9_89=l9_87;
bool l9_90;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_90=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_90=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_91=l9_82;
float l9_92=l9_89;
sc_ClampUV(l9_91,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_90,l9_92);
l9_84=l9_92;
l9_83=vec2(l9_88,l9_91);
}
#else
{
l9_84=1.0;
l9_83=vec2(l9_80,l9_82);
}
#endif
vec2 l9_93=sc_TransformUV(l9_83,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_94=l9_93.x;
float l9_95=l9_84;
sc_SoftwareWrapLate(l9_94,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_95);
float l9_96=l9_93.y;
float l9_97=l9_95;
sc_SoftwareWrapLate(l9_96,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_97);
float l9_98=l9_97;
vec3 l9_99=sc_SamplingCoordsViewToGlobal(vec2(l9_94,l9_96),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_100=texture(inputTex,l9_99.xy,0.0);
vec4 l9_101;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_101=mix(inputTexBorderColor,l9_100,vec4(l9_98));
}
#else
{
l9_101=l9_100;
}
#endif
l9_55=l9_101;
}
#endif
vec4 l9_102;
#if (inputTexLayout==2)
{
float l9_103=l9_53.x;
sc_SoftwareWrapEarly(l9_103,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_104=l9_103;
float l9_105=l9_53.y;
sc_SoftwareWrapEarly(l9_105,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_106=l9_105;
vec2 l9_107;
float l9_108;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_109;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_109=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_109=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_110=l9_104;
float l9_111=1.0;
sc_ClampUV(l9_110,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_109,l9_111);
float l9_112=l9_110;
float l9_113=l9_111;
bool l9_114;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_114=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_114=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_115=l9_106;
float l9_116=l9_113;
sc_ClampUV(l9_115,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_114,l9_116);
l9_108=l9_116;
l9_107=vec2(l9_112,l9_115);
}
#else
{
l9_108=1.0;
l9_107=vec2(l9_104,l9_106);
}
#endif
vec2 l9_117=sc_TransformUV(l9_107,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_118=l9_117.x;
float l9_119=l9_108;
sc_SoftwareWrapLate(l9_118,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_119);
float l9_120=l9_117.y;
float l9_121=l9_119;
sc_SoftwareWrapLate(l9_120,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_121);
float l9_122=l9_121;
vec3 l9_123=sc_SamplingCoordsViewToGlobal(vec2(l9_118,l9_120),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_124=texture(inputTexArrSC,l9_123,0.0);
vec4 l9_125;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_125=mix(inputTexBorderColor,l9_124,vec4(l9_122));
}
#else
{
l9_125=l9_124;
}
#endif
l9_102=l9_125;
}
#else
{
float l9_126=l9_53.x;
sc_SoftwareWrapEarly(l9_126,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_127=l9_126;
float l9_128=l9_53.y;
sc_SoftwareWrapEarly(l9_128,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_129=l9_128;
vec2 l9_130;
float l9_131;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_132;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_132=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_132=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_133=l9_127;
float l9_134=1.0;
sc_ClampUV(l9_133,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_132,l9_134);
float l9_135=l9_133;
float l9_136=l9_134;
bool l9_137;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_137=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_137=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_138=l9_129;
float l9_139=l9_136;
sc_ClampUV(l9_138,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_137,l9_139);
l9_131=l9_139;
l9_130=vec2(l9_135,l9_138);
}
#else
{
l9_131=1.0;
l9_130=vec2(l9_127,l9_129);
}
#endif
vec2 l9_140=sc_TransformUV(l9_130,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_141=l9_140.x;
float l9_142=l9_131;
sc_SoftwareWrapLate(l9_141,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_142);
float l9_143=l9_140.y;
float l9_144=l9_142;
sc_SoftwareWrapLate(l9_143,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_144);
float l9_145=l9_144;
vec3 l9_146=sc_SamplingCoordsViewToGlobal(vec2(l9_141,l9_143),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_147=texture(inputTex,l9_146.xy,0.0);
vec4 l9_148;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_148=mix(inputTexBorderColor,l9_147,vec4(l9_145));
}
#else
{
l9_148=l9_147;
}
#endif
l9_102=l9_148;
}
#endif
Value1=mix(l9_55.xyz,l9_102.xyz,vec3(l9_48.w));
Result=Value1;
}
#else
{
vec4 l9_149;
#if (output_1Layout==2)
{
float l9_150=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_150,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_151=l9_150;
float l9_152=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_152,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_153=l9_152;
vec2 l9_154;
float l9_155;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_156;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_156=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_156=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_157=l9_151;
float l9_158=1.0;
sc_ClampUV(l9_157,output_1UvMinMax.x,output_1UvMinMax.z,l9_156,l9_158);
float l9_159=l9_157;
float l9_160=l9_158;
bool l9_161;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_161=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_161=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_162=l9_153;
float l9_163=l9_160;
sc_ClampUV(l9_162,output_1UvMinMax.y,output_1UvMinMax.w,l9_161,l9_163);
l9_155=l9_163;
l9_154=vec2(l9_159,l9_162);
}
#else
{
l9_155=1.0;
l9_154=vec2(l9_151,l9_153);
}
#endif
vec2 l9_164=sc_TransformUV(l9_154,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_165=l9_164.x;
float l9_166=l9_155;
sc_SoftwareWrapLate(l9_165,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_166);
float l9_167=l9_164.y;
float l9_168=l9_166;
sc_SoftwareWrapLate(l9_167,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_168);
float l9_169=l9_168;
vec3 l9_170=sc_SamplingCoordsViewToGlobal(vec2(l9_165,l9_167),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_171=texture(output_1ArrSC,l9_170,0.0);
vec4 l9_172;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_172=mix(output_1BorderColor,l9_171,vec4(l9_169));
}
#else
{
l9_172=l9_171;
}
#endif
l9_149=l9_172;
}
#else
{
float l9_173=Globals.Surface_UVCoord0.x;
sc_SoftwareWrapEarly(l9_173,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x);
float l9_174=l9_173;
float l9_175=Globals.Surface_UVCoord0.y;
sc_SoftwareWrapEarly(l9_175,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y);
float l9_176=l9_175;
vec2 l9_177;
float l9_178;
#if (SC_USE_UV_MIN_MAX_output_1)
{
bool l9_179;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_179=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x==3;
}
#else
{
l9_179=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_180=l9_174;
float l9_181=1.0;
sc_ClampUV(l9_180,output_1UvMinMax.x,output_1UvMinMax.z,l9_179,l9_181);
float l9_182=l9_180;
float l9_183=l9_181;
bool l9_184;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_184=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y==3;
}
#else
{
l9_184=(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0);
}
#endif
float l9_185=l9_176;
float l9_186=l9_183;
sc_ClampUV(l9_185,output_1UvMinMax.y,output_1UvMinMax.w,l9_184,l9_186);
l9_178=l9_186;
l9_177=vec2(l9_182,l9_185);
}
#else
{
l9_178=1.0;
l9_177=vec2(l9_174,l9_176);
}
#endif
vec2 l9_187=sc_TransformUV(l9_177,(int(SC_USE_UV_TRANSFORM_output_1)!=0),output_1Transform);
float l9_188=l9_187.x;
float l9_189=l9_178;
sc_SoftwareWrapLate(l9_188,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).x,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_189);
float l9_190=l9_187.y;
float l9_191=l9_189;
sc_SoftwareWrapLate(l9_190,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_1,SC_SOFTWARE_WRAP_MODE_V_output_1).y,(int(SC_USE_CLAMP_TO_BORDER_output_1)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_1)!=0)),l9_191);
float l9_192=l9_191;
vec3 l9_193=sc_SamplingCoordsViewToGlobal(vec2(l9_188,l9_190),output_1Layout,output_1GetStereoViewIndex());
vec4 l9_194=texture(output_1,l9_193.xy,0.0);
vec4 l9_195;
#if (SC_USE_CLAMP_TO_BORDER_output_1)
{
l9_195=mix(output_1BorderColor,l9_194,vec4(l9_192));
}
#else
{
l9_195=l9_194;
}
#endif
l9_149=l9_195;
}
#endif
float param_13;
Node135_Conditional(1.0,1.0,Port_Input2_N135,param_13,Globals);
vec2 l9_196=((((l9_149*(warpMax-warpMin))+warpMin)*Port_Input1_N137)*vec4(warp_intensity)).xy*vec2(param_13);
vec4 l9_197=vec4(l9_196.x,l9_196.y,vec4(0.0).z,vec4(0.0).w);
l9_197.z=Port_Value2_N105;
vec4 l9_198=l9_197;
l9_198.w=Port_Value3_N105;
float param_18;
Node3_Conditional(1.0,1.0,Port_Input2_N003,param_18,Globals);
float l9_199=param_18;
vec2 l9_200=Globals.gScreenCoord;
vec2 l9_201=clamp(((((Port_Value_N099*sc_ModelViewProjectionMatrixArray[sc_GetStereoViewIndex()])*mat4(Port_Column0_N102,Port_Column1_N102,Port_Column2_N102,Port_Column3_N102))*l9_198).xy*vec2(l9_199))+l9_200,Port_Input1_N143,Port_Input2_N143);
vec4 l9_202;
#if (inputTexLayout==2)
{
float l9_203=l9_201.x;
sc_SoftwareWrapEarly(l9_203,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_204=l9_203;
float l9_205=l9_201.y;
sc_SoftwareWrapEarly(l9_205,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_206=l9_205;
vec2 l9_207;
float l9_208;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_209;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_209=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_209=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_210=l9_204;
float l9_211=1.0;
sc_ClampUV(l9_210,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_209,l9_211);
float l9_212=l9_210;
float l9_213=l9_211;
bool l9_214;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_214=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_214=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_215=l9_206;
float l9_216=l9_213;
sc_ClampUV(l9_215,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_214,l9_216);
l9_208=l9_216;
l9_207=vec2(l9_212,l9_215);
}
#else
{
l9_208=1.0;
l9_207=vec2(l9_204,l9_206);
}
#endif
vec2 l9_217=sc_TransformUV(l9_207,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_218=l9_217.x;
float l9_219=l9_208;
sc_SoftwareWrapLate(l9_218,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_219);
float l9_220=l9_217.y;
float l9_221=l9_219;
sc_SoftwareWrapLate(l9_220,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_221);
float l9_222=l9_221;
vec3 l9_223=sc_SamplingCoordsViewToGlobal(vec2(l9_218,l9_220),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_224=texture(inputTexArrSC,l9_223,0.0);
vec4 l9_225;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_225=mix(inputTexBorderColor,l9_224,vec4(l9_222));
}
#else
{
l9_225=l9_224;
}
#endif
l9_202=l9_225;
}
#else
{
float l9_226=l9_201.x;
sc_SoftwareWrapEarly(l9_226,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_227=l9_226;
float l9_228=l9_201.y;
sc_SoftwareWrapEarly(l9_228,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_229=l9_228;
vec2 l9_230;
float l9_231;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_232;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_232=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_232=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_233=l9_227;
float l9_234=1.0;
sc_ClampUV(l9_233,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_232,l9_234);
float l9_235=l9_233;
float l9_236=l9_234;
bool l9_237;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_237=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_237=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_238=l9_229;
float l9_239=l9_236;
sc_ClampUV(l9_238,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_237,l9_239);
l9_231=l9_239;
l9_230=vec2(l9_235,l9_238);
}
#else
{
l9_231=1.0;
l9_230=vec2(l9_227,l9_229);
}
#endif
vec2 l9_240=sc_TransformUV(l9_230,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_241=l9_240.x;
float l9_242=l9_231;
sc_SoftwareWrapLate(l9_241,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_242);
float l9_243=l9_240.y;
float l9_244=l9_242;
sc_SoftwareWrapLate(l9_243,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_244);
float l9_245=l9_244;
vec3 l9_246=sc_SamplingCoordsViewToGlobal(vec2(l9_241,l9_243),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_247=texture(inputTex,l9_246.xy,0.0);
vec4 l9_248;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_248=mix(inputTexBorderColor,l9_247,vec4(l9_245));
}
#else
{
l9_248=l9_247;
}
#endif
l9_202=l9_248;
}
#endif
Default=l9_202.xyz;
Result=Default;
}
#endif
}
void Node89_If_else(float Bool1,vec3 Value1,vec3 Default,out vec3 Result,ssGlobals Globals)
{
#if (Tweak_N6)
{
vec3 param_3;
Node94_If_else(0.0,vec3(0.0),vec3(0.0),param_3,Globals);
Value1=param_3;
Result=Value1;
}
#else
{
vec2 l9_0=Globals.gScreenCoord;
vec4 l9_1;
#if (inputTexLayout==2)
{
float l9_2=l9_0.x;
sc_SoftwareWrapEarly(l9_2,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_3=l9_2;
float l9_4=l9_0.y;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_5=l9_4;
vec2 l9_6;
float l9_7;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_8;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_8=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_8=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_9=l9_3;
float l9_10=1.0;
sc_ClampUV(l9_9,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_8,l9_10);
float l9_11=l9_9;
float l9_12=l9_10;
bool l9_13;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_13=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_13=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_14=l9_5;
float l9_15=l9_12;
sc_ClampUV(l9_14,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_13,l9_15);
l9_7=l9_15;
l9_6=vec2(l9_11,l9_14);
}
#else
{
l9_7=1.0;
l9_6=vec2(l9_3,l9_5);
}
#endif
vec2 l9_16=sc_TransformUV(l9_6,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_17=l9_16.x;
float l9_18=l9_7;
sc_SoftwareWrapLate(l9_17,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_18);
float l9_19=l9_16.y;
float l9_20=l9_18;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_20);
float l9_21=l9_20;
vec3 l9_22=sc_SamplingCoordsViewToGlobal(vec2(l9_17,l9_19),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_23=texture(inputTexArrSC,l9_22,0.0);
vec4 l9_24;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_24=mix(inputTexBorderColor,l9_23,vec4(l9_21));
}
#else
{
l9_24=l9_23;
}
#endif
l9_1=l9_24;
}
#else
{
float l9_25=l9_0.x;
sc_SoftwareWrapEarly(l9_25,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_26=l9_25;
float l9_27=l9_0.y;
sc_SoftwareWrapEarly(l9_27,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_28=l9_27;
vec2 l9_29;
float l9_30;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_31;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_31=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_31=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_32=l9_26;
float l9_33=1.0;
sc_ClampUV(l9_32,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_31,l9_33);
float l9_34=l9_32;
float l9_35=l9_33;
bool l9_36;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_36=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_36=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_37=l9_28;
float l9_38=l9_35;
sc_ClampUV(l9_37,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_36,l9_38);
l9_30=l9_38;
l9_29=vec2(l9_34,l9_37);
}
#else
{
l9_30=1.0;
l9_29=vec2(l9_26,l9_28);
}
#endif
vec2 l9_39=sc_TransformUV(l9_29,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_40=l9_39.x;
float l9_41=l9_30;
sc_SoftwareWrapLate(l9_40,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_41);
float l9_42=l9_39.y;
float l9_43=l9_41;
sc_SoftwareWrapLate(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_43);
float l9_44=l9_43;
vec3 l9_45=sc_SamplingCoordsViewToGlobal(vec2(l9_40,l9_42),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_46=texture(inputTex,l9_45.xy,0.0);
vec4 l9_47;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_47=mix(inputTexBorderColor,l9_46,vec4(l9_44));
}
#else
{
l9_47=l9_46;
}
#endif
l9_1=l9_47;
}
#endif
Default=l9_1.xyz;
Result=Default;
}
#endif
}
int alphaTexGetStereoViewIndex()
{
int l9_0;
#if (alphaTexHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void Node32_If_else(float Bool1,vec3 Value1,vec3 Default,out vec3 Result,ssGlobals Globals)
{
#if (Tweak_N15)
{
vec2 param_3;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),param_3,Globals);
vec2 l9_0=param_3;
vec4 l9_1;
#if (alphaTexLayout==2)
{
float l9_2=l9_0.x;
sc_SoftwareWrapEarly(l9_2,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).x);
float l9_3=l9_2;
float l9_4=l9_0.y;
sc_SoftwareWrapEarly(l9_4,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).y);
float l9_5=l9_4;
vec2 l9_6;
float l9_7;
#if (SC_USE_UV_MIN_MAX_alphaTex)
{
bool l9_8;
#if (SC_USE_CLAMP_TO_BORDER_alphaTex)
{
l9_8=ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).x==3;
}
#else
{
l9_8=(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0);
}
#endif
float l9_9=l9_3;
float l9_10=1.0;
sc_ClampUV(l9_9,alphaTexUvMinMax.x,alphaTexUvMinMax.z,l9_8,l9_10);
float l9_11=l9_9;
float l9_12=l9_10;
bool l9_13;
#if (SC_USE_CLAMP_TO_BORDER_alphaTex)
{
l9_13=ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).y==3;
}
#else
{
l9_13=(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0);
}
#endif
float l9_14=l9_5;
float l9_15=l9_12;
sc_ClampUV(l9_14,alphaTexUvMinMax.y,alphaTexUvMinMax.w,l9_13,l9_15);
l9_7=l9_15;
l9_6=vec2(l9_11,l9_14);
}
#else
{
l9_7=1.0;
l9_6=vec2(l9_3,l9_5);
}
#endif
vec2 l9_16=sc_TransformUV(l9_6,(int(SC_USE_UV_TRANSFORM_alphaTex)!=0),alphaTexTransform);
float l9_17=l9_16.x;
float l9_18=l9_7;
sc_SoftwareWrapLate(l9_17,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).x,(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_alphaTex)!=0)),l9_18);
float l9_19=l9_16.y;
float l9_20=l9_18;
sc_SoftwareWrapLate(l9_19,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).y,(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_alphaTex)!=0)),l9_20);
float l9_21=l9_20;
vec3 l9_22=sc_SamplingCoordsViewToGlobal(vec2(l9_17,l9_19),alphaTexLayout,alphaTexGetStereoViewIndex());
vec4 l9_23=texture(alphaTexArrSC,l9_22,0.0);
vec4 l9_24;
#if (SC_USE_CLAMP_TO_BORDER_alphaTex)
{
l9_24=mix(alphaTexBorderColor,l9_23,vec4(l9_21));
}
#else
{
l9_24=l9_23;
}
#endif
l9_1=l9_24;
}
#else
{
float l9_25=l9_0.x;
sc_SoftwareWrapEarly(l9_25,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).x);
float l9_26=l9_25;
float l9_27=l9_0.y;
sc_SoftwareWrapEarly(l9_27,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).y);
float l9_28=l9_27;
vec2 l9_29;
float l9_30;
#if (SC_USE_UV_MIN_MAX_alphaTex)
{
bool l9_31;
#if (SC_USE_CLAMP_TO_BORDER_alphaTex)
{
l9_31=ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).x==3;
}
#else
{
l9_31=(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0);
}
#endif
float l9_32=l9_26;
float l9_33=1.0;
sc_ClampUV(l9_32,alphaTexUvMinMax.x,alphaTexUvMinMax.z,l9_31,l9_33);
float l9_34=l9_32;
float l9_35=l9_33;
bool l9_36;
#if (SC_USE_CLAMP_TO_BORDER_alphaTex)
{
l9_36=ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).y==3;
}
#else
{
l9_36=(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0);
}
#endif
float l9_37=l9_28;
float l9_38=l9_35;
sc_ClampUV(l9_37,alphaTexUvMinMax.y,alphaTexUvMinMax.w,l9_36,l9_38);
l9_30=l9_38;
l9_29=vec2(l9_34,l9_37);
}
#else
{
l9_30=1.0;
l9_29=vec2(l9_26,l9_28);
}
#endif
vec2 l9_39=sc_TransformUV(l9_29,(int(SC_USE_UV_TRANSFORM_alphaTex)!=0),alphaTexTransform);
float l9_40=l9_39.x;
float l9_41=l9_30;
sc_SoftwareWrapLate(l9_40,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).x,(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_alphaTex)!=0)),l9_41);
float l9_42=l9_39.y;
float l9_43=l9_41;
sc_SoftwareWrapLate(l9_42,ivec2(SC_SOFTWARE_WRAP_MODE_U_alphaTex,SC_SOFTWARE_WRAP_MODE_V_alphaTex).y,(int(SC_USE_CLAMP_TO_BORDER_alphaTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_alphaTex)!=0)),l9_43);
float l9_44=l9_43;
vec3 l9_45=sc_SamplingCoordsViewToGlobal(vec2(l9_40,l9_42),alphaTexLayout,alphaTexGetStereoViewIndex());
vec4 l9_46=texture(alphaTex,l9_45.xy,0.0);
vec4 l9_47;
#if (SC_USE_CLAMP_TO_BORDER_alphaTex)
{
l9_47=mix(alphaTexBorderColor,l9_46,vec4(l9_44));
}
#else
{
l9_47=l9_46;
}
#endif
l9_1=l9_47;
}
#endif
vec3 param_8;
Node89_If_else(0.0,vec3(0.0),vec3(0.0),param_8,Globals);
vec3 l9_48=param_8;
vec4 l9_49;
#if (output_0Layout==2)
{
float l9_50=l9_0.x;
sc_SoftwareWrapEarly(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x);
float l9_51=l9_50;
float l9_52=l9_0.y;
sc_SoftwareWrapEarly(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y);
float l9_53=l9_52;
vec2 l9_54;
float l9_55;
#if (SC_USE_UV_MIN_MAX_output_0)
{
bool l9_56;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_56=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x==3;
}
#else
{
l9_56=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_57=l9_51;
float l9_58=1.0;
sc_ClampUV(l9_57,output_0UvMinMax.x,output_0UvMinMax.z,l9_56,l9_58);
float l9_59=l9_57;
float l9_60=l9_58;
bool l9_61;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_61=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y==3;
}
#else
{
l9_61=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_62=l9_53;
float l9_63=l9_60;
sc_ClampUV(l9_62,output_0UvMinMax.y,output_0UvMinMax.w,l9_61,l9_63);
l9_55=l9_63;
l9_54=vec2(l9_59,l9_62);
}
#else
{
l9_55=1.0;
l9_54=vec2(l9_51,l9_53);
}
#endif
vec2 l9_64=sc_TransformUV(l9_54,(int(SC_USE_UV_TRANSFORM_output_0)!=0),output_0Transform);
float l9_65=l9_64.x;
float l9_66=l9_55;
sc_SoftwareWrapLate(l9_65,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_66);
float l9_67=l9_64.y;
float l9_68=l9_66;
sc_SoftwareWrapLate(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_68);
float l9_69=l9_68;
vec3 l9_70=sc_SamplingCoordsViewToGlobal(vec2(l9_65,l9_67),output_0Layout,output_0GetStereoViewIndex());
vec4 l9_71=texture(output_0ArrSC,l9_70,0.0);
vec4 l9_72;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_72=mix(output_0BorderColor,l9_71,vec4(l9_69));
}
#else
{
l9_72=l9_71;
}
#endif
l9_49=l9_72;
}
#else
{
float l9_73=l9_0.x;
sc_SoftwareWrapEarly(l9_73,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x);
float l9_74=l9_73;
float l9_75=l9_0.y;
sc_SoftwareWrapEarly(l9_75,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y);
float l9_76=l9_75;
vec2 l9_77;
float l9_78;
#if (SC_USE_UV_MIN_MAX_output_0)
{
bool l9_79;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_79=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x==3;
}
#else
{
l9_79=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_80=l9_74;
float l9_81=1.0;
sc_ClampUV(l9_80,output_0UvMinMax.x,output_0UvMinMax.z,l9_79,l9_81);
float l9_82=l9_80;
float l9_83=l9_81;
bool l9_84;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_84=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y==3;
}
#else
{
l9_84=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_85=l9_76;
float l9_86=l9_83;
sc_ClampUV(l9_85,output_0UvMinMax.y,output_0UvMinMax.w,l9_84,l9_86);
l9_78=l9_86;
l9_77=vec2(l9_82,l9_85);
}
#else
{
l9_78=1.0;
l9_77=vec2(l9_74,l9_76);
}
#endif
vec2 l9_87=sc_TransformUV(l9_77,(int(SC_USE_UV_TRANSFORM_output_0)!=0),output_0Transform);
float l9_88=l9_87.x;
float l9_89=l9_78;
sc_SoftwareWrapLate(l9_88,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_89);
float l9_90=l9_87.y;
float l9_91=l9_89;
sc_SoftwareWrapLate(l9_90,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_91);
float l9_92=l9_91;
vec3 l9_93=sc_SamplingCoordsViewToGlobal(vec2(l9_88,l9_90),output_0Layout,output_0GetStereoViewIndex());
vec4 l9_94=texture(output_0,l9_93.xy,0.0);
vec4 l9_95;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_95=mix(output_0BorderColor,l9_94,vec4(l9_92));
}
#else
{
l9_95=l9_94;
}
#endif
l9_49=l9_95;
}
#endif
Value1=((vec3(1.0)-((vec4(l9_1.xyz,0.0)*vec4(alphaMax-alphaMin,0.0))+vec4(alphaMin,0.0)).xyz)*l9_48)+((l9_49*(colorMax-colorMin))+colorMin).xyz;
Result=Value1;
}
#else
{
vec2 param_13;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),param_13,Globals);
vec2 l9_96=param_13;
vec4 l9_97;
#if (output_0Layout==2)
{
float l9_98=l9_96.x;
sc_SoftwareWrapEarly(l9_98,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x);
float l9_99=l9_98;
float l9_100=l9_96.y;
sc_SoftwareWrapEarly(l9_100,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y);
float l9_101=l9_100;
vec2 l9_102;
float l9_103;
#if (SC_USE_UV_MIN_MAX_output_0)
{
bool l9_104;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_104=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x==3;
}
#else
{
l9_104=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_105=l9_99;
float l9_106=1.0;
sc_ClampUV(l9_105,output_0UvMinMax.x,output_0UvMinMax.z,l9_104,l9_106);
float l9_107=l9_105;
float l9_108=l9_106;
bool l9_109;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_109=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y==3;
}
#else
{
l9_109=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_110=l9_101;
float l9_111=l9_108;
sc_ClampUV(l9_110,output_0UvMinMax.y,output_0UvMinMax.w,l9_109,l9_111);
l9_103=l9_111;
l9_102=vec2(l9_107,l9_110);
}
#else
{
l9_103=1.0;
l9_102=vec2(l9_99,l9_101);
}
#endif
vec2 l9_112=sc_TransformUV(l9_102,(int(SC_USE_UV_TRANSFORM_output_0)!=0),output_0Transform);
float l9_113=l9_112.x;
float l9_114=l9_103;
sc_SoftwareWrapLate(l9_113,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_114);
float l9_115=l9_112.y;
float l9_116=l9_114;
sc_SoftwareWrapLate(l9_115,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_116);
float l9_117=l9_116;
vec3 l9_118=sc_SamplingCoordsViewToGlobal(vec2(l9_113,l9_115),output_0Layout,output_0GetStereoViewIndex());
vec4 l9_119=texture(output_0ArrSC,l9_118,0.0);
vec4 l9_120;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_120=mix(output_0BorderColor,l9_119,vec4(l9_117));
}
#else
{
l9_120=l9_119;
}
#endif
l9_97=l9_120;
}
#else
{
float l9_121=l9_96.x;
sc_SoftwareWrapEarly(l9_121,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x);
float l9_122=l9_121;
float l9_123=l9_96.y;
sc_SoftwareWrapEarly(l9_123,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y);
float l9_124=l9_123;
vec2 l9_125;
float l9_126;
#if (SC_USE_UV_MIN_MAX_output_0)
{
bool l9_127;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_127=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x==3;
}
#else
{
l9_127=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_128=l9_122;
float l9_129=1.0;
sc_ClampUV(l9_128,output_0UvMinMax.x,output_0UvMinMax.z,l9_127,l9_129);
float l9_130=l9_128;
float l9_131=l9_129;
bool l9_132;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_132=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y==3;
}
#else
{
l9_132=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_133=l9_124;
float l9_134=l9_131;
sc_ClampUV(l9_133,output_0UvMinMax.y,output_0UvMinMax.w,l9_132,l9_134);
l9_126=l9_134;
l9_125=vec2(l9_130,l9_133);
}
#else
{
l9_126=1.0;
l9_125=vec2(l9_122,l9_124);
}
#endif
vec2 l9_135=sc_TransformUV(l9_125,(int(SC_USE_UV_TRANSFORM_output_0)!=0),output_0Transform);
float l9_136=l9_135.x;
float l9_137=l9_126;
sc_SoftwareWrapLate(l9_136,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_137);
float l9_138=l9_135.y;
float l9_139=l9_137;
sc_SoftwareWrapLate(l9_138,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_139);
float l9_140=l9_139;
vec3 l9_141=sc_SamplingCoordsViewToGlobal(vec2(l9_136,l9_138),output_0Layout,output_0GetStereoViewIndex());
vec4 l9_142=texture(output_0,l9_141.xy,0.0);
vec4 l9_143;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_143=mix(output_0BorderColor,l9_142,vec4(l9_140));
}
#else
{
l9_143=l9_142;
}
#endif
l9_97=l9_143;
}
#endif
vec4 l9_144=(l9_97*(colorMax-colorMin))+colorMin;
vec3 param_18;
Node89_If_else(0.0,vec3(0.0),vec3(0.0),param_18,Globals);
Default=(vec3(1.0-l9_144.w)*param_18)+l9_144.xyz;
Result=Default;
}
#endif
}
int maskFacePartsGetStereoViewIndex()
{
int l9_0;
#if (maskFacePartsHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
int Tweak_N158GetStereoViewIndex()
{
int l9_0;
#if (Tweak_N158HasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
void sc_writeFragData0(vec4 col)
{
    col.x+=sc_UniformConstants.x*float(sc_ShaderCacheConstant);
    sc_FragData0=col;
}
vec4 sc_readFragData0_Platform()
{
    return getFragData()[0];
}
int intensityTextureGetStereoViewIndex()
{
int l9_0;
#if (intensityTextureHasSwappedViews)
{
l9_0=1-sc_GetStereoViewIndex();
}
#else
{
l9_0=sc_GetStereoViewIndex();
}
#endif
return l9_0;
}
float transformSingleColor(float original,float intMap,float target)
{
#if ((BLEND_MODE_REALISTIC||BLEND_MODE_FORGRAY)||BLEND_MODE_NOTBRIGHT)
{
return original/pow(1.0-target,intMap);
}
#else
{
#if (BLEND_MODE_DIVISION)
{
return original/(1.0-target);
}
#else
{
#if (BLEND_MODE_BRIGHT)
{
return original/pow(1.0-target,2.0-(2.0*original));
}
#endif
}
#endif
}
#endif
return 0.0;
}
vec3 RGBtoHCV(vec3 rgb)
{
vec4 l9_0;
if (rgb.y<rgb.z)
{
l9_0=vec4(rgb.zy,-1.0,0.66666669);
}
else
{
l9_0=vec4(rgb.yz,0.0,-0.33333334);
}
vec4 l9_1;
if (rgb.x<l9_0.x)
{
l9_1=vec4(l9_0.xyw,rgb.x);
}
else
{
l9_1=vec4(rgb.x,l9_0.yzx);
}
float l9_2=l9_1.x-min(l9_1.w,l9_1.y);
return vec3(abs(((l9_1.w-l9_1.y)/((6.0*l9_2)+1e-07))+l9_1.z),l9_2,l9_1.x);
}
vec3 RGBToHSL(vec3 rgb)
{
vec3 l9_0=RGBtoHCV(rgb);
float l9_1=l9_0.y;
float l9_2=l9_0.z-(l9_1*0.5);
return vec3(l9_0.x,l9_1/((1.0-abs((2.0*l9_2)-1.0))+1e-07),l9_2);
}
vec3 HUEtoRGB(float hue)
{
return clamp(vec3(abs((6.0*hue)-3.0)-1.0,2.0-abs((6.0*hue)-2.0),2.0-abs((6.0*hue)-4.0)),vec3(0.0),vec3(1.0));
}
vec3 HSLToRGB(vec3 hsl)
{
return ((HUEtoRGB(hsl.x)-vec3(0.5))*((1.0-abs((2.0*hsl.z)-1.0))*hsl.y))+vec3(hsl.z);
}
vec3 transformColor(float yValue,vec3 original,vec3 target,float weight,float intMap)
{
#if (BLEND_MODE_INTENSE)
{
return mix(original,HSLToRGB(vec3(target.x,target.y,RGBToHSL(original).z)),vec3(weight));
}
#else
{
return mix(original,clamp(vec3(transformSingleColor(yValue,intMap,target.x),transformSingleColor(yValue,intMap,target.y),transformSingleColor(yValue,intMap,target.z)),vec3(0.0),vec3(1.0)),vec3(weight));
}
#endif
}
vec3 definedBlend(vec3 a,vec3 b)
{
#if (BLEND_MODE_LIGHTEN)
{
return max(a,b);
}
#else
{
#if (BLEND_MODE_DARKEN)
{
return min(a,b);
}
#else
{
#if (BLEND_MODE_DIVIDE)
{
return b/a;
}
#else
{
#if (BLEND_MODE_AVERAGE)
{
return (a+b)*0.5;
}
#else
{
#if (BLEND_MODE_SUBTRACT)
{
return max((a+b)-vec3(1.0),vec3(0.0));
}
#else
{
#if (BLEND_MODE_DIFFERENCE)
{
return abs(a-b);
}
#else
{
#if (BLEND_MODE_NEGATION)
{
return vec3(1.0)-abs((vec3(1.0)-a)-b);
}
#else
{
#if (BLEND_MODE_EXCLUSION)
{
return (a+b)-((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_OVERLAY)
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1;
if (a.y<0.5)
{
l9_1=(2.0*a.y)*b.y;
}
else
{
l9_1=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_2;
if (a.z<0.5)
{
l9_2=(2.0*a.z)*b.z;
}
else
{
l9_2=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return vec3(l9_0,l9_1,l9_2);
}
#else
{
#if (BLEND_MODE_SOFT_LIGHT)
{
return (((vec3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
#else
{
#if (BLEND_MODE_HARD_LIGHT)
{
float l9_3;
if (b.x<0.5)
{
l9_3=(2.0*b.x)*a.x;
}
else
{
l9_3=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_4;
if (b.y<0.5)
{
l9_4=(2.0*b.y)*a.y;
}
else
{
l9_4=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_5;
if (b.z<0.5)
{
l9_5=(2.0*b.z)*a.z;
}
else
{
l9_5=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return vec3(l9_3,l9_4,l9_5);
}
#else
{
#if (BLEND_MODE_COLOR_DODGE)
{
float l9_6;
if (b.x==1.0)
{
l9_6=b.x;
}
else
{
l9_6=min(a.x/(1.0-b.x),1.0);
}
float l9_7;
if (b.y==1.0)
{
l9_7=b.y;
}
else
{
l9_7=min(a.y/(1.0-b.y),1.0);
}
float l9_8;
if (b.z==1.0)
{
l9_8=b.z;
}
else
{
l9_8=min(a.z/(1.0-b.z),1.0);
}
return vec3(l9_6,l9_7,l9_8);
}
#else
{
#if (BLEND_MODE_COLOR_BURN)
{
float l9_9;
if (b.x==0.0)
{
l9_9=b.x;
}
else
{
l9_9=max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_10;
if (b.y==0.0)
{
l9_10=b.y;
}
else
{
l9_10=max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_11;
if (b.z==0.0)
{
l9_11=b.z;
}
else
{
l9_11=max(1.0-((1.0-a.z)/b.z),0.0);
}
return vec3(l9_9,l9_10,l9_11);
}
#else
{
#if (BLEND_MODE_LINEAR_LIGHT)
{
float l9_12;
if (b.x<0.5)
{
l9_12=max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_12=min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_13;
if (b.y<0.5)
{
l9_13=max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_13=min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_14;
if (b.z<0.5)
{
l9_14=max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_14=min(a.z+(2.0*(b.z-0.5)),1.0);
}
return vec3(l9_12,l9_13,l9_14);
}
#else
{
#if (BLEND_MODE_VIVID_LIGHT)
{
float l9_15;
if (b.x<0.5)
{
float l9_16;
if ((2.0*b.x)==0.0)
{
l9_16=2.0*b.x;
}
else
{
l9_16=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_15=l9_16;
}
else
{
float l9_17;
if ((2.0*(b.x-0.5))==1.0)
{
l9_17=2.0*(b.x-0.5);
}
else
{
l9_17=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_15=l9_17;
}
float l9_18;
if (b.y<0.5)
{
float l9_19;
if ((2.0*b.y)==0.0)
{
l9_19=2.0*b.y;
}
else
{
l9_19=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_18=l9_19;
}
else
{
float l9_20;
if ((2.0*(b.y-0.5))==1.0)
{
l9_20=2.0*(b.y-0.5);
}
else
{
l9_20=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_18=l9_20;
}
float l9_21;
if (b.z<0.5)
{
float l9_22;
if ((2.0*b.z)==0.0)
{
l9_22=2.0*b.z;
}
else
{
l9_22=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_21=l9_22;
}
else
{
float l9_23;
if ((2.0*(b.z-0.5))==1.0)
{
l9_23=2.0*(b.z-0.5);
}
else
{
l9_23=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_21=l9_23;
}
return vec3(l9_15,l9_18,l9_21);
}
#else
{
#if (BLEND_MODE_PIN_LIGHT)
{
float l9_24;
if (b.x<0.5)
{
l9_24=min(a.x,2.0*b.x);
}
else
{
l9_24=max(a.x,2.0*(b.x-0.5));
}
float l9_25;
if (b.y<0.5)
{
l9_25=min(a.y,2.0*b.y);
}
else
{
l9_25=max(a.y,2.0*(b.y-0.5));
}
float l9_26;
if (b.z<0.5)
{
l9_26=min(a.z,2.0*b.z);
}
else
{
l9_26=max(a.z,2.0*(b.z-0.5));
}
return vec3(l9_24,l9_25,l9_26);
}
#else
{
#if (BLEND_MODE_HARD_MIX)
{
float l9_27;
if (b.x<0.5)
{
float l9_28;
if ((2.0*b.x)==0.0)
{
l9_28=2.0*b.x;
}
else
{
l9_28=max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_27=l9_28;
}
else
{
float l9_29;
if ((2.0*(b.x-0.5))==1.0)
{
l9_29=2.0*(b.x-0.5);
}
else
{
l9_29=min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_27=l9_29;
}
bool l9_30=l9_27<0.5;
float l9_31;
if (b.y<0.5)
{
float l9_32;
if ((2.0*b.y)==0.0)
{
l9_32=2.0*b.y;
}
else
{
l9_32=max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_31=l9_32;
}
else
{
float l9_33;
if ((2.0*(b.y-0.5))==1.0)
{
l9_33=2.0*(b.y-0.5);
}
else
{
l9_33=min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_31=l9_33;
}
bool l9_34=l9_31<0.5;
float l9_35;
if (b.z<0.5)
{
float l9_36;
if ((2.0*b.z)==0.0)
{
l9_36=2.0*b.z;
}
else
{
l9_36=max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_35=l9_36;
}
else
{
float l9_37;
if ((2.0*(b.z-0.5))==1.0)
{
l9_37=2.0*(b.z-0.5);
}
else
{
l9_37=min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_35=l9_37;
}
return vec3(l9_30 ? 0.0 : 1.0,l9_34 ? 0.0 : 1.0,(l9_35<0.5) ? 0.0 : 1.0);
}
#else
{
#if (BLEND_MODE_HARD_REFLECT)
{
float l9_38;
if (b.x==1.0)
{
l9_38=b.x;
}
else
{
l9_38=min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_39;
if (b.y==1.0)
{
l9_39=b.y;
}
else
{
l9_39=min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_40;
if (b.z==1.0)
{
l9_40=b.z;
}
else
{
l9_40=min((a.z*a.z)/(1.0-b.z),1.0);
}
return vec3(l9_38,l9_39,l9_40);
}
#else
{
#if (BLEND_MODE_HARD_GLOW)
{
float l9_41;
if (a.x==1.0)
{
l9_41=a.x;
}
else
{
l9_41=min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_42;
if (a.y==1.0)
{
l9_42=a.y;
}
else
{
l9_42=min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_43;
if (a.z==1.0)
{
l9_43=a.z;
}
else
{
l9_43=min((b.z*b.z)/(1.0-a.z),1.0);
}
return vec3(l9_41,l9_42,l9_43);
}
#else
{
#if (BLEND_MODE_HARD_PHOENIX)
{
return (min(a,b)-max(a,b))+vec3(1.0);
}
#else
{
#if (BLEND_MODE_HUE)
{
return HSLToRGB(vec3(RGBToHSL(b).x,RGBToHSL(a).yz));
}
#else
{
#if (BLEND_MODE_SATURATION)
{
vec3 l9_44=RGBToHSL(a);
return HSLToRGB(vec3(l9_44.x,RGBToHSL(b).y,l9_44.z));
}
#else
{
#if (BLEND_MODE_COLOR)
{
return HSLToRGB(vec3(RGBToHSL(b).xy,RGBToHSL(a).z));
}
#else
{
#if (BLEND_MODE_LUMINOSITY)
{
return HSLToRGB(vec3(RGBToHSL(a).xy,RGBToHSL(b).z));
}
#else
{
vec3 l9_45=a;
vec3 l9_46=b;
float l9_47=((0.29899999*l9_45.x)+(0.58700001*l9_45.y))+(0.114*l9_45.z);
float l9_48=pow(l9_47,1.0/correctedIntensity);
vec4 l9_49;
#if (intensityTextureLayout==2)
{
float l9_50=l9_48;
sc_SoftwareWrapEarly(l9_50,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_51=l9_50;
float l9_52=0.5;
sc_SoftwareWrapEarly(l9_52,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_53=l9_52;
vec2 l9_54;
float l9_55;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_56;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_56=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_56=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_57=l9_51;
float l9_58=1.0;
sc_ClampUV(l9_57,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_56,l9_58);
float l9_59=l9_57;
float l9_60=l9_58;
bool l9_61;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_61=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_61=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_62=l9_53;
float l9_63=l9_60;
sc_ClampUV(l9_62,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_61,l9_63);
l9_55=l9_63;
l9_54=vec2(l9_59,l9_62);
}
#else
{
l9_55=1.0;
l9_54=vec2(l9_51,l9_53);
}
#endif
vec2 l9_64=sc_TransformUV(l9_54,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_65=l9_64.x;
float l9_66=l9_55;
sc_SoftwareWrapLate(l9_65,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0)),l9_66);
float l9_67=l9_64.y;
float l9_68=l9_66;
sc_SoftwareWrapLate(l9_67,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0)),l9_68);
float l9_69=l9_68;
vec3 l9_70=sc_SamplingCoordsViewToGlobal(vec2(l9_65,l9_67),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_71=texture(intensityTextureArrSC,l9_70,0.0);
vec4 l9_72;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_72=mix(intensityTextureBorderColor,l9_71,vec4(l9_69));
}
#else
{
l9_72=l9_71;
}
#endif
l9_49=l9_72;
}
#else
{
float l9_73=l9_48;
sc_SoftwareWrapEarly(l9_73,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x);
float l9_74=l9_73;
float l9_75=0.5;
sc_SoftwareWrapEarly(l9_75,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y);
float l9_76=l9_75;
vec2 l9_77;
float l9_78;
#if (SC_USE_UV_MIN_MAX_intensityTexture)
{
bool l9_79;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_79=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x==3;
}
#else
{
l9_79=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_80=l9_74;
float l9_81=1.0;
sc_ClampUV(l9_80,intensityTextureUvMinMax.x,intensityTextureUvMinMax.z,l9_79,l9_81);
float l9_82=l9_80;
float l9_83=l9_81;
bool l9_84;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_84=ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y==3;
}
#else
{
l9_84=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0);
}
#endif
float l9_85=l9_76;
float l9_86=l9_83;
sc_ClampUV(l9_85,intensityTextureUvMinMax.y,intensityTextureUvMinMax.w,l9_84,l9_86);
l9_78=l9_86;
l9_77=vec2(l9_82,l9_85);
}
#else
{
l9_78=1.0;
l9_77=vec2(l9_74,l9_76);
}
#endif
vec2 l9_87=sc_TransformUV(l9_77,(int(SC_USE_UV_TRANSFORM_intensityTexture)!=0),intensityTextureTransform);
float l9_88=l9_87.x;
float l9_89=l9_78;
sc_SoftwareWrapLate(l9_88,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).x,(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0)),l9_89);
float l9_90=l9_87.y;
float l9_91=l9_89;
sc_SoftwareWrapLate(l9_90,ivec2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture,SC_SOFTWARE_WRAP_MODE_V_intensityTexture).y,(int(SC_USE_CLAMP_TO_BORDER_intensityTexture)!=0)&&(!(int(SC_USE_UV_MIN_MAX_intensityTexture)!=0)),l9_91);
float l9_92=l9_91;
vec3 l9_93=sc_SamplingCoordsViewToGlobal(vec2(l9_88,l9_90),intensityTextureLayout,intensityTextureGetStereoViewIndex());
vec4 l9_94=texture(intensityTexture,l9_93.xy,0.0);
vec4 l9_95;
#if (SC_USE_CLAMP_TO_BORDER_intensityTexture)
{
l9_95=mix(intensityTextureBorderColor,l9_94,vec4(l9_92));
}
#else
{
l9_95=l9_94;
}
#endif
l9_49=l9_95;
}
#endif
float l9_96=((((l9_49.x*256.0)+l9_49.y)+(l9_49.z/256.0))/257.00391)*16.0;
float l9_97;
#if (BLEND_MODE_FORGRAY)
{
l9_97=max(l9_96,1.0);
}
#else
{
l9_97=l9_96;
}
#endif
float l9_98;
#if (BLEND_MODE_NOTBRIGHT)
{
l9_98=min(l9_97,1.0);
}
#else
{
l9_98=l9_97;
}
#endif
return transformColor(l9_47,l9_45,l9_46,1.0,l9_98);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
vec4 outputMotionVectorsIfNeeded(vec3 surfacePosWorldSpace,vec4 finalColor)
{
#if (sc_MotionVectorsPass)
{
vec4 l9_0=vec4(surfacePosWorldSpace,1.0);
vec4 l9_1=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*l9_0;
vec4 l9_2=((sc_PrevFrameViewProjectionMatrixArray[sc_GetStereoViewIndex()]*sc_PrevFrameModelMatrix)*sc_ModelMatrixInverse)*l9_0;
vec2 l9_3=((l9_1.xy/vec2(l9_1.w)).xy-(l9_2.xy/vec2(l9_2.w)).xy)*0.5;
float l9_4=floor(((l9_3.x*5.0)+0.5)*65535.0);
float l9_5=floor(l9_4*0.00390625);
float l9_6=floor(((l9_3.y*5.0)+0.5)*65535.0);
float l9_7=floor(l9_6*0.00390625);
return vec4(l9_5/255.0,(l9_4-(l9_5*256.0))/255.0,l9_7/255.0,(l9_6-(l9_7*256.0))/255.0);
}
#else
{
return finalColor;
}
#endif
}
float getFrontLayerZTestEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 5e-07;
}
#else
{
return 5.0000001e-08;
}
#endif
}
void unpackValues(float channel,int passIndex,inout int values[8])
{
#if (sc_OITCompositingPass)
{
channel=floor((channel*255.0)+0.5);
int l9_0=((passIndex+1)*4)-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_0>=(passIndex*4))
{
values[l9_0]=(values[l9_0]*4)+int(floor(mod(channel,4.0)));
channel=floor(channel/4.0);
l9_0--;
continue;
}
else
{
break;
}
}
}
#endif
}
float getDepthOrderingEpsilon()
{
#if (sc_SkinBonesCount>0)
{
return 0.001;
}
#else
{
return 0.0;
}
#endif
}
int encodeDepth(float depth,vec2 depthBounds)
{
float l9_0=(1.0-depthBounds.x)*1000.0;
return int(clamp((depth-l9_0)/((depthBounds.y*1000.0)-l9_0),0.0,1.0)*65535.0);
}
float viewSpaceDepth()
{
#if (UseViewSpaceDepthVariant&&((sc_OITDepthGatherPass||sc_OITCompositingPass)||sc_OITDepthBoundsPass))
{
return varViewSpaceDepth;
}
#else
{
return sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][3].z/(sc_ProjectionMatrixArray[sc_GetStereoViewIndex()][2].z+((gl_FragCoord.z*2.0)-1.0));
}
#endif
}
float packValue(inout int value)
{
#if (sc_OITDepthGatherPass)
{
int l9_0=value;
value/=4;
return floor(floor(mod(float(l9_0),4.0))*64.0)/255.0;
}
#else
{
return 0.0;
}
#endif
}
void sc_writeFragData1(vec4 col)
{
#if sc_FragDataCount>=2
    sc_FragData1=col;
#endif
}
void sc_writeFragData2(vec4 col)
{
#if sc_FragDataCount>=3
    sc_FragData2=col;
#endif
}
void main()
{
#if (sc_DepthOnly)
{
return;
}
#endif
#if ((sc_StereoRenderingMode==1)&&(sc_StereoRendering_IsClipDistanceEnabled==0))
{
if (varClipDistance<0.0)
{
discard;
}
}
#endif
bool l9_0=overrideTimeEnabled==1;
float l9_1;
if (l9_0)
{
l9_1=overrideTimeElapsed;
}
else
{
l9_1=sc_Time.x;
}
float l9_2;
if (l9_0)
{
l9_2=overrideTimeDelta;
}
else
{
l9_2=sc_Time.y;
}
vec2 l9_3;
vec2 l9_4;
if (isProxyMode)
{
RayHitPayload l9_5=GetHitData(ivec2(gl_FragCoord.xy));
if (noEarlyZ)
{
if (l9_5.id.x!=uint(instance_id))
{
return;
}
}
vec4 l9_6=sc_ViewProjectionMatrixArray[sc_GetStereoViewIndex()]*vec4(l9_5.positionWS,1.0);
l9_4=l9_5.uv0;
l9_3=((l9_6.xy/vec2(l9_6.w))*0.5)+vec2(0.5);
}
else
{
l9_4=varPackedTex.xy;
l9_3=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
}
vec4 l9_7;
#if (inputTexLayout==2)
{
float l9_8=l9_3.x;
sc_SoftwareWrapEarly(l9_8,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_9=l9_8;
float l9_10=l9_3.y;
sc_SoftwareWrapEarly(l9_10,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_11=l9_10;
vec2 l9_12;
float l9_13;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_14;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_14=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_14=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_15=l9_9;
float l9_16=1.0;
sc_ClampUV(l9_15,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_14,l9_16);
float l9_17=l9_15;
float l9_18=l9_16;
bool l9_19;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_19=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_19=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_20=l9_11;
float l9_21=l9_18;
sc_ClampUV(l9_20,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_19,l9_21);
l9_13=l9_21;
l9_12=vec2(l9_17,l9_20);
}
#else
{
l9_13=1.0;
l9_12=vec2(l9_9,l9_11);
}
#endif
vec2 l9_22=sc_TransformUV(l9_12,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_23=l9_22.x;
float l9_24=l9_13;
sc_SoftwareWrapLate(l9_23,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_24);
float l9_25=l9_22.y;
float l9_26=l9_24;
sc_SoftwareWrapLate(l9_25,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_26);
float l9_27=l9_26;
vec3 l9_28=sc_SamplingCoordsViewToGlobal(vec2(l9_23,l9_25),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_29=texture(inputTexArrSC,l9_28,0.0);
vec4 l9_30;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_30=mix(inputTexBorderColor,l9_29,vec4(l9_27));
}
#else
{
l9_30=l9_29;
}
#endif
l9_7=l9_30;
}
#else
{
float l9_31=l9_3.x;
sc_SoftwareWrapEarly(l9_31,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x);
float l9_32=l9_31;
float l9_33=l9_3.y;
sc_SoftwareWrapEarly(l9_33,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y);
float l9_34=l9_33;
vec2 l9_35;
float l9_36;
#if (SC_USE_UV_MIN_MAX_inputTex)
{
bool l9_37;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_37=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x==3;
}
#else
{
l9_37=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_38=l9_32;
float l9_39=1.0;
sc_ClampUV(l9_38,inputTexUvMinMax.x,inputTexUvMinMax.z,l9_37,l9_39);
float l9_40=l9_38;
float l9_41=l9_39;
bool l9_42;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_42=ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y==3;
}
#else
{
l9_42=(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0);
}
#endif
float l9_43=l9_34;
float l9_44=l9_41;
sc_ClampUV(l9_43,inputTexUvMinMax.y,inputTexUvMinMax.w,l9_42,l9_44);
l9_36=l9_44;
l9_35=vec2(l9_40,l9_43);
}
#else
{
l9_36=1.0;
l9_35=vec2(l9_32,l9_34);
}
#endif
vec2 l9_45=sc_TransformUV(l9_35,(int(SC_USE_UV_TRANSFORM_inputTex)!=0),inputTexTransform);
float l9_46=l9_45.x;
float l9_47=l9_36;
sc_SoftwareWrapLate(l9_46,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).x,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_47);
float l9_48=l9_45.y;
float l9_49=l9_47;
sc_SoftwareWrapLate(l9_48,ivec2(SC_SOFTWARE_WRAP_MODE_U_inputTex,SC_SOFTWARE_WRAP_MODE_V_inputTex).y,(int(SC_USE_CLAMP_TO_BORDER_inputTex)!=0)&&(!(int(SC_USE_UV_MIN_MAX_inputTex)!=0)),l9_49);
float l9_50=l9_49;
vec3 l9_51=sc_SamplingCoordsViewToGlobal(vec2(l9_46,l9_48),inputTexLayout,inputTexGetStereoViewIndex());
vec4 l9_52=texture(inputTex,l9_51.xy,0.0);
vec4 l9_53;
#if (SC_USE_CLAMP_TO_BORDER_inputTex)
{
l9_53=mix(inputTexBorderColor,l9_52,vec4(l9_50));
}
#else
{
l9_53=l9_52;
}
#endif
l9_7=l9_53;
}
#endif
ssGlobals l9_54=ssGlobals(l9_1,l9_2,0.0,l9_3,l9_4);
vec3 l9_55;
#if (Tweak_N10)
{
vec3 l9_56;
Node32_If_else(0.0,vec3(0.0),vec3(0.0),l9_56,l9_54);
l9_55=l9_56;
}
#else
{
vec2 l9_57;
Node1_If_else(0.0,vec2(0.0),vec2(0.0),l9_57,l9_54);
vec2 l9_58=l9_57;
vec4 l9_59;
#if (output_0Layout==2)
{
float l9_60=l9_58.x;
sc_SoftwareWrapEarly(l9_60,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x);
float l9_61=l9_60;
float l9_62=l9_58.y;
sc_SoftwareWrapEarly(l9_62,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y);
float l9_63=l9_62;
vec2 l9_64;
float l9_65;
#if (SC_USE_UV_MIN_MAX_output_0)
{
bool l9_66;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_66=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x==3;
}
#else
{
l9_66=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_67=l9_61;
float l9_68=1.0;
sc_ClampUV(l9_67,output_0UvMinMax.x,output_0UvMinMax.z,l9_66,l9_68);
float l9_69=l9_67;
float l9_70=l9_68;
bool l9_71;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_71=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y==3;
}
#else
{
l9_71=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_72=l9_63;
float l9_73=l9_70;
sc_ClampUV(l9_72,output_0UvMinMax.y,output_0UvMinMax.w,l9_71,l9_73);
l9_65=l9_73;
l9_64=vec2(l9_69,l9_72);
}
#else
{
l9_65=1.0;
l9_64=vec2(l9_61,l9_63);
}
#endif
vec2 l9_74=sc_TransformUV(l9_64,(int(SC_USE_UV_TRANSFORM_output_0)!=0),output_0Transform);
float l9_75=l9_74.x;
float l9_76=l9_65;
sc_SoftwareWrapLate(l9_75,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_76);
float l9_77=l9_74.y;
float l9_78=l9_76;
sc_SoftwareWrapLate(l9_77,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_78);
float l9_79=l9_78;
vec3 l9_80=sc_SamplingCoordsViewToGlobal(vec2(l9_75,l9_77),output_0Layout,output_0GetStereoViewIndex());
vec4 l9_81=texture(output_0ArrSC,l9_80,0.0);
vec4 l9_82;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_82=mix(output_0BorderColor,l9_81,vec4(l9_79));
}
#else
{
l9_82=l9_81;
}
#endif
l9_59=l9_82;
}
#else
{
float l9_83=l9_58.x;
sc_SoftwareWrapEarly(l9_83,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x);
float l9_84=l9_83;
float l9_85=l9_58.y;
sc_SoftwareWrapEarly(l9_85,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y);
float l9_86=l9_85;
vec2 l9_87;
float l9_88;
#if (SC_USE_UV_MIN_MAX_output_0)
{
bool l9_89;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_89=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x==3;
}
#else
{
l9_89=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_90=l9_84;
float l9_91=1.0;
sc_ClampUV(l9_90,output_0UvMinMax.x,output_0UvMinMax.z,l9_89,l9_91);
float l9_92=l9_90;
float l9_93=l9_91;
bool l9_94;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_94=ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y==3;
}
#else
{
l9_94=(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0);
}
#endif
float l9_95=l9_86;
float l9_96=l9_93;
sc_ClampUV(l9_95,output_0UvMinMax.y,output_0UvMinMax.w,l9_94,l9_96);
l9_88=l9_96;
l9_87=vec2(l9_92,l9_95);
}
#else
{
l9_88=1.0;
l9_87=vec2(l9_84,l9_86);
}
#endif
vec2 l9_97=sc_TransformUV(l9_87,(int(SC_USE_UV_TRANSFORM_output_0)!=0),output_0Transform);
float l9_98=l9_97.x;
float l9_99=l9_88;
sc_SoftwareWrapLate(l9_98,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).x,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_99);
float l9_100=l9_97.y;
float l9_101=l9_99;
sc_SoftwareWrapLate(l9_100,ivec2(SC_SOFTWARE_WRAP_MODE_U_output_0,SC_SOFTWARE_WRAP_MODE_V_output_0).y,(int(SC_USE_CLAMP_TO_BORDER_output_0)!=0)&&(!(int(SC_USE_UV_MIN_MAX_output_0)!=0)),l9_101);
float l9_102=l9_101;
vec3 l9_103=sc_SamplingCoordsViewToGlobal(vec2(l9_98,l9_100),output_0Layout,output_0GetStereoViewIndex());
vec4 l9_104=texture(output_0,l9_103.xy,0.0);
vec4 l9_105;
#if (SC_USE_CLAMP_TO_BORDER_output_0)
{
l9_105=mix(output_0BorderColor,l9_104,vec4(l9_102));
}
#else
{
l9_105=l9_104;
}
#endif
l9_59=l9_105;
}
#endif
l9_55=((l9_59*(colorMax-colorMin))+colorMin).xyz;
}
#endif
vec4 l9_106=vec4(l9_55.x,l9_55.y,l9_55.z,vec4(0.0).w);
l9_106.w=Port_Value2_N017;
vec4 l9_107=mix(l9_7,l9_106,vec4(intensity));
vec4 l9_108;
#if (maskFacePartsLayout==2)
{
float l9_109=l9_3.x;
sc_SoftwareWrapEarly(l9_109,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).x);
float l9_110=l9_109;
float l9_111=l9_3.y;
sc_SoftwareWrapEarly(l9_111,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).y);
float l9_112=l9_111;
vec2 l9_113;
float l9_114;
#if (SC_USE_UV_MIN_MAX_maskFaceParts)
{
bool l9_115;
#if (SC_USE_CLAMP_TO_BORDER_maskFaceParts)
{
l9_115=ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).x==3;
}
#else
{
l9_115=(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0);
}
#endif
float l9_116=l9_110;
float l9_117=1.0;
sc_ClampUV(l9_116,maskFacePartsUvMinMax.x,maskFacePartsUvMinMax.z,l9_115,l9_117);
float l9_118=l9_116;
float l9_119=l9_117;
bool l9_120;
#if (SC_USE_CLAMP_TO_BORDER_maskFaceParts)
{
l9_120=ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).y==3;
}
#else
{
l9_120=(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0);
}
#endif
float l9_121=l9_112;
float l9_122=l9_119;
sc_ClampUV(l9_121,maskFacePartsUvMinMax.y,maskFacePartsUvMinMax.w,l9_120,l9_122);
l9_114=l9_122;
l9_113=vec2(l9_118,l9_121);
}
#else
{
l9_114=1.0;
l9_113=vec2(l9_110,l9_112);
}
#endif
vec2 l9_123=sc_TransformUV(l9_113,(int(SC_USE_UV_TRANSFORM_maskFaceParts)!=0),maskFacePartsTransform);
float l9_124=l9_123.x;
float l9_125=l9_114;
sc_SoftwareWrapLate(l9_124,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).x,(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0)&&(!(int(SC_USE_UV_MIN_MAX_maskFaceParts)!=0)),l9_125);
float l9_126=l9_123.y;
float l9_127=l9_125;
sc_SoftwareWrapLate(l9_126,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).y,(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0)&&(!(int(SC_USE_UV_MIN_MAX_maskFaceParts)!=0)),l9_127);
float l9_128=l9_127;
vec3 l9_129=sc_SamplingCoordsViewToGlobal(vec2(l9_124,l9_126),maskFacePartsLayout,maskFacePartsGetStereoViewIndex());
vec4 l9_130=texture(maskFacePartsArrSC,l9_129,0.0);
vec4 l9_131;
#if (SC_USE_CLAMP_TO_BORDER_maskFaceParts)
{
l9_131=mix(maskFacePartsBorderColor,l9_130,vec4(l9_128));
}
#else
{
l9_131=l9_130;
}
#endif
l9_108=l9_131;
}
#else
{
float l9_132=l9_3.x;
sc_SoftwareWrapEarly(l9_132,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).x);
float l9_133=l9_132;
float l9_134=l9_3.y;
sc_SoftwareWrapEarly(l9_134,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).y);
float l9_135=l9_134;
vec2 l9_136;
float l9_137;
#if (SC_USE_UV_MIN_MAX_maskFaceParts)
{
bool l9_138;
#if (SC_USE_CLAMP_TO_BORDER_maskFaceParts)
{
l9_138=ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).x==3;
}
#else
{
l9_138=(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0);
}
#endif
float l9_139=l9_133;
float l9_140=1.0;
sc_ClampUV(l9_139,maskFacePartsUvMinMax.x,maskFacePartsUvMinMax.z,l9_138,l9_140);
float l9_141=l9_139;
float l9_142=l9_140;
bool l9_143;
#if (SC_USE_CLAMP_TO_BORDER_maskFaceParts)
{
l9_143=ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).y==3;
}
#else
{
l9_143=(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0);
}
#endif
float l9_144=l9_135;
float l9_145=l9_142;
sc_ClampUV(l9_144,maskFacePartsUvMinMax.y,maskFacePartsUvMinMax.w,l9_143,l9_145);
l9_137=l9_145;
l9_136=vec2(l9_141,l9_144);
}
#else
{
l9_137=1.0;
l9_136=vec2(l9_133,l9_135);
}
#endif
vec2 l9_146=sc_TransformUV(l9_136,(int(SC_USE_UV_TRANSFORM_maskFaceParts)!=0),maskFacePartsTransform);
float l9_147=l9_146.x;
float l9_148=l9_137;
sc_SoftwareWrapLate(l9_147,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).x,(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0)&&(!(int(SC_USE_UV_MIN_MAX_maskFaceParts)!=0)),l9_148);
float l9_149=l9_146.y;
float l9_150=l9_148;
sc_SoftwareWrapLate(l9_149,ivec2(SC_SOFTWARE_WRAP_MODE_U_maskFaceParts,SC_SOFTWARE_WRAP_MODE_V_maskFaceParts).y,(int(SC_USE_CLAMP_TO_BORDER_maskFaceParts)!=0)&&(!(int(SC_USE_UV_MIN_MAX_maskFaceParts)!=0)),l9_150);
float l9_151=l9_150;
vec3 l9_152=sc_SamplingCoordsViewToGlobal(vec2(l9_147,l9_149),maskFacePartsLayout,maskFacePartsGetStereoViewIndex());
vec4 l9_153=texture(maskFaceParts,l9_152.xy,0.0);
vec4 l9_154;
#if (SC_USE_CLAMP_TO_BORDER_maskFaceParts)
{
l9_154=mix(maskFacePartsBorderColor,l9_153,vec4(l9_151));
}
#else
{
l9_154=l9_153;
}
#endif
l9_108=l9_154;
}
#endif
vec4 l9_155=mix(l9_7,l9_107,vec4(l9_108.x));
vec4 l9_156;
#if (Tweak_N158Layout==2)
{
float l9_157=l9_4.x;
sc_SoftwareWrapEarly(l9_157,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).x);
float l9_158=l9_157;
float l9_159=l9_4.y;
sc_SoftwareWrapEarly(l9_159,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).y);
float l9_160=l9_159;
vec2 l9_161;
float l9_162;
#if (SC_USE_UV_MIN_MAX_Tweak_N158)
{
bool l9_163;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N158)
{
l9_163=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).x==3;
}
#else
{
l9_163=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0);
}
#endif
float l9_164=l9_158;
float l9_165=1.0;
sc_ClampUV(l9_164,Tweak_N158UvMinMax.x,Tweak_N158UvMinMax.z,l9_163,l9_165);
float l9_166=l9_164;
float l9_167=l9_165;
bool l9_168;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N158)
{
l9_168=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).y==3;
}
#else
{
l9_168=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0);
}
#endif
float l9_169=l9_160;
float l9_170=l9_167;
sc_ClampUV(l9_169,Tweak_N158UvMinMax.y,Tweak_N158UvMinMax.w,l9_168,l9_170);
l9_162=l9_170;
l9_161=vec2(l9_166,l9_169);
}
#else
{
l9_162=1.0;
l9_161=vec2(l9_158,l9_160);
}
#endif
vec2 l9_171=sc_TransformUV(l9_161,(int(SC_USE_UV_TRANSFORM_Tweak_N158)!=0),Tweak_N158Transform);
float l9_172=l9_171.x;
float l9_173=l9_162;
sc_SoftwareWrapLate(l9_172,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).x,(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N158)!=0)),l9_173);
float l9_174=l9_171.y;
float l9_175=l9_173;
sc_SoftwareWrapLate(l9_174,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).y,(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N158)!=0)),l9_175);
float l9_176=l9_175;
vec3 l9_177=sc_SamplingCoordsViewToGlobal(vec2(l9_172,l9_174),Tweak_N158Layout,Tweak_N158GetStereoViewIndex());
vec4 l9_178=texture(Tweak_N158ArrSC,l9_177,0.0);
vec4 l9_179;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N158)
{
l9_179=mix(Tweak_N158BorderColor,l9_178,vec4(l9_176));
}
#else
{
l9_179=l9_178;
}
#endif
l9_156=l9_179;
}
#else
{
float l9_180=l9_4.x;
sc_SoftwareWrapEarly(l9_180,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).x);
float l9_181=l9_180;
float l9_182=l9_4.y;
sc_SoftwareWrapEarly(l9_182,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).y);
float l9_183=l9_182;
vec2 l9_184;
float l9_185;
#if (SC_USE_UV_MIN_MAX_Tweak_N158)
{
bool l9_186;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N158)
{
l9_186=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).x==3;
}
#else
{
l9_186=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0);
}
#endif
float l9_187=l9_181;
float l9_188=1.0;
sc_ClampUV(l9_187,Tweak_N158UvMinMax.x,Tweak_N158UvMinMax.z,l9_186,l9_188);
float l9_189=l9_187;
float l9_190=l9_188;
bool l9_191;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N158)
{
l9_191=ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).y==3;
}
#else
{
l9_191=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0);
}
#endif
float l9_192=l9_183;
float l9_193=l9_190;
sc_ClampUV(l9_192,Tweak_N158UvMinMax.y,Tweak_N158UvMinMax.w,l9_191,l9_193);
l9_185=l9_193;
l9_184=vec2(l9_189,l9_192);
}
#else
{
l9_185=1.0;
l9_184=vec2(l9_181,l9_183);
}
#endif
vec2 l9_194=sc_TransformUV(l9_184,(int(SC_USE_UV_TRANSFORM_Tweak_N158)!=0),Tweak_N158Transform);
float l9_195=l9_194.x;
float l9_196=l9_185;
sc_SoftwareWrapLate(l9_195,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).x,(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N158)!=0)),l9_196);
float l9_197=l9_194.y;
float l9_198=l9_196;
sc_SoftwareWrapLate(l9_197,ivec2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N158,SC_SOFTWARE_WRAP_MODE_V_Tweak_N158).y,(int(SC_USE_CLAMP_TO_BORDER_Tweak_N158)!=0)&&(!(int(SC_USE_UV_MIN_MAX_Tweak_N158)!=0)),l9_198);
float l9_199=l9_198;
vec3 l9_200=sc_SamplingCoordsViewToGlobal(vec2(l9_195,l9_197),Tweak_N158Layout,Tweak_N158GetStereoViewIndex());
vec4 l9_201=texture(Tweak_N158,l9_200.xy,0.0);
vec4 l9_202;
#if (SC_USE_CLAMP_TO_BORDER_Tweak_N158)
{
l9_202=mix(Tweak_N158BorderColor,l9_201,vec4(l9_199));
}
#else
{
l9_202=l9_201;
}
#endif
l9_156=l9_202;
}
#endif
vec4 l9_203=vec4(l9_108.z)*l9_156;
vec4 l9_204=mix(l9_7,mix(l9_7,l9_107,l9_203),vec4(darkenAlpha));
vec3 l9_205=vec3(l9_203.x);
vec3 l9_206=mix(l9_155.xyz,vec3(min(l9_155.x,l9_204.x),min(l9_155.y,l9_204.y),min(l9_155.z,l9_204.z)).xyz,l9_205);
float l9_207=l9_155.w;
vec4 l9_208=vec4(l9_206.x,l9_206.y,l9_206.z,vec4(0.0).w);
l9_208.w=l9_207;
vec3 l9_209=mix(l9_208.xyz,vec3(max(l9_206.x,l9_107.x),max(l9_206.y,l9_107.y),max(l9_206.z,l9_107.z)).xyz,l9_205);
vec4 l9_210=vec4(l9_209.x,l9_209.y,l9_209.z,vec4(0.0).w);
l9_210.w=l9_207;
vec4 l9_211=mix(l9_208,l9_210,vec4(lightenAlpha));
float l9_212=l9_211.w;
#if (sc_BlendMode_AlphaTest)
{
if (l9_212<alphaTestThreshold)
{
discard;
}
}
#endif
#if (ENABLE_STIPPLE_PATTERN_TEST)
{
if (l9_212<((mod(dot(floor(mod(gl_FragCoord.xy,vec2(4.0))),vec2(4.0,1.0))*9.0,16.0)+1.0)/17.0))
{
discard;
}
}
#endif
if (isProxyMode)
{
vec4 l9_213;
#if (sc_ProxyAlphaOne)
{
vec4 l9_214=l9_211;
l9_214.w=1.0;
l9_213=l9_214;
}
#else
{
l9_213=l9_211;
}
#endif
sc_writeFragData0(max(l9_213,vec4(0.0)));
return;
}
vec4 l9_215;
#if (sc_ProjectiveShadowsCaster)
{
float l9_216;
#if (((sc_BlendMode_Normal||sc_BlendMode_AlphaToCoverage)||sc_BlendMode_PremultipliedAlphaHardware)||sc_BlendMode_PremultipliedAlphaAuto)
{
l9_216=l9_212;
}
#else
{
float l9_217;
#if (sc_BlendMode_PremultipliedAlpha)
{
l9_217=clamp(l9_212*2.0,0.0,1.0);
}
#else
{
float l9_218;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_218=clamp(dot(l9_211.xyz,vec3(l9_212)),0.0,1.0);
}
#else
{
float l9_219;
#if (sc_BlendMode_AlphaTest)
{
l9_219=1.0;
}
#else
{
float l9_220;
#if (sc_BlendMode_Multiply)
{
l9_220=(1.0-dot(l9_211.xyz,vec3(0.33333001)))*l9_212;
}
#else
{
float l9_221;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_221=(1.0-clamp(dot(l9_211.xyz,vec3(1.0)),0.0,1.0))*l9_212;
}
#else
{
float l9_222;
#if (sc_BlendMode_ColoredGlass)
{
l9_222=clamp(dot(l9_211.xyz,vec3(1.0)),0.0,1.0)*l9_212;
}
#else
{
float l9_223;
#if (sc_BlendMode_Add)
{
l9_223=clamp(dot(l9_211.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_224;
#if (sc_BlendMode_AddWithAlphaFactor)
{
l9_224=clamp(dot(l9_211.xyz,vec3(1.0)),0.0,1.0)*l9_212;
}
#else
{
float l9_225;
#if (sc_BlendMode_Screen)
{
l9_225=dot(l9_211.xyz,vec3(0.33333001))*l9_212;
}
#else
{
float l9_226;
#if (sc_BlendMode_Min)
{
l9_226=1.0-clamp(dot(l9_211.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
float l9_227;
#if (sc_BlendMode_Max)
{
l9_227=clamp(dot(l9_211.xyz,vec3(1.0)),0.0,1.0);
}
#else
{
l9_227=1.0;
}
#endif
l9_226=l9_227;
}
#endif
l9_225=l9_226;
}
#endif
l9_224=l9_225;
}
#endif
l9_223=l9_224;
}
#endif
l9_222=l9_223;
}
#endif
l9_221=l9_222;
}
#endif
l9_220=l9_221;
}
#endif
l9_219=l9_220;
}
#endif
l9_218=l9_219;
}
#endif
l9_217=l9_218;
}
#endif
l9_216=l9_217;
}
#endif
l9_215=vec4(mix(sc_ShadowColor.xyz,sc_ShadowColor.xyz*l9_211.xyz,vec3(sc_ShadowColor.w)),sc_ShadowDensity*l9_216);
}
#else
{
vec4 l9_228;
#if (sc_RenderAlphaToColor)
{
l9_228=vec4(l9_212);
}
#else
{
vec4 l9_229;
#if (sc_BlendMode_Custom)
{
vec4 l9_230;
#if (sc_FramebufferFetch)
{
vec4 l9_231=sc_readFragData0_Platform();
vec4 l9_232;
#if (sc_UseFramebufferFetchMarker)
{
vec4 l9_233=l9_231;
l9_233.x=l9_231.x+_sc_framebufferFetchMarker;
l9_232=l9_233;
}
#else
{
l9_232=l9_231;
}
#endif
l9_230=l9_232;
}
#else
{
vec2 l9_234=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
int l9_235;
#if (sc_ScreenTextureHasSwappedViews)
{
l9_235=1-sc_GetStereoViewIndex();
}
#else
{
l9_235=sc_GetStereoViewIndex();
}
#endif
vec4 l9_236;
#if (sc_ScreenTextureLayout==2)
{
l9_236=texture(sc_ScreenTextureArrSC,sc_SamplingCoordsViewToGlobal(l9_234,sc_ScreenTextureLayout,l9_235),0.0);
}
#else
{
l9_236=texture(sc_ScreenTexture,sc_SamplingCoordsViewToGlobal(l9_234,sc_ScreenTextureLayout,l9_235).xy,0.0);
}
#endif
l9_230=l9_236;
}
#endif
vec4 l9_237;
#if (((sc_IsEditor&&sc_GetFramebufferColorInvalidUsageMarker)&&(!sc_BlendMode_Software))&&(!sc_BlendMode_ColoredGlass))
{
vec4 l9_238=l9_230;
l9_238.x=l9_230.x+_sc_GetFramebufferColorInvalidUsageMarker;
l9_237=l9_238;
}
#else
{
l9_237=l9_230;
}
#endif
vec3 l9_239=mix(l9_237.xyz,definedBlend(l9_237.xyz,l9_211.xyz).xyz,vec3(l9_212));
vec4 l9_240=vec4(l9_239.x,l9_239.y,l9_239.z,vec4(0.0).w);
l9_240.w=1.0;
l9_229=l9_240;
}
#else
{
vec4 l9_241;
#if (sc_BlendMode_MultiplyOriginal)
{
l9_241=vec4(mix(vec3(1.0),l9_211.xyz,vec3(l9_212)),l9_212);
}
#else
{
vec4 l9_242;
#if (sc_BlendMode_Screen||sc_BlendMode_PremultipliedAlphaAuto)
{
float l9_243;
#if (sc_BlendMode_PremultipliedAlphaAuto)
{
l9_243=clamp(l9_212,0.0,1.0);
}
#else
{
l9_243=l9_212;
}
#endif
l9_242=vec4(l9_211.xyz*l9_243,l9_243);
}
#else
{
l9_242=l9_211;
}
#endif
l9_241=l9_242;
}
#endif
l9_229=l9_241;
}
#endif
l9_228=l9_229;
}
#endif
l9_215=l9_228;
}
#endif
vec4 l9_244;
if (PreviewEnabled==1)
{
vec4 l9_245;
if (((PreviewVertexSaved*1.0)!=0.0) ? true : false)
{
l9_245=PreviewVertexColor;
}
else
{
l9_245=vec4(0.0);
}
l9_244=l9_245;
}
else
{
l9_244=l9_215;
}
vec4 l9_246;
#if (sc_ShaderComplexityAnalyzer)
{
l9_246=vec4(shaderComplexityValue/255.0,0.0,0.0,1.0);
}
#else
{
l9_246=vec4(0.0);
}
#endif
vec4 l9_247;
if (l9_246.w>0.0)
{
l9_247=l9_246;
}
else
{
l9_247=l9_244;
}
vec4 l9_248=outputMotionVectorsIfNeeded(varPos,max(l9_247,vec4(0.0)));
vec4 l9_249=clamp(l9_248,vec4(0.0),vec4(1.0));
#if (sc_OITDepthBoundsPass)
{
#if (sc_OITDepthBoundsPass)
{
float l9_250=clamp(viewSpaceDepth()/1000.0,0.0,1.0);
sc_writeFragData0(vec4(max(0.0,1.0-(l9_250-0.0039215689)),min(1.0,l9_250+0.0039215689),0.0,0.0));
}
#endif
}
#else
{
#if (sc_OITDepthPrepass)
{
sc_writeFragData0(vec4(1.0));
}
#else
{
#if (sc_OITDepthGatherPass)
{
#if (sc_OITDepthGatherPass)
{
vec2 l9_251=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_251).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_252=encodeDepth(viewSpaceDepth(),texture(sc_OITFilteredDepthBoundsTexture,l9_251).xy);
float l9_253=packValue(l9_252);
int l9_260=int(l9_249.w*255.0);
float l9_261=packValue(l9_260);
sc_writeFragData0(vec4(packValue(l9_252),packValue(l9_252),packValue(l9_252),packValue(l9_252)));
sc_writeFragData1(vec4(l9_253,packValue(l9_252),packValue(l9_252),packValue(l9_252)));
sc_writeFragData2(vec4(l9_261,packValue(l9_260),packValue(l9_260),packValue(l9_260)));
#if (sc_OITMaxLayersVisualizeLayerCount)
{
sc_writeFragData2(vec4(0.0039215689,0.0,0.0,0.0));
}
#endif
}
#endif
}
#else
{
#if (sc_OITCompositingPass)
{
#if (sc_OITCompositingPass)
{
vec2 l9_264=sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw);
#if (sc_OITMaxLayers4Plus1)
{
if ((gl_FragCoord.z-texture(sc_OITFrontDepthTexture,l9_264).x)<=getFrontLayerZTestEpsilon())
{
discard;
}
}
#endif
int l9_265[8];
int l9_266[8];
int l9_267=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_267<8)
{
l9_265[l9_267]=0;
l9_266[l9_267]=0;
l9_267++;
continue;
}
else
{
break;
}
}
int l9_268;
#if (sc_OITMaxLayers8)
{
l9_268=2;
}
#else
{
l9_268=1;
}
#endif
int l9_269=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_269<l9_268)
{
vec4 l9_270;
vec4 l9_271;
vec4 l9_272;
if (l9_269==0)
{
l9_272=texture(sc_OITAlpha0,l9_264);
l9_271=texture(sc_OITDepthLow0,l9_264);
l9_270=texture(sc_OITDepthHigh0,l9_264);
}
else
{
l9_272=vec4(0.0);
l9_271=vec4(0.0);
l9_270=vec4(0.0);
}
vec4 l9_273;
vec4 l9_274;
vec4 l9_275;
if (l9_269==1)
{
l9_275=texture(sc_OITAlpha1,l9_264);
l9_274=texture(sc_OITDepthLow1,l9_264);
l9_273=texture(sc_OITDepthHigh1,l9_264);
}
else
{
l9_275=l9_272;
l9_274=l9_271;
l9_273=l9_270;
}
if (any(notEqual(l9_273,vec4(0.0)))||any(notEqual(l9_274,vec4(0.0))))
{
int l9_276[8]=l9_265;
unpackValues(l9_273.w,l9_269,l9_276);
unpackValues(l9_273.z,l9_269,l9_276);
unpackValues(l9_273.y,l9_269,l9_276);
unpackValues(l9_273.x,l9_269,l9_276);
unpackValues(l9_274.w,l9_269,l9_276);
unpackValues(l9_274.z,l9_269,l9_276);
unpackValues(l9_274.y,l9_269,l9_276);
unpackValues(l9_274.x,l9_269,l9_276);
int l9_285[8]=l9_266;
unpackValues(l9_275.w,l9_269,l9_285);
unpackValues(l9_275.z,l9_269,l9_285);
unpackValues(l9_275.y,l9_269,l9_285);
unpackValues(l9_275.x,l9_269,l9_285);
}
l9_269++;
continue;
}
else
{
break;
}
}
vec4 l9_290=texture(sc_OITFilteredDepthBoundsTexture,l9_264);
vec2 l9_291=l9_290.xy;
int l9_292;
#if (sc_SkinBonesCount>0)
{
l9_292=encodeDepth(((1.0-l9_290.x)*1000.0)+getDepthOrderingEpsilon(),l9_291);
}
#else
{
l9_292=0;
}
#endif
int l9_293=encodeDepth(viewSpaceDepth(),l9_291);
vec4 l9_294;
l9_294=l9_249*l9_249.w;
vec4 l9_295;
int l9_296=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_296<8)
{
int l9_297=l9_265[l9_296];
int l9_298=l9_293-l9_292;
bool l9_299=l9_297<l9_298;
bool l9_300;
if (l9_299)
{
l9_300=l9_265[l9_296]>0;
}
else
{
l9_300=l9_299;
}
if (l9_300)
{
vec3 l9_301=l9_294.xyz*(1.0-(float(l9_266[l9_296])/255.0));
l9_295=vec4(l9_301.x,l9_301.y,l9_301.z,l9_294.w);
}
else
{
l9_295=l9_294;
}
l9_294=l9_295;
l9_296++;
continue;
}
else
{
break;
}
}
sc_writeFragData0(l9_294);
#if (sc_OITMaxLayersVisualizeLayerCount)
{
discard;
}
#endif
}
#endif
}
#else
{
#if (sc_OITFrontLayerPass)
{
#if (sc_OITFrontLayerPass)
{
if (abs(gl_FragCoord.z-texture(sc_OITFrontDepthTexture,sc_ScreenCoordsGlobalToView(gl_FragCoord.xy*sc_CurrentRenderTargetDims.zw)).x)>getFrontLayerZTestEpsilon())
{
discard;
}
sc_writeFragData0(l9_249);
}
#endif
}
#else
{
sc_writeFragData0(l9_248);
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif
}
#endif // #elif defined FRAGMENT_SHADER // #if defined VERTEX_SHADER
