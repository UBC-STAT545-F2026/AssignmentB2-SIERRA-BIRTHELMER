
# assignmentB2SierraBirthelmer

The `assignmentB2SierraBirthelmer` package provides a function for
summarizing demographic characteristics in datasets containing repeated
observations per participant, such as daily diary data.

The `participant_summary()` function identifies unique participants and
calculates the number and percentage of participants in each category of
a selected variable. This makes it easier to summarize participant
characteristics without counting individuals multiple times.

## Installation

You can install the package from GitHub using:

``` r
# install.packages("remotes")
remotes::install_github(
  "UBC-STAT545-F2026/assignmentB2SierraBirthelmer",
  ref = "0.1.0"
)
```

## Example

First, load the package:

``` r
library(assignmentB2SierraBirthelmer)
```

Create an example dataset with repeated observations:

``` r
example_data <- data.frame(
  id = c(1, 1, 2, 2, 3, 3),
  gender = c("Female", "Female", "Male",
             "Male", "Female", "Female")
)
```

Use `participant_summary()` to calculate the number and percentage of
unique participants in each gender category:

``` r
participant_summary(example_data, id, gender)
```

    ##   gender n percentage
    ## 1 Female 2      66.67
    ## 2   Male 1      33.33
