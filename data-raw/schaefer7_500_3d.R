## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_500_3d <- make_schaefer_3d(7, 500)


schaefer7_500_3d <- schaefer7_500_3d %>%
  tidyr::unnest(ggseg_3d) %>%
  as_tibble() %>%
  mutate(
    region = gsub("17Networks_|RH_|LH_", "", region),
    region = ifelse(grepl("Background", region), NA, region)
  ) %>%
  ggseg3d::as_ggseg3d_atlas()

schaefer7_500 <- make_ggseg3d_2_ggseg(schaefer7_500_3d,
                                      steps = 2:7,
                                      tolerance = 1,
                                      output_dir = "~/Desktop/")

## write out ----

usethis::use_data(schaefer7_500_3d,
                  schaefer7_500,
                  overwrite = TRUE)
