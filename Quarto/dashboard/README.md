# Quarto Daily Report

**Access the dashboard at: <https://colorado.posit.co/rsc/lisas-quarto-dashboard/>**

# Todo

- [x] Today's date
- [x] Check if today is a US holiday
- [x] When is the next US holiday
- [x] Today's weather
- [x] Weather forecast
- [x] Today's UV index
- [x] Current posit product versions
- [x] RSS feed for R Journal
- [x] RSS feed for r-weekly 
- [x] RSS feed for Posit blogs 
- [x] Automotive recalls
- [x] Include the readme as a "include" example [1](https://quarto.org/docs/authoring/includes.html) 
- [] Fix value box text size [1](https://github.com/quarto-dev/quarto-cli/blob/823bcf97e698f955390df46b0ea163aa5d9a8587/src/resources/formats/dashboard/quarto-dashboard.scss#L640)
- [] Webcam of the day [1](https://allsky.gi.alaska.edu/) [2](https://seaice.alaska.edu/gi/observatories/barrow_webcam/) [3](https://explore.org/livecams/brown-bears/river-watch-brown-bear-salmon-cams) [4](https://explore.org/livecams/orcas/orcalab-base) [5](https://www.allaboutbirds.org/cams/#)
- [] FDA recalls: <https://open.fda.gov/apis/>
- [] Product recalls 
- [] Air quality: [1](https://aqs.epa.gov/aqsweb/documents/data_api.html) [2](https://developers.google.com/maps/documentation/air-quality/overview) [3](https://openaq.org/developers/platform-overview/)
- [] Water quality
- [] Add a Python code chunk to demonstrate bilingual projects 
- [] Add a parameter to generate parameterized outputs 
- [] Daily water quality: [1](https://waterdata.usgs.gov/blog/dataretrieval/#multi-agency-water-quality-data-from-the-water-quality-portal-wqp)
- [] Add conditionality: [1](https://github.com/quarto-dev/quarto-r/issues/137#issuecomment-1966765073) [2](https://github.com/rich-iannone/quarto-email/issues/9) [3](https://github.com/quarto-dev/quarto-r/issues/137)
- [] Send conditional emails (only on weekdays)
- [x] Add better [icons](https://icons.getbootstrap.com/) 


# Environment management 

Following best practices from [quarto](https://quarto.org/docs/projects/virtual-environments.html#using-renv), this project is using renv to manage BOTH R and Python environments. 

## One time setup

```
install.packages("renv")
library(renv)
renv::init()
renv::use_python()
renv::snapshot()
```

## Environment restore 

```
renv::restore()
```

## Preview

```
quarto preview quarto-daily-dashboard-report.qmd --to dashboard --no-watch-inputs --no-browse
```

## Publish

In order to deploy it needs to be a project: 
```
quarto create project 
```

Done through: <https://quarto.org/docs/publishing/quarto-pub.html> 

# Publishing

Notes for the developer:

This presentation is published to the RStudio demo server using push button publishing from the RStudio IDE.

It is also published to my quarto pub space. I run quarto publish quarto-pub from terminal after `cd`-ing in to the directory. Answer "Y" to overwrite my previous site and to use the correct account. For example, to publish this slide deck I'm running: `quarto publish quarto-pub 2024-git-demo.qmd`. It will need to be a quarto project. If you have an existing directory of documents that you want to treat as a project just invoke `quarto create-project` with no arguments from within the directory.

I can access my account and see my deployments at https://questionable.quarto.pub/.
