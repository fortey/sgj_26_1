#version 140

in mediump vec2 var_texcoord0;
in highp vec3 var_normal;
in highp vec4 var_position;
in highp vec4 var_view_position;
in highp vec4 var_texcoord0_shadow;

out vec4 out_fragColor;

uniform mediump sampler2D tex0;
uniform mediump sampler2D tex1;

uniform MaterialData {
    mediump vec4 u_melting_degree;
};

#include "/light_and_shadows/materials/fun.glsl"
#include "/light_and_shadows/materials/fog_fun.glsl"

void main()
{
    const float blur_width   = 0.5;
    const float blur_strength = 0.9;
    
    // Pre-multiply alpha since all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    vec2 texcoord = var_texcoord0.xy;
    vec4 color;
    if (u_melting_degree.x > 0) {
        float wave = sin(u_melting_degree.x * 4.0 + texcoord.x * 30.0) * 0.02;
        texcoord.y += wave;

        float edge_base = 1.0 - u_melting_degree.x;
        float edge_noise = sin(texcoord.x * 15.0 + u_melting_degree.x * 20.0) * 0.04;
        float melt_edge = edge_base + edge_noise;

        float edge_alpha = smoothstep(melt_edge + blur_width, melt_edge - blur_width, texcoord.y);

        if (edge_alpha < 0.001) {
            discard;
        }

        if (texcoord.y < edge_base - 0.1) {
            texcoord.y += (texcoord.y - edge_base) * 0.1 * u_melting_degree.x;
        }

        float blur_factor = 1.0 - abs((texcoord.y - melt_edge) / (blur_width * 0.5));
        blur_factor = clamp(blur_factor, 0.0, 1.0) * blur_strength;

        vec4 base_color = texture(tex0, texcoord);

        vec4 blurred_color = base_color;
        if (blur_factor > 0.0) {
            const float offset = 0.005;
            vec4 c1 = texture(tex0, texcoord + vec2( offset,  offset));
            vec4 c2 = texture(tex0, texcoord + vec2(-offset,  offset));
            vec4 c3 = texture(tex0, texcoord + vec2( offset, -offset));
            vec4 c4 = texture(tex0, texcoord + vec2(-offset, -offset));
            vec4 avg = (base_color + c1 + c2 + c3 + c4) * 0.2;
            blurred_color = mix(base_color, avg, blur_factor);
        }

        color = blurred_color * tint_pm;
        color.a *= edge_alpha;
    }
    else
    {
        color = texture(tex0, texcoord)*tint_pm;
    }
    // if(color.a < 0.1) discard;
    
// Editor does not support Lights and Shadows previews yet, so ignore it.
#ifdef EDITOR
    out_fragColor = color;
#else 
    // Shadow map
    vec3 minus_color = vec3(0.);
    if(shadow_color.w > 0.) // on
    {
        vec4 depth_proj = var_texcoord0_shadow / var_texcoord0_shadow.w;
        float shadow = shadow_calculation(depth_proj.xyzw);
        minus_color = shadow_color.xyz * shadow;
    };
    vec3 frag_color  = color.rgb;

    // Add the fog
    frag_color = add_fog(frag_color, var_view_position.z, fog.x, fog.y, fog_color.rgb*color.a, fog_color.a);

    out_fragColor = vec4(frag_color, color.a);
#endif
}
