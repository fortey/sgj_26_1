varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform fs_uniforms
{
	mediump vec4 tint;
	mediump vec4 u_brightness_offset;
};


float plot(vec2 st, float pct){
	return smoothstep(pct - 0.01, pct, st.y) - smoothstep(pct, pct + 0.01, st.y);
}
void main()
{
	// Pre-multiply alpha since all runtime textures already are
	lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
	lowp vec2 texcoord = var_texcoord0.xy;

	float y = smoothstep(0.1, 0.9, texcoord.x + u_brightness_offset.x/100);
	lowp vec4 color = texture2D(texture_sampler, texcoord);
	float pct = plot(texcoord, y);
	color = (1.0 - pct) * color + pct * (color + vec4(0.5, 0.5, 0.5, 0.0) * step(0.01, color.a));

	
	gl_FragColor = color;
}
