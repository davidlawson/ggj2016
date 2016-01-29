Shader "Custom/BillboardCube" 
{
	Properties 
	{
		_MainTex ("Texture Image", 2D) = "white" {}
	}
	
	SubShader 
	{
		Tags { "Queue" = "Transparent" }
		
		Pass 
		{
			//ZWrite Off
     		Blend SrcAlpha OneMinusSrcAlpha
     		
			CGPROGRAM
							
			#pragma vertex vert
			#pragma fragment frag

			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;

			struct vertexInput {
				float4 vertex : POSITION;
				float4 tex: TEXCOORD0;
			};
			
			struct vertexOutput {
				float4 pos : SV_POSITION;
				half2 uv : TEXCOORD0;
			};
			
			vertexOutput vert(vertexInput input)
			{
				vertexOutput output;
				
				float scaleX = length(mul(_Object2World, float4(1.0, 0.0, 0.0, 0.0)));
            	float scaleY = length(mul(_Object2World, float4(0.0, 1.0, 0.0, 0.0)));
				output.pos = mul(UNITY_MATRIX_P, 
	              mul(UNITY_MATRIX_MV, float4(0.0, 0.0, 0.0, 1.0))
	              - float4(input.vertex.x * scaleX, input.vertex.y * scaleY, 0.0, 0.0));
	  
	            output.uv = input.tex.xy * _MainTex_ST.xy + _MainTex_ST.zw;

	            return output;
			}
			
			float4 frag(vertexOutput input) : COLOR
			{
				return tex2D(_MainTex, float2(input.uv));
			}
			
			ENDCG
		} 
	}
}
