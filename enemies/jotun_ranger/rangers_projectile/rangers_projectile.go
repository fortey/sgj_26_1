components {
  id: "rangers_projectile"
  component: "/enemies/jotun_ranger/rangers_projectile/rangers_projectile.script"
}
embedded_components {
  id: "sprite_1"
  type: "sprite"
  data: "default_animation: \"bullet_ice1\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/enemies.atlas\"\n"
  "}\n"
  ""
  scale {
    x: 0.04
    y: 0.04
    z: 0.04
  }
}
embedded_components {
  id: "sprite_2"
  type: "sprite"
  data: "default_animation: \"bullet_ice2\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "size {\n"
  "  x: 94.0\n"
  "  y: 30.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/enemies.atlas\"\n"
  "}\n"
  ""
  scale {
    x: 0.04
    y: 0.04
    z: 0.04
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"projectile\"\n"
  "mask: \"player\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_CAPSULE\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "      z: 0.70710677\n"
  "      w: 0.70710677\n"
  "    }\n"
  "    index: 0\n"
  "    count: 2\n"
  "  }\n"
  "  data: 0.75\n"
  "  data: 1.0\n"
  "}\n"
  "event_collision: false\n"
  "event_contact: false\n"
  ""
}
