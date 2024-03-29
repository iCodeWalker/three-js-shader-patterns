// accessing vUv varying
varying vec2 vUv;

void main()
{
    // gl_FragColor = vec4(0.5, 0.0, 1.0, 1.0);
    // ############# Pattern 1 #############
    // ====> gradient color pattern

    // gl_FragColor = vec4(vUv, 1.0, 1.0); or 
    // gl_FragColor = vec4(vUv.x,vUv.y, 1.0, 1.0);

    // ############# Pattern 2 #############
    // ====> gradient color pattern

    // gl_FragColor = vec4(vUv, 0.5, 1.0); 

    // ############# Pattern 3 #############
    // ====> Gray scale gradient
    // gl_FragColor = vec4(0.5, 0.5, 0.5, 1.0);

    // ====> Black and white gradient in horizontal direction
    // gl_FragColor = vec4(vUv.x, vUv.x, vUv.x, 1.0);

    // ###### Create a float variable for stroing the gradient color and use the value on the plane.
    // float strength = vUv.x;

    // ############# Pattern 4 #############
    // ====> Black and white gradient in vertical direction

    // float strength = vUv.y;

    // ############# Pattern 5 #############
    // ====> Black and white gradient in negative vertical direction

    // float strength = 1.0 - vUv.y;

    // ############# Pattern 6 #############
    // ====> Black and white gradient to have brighter color. Value starts from 0 but increases faster 
    // ====> and have brighter color
    // float strength = vUv.y * 10.0;

    // ############# Pattern 7 #############
    // ====> Repeating black and white pattern
    // float strength = mod(vUv.y * 10.0, 1.0);

    // ############# Pattern 8 #############
    // ====> Repeating black and white pattern with step
    // float strength = mod(vUv.y * 10.0, 1.0);
    // step function : if it reaches a limit than the value is 0 otherwise 1. 
    // strength = step(0.5, strength); // Here limit is 0.5

    // ############# Pattern 9 #############
    // ====> Repeating black and white pattern with step which has more dark part
    // float strength = mod(vUv.y * 10.0, 1.0);
    // step function : if it reaches a limit than the value is 0 otherwise 1. 
    // strength = step(0.8, strength); // Here limit is 0.8

    // ############# Pattern 10 #############
    // ====> Repeating black and white pattern (vertical lines) with step which has more dark part
    // float strength = mod(vUv.x * 10.0, 1.0);

    // strength = step(0.8, strength);

    // ############# Pattern 11 #############
    // ====> Repeating black and white boxes pattern.

    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    // strength += step(0.8, mod(vUv.y * 10.0, 1.0));

    // ############# Pattern 12 #############
    // ====> Repeating black and white dot pattern.

    // float strength = step(0.8, mod(vUv.x * 10.0, 1.0));
    // strength *= step(0.8, mod(vUv.y * 10.0, 1.0));

    // ############# Pattern 13 #############
    // ====> Repeating black and white line pattern.

    // float strength = step(0.4, mod(vUv.x * 10.0, 1.0));
    // strength *= step(0.8, mod(vUv.y * 10.0, 1.0));

    // ############# Pattern 14 #############
    // ====> Repeating black and white line-line pattern.

    // float barX = step(0.4, mod(vUv.x * 10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0, 1.0));

    // float barY = step(0.8, mod(vUv.x * 10.0, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));

    // float strength = barX + barY;

    // ############# Pattern 15 #############

    // float barX = step(0.4, mod(vUv.x * 10.0, 1.0));
    // barX *= step(0.8, mod(vUv.y * 10.0 + 0.2, 1.0));

    // float barY = step(0.8, mod(vUv.x * 10.0 + 0.2, 1.0));
    // barY *= step(0.4, mod(vUv.y * 10.0, 1.0));

    // float strength = barX + barY;

    // ############# Pattern 16 #############
    // garadient on both sides from the center

    // float strength = abs(vUv.x - 0.5);

    // ############# Pattern 17 #############
    // combination of both gradient vertical and horizontal of both sides from the center
    // float strength = min(abs(vUv.x - 0.5) ,abs(vUv.y - 0.5));

    // ############# Pattern 18 #############
    // float strength = max(abs(vUv.x - 0.5) ,abs(vUv.y - 0.5));

    // ############# Pattern 19 #############
    // ====> Black box inside white box pattern
    // float strength = step(0.2, max(abs(vUv.x - 0.5) ,abs(vUv.y - 0.5)));

    // ############# Pattern 20 #############
    // ====> Black box inside smaller white box
    float square1 = step(0.2, max(abs(vUv.x - 0.5) ,abs(vUv.y - 0.5)));
    float square2 = 1.0 - step(0.25, max(abs(vUv.x - 0.5) ,abs(vUv.y - 0.5)));

    float strength = square1 * square2;

    gl_FragColor = vec4(vec3(strength), 1.0);


}