embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"stone4\"\n"
  "material: \"/light_and_shadows/materials/sprite/light_sprite.material\"\n"
  "textures {\n"
  "  sampler: \"tex0\"\n"
  "  texture: \"/assets/main.atlas\"\n"
  "}\n"
  "textures {\n"
  "  sampler: \"tex1\"\n"
  "  texture: \"/assets/main.atlas\"\n"
  "}\n"
  ""
  rotation {
    x: -0.23004974
    w: 0.97317886
  }
  scale {
    x: 0.04
    y: 0.04
    z: 0.04
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"default\"\n"
  "mask: \"player\"\n"
  "mask: \"enemy\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_CAPSULE\n"
  "    position {\n"
  "      y: 8.0\n"
  "      z: -1.0\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 2\n"
  "  }\n"
  "  data: 4.0\n"
  "  data: 8.0\n"
  "}\n"
  ""
}
