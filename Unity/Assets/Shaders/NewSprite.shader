// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33027,y:32666,varname:node_3138,prsc:2|emission-8712-OUT,clip-1221-A;n:type:ShaderForge.SFN_ScreenPos,id:8039,x:31497,y:32431,varname:node_8039,prsc:2,sctp:0;n:type:ShaderForge.SFN_Tex2d,id:4437,x:32310,y:32710,ptovrint:False,ptlb:RealTex,ptin:_RealTex,varname:node_4437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:92bd2f3f55a384338bb507fa29d2ea26,ntxv:0,isnm:False|UVIN-5722-OUT;n:type:ShaderForge.SFN_Tex2d,id:1221,x:32311,y:33035,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1221,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:92bd2f3f55a384338bb507fa29d2ea26,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:2726,x:31780,y:32471,varname:node_2726,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8039-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6335,x:31830,y:32732,varname:node_6335,prsc:2|A-2623-OUT,B-5011-T;n:type:ShaderForge.SFN_Append,id:2623,x:31561,y:32669,varname:node_2623,prsc:2|A-5223-OUT,B-2573-OUT;n:type:ShaderForge.SFN_Time,id:5011,x:31561,y:32836,varname:node_5011,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:2573,x:31288,y:32730,ptovrint:False,ptlb:Y Speed Vert,ptin:_YSpeedVert,varname:node_5535,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:5223,x:31288,y:32643,ptovrint:False,ptlb:X Speed Vert,ptin:_XSpeedVert,varname:node_4851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:5722,x:32026,y:32710,varname:node_5722,prsc:2|A-2726-OUT,B-6335-OUT;n:type:ShaderForge.SFN_RgbToHsv,id:6494,x:32515,y:32699,varname:node_6494,prsc:2|IN-4437-RGB;n:type:ShaderForge.SFN_HsvToRgb,id:8712,x:32858,y:32717,varname:node_8712,prsc:2|H-358-OUT,S-4647-OUT,V-6494-VOUT;n:type:ShaderForge.SFN_Slider,id:9157,x:32714,y:32494,ptovrint:False,ptlb:Hue,ptin:_Hue,varname:node_9157,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:13;n:type:ShaderForge.SFN_Multiply,id:358,x:32687,y:32649,varname:node_358,prsc:2|A-6494-HOUT,B-9157-OUT;n:type:ShaderForge.SFN_Multiply,id:4647,x:32691,y:32807,varname:node_4647,prsc:2|A-6494-SOUT,B-8082-OUT;n:type:ShaderForge.SFN_Slider,id:8082,x:32311,y:32934,ptovrint:False,ptlb:Saturation,ptin:_Saturation,varname:node_8082,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:1221-4437-2573-5223-9157-8082;pass:END;sub:END;*/

Shader "Shader Forge/NewSprite" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _RealTex ("RealTex", 2D) = "white" {}
        _YSpeedVert ("Y Speed Vert", Float ) = 0
        _XSpeedVert ("X Speed Vert", Float ) = 0
        _Hue ("Hue", Range(1, 13)) = 1
        _Saturation ("Saturation", Range(0, 1)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _RealTex; uniform float4 _RealTex_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _YSpeedVert;
            uniform float _XSpeedVert;
            uniform float _Hue;
            uniform float _Saturation;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
////// Lighting:
////// Emissive:
                float4 node_5011 = _Time + _TimeEditor;
                float2 node_5722 = ((i.screenPos.rg*0.5+0.5)+(float2(_XSpeedVert,_YSpeedVert)*node_5011.g));
                float4 _RealTex_var = tex2D(_RealTex,TRANSFORM_TEX(node_5722, _RealTex));
                float4 node_6494_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_6494_p = lerp(float4(float4(_RealTex_var.rgb,0.0).zy, node_6494_k.wz), float4(float4(_RealTex_var.rgb,0.0).yz, node_6494_k.xy), step(float4(_RealTex_var.rgb,0.0).z, float4(_RealTex_var.rgb,0.0).y));
                float4 node_6494_q = lerp(float4(node_6494_p.xyw, float4(_RealTex_var.rgb,0.0).x), float4(float4(_RealTex_var.rgb,0.0).x, node_6494_p.yzx), step(node_6494_p.x, float4(_RealTex_var.rgb,0.0).x));
                float node_6494_d = node_6494_q.x - min(node_6494_q.w, node_6494_q.y);
                float node_6494_e = 1.0e-10;
                float3 node_6494 = float3(abs(node_6494_q.z + (node_6494_q.w - node_6494_q.y) / (6.0 * node_6494_d + node_6494_e)), node_6494_d / (node_6494_q.x + node_6494_e), node_6494_q.x);;
                float3 emissive = (lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac((node_6494.r*_Hue)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),(node_6494.g*_Saturation))*node_6494.b);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
