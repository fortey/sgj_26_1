components {
  id: "item"
  component: "/scripts/item.script"
  properties {
    id: "key"
    value: "crystal"
    type: PROPERTY_TYPE_HASH
  }
}
components {
  id: "crystal_brightness_controller"
  component: "/resources/materials/crystal/crystal_brightness_controller.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"crystal\"\n"
  "material: \"/resources/materials/crystal/crystal.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/assets/main.atlas\"\n"
  "}\n"
  ""
  position {
    y: 1.266667
  }
  scale {
    x: 0.04
    y: 0.04
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"item\"\n"
  "mask: \"player\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "      y: 1.466667\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "  }\n"
  "  data: 1.5\n"
  "}\n"
  ""
}
