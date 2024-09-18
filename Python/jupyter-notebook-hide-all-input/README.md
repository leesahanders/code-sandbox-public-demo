# Data Visualization with Jupyter Notebooks

## Deploy

[For Jupyter notebooks,](https://docs.posit.co/rsconnect-python/#hide-jupyter-notebook-input-code-cells) when writing the manifest they may need to pass the `--hide-all-input` flag, e.g.  

```
rsconnect write-manifest notebook jupyter-interactive-visualization.ipynb -o --hide-all-input

rsconnect deploy notebook jupyter-static-notebook.ipynb -n <SERVER-NICKNAME>
```

which will yield a manifest with a jupyter section indicating that code should not be displayed in the rendered output:  

```
{
  "version": 1,
  "locale": "en_US.UTF-8",
  "metadata": {
    "appmode": "jupyter-static",
    "entrypoint": "jupyter-interactive-visualization.ipynb"
  },
  "python": {
    "version": "3.10.12",
    "package_manager": {
      "name": "pip",
      "version": "23.3.1",
      "package_file": "requirements.txt"
    }
  },
  "files": {
    "jupyter-interactive-visualization.ipynb": {
      "checksum": "20b7f819b6b3f4fff5df28e05d6dd924"
    },
    "requirements.txt": {
      "checksum": "d59c8f2d87dd7d7a4633b6104332aec4"
    }
  },
  "jupyter": {
    "hide_all_input": true
  }
}
```

## Resources

[RStudio Connect User Guide - Jupyter](https://docs.rstudio.com/connect/user/jupyter-notebook/)