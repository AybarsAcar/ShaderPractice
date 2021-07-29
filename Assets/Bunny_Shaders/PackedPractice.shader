Shader "Bunny/PackedPractice"
{
    Properties
    {
        _Colour ("Example Colour", Color) = (1,1,1,1)
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainText;
        };

        fixed4 _Colour;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Colour.rgb;
        }
        ENDCG
    }

    FallBack "Diffuse"
}