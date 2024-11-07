# Adding diagrams to report using mermaid

# Bells and Whistles 

## Paramaters

Declare params in the yaml: 

```
params:
  color: 
    value: "copper"
```

We can read back the parameter selected 

Use inline R code for markdown: `r params$color`

Use paste() for plot and table titles and labels: 

```r
# ggplot code +
labs(title = paste(params$color, "population"))
``

We can render this through quarto with: 

```
quarto render report-parameterized.qmd -P color:copper

# Or we could use a yaml file
quarto render report-parameterized.qmd --execute-params params.yml
```

We could also iterate over a list of parameters to generate a set of reports: 

```r
df <- readr::read_csv("grades.csv")

for (i in 1:nrow(df)) {
    student <- df[i, ] # Each row is a unique student
    quarto::quarto_render(
        input = "template.qmd",
        output_file = paste0("feedback-", student$name, ".pdf"),
        execute_params = list(
            name = student$name,
            grade = student$grade
        )
    )
}
```

Reference: 

- <https://www.mm218.dev/posts/2022-08-04-how-to-use-quarto-for-parameterized-reporting/>
- <https://www.jhelvy.com/blog/2023-02-28-parameterized-pdfs-with-quarto/index.html> 
- <https://jadeyryan.quarto.pub/rladies-dc-quarto-params/slides/#/title-slide>
- Example originally from: <https://rmarkdown.rstudio.com/lesson-6.html> 