components {
  id: "sun"
  component: "/scripts/sun.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"sun\"\n"
  "material: \"/resources/materials/crystal/crystal.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
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
