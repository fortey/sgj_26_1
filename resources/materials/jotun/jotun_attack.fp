varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform fs_uniforms
{
	mediump vec4 tint;
	mediump vec4 u_brightness_time;
	mediump vec4 u_waving_time;
};

void main()
{
	// Pre-multiply alpha since all runtime textures already are
	lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
	lowp vec2 texcoord = var_texcoord0.xy;
	texcoord.x = var_texcoord0.x + sin(u_waving_time.x + texcoord.y*25) * 0.01;
	gl_FragColor = texture2D(texture_sampler, texcoord) * (cos(u_brightness_time.x) + 2)/2;
}
