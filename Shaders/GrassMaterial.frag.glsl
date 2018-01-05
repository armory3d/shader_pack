#version 450

in vec3 color;
in vec4 lampPos;

out vec4 fragColor;

uniform sampler2D shadowMap;

void main() {

	vec3 lPos = lampPos.xyz / vec3(lampPos.w);
    const float shadowsBias = 0.001;
    float visibility = max(float((texture(shadowMap, lPos.xy).x + shadowsBias) > lPos.z), 0.45);

	fragColor = vec4(color * visibility, 1.0);
}
