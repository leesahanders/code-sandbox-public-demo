# UV Spatial Map 

# Bells and whistles 

## Custom scss

For fixing strange tables in vapor theme: 

```
$pink:     #ea39b8 !default;
$teal:     #03aa95 !default;

.datatables {
    font-size: .9rem !important;
    font-color: $white !important;
    color: $white !important;
}

.datatables .dt-buttons {
    font-color: $white !important;
    color: #03aa95 !important;
}
```


# For the developer

## TODO

-[] Fix zipcode to lat, long lookup, using the census API's: <https://www.census.gov/data/developers/data-sets.html> 
-[] Make maps with leaflet: <https://r-charts.com/spatial/interactive-maps-leaflet/> 
-[] Consider using kepler: <https://github.com/keplergl/kepler.gl> 
-[] Consider switching to choropleth: <https://r-charts.com/spatial/choropleth-map-ggplot2/> 
-[] Add alerts when click on state: <https://www.weather.gov/documentation/services-web-api> 
-[] Add more data using envstats: <https://cran.r-project.org/web//packages/EnvStats/EnvStats.pdf> 
-[] Add layers with different coloring: <https://rstudio.github.io/leaflet/articles/showhide.html> 
-[] Add cancer gov data: <https://stackoverflow.com/questions/49173967/trouble-using-jsonlites-fromjson-with-url-in-r> 
-[] Create a zipcode map: <https://stackoverflow.com/questions/59539423/creating-a-zipcode-map-in-r> 

## Preview

```
quarto preview dashboard-spatial.qmd --to dashboard --no-watch-inputs --no-browse
```

## Publish

In order to deploy it needs to be a project: 
```
quarto create project 
```

Done through: <https://quarto.org/docs/publishing/quarto-pub.html> 

# References 

Inspired by Jeremy Allen's Whale dashboard: <https://github.com/jeremy-allen/whale-dashboard/blob/main/gray-whales.qmd> 

# Publishing

Notes for the developer:

This content needs to be deployed with an image that supports the system dependencies for the curl package. For example: <ghcr.io/npelikan/pwb-session-daily:latest> or building your own from <https://github.com/sol-eng/pro-product-images> 

The [image can be declared](https://docs.posit.co/connect/user/publishing-r/index.html#target-image) when writing the rsconnect manifest: 

```r
rsconnect::writeManifest(image = "ghcr.io/npelikan/pwb-session-daily:latest")

rsconnect::writeManifest(...,
    image = "ghcr.io/rstudio/content-base:r4.0.5-py3.8.8-jammy")
rsconnect::deployApp(...,
    image = "ghcr.io/rstudio/content-base:r4.0.5-py3.8.8-jammy")
rsconnect::deployAPI(...,
    image = "ghcr.io/rstudio/content-base:r4.0.5-py3.8.8-jammy")
rsconnect::deployDoc(...,
    image = "ghcr.io/rstudio/content-base:r4.0.5-py3.8.8-jammy")
rsconnect::deploySite(...,
    image = "ghcr.io/rstudio/content-base:r4.0.5-py3.8.8-jammy")
```

It is also published to my quarto pub space. I run quarto publish quarto-pub from terminal after `cd`-ing in to the directory. Answer "Y" to overwrite my previous site and to use the correct account. For example, to publish this slide deck I'm running: `quarto publish quarto-pub 2024-git-demo.qmd`. It will need to be a quarto project. If you have an existing directory of documents that you want to treat as a project just invoke `quarto create-project` with no arguments from within the directory.

I can access my account and see my deployments at https://questionable.quarto.pub/.


