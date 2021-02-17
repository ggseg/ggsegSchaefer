## setup ----

source(here::here("data-raw", "setup.R"))
load(here::here("data", "schaefer7_200_3d.rda"))

source(here::here("data-raw", "setup.R"))

schaefer7_200_3d <- make_schaefer_3d(7, 200)

schaefer7_200_3d <- schaefer7_200_3d %>%
  tidyr::unnest(ggseg_3d) %>%
  as_tibble() %>%
  mutate(
    region = gsub("17Networks_|RH_|LH_", "", region),
    region = ifelse(grepl("Background", region), NA, region)
  ) %>%
  ggseg3d::as_ggseg3d_atlas()

# schaefer7_200 <- make_schaefer_2d(schaefer7_200_3d, 7, 200)
schaefer7_200 <- make_ggseg3d_2_ggseg(schaefer7_200,
                                      toleranse = 1,
                                      output_dir = "~/Desktop")

## write out ----

usethis::use_data(schaefer7_200,
                  schaefer7_200_3d,
                  overwrite = TRUE)
