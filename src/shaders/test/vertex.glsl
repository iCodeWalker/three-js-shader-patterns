varying vec2 vUv;

void main()
{
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);

    // assigning value of uv attribute to varying vUv for accessing it in the Fragment Shader.
    vUv = uv;
}