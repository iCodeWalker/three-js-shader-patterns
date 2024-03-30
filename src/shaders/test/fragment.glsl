// "define" is used for the variables whose value is not going to change. It is cheaper than variables.
#define PI 3.1415926535897932384


// accessing vUv varying
varying vec2 vUv;

// Function for having random values
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// Function to rotate uv coordinates
vec2 rotate(vec2 uv, float rotation, vec2 mid) {
    return vec2(
        cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
        cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

//	Classic Perlin 2D Noise 
//	by Stefan Gustavson
//
vec2 fade(vec2 t) {return t*t*t*(t*(t*6.0-15.0)+10.0);}

vec4 permute(vec4 x){return mod(((x*34.0)+1.0)*x, 289.0);}

float cnoise(vec2 P){
  vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
  vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
  Pi = mod(Pi, 289.0); // To avoid truncation effects in permutation
  vec4 ix = Pi.xzxz;
  vec4 iy = Pi.yyww;
  vec4 fx = Pf.xzxz;
  vec4 fy = Pf.yyww;
  vec4 i = permute(permute(ix) + iy);
  vec4 gx = 2.0 * fract(i * 0.0243902439) - 1.0; // 1/41 = 0.024...
  vec4 gy = abs(gx) - 0.5;
  vec4 tx = floor(gx + 0.5);
  gx = gx - tx;
  vec2 g00 = vec2(gx.x,gy.x);
  vec2 g10 = vec2(gx.y,gy.y);
  vec2 g01 = vec2(gx.z,gy.z);
  vec2 g11 = vec2(gx.w,gy.w);
  vec4 norm = 1.79284291400159 - 0.85373472095314 * 
    vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11));
  g00 *= norm.x;
  g01 *= norm.y;
  g10 *= norm.z;
  g11 *= norm.w;
  float n00 = dot(g00, vec2(fx.x, fy.x));
  float n10 = dot(g10, vec2(fx.y, fy.y));
  float n01 = dot(g01, vec2(fx.z, fy.z));
  float n11 = dot(g11, vec2(fx.w, fy.w));
  vec2 fade_xy = fade(Pf.xy);
  vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
  float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
  return 2.3 * n_xy;
}

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
    // float square1 = step(0.2, max(abs(vUv.x - 0.5) ,abs(vUv.y - 0.5)));
    // float square2 = 1.0 - step(0.25, max(abs(vUv.x - 0.5) ,abs(vUv.y - 0.5)));

    // float strength = square1 * square2;

    // ############# Pattern 21 #############
    // float strength = floor(vUv.x);
    // float strength = floor(vUv.x * 10.0) + 0.4;
    // float strength = floor(vUv.x * 10.0) / 10.0;

    // ############# Pattern 22 #############
    // ====> chess pattern
    // float strength = floor(vUv.x * 10.0) / 10.0;
    // strength *= floor(vUv.y * 10.0) / 10.0;

    // ############# Pattern 23 #############
    // ====> static disturbance pattern
    // We need a random value for this but there is nothing like random function in GLSL.
    // We can achieve this by using sin, frac functions, so it generates a value so unpredictable that it looks
    // like the value is random.
    // float strength = random(vUv);

    // ############# Pattern 24 #############
    // ====> Big random color boxes
    // vec2 gridUv = vec2(
    //     floor(vUv.x * 10.0) / 10.0,
    //     floor(vUv.y * 10.0) / 10.0
    // );

    // float strength = random(gridUv);

    // ############# Pattern 25 #############
    // ====> Big random color boxes with some offset in y-axis
    // vec2 gridUv = vec2(
    //     floor(vUv.x * 10.0) / 10.0,
    //     floor((vUv.y + vUv.x * 0.5) * 10.0) / 10.0
    // );

    // float strength = random(gridUv);

    // ############# Pattern 26 #############
    // ====> gradient starting from corner (0,0)
    // float strength = length(vUv);

    // ############# Pattern 27 #############
    // ====> gradient from center in circle shape
    // float strength = length(vUv - 0.5);

    // float strength = distance(vUv,vec2(0.5, 0.5));
    // float strength = distance(vUv,vec2(0.3, 0.5));

    // ############# Pattern 28 #############
    // ====> brighter gradient from center in circle shape
    // float strength = 1.0 - distance(vUv,vec2(0.5, 0.5));

    // ############# Pattern 29 #############
    // ====> brighter gradient from center in circle shape in dark plane
    // ##### Point light effect ######
    // float strength = 0.015/distance(vUv,vec2(0.5, 0.5));

    // ############# Pattern 30 #############
    // ====> brighter gradient from center in circle shape in dark plane (streched light)
    // ##### streched light effect ######
    // vec2 lightUv = vec2(
    //     vUv.x * 0.1 + 0.45,
    //     vUv.y * 0.5 + 0.25
    // );
    // float strength = 0.015/distance(lightUv,vec2(0.5, 0.5));

    // ############# Pattern 31 #############
    // ====> star pattern

    // // For X-axis
    // vec2 lightUvX = vec2(
    //     vUv.x * 0.1 + 0.45,
    //     vUv.y * 0.5 + 0.25
    // );
    // float lightX =  0.015/distance(lightUvX,vec2(0.5, 0.5));

    // // For Y-axis
    // vec2 lightUvY = vec2(
    //     vUv.y * 0.1 + 0.45,
    //     vUv.x * 0.5 + 0.25
    // );
    // float lightY =  0.015/distance(lightUvY,vec2(0.5, 0.5));

    // float strength = lightX * lightY;

    // ############# Pattern 32 #############
    // ====> star pattern (rotated)
    // Here we need to rotate the uv coordinates. Rotating uv coordinates is not easy and we need a function to do it.

    // Rotated uv coordinates

    // float pi = 3.14159265359;
    // vec2 rotatedUv = rotate(vUv, pi, vec2(0.5,0.5));
    // vec2 rotatedUv = rotate(vUv, pi * 0.25, vec2(0.5));

    // vec2 rotatedUv = rotate(vUv, PI * 0.25, vec2(0.5));


    // // For X-axis
    // vec2 lightUvX = vec2(
    //     rotatedUv.x * 0.1 + 0.45,
    //     rotatedUv.y * 0.5 + 0.25
    // );
    // float lightX =  0.015/distance(lightUvX,vec2(0.5, 0.5));

    // // For Y-axis
    // vec2 lightUvY = vec2(
    //     rotatedUv.y * 0.1 + 0.45,
    //     rotatedUv.x * 0.5 + 0.25
    // );
    // float lightY =  0.015/distance(lightUvY,vec2(0.5, 0.5));

    // float strength = lightX * lightY;

    // ############# Pattern 33 #############
    // ====> Circles 
    // with gradient in the circle at center
    // float strength = distance(vUv, vec2(0.5));

    // with black circle at the center
    // float strength = step(0.25, distance(vUv, vec2(0.5)));

    // ############# Pattern 34 #############
    // ring gradient at center
    // float strength = abs(distance(vUv, vec2(0.5)) - 0.25);

    // ############# Pattern 35 #############
    // ====> ring at center
    // float strength = step(0.01, abs(distance(vUv, vec2(0.5)) - 0.25));

    // ############# Pattern 36 #############
    // ====> ring at center (contrast color)
    // float strength = 1.0 - step(0.01, abs(distance(vUv, vec2(0.5)) - 0.25));

    // ############# Pattern 37 #############
    // ====> ameoba type pattern
    // vec2 wavedUv = vec2(
    //     vUv.x,
    //     vUv.y + sin(vUv.x * 30.0) * 0.1
    // );

    // float strength = 1.0 - step(0.01, abs(distance(wavedUv, vec2(0.5)) - 0.25));

    // ############# Pattern 38 #############
    // ====> more random pattern
    // vec2 wavedUv = vec2(
    //     vUv.x + sin(vUv.y * 30.0) * 0.1,
    //     vUv.y + sin(vUv.x * 30.0) * 0.1
    // );

    // float strength = 1.0 - step(0.01, abs(distance(wavedUv, vec2(0.5)) - 0.25));

    // ############# Pattern 39 #############
    // vec2 wavedUv = vec2(
    //     vUv.x + sin(vUv.y * 100.0) * 0.1,
    //     vUv.y + sin(vUv.x * 100.0) * 0.1
    // );

    // float strength = 1.0 - step(0.01, abs(distance(wavedUv, vec2(0.5)) - 0.25));

    // ############# Pattern 40 #############
    // =======> Angles
    // float angle = atan(vUv.x, vUv.y);
    // float strength = angle;

    // ############# Pattern 41 #############
    // =======> Angles
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // float strength = angle;

    // ############# Pattern 42 #############
    // =======> Angles
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // float strength = angle ;

    // ############# Pattern 43 #############
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // angle *= 20.0;
    // angle = mod(angle, 1.0);
    // float strength = angle ;

    // ############# Pattern 44 #############
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // float strength = sin(angle * 200.0) ;

    // ############# Pattern 45 #############
    // ====> sinusoid circle
    // float angle = atan(vUv.x - 0.5, vUv.y - 0.5);
    // angle /= PI * 2.0;
    // angle += 0.5;
    // float sinusoid = sin(angle * 100.0) ;

    // // changed the radius of the circle depending upon the sinusoid value
    // float radius = 0.25 + sinusoid * 0.02;

    // float strength = 1.0 - step(0.01, abs(distance(vUv, vec2(0.5)) - radius));

    // ############# Pattern 46 #############
    // ====> Perlin noise
    // Perlin noise is used to recreate natural shapes like clouds, smoke, water, fire, terrain elevation.
    // but it can also be used to animate the grass or snow moving in the wind.
    // float strength = cnoise(vUv * 10.0);

    // ############# Pattern 47 #############
    // float strength = step(0.0, cnoise(vUv * 10.0));

    // ############# Pattern 48 #############
    // float strength = abs(cnoise(vUv * 10.0));
    // float strength = 1.0 - abs(cnoise(vUv * 10.0));

    // ############# Pattern 49 #############
    // float strength = sin(cnoise(vUv * 10.0) * 20.0);
    
    // ############# Pattern 50 #############
    // float strength = step(0.9, sin(cnoise(vUv * 10.0) * 20.0));


    // ############# Pattern (Color Version) #############

    // Color mix version
    float strength = step(0.9, sin(cnoise(vUv * 10.0) * 20.0));

    // Some times the strength in higher than 1.0 and the output gets extrapolated.
    // Due to this we gets strange color output.
    // To fix this we have to clamp the strength
    strength = clamp(strength, 0.0, 1.0);

    vec3 blackColor = vec3(0.0);
    vec3 uvColor = vec3(vUv, 1.0);

    vec3 mixedColor = mix(blackColor, uvColor, strength);

    gl_FragColor = vec4(mixedColor, 1.0);

    // Black and White version
    // gl_FragColor = vec4(vec3(strength), 1.0);


}