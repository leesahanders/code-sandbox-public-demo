# Getting started with Python (Quarto and Shiny)

## Usage

### The uv way

Use [uv](https://github.com/astral-sh/uv). It will detect that this is a project and create the venv for us when we go to run the application. 

```bash
cd Python/quarto-python-lightbox

# Create the kernel
uv run ipython kernel install --user --name=project

# Optionally, render the document
uv run quarto preview quarto-python-lightbox.qmd --no-browser --no-watch-inputs
```

- Open the `.qmd` file for interactive use.
- Chose the just created kernel (you may need to refresh).
- Click "Run All". 


### The pip way

Setup the `venv` environment:

```bash
python -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
```

- Open the `quarto-python-lightbox.qmd` file for interactive use.
- Chose the just created `.venv` as the selected kernel.
- Click "Preview"

## Deploy

### rsconnect-python CLI

```bash
# With uv
uv run rsconnect deploy quarto .
# Without uv
rsconnect deploy quarto .
```

### Git-backed

Update the code, and then run:

```bash
# With uv
uv export -o requirements.txt --no-hashes
uv run rsconnect write-manifest quarto --overwrite .
# Without uv
pip freeze > requirements.txt 
rsconnect write-manifest quarto --overwrite .
```

Commit the new `manifest.json` file to the git repo along with the code.

## Resources

- [Posit Connect User Guide: Quarto (Python)](https://docs.posit.co/connect/user/publishing-cli-quarto/)
- [quarto cli](https://quarto.org/docs/publishing/rstudio-connect.html)
- [rsconnect](https://github.com/rstudio/rsconnect)
- [rsconnect-python](https://github.com/rstudio/rsconnect-python)
- [quarto projects](https://quarto.org/docs/projects/quarto-projects.html)
- [Posit Connect User Guide - Git Backed Publishing ](https://docs.posit.co/connect/user/git-backed/)
- [Quarto Version Manager](https://github.com/dpastoor/qvm)
- [Lightbox Quarto Extension](https://github.com/quarto-ext/lightbox)