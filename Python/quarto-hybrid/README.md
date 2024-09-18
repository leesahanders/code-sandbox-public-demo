## Quarto hybrid project

Add formatting for light/dark mode:

```
format:
  html:
    theme:
      light: flatly
      dark: darkly
```

Preview the quarto doc:
```
quarto preview notebook.ipynb
quarto preview quarto-hybrid.qmd
```

In order to deploy it needs to be a project:
```
quarto create project
```

This means that we need to have a _quarto.yml file, minimally it needs contents to be like this:
```
project:
  title: "."
```

Deploy it:
```
rsconnect deploy quarto . <- doesn't work because of the r chunks needing knitr (could be deployed from rstudio though with push button)

quarto publish
```

Reference for calling R variables from Python and vice versa: <https://rstudio.github.io/reticulate/articles/r_markdown.html>


