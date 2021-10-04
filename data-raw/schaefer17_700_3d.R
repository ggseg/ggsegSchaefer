## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer17_700_3d <- make_schaefer_3d(17, 700)

schaefer17_700_3d <- schaefer17_700_3d %>%
  tidyr::unnest(ggseg_3d) %>%
  as_tibble() %>%
  mutate(
    region = gsub("17Networks_|RH_|LH_", "", region),
    region = ifelse(grepl("Background", region), NA, region)
  ) %>%
  ggseg3d::as_ggseg3d_atlas()

schaefer17_700 <- make_ggseg3d_2_ggseg(schaefer17_700_3d,
                                       steps = 2:7,
                                       tolerance = 1,
                                       output_dir = "~/Desktop/")
plot(schaefer17_700, show.legend = FALSE)

## write out ----

usethis::use_data(schaefer17_700_3d,
                  schaefer17_700,
                  overwrite = TRUE)
