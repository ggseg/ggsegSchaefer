atlas_names_7 <- paste0(
  "schaefer7_",
  c(100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
)
atlas_names_17 <- paste0(
  "schaefer17_",
  c(100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
)

for (nm in c(atlas_names_7, atlas_names_17)) {
  atlas <- do.call(nm, list())

  describe(paste(nm, "atlas"), {
    it("is a ggseg_atlas", {
      expect_s3_class(atlas, "ggseg_atlas")
      expect_s3_class(atlas, "cortical_atlas")
    })

    it("is valid", {
      expect_true(ggseg.formats::is_ggseg_atlas(atlas))
    })
  })
}

describe("schaefer7_400 atlas rendering", {
  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("vdiffr")
    vdiffr::expect_doppelganger(
      "schaefer7_400-2d",
      ggseg::brain_test_plot(schaefer7_400())
    )
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d::ggseg3d(atlas = schaefer7_400())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})
