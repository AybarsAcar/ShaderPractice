Shader "Bunny/BumpDiffuse"
{
    Properties
    {
        _MyDiffuse ("Diffuse Texture", 2D) = "white" {}
        _MyBump ("Normal Texture", 2D) = "bump" {}
        _MySlider ("Bump Amount", Range(0,10)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MyDiffuse;
        sampler2D _MyBump;
        half _MySlider;

        struct Input
        {
            float2 uv_MyDiffuse;
            float2 uv_MyBump;
        };


        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D(_MyDiffuse, IN.uv_MyDiffuse).rgb;

            o.Normal = UnpackNormal(tex2D(_MyBump, IN.uv_MyBump));
            o.Normal *= float3(_MySlider, _MySlider, 1); // adjust the normal map -> affects the bumps
        }
        ENDCG
    }
    FallBack "Diffuse"
}