// programmed in shaderToy website so the inputs to main function is given by the website itself. If you want to test this out, just copy paste and compile it.
vec3 palette( in float t)
        {
    vec3 a = vec3(0.500, 0.500 ,0.500);
    vec3 b = vec3(0.500, 0.500 ,0.500);
    vec3 c = vec3(1.000 ,1.000 ,1.000);
    vec3 d = vec3(0.000, 0.333 ,0.667);
    
    return a + b*cos( 6.28318*(c*t+d) );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
        vec2 uv = fragCoord / iResolution.xy * 2.0 - 1.0;
        uv.x *= iResolution.x/iResolution.y;
        vec2 uv0 = uv;
        vec3 finalcol = vec3(0);
        
        for(float i=0.0;i<4.;i++){
        
            uv *= 1.7;
            uv = fract(uv);
            uv -= 0.5;
            float d = length(uv) * exp(-length(uv0));
            vec3 col = palette(length(uv0) + i*.4* iTime*.9);
            d = sin(d*8. + iTime)/8.;
            d= abs(d);
            d=pow(0.01/d,2.0);
            finalcol += col * d;
            
            }
            fragColor = vec4(finalcol,1);
}
