Shader "Bunny/BumpedEnvironment"
{
    Properties
    {
        _MyDiffuse ("Diffuse Texture", 2D) = "white" {}
        _MyBump ("Bump Texture", 2D) = "white" {}
        _BumpAmount ("Bump Amount", Range(0,10)) = 1
        _Brightness ("Brightness", Range(0,10)) = 1
        _CubeMap ("Cube Map", CUBE) = "white" {} // used for reflection
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MyDiffuse;
        sampler2D _MyBump;
        half _BumpAmount;
        half _Brightness;
        samplerCUBE _CubeMap;

        struct Input
        {
            float2 uv_MyDiffuse;
            float2 uv_MyBump;
            float3 worldRefl; INTERNAL_DATA
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MyDiffuse, IN.uv_MyDiffuse).rgb;

            o.Normal = UnpackNormal(tex2D(_MyBump, IN.uv_MyBump)) * _Brightness;

            o.Normal *= float3(_BumpAmount, _BumpAmount, 1);

            // set the emission to get teh world reflection
            o.Emission = texCUBE(_CubeMap, WorldReflectionVector(IN, o.Normal)).rgb; 
        }
        ENDCG
    }
    FallBack "Diffuse"
} 