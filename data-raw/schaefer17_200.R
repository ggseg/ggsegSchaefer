## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer17_200_3d.rda"))

## make ggseg atlas ----

schaefer17_200 <- make_schaefer_2d(schaefer17_200_3d, 17, 200)

## write out ----

usethis::use_data(schaefer17_200, overwrite = TRUE)
