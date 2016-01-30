// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:1,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:1,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:4,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|spec-5480-OUT,gloss-5480-OUT,emission-181-OUT;n:type:ShaderForge.SFN_Multiply,id:6343,x:32186,y:32501,varname:node_6343,prsc:2|A-7736-RGB,B-6698-OUT;n:type:ShaderForge.SFN_Color,id:6665,x:31590,y:32652,ptovrint:False,ptlb:ColorSurface,ptin:_ColorSurface,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4778905,c2:1,c3:0.2720588,c4:1;n:type:ShaderForge.SFN_Tex2d,id:7736,x:31898,y:32323,ptovrint:True,ptlb:Base Color,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:6781,x:31226,y:33329,ptovrint:False,ptlb:Fresnel Strength,ptin:_FresnelStrength,varname:node_6781,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Fresnel,id:9468,x:31236,y:33017,varname:node_9468,prsc:2|EXP-8412-OUT;n:type:ShaderForge.SFN_Lerp,id:310,x:31764,y:33175,varname:node_310,prsc:2|A-8340-OUT,B-5204-OUT,T-6781-OUT;n:type:ShaderForge.SFN_Vector1,id:8340,x:31432,y:33203,varname:node_8340,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:8412,x:30932,y:33096,ptovrint:False,ptlb:Fresnel Amount,ptin:_FresnelAmount,varname:node_8412,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Color,id:5632,x:31632,y:32987,ptovrint:False,ptlb:Fresnel Color,ptin:_FresnelColor,varname:node_5632,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5613,x:31080,y:33214,ptovrint:False,ptlb:Fresnel Texture,ptin:_FresnelTexture,varname:node_5613,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5204,x:31432,y:33059,varname:node_5204,prsc:2|A-9468-OUT,B-5613-RGB;n:type:ShaderForge.SFN_Vector1,id:5480,x:32462,y:32752,varname:node_5480,prsc:2,v1:0;n:type:ShaderForge.SFN_FragmentPosition,id:3912,x:31401,y:32443,varname:node_3912,prsc:2;n:type:ShaderForge.SFN_If,id:6698,x:31977,y:32669,varname:node_6698,prsc:2|A-3912-Y,B-5482-OUT,GT-6665-RGB,EQ-6665-RGB,LT-3532-RGB;n:type:ShaderForge.SFN_ValueProperty,id:5482,x:31755,y:32565,ptovrint:False,ptlb:Ground,ptin:_Ground,varname:node_5482,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:3532,x:31590,y:32816,ptovrint:False,ptlb:ColorGround,ptin:_ColorGround,varname:node_3532,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1764,x:32167,y:32896,varname:node_1764,prsc:2|A-5632-RGB,B-310-OUT;n:type:ShaderForge.SFN_Vector1,id:12,x:32441,y:32627,varname:node_12,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:181,x:32471,y:32860,varname:node_181,prsc:2|A-6343-OUT,B-1764-OUT;proporder:7736-5613-5632-6781-8412-6665-3532-5482;pass:END;sub:END;*/

Shader "Shader Forge/CSGground" {
    Properties {
        _MainTex ("Base Color", 2D) = "white" {}
        _FresnelTexture ("Fresnel Texture", 2D) = "white" {}
        _FresnelColor ("Fresnel Color", Color) = (1,1,1,1)
        _FresnelStrength ("Fresnel Strength", Range(0, 2)) = 1
        _FresnelAmount ("Fresnel Amount", Range(0, 5)) = 1
        _ColorSurface ("ColorSurface", Color) = (0.4778905,1,0.2720588,1)
        _ColorGround ("ColorGround", Color) = (0.5,0.5,0.5,1)
        _Ground ("Ground", Float ) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
            "DisableBatching"="True"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZTest Equal
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _ColorSurface;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _FresnelStrength;
            uniform float _FresnelAmount;
            uniform float4 _FresnelColor;
            uniform sampler2D _FresnelTexture; uniform float4 _FresnelTexture_ST;
            uniform float _Ground;
            uniform float4 _ColorGround;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_6698_if_leA = step(i.posWorld.g,_Ground);
                float node_6698_if_leB = step(_Ground,i.posWorld.g);
                float node_8340 = 0.0;
                float4 _FresnelTexture_var = tex2D(_FresnelTexture,TRANSFORM_TEX(i.uv0, _FresnelTexture));
                float3 emissive = ((_MainTex_var.rgb*lerp((node_6698_if_leA*_ColorGround.rgb)+(node_6698_if_leB*_ColorSurface.rgb),_ColorSurface.rgb,node_6698_if_leA*node_6698_if_leB))+(_FresnelColor.rgb*lerp(float3(node_8340,node_8340,node_8340),(pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelAmount)*_FresnelTexture_var.rgb),_FresnelStrength)));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _ColorSurface;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _FresnelStrength;
            uniform float _FresnelAmount;
            uniform float4 _FresnelColor;
            uniform sampler2D _FresnelTexture; uniform float4 _FresnelTexture_ST;
            uniform float _Ground;
            uniform float4 _ColorGround;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_6698_if_leA = step(i.posWorld.g,_Ground);
                float node_6698_if_leB = step(_Ground,i.posWorld.g);
                float node_8340 = 0.0;
                float4 _FresnelTexture_var = tex2D(_FresnelTexture,TRANSFORM_TEX(i.uv0, _FresnelTexture));
                o.Emission = ((_MainTex_var.rgb*lerp((node_6698_if_leA*_ColorGround.rgb)+(node_6698_if_leB*_ColorSurface.rgb),_ColorSurface.rgb,node_6698_if_leA*node_6698_if_leB))+(_FresnelColor.rgb*lerp(float3(node_8340,node_8340,node_8340),(pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelAmount)*_FresnelTexture_var.rgb),_FresnelStrength)));
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
