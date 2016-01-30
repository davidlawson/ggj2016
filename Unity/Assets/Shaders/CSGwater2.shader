// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33257,y:32743,varname:node_4013,prsc:2|emission-1887-OUT,refract-7292-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:9455,x:31802,y:32846,varname:node_9455,prsc:2|IN-1378-OUT,IMIN-6228-OUT,IMAX-4735-OUT,OMIN-6518-OUT,OMAX-1214-OUT;n:type:ShaderForge.SFN_Multiply,id:1378,x:31573,y:32606,varname:node_1378,prsc:2|A-5304-OUT,B-4957-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5304,x:31389,y:32606,ptovrint:False,ptlb:Density,ptin:_Density,varname:node_5549,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Subtract,id:4957,x:31389,y:32666,varname:node_4957,prsc:2|A-5451-OUT,B-5941-OUT;n:type:ShaderForge.SFN_Add,id:6228,x:31573,y:32817,varname:node_6228,prsc:2|A-1773-XYZ,B-1773-W;n:type:ShaderForge.SFN_SceneDepth,id:5451,x:31216,y:32587,varname:node_5451,prsc:2;n:type:ShaderForge.SFN_Depth,id:5941,x:31183,y:32720,varname:node_5941,prsc:2;n:type:ShaderForge.SFN_Vector4Property,id:1773,x:31389,y:32817,ptovrint:False,ptlb:RGB Min,ptin:_RGBMin,varname:node_4516,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:-0.1;n:type:ShaderForge.SFN_Vector4Property,id:4919,x:31389,y:32984,ptovrint:False,ptlb:RGB Offset,ptin:_RGBOffset,varname:node_6971,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.8,v2:3.2,v3:7.7,v4:0;n:type:ShaderForge.SFN_Add,id:4735,x:31573,y:32962,varname:node_4735,prsc:2|A-4919-XYZ,B-4919-W;n:type:ShaderForge.SFN_Vector1,id:6518,x:31573,y:33107,varname:node_6518,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:1214,x:31573,y:33166,varname:node_1214,prsc:2,v1:0;n:type:ShaderForge.SFN_Clamp01,id:766,x:31985,y:32846,varname:node_766,prsc:2|IN-9455-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6016,x:31985,y:33038,ptovrint:False,ptlb:Fade Power,ptin:_FadePower,varname:node_8268,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_SceneColor,id:7724,x:32172,y:32822,varname:node_7724,prsc:2;n:type:ShaderForge.SFN_Power,id:5733,x:32172,y:32966,varname:node_5733,prsc:2|VAL-766-OUT,EXP-6016-OUT;n:type:ShaderForge.SFN_Multiply,id:4385,x:32386,y:32905,varname:node_4385,prsc:2|A-7724-RGB,B-5733-OUT;n:type:ShaderForge.SFN_Blend,id:1887,x:32563,y:32812,varname:node_1887,prsc:2,blmd:5,clmp:True|SRC-4385-OUT,DST-1665-OUT;n:type:ShaderForge.SFN_Color,id:4568,x:32172,y:32641,ptovrint:False,ptlb:Colour A,ptin:_ColourA,varname:node_4568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.006896734,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1335,x:32134,y:32442,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1335,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7871-OUT;n:type:ShaderForge.SFN_Blend,id:1665,x:32579,y:32466,varname:node_1665,prsc:2,blmd:5,clmp:True|SRC-4242-OUT,DST-4568-RGB;n:type:ShaderForge.SFN_Color,id:9212,x:32768,y:32007,ptovrint:False,ptlb:Colour B,ptin:_ColourB,varname:node_9212,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:4242,x:32426,y:32376,varname:node_4242,prsc:2|A-1675-OUT,B-1335-A;n:type:ShaderForge.SFN_Tex2d,id:9884,x:32312,y:33116,ptovrint:False,ptlb:Refraction,ptin:_Refraction,varname:node_9884,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e08c295755c0885479ad19f518286ff2,ntxv:3,isnm:True|UVIN-1942-OUT;n:type:ShaderForge.SFN_ComponentMask,id:1285,x:32477,y:33116,varname:node_1285,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9884-RGB;n:type:ShaderForge.SFN_Slider,id:7221,x:32016,y:33303,ptovrint:False,ptlb:Refraction Intensity,ptin:_RefractionIntensity,varname:_RefractionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_Vector1,id:7852,x:32173,y:33382,varname:node_7852,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:5902,x:32411,y:33354,varname:node_5902,prsc:2|A-7221-OUT,B-7852-OUT;n:type:ShaderForge.SFN_Multiply,id:7292,x:32581,y:33275,varname:node_7292,prsc:2|A-1285-OUT,B-5902-OUT;n:type:ShaderForge.SFN_Add,id:1942,x:32007,y:33145,varname:node_1942,prsc:2|A-8258-OUT,B-448-OUT;n:type:ShaderForge.SFN_Multiply,id:448,x:31805,y:33263,varname:node_448,prsc:2|A-7129-OUT,B-8520-T;n:type:ShaderForge.SFN_Time,id:8520,x:31631,y:33406,varname:node_8520,prsc:2;n:type:ShaderForge.SFN_Append,id:7129,x:31631,y:33253,varname:node_7129,prsc:2|A-5677-OUT,B-1689-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5677,x:31389,y:33276,ptovrint:False,ptlb:Ref U Speed,ptin:_RefUSpeed,varname:node_5677,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:1689,x:31409,y:33440,ptovrint:False,ptlb:Ref V Speed,ptin:_RefVSpeed,varname:node_1689,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_FragmentPosition,id:6056,x:30800,y:32362,varname:node_6056,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:407,x:31007,y:32375,varname:node_407,prsc:2,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-6056-XYZ;n:type:ShaderForge.SFN_Tex2d,id:33,x:31259,y:31712,ptovrint:False,ptlb:MotionNoiseA,ptin:_MotionNoiseA,varname:node_33,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2845-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8956,x:31782,y:31907,varname:node_8956,prsc:2,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-181-OUT;n:type:ShaderForge.SFN_Add,id:7871,x:31967,y:32280,varname:node_7871,prsc:2|A-764-OUT,B-8258-OUT;n:type:ShaderForge.SFN_Tex2d,id:3655,x:31242,y:31901,ptovrint:False,ptlb:MotionNoiseB,ptin:_MotionNoiseB,varname:node_3655,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2845-OUT;n:type:ShaderForge.SFN_Lerp,id:181,x:31585,y:31907,varname:node_181,prsc:2|A-33-RGB,B-3655-RGB,T-7205-OUT;n:type:ShaderForge.SFN_Multiply,id:764,x:31989,y:32045,varname:node_764,prsc:2|A-8956-OUT,B-3762-OUT;n:type:ShaderForge.SFN_Slider,id:3762,x:31628,y:32131,ptovrint:False,ptlb:Distortion Amount,ptin:_DistortionAmount,varname:node_3762,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_Multiply,id:392,x:30765,y:31717,varname:node_392,prsc:2|A-530-OUT,B-8552-T;n:type:ShaderForge.SFN_Append,id:530,x:30591,y:31707,varname:node_530,prsc:2|A-4636-OUT,B-4577-OUT;n:type:ShaderForge.SFN_Time,id:8552,x:30579,y:31860,varname:node_8552,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:4577,x:30363,y:31894,ptovrint:False,ptlb:MotionNoiseVSpeed,ptin:_MotionNoiseVSpeed,varname:_RefVSpeed_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.07;n:type:ShaderForge.SFN_ValueProperty,id:4636,x:30343,y:31730,ptovrint:False,ptlb:MotionNoiseU Speed,ptin:_MotionNoiseUSpeed,varname:_RefUSpeed_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.03;n:type:ShaderForge.SFN_Add,id:2845,x:30954,y:31656,varname:node_2845,prsc:2|A-8258-OUT,B-392-OUT;n:type:ShaderForge.SFN_Sin,id:7205,x:31435,y:32085,varname:node_7205,prsc:2|IN-9747-OUT;n:type:ShaderForge.SFN_Time,id:1722,x:31041,y:32099,varname:node_1722,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9747,x:31242,y:32119,varname:node_9747,prsc:2|A-1722-T,B-2470-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2470,x:31075,y:32285,ptovrint:False,ptlb:Distort Speed,ptin:_DistortSpeed,varname:node_2470,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.6;n:type:ShaderForge.SFN_Tex2d,id:1187,x:32439,y:32054,ptovrint:False,ptlb:Highlight,ptin:_Highlight,varname:node_1187,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8060-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:8060,x:32266,y:31978,varname:node_8060,prsc:2,sctp:0;n:type:ShaderForge.SFN_Multiply,id:1675,x:32594,y:32214,varname:node_1675,prsc:2|A-9212-RGB,B-1187-RGB;n:type:ShaderForge.SFN_NormalVector,id:8258,x:31281,y:32389,prsc:2,pt:False;proporder:4568-9212-1335-5304-1773-4919-6016-9884-7221-5677-1689-33-3655-3762-4577-4636-2470-1187;pass:END;sub:END;*/

