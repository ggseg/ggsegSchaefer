require(ggplot2)

# ggseg ----
context("test-schaefer17-adapt_scales")
test_that("Check that ggseg:::adapt_scales is working", {
  # expect_equal(mode(ggseg:::adapt_scales(unnest(schaefer17_100, ggseg))), "list")
  expect_error(ggseg:::adapt_scales(schaefer17_100))
})

context("test-schaefer17-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("schaefer17_100", package = "ggsegSchaefer")), 100)

  expect_error(brain_pal("schaefer17_100"), "not a valid")

  expect_true(all(names(brain_pal("schaefer17_100", package = "ggsegSchaefer")) %in% schaefer17_100$data$region))
})

context("test-schaefer17-brain-atlas")
test_that("atlases are true ggseg brain atlases", {
  # As of ggseg 1.6.00 the class is called brain_atlas
  expect_true(is_brain_atlas(schaefer17_100))
  expect_s3_class(schaefer17_100, "brain_atlas")

  expect_type(brain_regions(schaefer17_100), "character")
  expect_type(brain_labels(schaefer17_100), "character")
})

context("test-schaefer17-ggseg")
test_that("Check that polygon atlases plot with ggseg()", {
  expect_s3_class(ggseg(atlas = schaefer17_100),
                  c("gg","ggplot"))

  expect_s3_class(ggseg(atlas = schaefer17_100, mapping = aes(fill = region)),
                  c("gg","ggplot"))

  expect_s3_class(ggseg(atlas = schaefer17_100, mapping = aes(fill = region)) +
                    scale_fill_brain("schaefer17_100", package = "ggsegSchaefer"),
                  c("gg","ggplot"))

  expect_s3_class(ggseg(atlas = schaefer17_100, adapt_scales = F), c("gg","ggplot"))

})

test_that("Check that polygon atlases plot with geom_brain()", {
  expect_s3_class(ggplot() + geom_brain(atlas = schaefer17_100),
                  c("gg","ggplot"))

  expect_s3_class(ggplot() + geom_brain(atlas = schaefer17_100) +
                    scale_fill_brain("schaefer17_100", package = "ggsegSchaefer"),
                  c("gg","ggplot"))

  expect_s3_class(ggplot() + geom_brain(atlas = schaefer17_100,
                                        position = position_brain(hemi ~ side)),
                  c("gg","ggplot"))

})

# ggseg3d ----
context("test-schaefer17-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_s3_class(
    ggseg3d(atlas=schaefer17_100_3d, surface = "inflated"),
    c("plotly", "htmlwidget")
  )
})

context("test-schaefer17-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(schaefer17_100_3d))
  expect_s3_class(schaefer17_100_3d, "ggseg3d_atlas")

})
