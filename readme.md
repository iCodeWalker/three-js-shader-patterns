# Three.js Shader Patterns

1. We could use textures for making patterns like stars, circles, light lens, waves etc, but drawing the shape gices us more control.
2. All we need is coordinates and mathematical skills.

3. As we are going to draw the shapes on the plane in the Fragment shader we need the UV coordinates.
   We get the uv attribute and send it to the Fragment Shader as a varying named vUv.

   The uv coordinates (vUv in the fragment) goes from 0.0, 0.0 on the bottom left corner to 1.0, 1.0 on the top-right corner.

4. Drawing patterns on plane :

   1. Pattern 1 : Gradient Color on the plane.
      gl_FragColor = vec4(vUv.x,vUv.y, 1.0, 1.0);

   2. Pattern 2 : Gradient Color on the plane.
      gl_FragColor = vec4(vUv.x,vUv.y, 0.0, 1.0);

   3. Pattern 3 : Black and white Gradient Color on the plane.
      gl_FragColor = vec4(0.5, 0.5, 0.5, 1.0); // For gray scale all rgb values must be same

      gl_FragColor = vec4(vUv.x, vUv.x, vUv.x, 1.0); // For Black and white Gradient Color
