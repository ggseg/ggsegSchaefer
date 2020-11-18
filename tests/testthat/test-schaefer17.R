# ggseg ----
context("test-schaefer17-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("schaefer17", package = "ggsegSchaefer")), 399)

  expect_error(brain_pal("schaefer17"), "not a valid")

  expect_true(all(names(brain_pal("schaefer17", package = "ggsegSchaefer")) %in% brain_regions(schaefer17)))
})

context("test-schaefer17-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_brain_atlas(schaefer17))

})

context("test-schaefer17-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = schaefer17),c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17, mapping = aes(fill = region)) +
              scale_fill_brain("schaefer17", package = "ggsegSchaefer"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17, mapping = aes(fill = region)) +
              scale_fill_brain("schaefer17", package = "ggsegSchaefer"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17, mapping=aes(fill=region), adapt_scales = F ),c("gg","ggplot"))

})


# ggseg3d ----
context("test-schaefer17-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=schaefer17_3d),
    c("plotly", "htmlwidget")
  )
})



context("test-schaefer17-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(schaefer17_3d))

})
