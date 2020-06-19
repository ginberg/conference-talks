# Displays the most popular downloaded packages from CRAN
suppressWarnings({
    library(cranlogs)
    library(dplyr)
    library(tibble)
    library(canvasXpress)
})

df <- cran_top_downloads(when = "last-month", count = 20) %>%
    select(package, count) %>%
    mutate(count = count / 1000000) %>%
    tibble::column_to_rownames("package") %>%
    t()

canvasXpress(data      = df,
             graphType = "Bar",
             title     = "Top downloaded packages from CRAN",
             subtitle  = "Last Month",
             xAxis2Title = "Count (million)",
             titleScaleFontFactor = 0.7,
             subtitleScaleFontFactor = 0.4,
             colorScheme = "Economist")
