## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer17_500_3d <- make_schaefer_3d(17, 500)

schaefer17_500_3d <- schaefer17_500_3d %>%
  tidyr::unnest(ggseg_3d) %>%
  as_tibble() %>%
  mutate(
    region = gsub("17Networks_|RH_|LH_", "", region),
    region = ifelse(grepl("Background", region), NA, region)
  ) %>%
  ggseg3d::as_ggseg3d_atlas()

schaefer17_500 <- make_ggseg3d_2_ggseg(schaefer17_500_3d,
                                       steps = 2:7,
                                       tolerance = 1,
                                       output_dir = "~/Desktop/")
## write out ----

usethis::use_data(schaefer17_500_3d,
                  schaefer17_500, overwrite = TRUE)
