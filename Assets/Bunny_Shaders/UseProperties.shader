Shader "Bunny/UseProperties"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Range ("Range", Range(0,5)) = 0.5
        _MyTex ("Texture", 2D) = "white" {}
        _Cube ("Cude", CUBE) = "" {}
        _Float ("Float", Float) = 0.5
        _Vector ("Vector", Vector) = (0.5,1,1,1)
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        fixed4 _Color;
        half _Range;
        sampler2D _MyTex;
        samplerCUBE _Cube;
        float _Float;
        float4 _Vector;

        struct Input
        {
            float2 uv_MyTex;
            float3 worldRefl;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            // get the albedo colour from the texture we pass in
            // and use the Range variable
            o.Albedo = (tex2D(_MyTex, IN.uv_MyTex) * _Range + _Color).rgb;
            o.Emission = texCUBE(_Cube, IN.worldRefl).rgb;
        }
        ENDCG
    }

    FallBack "Diffuse"
}