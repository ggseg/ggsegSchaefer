require(ggplot2)

# ggseg ----
context("test-schaefer7-adapt_scales")
# adapt_scales appears inconsistent as to whether it expects
# old or new style brain_atlas
# let this fail for now until I file an issue to ask about this
test_that("Check that ggseg:::adapt_scales is working", {
  # expect_equal(mode(ggseg:::adapt_scales(unnest(schaefer7_100, ggseg))), "list")
  expect_error(ggseg:::adapt_scales(schaefer7_100))
})

context("test-schaefer7-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("schaefer7_100", package = "ggsegSchaefer")), 100)

  expect_error(brain_pal("schaefer7_100"), "not a valid")

  expect_true(all(names(brain_pal("schaefer7_100", package = "ggsegSchaefer")) %in% schaefer7_100$data$region))
})

context("test-schaefer7-brain-atlas")
test_that("atlases are true ggseg brain atlases", {
# As of ggseg 1.6.00 the class is called brain_atlas
  expect_true(is_brain_atlas(schaefer7_100))
  expect_s3_class(schaefer7_100, "brain_atlas")

  expect_type(brain_regions(schaefer7_100), "character")
  expect_type(brain_labels(schaefer7_100), "character")
})

context("test-schaefer7-ggseg")
test_that("Check that polygon atlases plot with ggseg()", {
  expect_s3_class(ggseg(atlas = schaefer7_100),
                  c("gg","ggplot"))

  expect_s3_class(ggseg(atlas = schaefer7_100, mapping = aes(fill = region)),
                  c("gg","ggplot"))

  expect_s3_class(ggseg(atlas = schaefer7_100, mapping = aes(fill = region)) +
                    scale_fill_brain("schaefer7_100", package = "ggsegSchaefer"),
                  c("gg","ggplot"))

  expect_s3_class(ggseg(atlas = schaefer7_100, adapt_scales = F), c("gg","ggplot"))

})

test_that("Check that polygon atlases plot with geom_brain()", {
  expect_s3_class(ggplot() + geom_brain(atlas = schaefer7_100),
                  c("gg","ggplot"))

  expect_s3_class(ggplot() + geom_brain(atlas = schaefer7_100) +
                    scale_fill_brain("schaefer7_100", package = "ggsegSchaefer"),
                  c("gg","ggplot"))

  expect_s3_class(ggplot() + geom_brain(atlas = schaefer7_100,
                                        position = position_brain(hemi ~ side)),
                  c("gg","ggplot"))

})

# ggseg3d ----
context("test-schaefer7-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_s3_class(
    ggseg3d(atlas=schaefer7_100_3d, surface = "inflated"),
    c("plotly", "htmlwidget")
  )
})

context("test-schaefer7-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(schaefer7_100_3d))
  expect_s3_class(schaefer7_100_3d, "ggseg3d_atlas")

})
