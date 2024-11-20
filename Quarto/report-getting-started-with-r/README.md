# Getting started with R (Quarto and Shiny)

> **Warning**
> This is part of a repository that is prone to  Changes and overhauls will happen without notice, but feel free to reach out with any questions/corrections/or help needs at lisamaeanders@gmail.com

**Access the deployed content at: <https://pub.demo.posit.team/public/getting-started-quarto-shiny-r/>**

![screenshot of Quarto report](/img/getting-started-R.png)

## Usage

Setup the `renv` environment:

```r
renv::activate()
renv::restore()
```

To render the document either open `getting-started-R.qmd` and use the "Render" button on the top of the IDE code pane or use:

```r
quarto::quarto_render("getting-started-R.qmd")
```

## Deployment

### Push Button

Open `getting-started-R.qmd` and use the blue publish icon in the upper right corner of the IDE code pane.

### rsconnect package

You can also deploy using the rsconnect package:

```
rsconnect::deployDoc(
  doc = "getting-started-R.qmd",
  appTitle = "Quarto (with Connect): Getting started with R"
)
```

### Quarto CLI

```
quarto publish connect getting-started-R.qmd
```

### Git-backed

Update the code, and then run:

```r
rsconnect::writeManifest(quarto = TRUE)
```

Commit the new `manifest.json` file to the git repo along with the code.

## Resources

- [Posit Connect User Guide: Quarto](https://docs.posit.co/connect/user/quarto/)
- Posit-webinar-series: <https://github.com/jeremy-allen/posit-webinar-series> 
- Quarto workshop: <https://github.com/jeremy-allen/quarto-workshop> 
- Quarto demo: <https://github.com/jeremy-allen/quarto-demo> 
- Quarto listings report: <https://github.com/jeremy-allen/quarto-listings-report> 
- Diagrams in Quarto: <https://github.com/jeremy-allen/diagrams-in-quarto> 
- Quarto manuscripts: <https://github.com/jeremy-allen/quarto-manuscripts> 
- Public sector cheat sheet: <https://github.com/rstudio/Posit-Public-Sector-Cheatsheet> 
- renv example from the VA Dept. Environmental Quality: <https://github.com/JosiahParry/renv-example>
- Scripts in projects: <https://quarto.org/docs/computations/render-scripts.html#scripts-in-projects> 
- Reproduceable presentations in quarto: <https://info5940.infosci.cornell.edu/slides/publishing-reproducible-documents/#/title-slide> 
- Quarto awesome list: <https://github.com/mcanouil/awesome-quarto> 
- Quarto the definitive guide: <https://quarto-tdg.org/presentations> 
- R without statistics, reproduceable reporting with quarto: <https://book.rwithoutstatistics.com/quarto-chapter> 
- Quarto tip a day: <https://mine-cetinkaya-rundel.github.io/quarto-tip-a-day/posts/17-dark-mode/> 
- Quarto callouts: <https://www.andreashandel.com/posts/2023-06-13-custom-callouts-quarto/> 
- rmflight quarto blog: <https://rmflight.github.io/> 
- Let's make a presentation with quarto: <https://gesiscss.github.io/quarto-workshop/material/slides/05_presentations.html#/title-slide> 
- Sharing data in a Quarto dashboard by Mine: <https://mine.quarto.pub/quarto-dashboards-pydata/#/title-slide> 
- Thomas Mock's presentation to Austin Python meetup in 2024: <https://thomasmock.quarto.pub/python-austin/#/> 
- [Parameterized Reports with Quarto: R-Ladies DC Workshop](https://jadeyryan.com/talks/2024-01-18_rladies-dc_quarto-params/)
- [Extending quarto](https://www.youtube.com/watch?v=EihuM4oyOvs)
- [Quarto job scheduling](https://github.com/ryjohnson09/quarto-job-scheduling?tab=readme-ov-file) 
- [Some Quarto Tips for Academic Presentation](https://kazuyanagimoto.com/blog/2022/12/27/quarto_tips/)
- [Posit blog, building a reporting infrastructure with quarto](https://posit.co/blog/building-a-reporting-infrastructure-with-quarto/)
- [2022 talk by Daniel Chen at pydata 2022]( https://github.com/chendaniely/pydata-nyc-2022-python_quarto) and [the recording](https://www.youtube.com/watch?v=AnrGW8zoLx8)
- [2022 topic building websites with quarto](https://rstudio-conf-2022.github.io/get-started-quarto/materials/06-websites.html#/websites) 
- [Making pretty pdf's with quarto](https://nrennie.rbind.io/blog/making-pretty-pdf-quarto/) 
- [Jeremy's workshop outline](https://github.com/jeremy-allen/quarto-workshop/blob/main/workshop-guide)

From Posit conf: 

- ["Reproducible Manuscripts with Quarto" talk at posit::conf(2023)](https://github.com/mine-cetinkaya-rundel/quarto-manuscripts)

Websites: 

- Building a quarto website: <https://ucsb-meds.github.io/creating-quarto-websites/> 


# Publishing

Notes for the developer:

This presentation is published to the RStudio demo server using push button publishing from the RStudio IDE.

It is also published to my quarto pub space. I run quarto publish quarto-pub from terminal after `cd`-ing in to the directory. Answer "Y" to overwrite my previous site and to use the correct account. For example, to publish this slide deck I'm running: `quarto publish quarto-pub 2024-git-demo.qmd`. It will need to be a quarto project. If you have an existing directory of documents that you want to treat as a project just invoke `quarto create-project` with no arguments from within the directory.

Preview with: `quarto preview quarto-for-reproducible-reporting-demo.qmd --to positslides-revealjs --no-watch-inputs --no-browse`

I can access my account and see my deployments at https://questionable.quarto.pub/.

Each piece of content, in order to be published, needs: 

- `_quarto.yml`
- `manifest.json`

I can set each one manually with this: 

```r
library(rsconnect)

setwd("C:/Users/LisaAnders/Documents/git/quarto-for-reproducible-reporting-demo/content-examples/report-mermaid-diagrams")
rsconnect::writeManifest()
rsconnect::writeManifest(appDir = getwd(), appPrimaryDoc = "getting-started.qmd", appMode="quarto-static")
```

