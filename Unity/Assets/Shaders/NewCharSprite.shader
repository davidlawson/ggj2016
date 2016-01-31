// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-6205-OUT,clip-1221-A;n:type:ShaderForge.SFN_ScreenPos,id:8039,x:31205,y:32395,varname:node_8039,prsc:2,sctp:0;n:type:ShaderForge.SFN_Tex2d,id:4437,x:31681,y:32597,ptovrint:False,ptlb:RealTex,ptin:_RealTex,varname:node_4437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a4a883b00d5a03c4191f41d61ff430fe,ntxv:0,isnm:False|UVIN-2726-OUT;n:type:ShaderForge.SFN_Tex2d,id:1221,x:32084,y:32990,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1221,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:71b4c540c5eb54a48935ddb991c71657,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:2726,x:31446,y:32546,varname:node_2726,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8039-UVOUT;n:type:ShaderForge.SFN_Color,id:9058,x:32054,y:32451,ptovrint:False,ptlb:Key,ptin:_Key,varname:node_9058,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_If,id:6205,x:32508,y:32696,varname:node_6205,prsc:2|A-9058-RGB,B-1221-RGB,GT-1221-RGB,EQ-5287-OUT,LT-1221-RGB;n:type:ShaderForge.SFN_RgbToHsv,id:8100,x:31663,y:32858,varname:node_8100,prsc:2|IN-4437-RGB;n:type:ShaderForge.SFN_Slider,id:7017,x:31459,y:33093,ptovrint:False,ptlb:Saturation,ptin:_Saturation,varname:node_8082,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:4747,x:31839,y:32966,varname:node_4747,prsc:2|A-8100-SOUT,B-7017-OUT;n:type:ShaderForge.SFN_Multiply,id:5367,x:31835,y:32808,varname:node_5367,prsc:2|A-8100-HOUT,B-742-OUT;n:type:ShaderForge.SFN_HsvToRgb,id:5287,x:32006,y:32876,varname:node_5287,prsc:2|H-5367-OUT,S-4747-OUT,V-8100-VOUT;n:type:ShaderForge.SFN_Slider,id:742,x:31862,y:32653,ptovrint:False,ptlb:Hue,ptin:_Hue,varname:node_9157,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:13;proporder:1221-4437-9058-7017-742;pass:END;sub:END;*/

Shader "Shader Forge/NewCharSprite" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _RealTex ("RealTex", 2D) = "white" {}
        _Key ("Key", Color) = (0,1,1,1)
        _Saturation ("Saturation", Range(0, 1)) = 1
        _Hue ("Hue", Range(1, 13)) = 1
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
            uniform sampler2D _RealTex; uniform float4 _RealTex_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Key;
            uniform float _Saturation;
            uniform float _Hue;
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
                float node_6205_if_leA = step(_Key.rgb,_MainTex_var.rgb);
                float node_6205_if_leB = step(_MainTex_var.rgb,_Key.rgb);
                float2 node_2726 = (i.screenPos.rg*0.5+0.5);
                float4 _RealTex_var = tex2D(_RealTex,TRANSFORM_TEX(node_2726, _RealTex));
                float4 node_8100_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_8100_p = lerp(float4(float4(_RealTex_var.rgb,0.0).zy, node_8100_k.wz), float4(float4(_RealTex_var.rgb,0.0).yz, node_8100_k.xy), step(float4(_RealTex_var.rgb,0.0).z, float4(_RealTex_var.rgb,0.0).y));
                float4 node_8100_q = lerp(float4(node_8100_p.xyw, float4(_RealTex_var.rgb,0.0).x), float4(float4(_RealTex_var.rgb,0.0).x, node_8100_p.yzx), step(node_8100_p.x, float4(_RealTex_var.rgb,0.0).x));
                float node_8100_d = node_8100_q.x - min(node_8100_q.w, node_8100_q.y);
                float node_8100_e = 1.0e-10;
                float3 node_8100 = float3(abs(node_8100_q.z + (node_8100_q.w - node_8100_q.y) / (6.0 * node_8100_d + node_8100_e)), node_8100_d / (node_8100_q.x + node_8100_e), node_8100_q.x);;
                float3 emissive = lerp((node_6205_if_leA*_MainTex_var.rgb)+(node_6205_if_leB*_MainTex_var.rgb),(lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac((node_8100.r*_Hue)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),(node_8100.g*_Saturation))*node_8100.b),node_6205_if_leA*node_6205_if_leB);
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