Shader "Shader Forge/CSGwater2" {
    Properties {
        _ColourA ("Colour A", Color) = (0,0.006896734,1,1)
        _ColourB ("Colour B", Color) = (1,1,1,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _Density ("Density", Float ) = 1
        _RGBMin ("RGB Min", Vector) = (0,0,0,-0.1)
        _RGBOffset ("RGB Offset", Vector) = (0.8,3.2,7.7,0)
        _FadePower ("Fade Power", Float ) = 3
        _Refraction ("Refraction", 2D) = "bump" {}
        _RefractionIntensity ("Refraction Intensity", Range(0, 1)) = 0.1
        _RefUSpeed ("Ref U Speed", Float ) = 1
        _RefVSpeed ("Ref V Speed", Float ) = 0.5
        _MotionNoiseA ("MotionNoiseA", 2D) = "white" {}
        _MotionNoiseB ("MotionNoiseB", 2D) = "white" {}
        _DistortionAmount ("Distortion Amount", Range(0, 1)) = 0.1
        _MotionNoiseVSpeed ("MotionNoiseVSpeed", Float ) = -0.07
        _MotionNoiseUSpeed ("MotionNoiseU Speed", Float ) = 0.03
        _DistortSpeed ("Distort Speed", Float ) = 0.6
        _Highlight ("Highlight", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float _Density;
            uniform float4 _RGBMin;
            uniform float4 _RGBOffset;
            uniform float _FadePower;
            uniform float4 _ColourA;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _ColourB;
            uniform sampler2D _Refraction; uniform float4 _Refraction_ST;
            uniform float _RefractionIntensity;
            uniform float _RefUSpeed;
            uniform float _RefVSpeed;
            uniform sampler2D _MotionNoiseA; uniform float4 _MotionNoiseA_ST;
            uniform sampler2D _MotionNoiseB; uniform float4 _MotionNoiseB_ST;
            uniform float _DistortionAmount;
            uniform float _MotionNoiseVSpeed;
            uniform float _MotionNoiseUSpeed;
            uniform float _DistortSpeed;
            uniform sampler2D _Highlight; uniform float4 _Highlight_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float4 node_8520 = _Time + _TimeEditor;
                float3 node_1942 = (i.normalDir+float3((float2(_RefUSpeed,_RefVSpeed)*node_8520.g),0.0));
                float3 _Refraction_var = UnpackNormal(tex2D(_Refraction,TRANSFORM_TEX(node_1942, _Refraction)));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (_Refraction_var.rgb.rg*(_RefractionIntensity*0.2));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float3 node_6228 = (_RGBMin.rgb+_RGBMin.a);
                float node_6518 = 1.0;
                float4 _Highlight_var = tex2D(_Highlight,TRANSFORM_TEX(i.screenPos.rg, _Highlight));
                float4 node_8552 = _Time + _TimeEditor;
                float3 node_2845 = (i.normalDir+float3((float2(_MotionNoiseUSpeed,_MotionNoiseVSpeed)*node_8552.g),0.0));
                float4 _MotionNoiseA_var = tex2D(_MotionNoiseA,TRANSFORM_TEX(node_2845, _MotionNoiseA));
                float4 _MotionNoiseB_var = tex2D(_MotionNoiseB,TRANSFORM_TEX(node_2845, _MotionNoiseB));
                float4 node_1722 = _Time + _TimeEditor;
                float3 node_7871 = (float3((lerp(_MotionNoiseA_var.rgb,_MotionNoiseB_var.rgb,sin((node_1722.g*_DistortSpeed))).rb*_DistortionAmount),0.0)+i.normalDir);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_7871, _MainTex));
                float3 emissive = saturate(max((sceneColor.rgb*pow(saturate((node_6518 + ( ((_Density*(sceneZ-partZ)) - node_6228) * (0.0 - node_6518) ) / ((_RGBOffset.rgb+_RGBOffset.a) - node_6228))),_FadePower)),saturate(max(((_ColourB.rgb*_Highlight_var.rgb)*_MainTex_var.a),_ColourA.rgb))));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,1),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
