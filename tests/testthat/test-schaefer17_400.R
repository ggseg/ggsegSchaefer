# ggseg ----
test_that("atlases are true ggseg atlases", {

  expect_true(is_brain_atlas(schaefer17_400))

})

test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = schaefer17_400),c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17_400, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17_400, mapping = aes(fill = region)) +
              scale_fill_brain("schaefer17_400", package = "ggsegSchaefer"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17_400, mapping = aes(fill = region)) +
              scale_fill_brain("schaefer17_400", package = "ggsegSchaefer"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = schaefer17_400, mapping=aes(fill=region), adapt_scales = F ),c("gg","ggplot"))

})


# ggseg3d ----
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=schaefer17_400_3d),
    c("plotly", "htmlwidget")
  )
})

test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(schaefer17_400_3d))

})
