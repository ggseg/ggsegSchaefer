
## Polygon data ----
#' Schaefer 7 network parcellation
#'
#'
#' @docType data
#' @name schaefer7
#' @usage data(schaefer7)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A data.frame with 10913 observations and 11 variables
#' \describe{
#'   \item{long}{coordinates for the x-axis}
#'   \item{lat}{coordinates for the y-axis}
#'   \item{region}{name of region}
#'   \item{hemi}{name of the hemisphere (left, right)}
#'   \item{side}{which side to view (medial, lateral)}
#'   \item{acronym}{abbreviated name of region}
#'   \item{lobe}{lobe location}
#'   \item{label}{label from recon-all segmentation}
#'   \item{atlas}{name of the atlas}
#' }
#' @examples
#' data(schaefer7)
"schaefer7"


#' Schaefer 7 network parcellation
#'
#' @docType data
#' @name schaefer17
#' @usage data(schaefer17)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A data.frame with 10913 observations and 11 variables
#' \describe{
#'   \item{long}{coordinates for the x-axis}
#'   \item{lat}{coordinates for the y-axis}
#'   \item{region}{name of region}
#'   \item{hemi}{name of the hemisphere (left, right)}
#'   \item{side}{which side to view (medial, lateral)}
#'   \item{label}{label from recon-all segmentation}
#'   \item{atlas}{name of the atlas}
#' }
#' @examples
#' data(schaefer17)
"schaefer17"


### 3d meshes ----

#' Schaefer 7 network parcellation
#'
#' Mesh data for the 7 resting-state networks of
#' the Schaefer et al. (2018) networks.
#'
#' @docType data
#' @name schaefer7_3d
#' @usage data(schaefer7_3d)
#' @family ggseg3d_atlases
#' @keywords datasets
#'
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A tibble with 4 observations and a nested data.frame
#' \describe{
#'   \item{surf}{type of surface (`inflated` or `white`)}
#'   \item{hemi}{hemisphere (`left`` or `right`)}
#'   \item{data}{data.frame of necessary variables for plotting
#'   }
#'
#'   \item{atlas}{String. atlas name}
#'   \item{roi}{numbered region from surface}
#'   \item{annot}{concatenated region name}
#'   \item{label}{label `hemi_annot` of the region}
#'   \item{mesh}{list of meshes in two lists: vb and it}
#'   \item{area}{name of area in full}
#'   \item{colour}{HEX colour of region}
#' }
#' @examples
#' data(schaefer7_3d)
"schaefer7_3d"



#' Schaefer 17 network parcellation
#'
#' Mesh data for the 17 resting-state networks of
#' the Schaefer et al. (2018) networks.
#'
#' @docType data
#' @name schaefer17_3d
#' @usage data(schaefer17_3d)
#' @family ggseg3d_atlases
#' @keywords datasets
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A tibble with 4 observations and a nested data.frame
#' \describe{
#'   \item{surf}{type of surface (`inflated` or `white`)}
#'   \item{hemi}{hemisphere (`left`` or `right`)}
#'   \item{data}{data.frame of necessary variables for plotting
#'   }
#'
#'   \item{atlas}{String. atlas name}
#'   \item{roi}{numbered region from surface}
#'   \item{annot}{concatenated region name}
#'   \item{label}{label `hemi_annot` of the region}
#'   \item{mesh}{list of meshes in two lists: vb and it}
#'   \item{area}{name of area in full}
#'   \item{colour}{HEX colour of region}
#' }
#' @examples
#' data(schaefer17_3d)
"schaefer17_3d"
