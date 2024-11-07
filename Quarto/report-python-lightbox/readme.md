# quarto-python 

Read more about using Quarto with Python: [here](https://quarto.org/docs/computations/python.html)

This can be opened and successfully deployed and run from the RStudio IDE, JupyterLab, or VS Code. 

 - Appropriate languages must be installed
 - Quarto must be installed
 - Quarto extensions for VS Code and/or JupyterLab must be installed

## Rendering 

Render me with `Ctrl+Shift+K` on the keyboard, clicking **render** from your preferred editor, or from terminal with either: 

```bash
quarto preview quarto-python-jupyter.qmd
quarto render quarto-python-jupyter.qmd --to html
```

Add the tags `--to html` or `--to docx` at the end to specify an output format

Quarto documents can be used in JupyterLab [in a Jupyter notebook](https://quarto.org/docs/get-started/hello/jupyter.html#rendering). In which case rendering is done by running: 

```bash
quarto render hello.ipynb --to html
quarto render hello.ipynb --to docx
```

## Publishing 

Read about publishing in the documentation: [here](https://docs.rstudio.com/connect/user/quarto/) and [here](https://quarto.org/docs/publishing/rstudio-connect.html)

### VS Code and JupyterLab

The fastest way: 

* Test locally
* Acquire an [API key](https://docs.rstudio.com/connect/user/api-keys/) 
* Publish with the [quarto cli](https://quarto.org/docs/publishing/rstudio-connect.html)

```bash
quarto publish connect quarto-python-lightbox.qmd
```

This works if you are using the code in this repo because we've already (1) turned this into a quarto project (2) written the manifest.json (and requirements.txt) files. See below for how to do those steps if relevant, or other methods for publishing (like git backed). 

**Publish using the Quarto CLI**

* Test locally
* Acquire an [API key](https://docs.rstudio.com/connect/user/api-keys/) 
* Publish with the [quarto cli](https://quarto.org/docs/publishing/rstudio-connect.html)

It will ask for a server URL and API key to be provided in order to successfully publish, have those ready to enter. 

```bash
quarto publish connect quarto-python-lightbox.qmd 
```

Note: [To publish a document rather than a website or book, provide the path to the document](https://quarto.org/docs/publishing/rstudio-connect.html)

**Programmatically using [rsconnect-python](https://github.com/rstudio/rsconnect-python)**

Hopefully future releases of rsconnect-python will include more robustness for handling quarto documents that aren't part of a project. [If you have an existing directory of documents that you want to treat as a project just invoke create-project with no arguments from within the directory from terminal:](https://quarto.org/docs/projects/quarto-projects.html) `quarto create-project`

```bash
pip install quarto
pip install rsconnect-python
```

If already installed can upgrade with: 
```bash
pip install rsconnect-python --upgrade
```

Check your installed package version with: 
```bash
pip show rsconnect-python
```

Set up your server address and publish. 

```
rsconnect add \
    --api-key <MY-API-KEY> \
    --server <https://connect.example.org:3939> \
    --name <SERVER-NICKNAME>
```

```
rsconnect deploy manifest manifest.json
```

Or if you haven't written the manifest: 
```
rsconnect deploy quarto . -n colorado
```

**Create a manifest for future git-backed publishing**

See note above about requiring quarto as a quarto project prior to using rsconnect-python. 

```bash
rsconnect write-manifest quarto .
```

For overwriting add the flag `--overwrite'. 

### RStudio IDE

**Publish to Connect server using push-button**

* Test locally
* Push button publishing 

**Publish using the Quarto CLI**

* Test locally
* Configure the [Connect server address](https://docs.rstudio.com/connect/user/publishing/#publishing-destination)
* Publish to Connect using the [quarto cli](https://quarto.org/docs/publishing/rstudio-connect.html#knitr-r)

```r
library(quarto)

quarto_publish_doc(
  "document.qmd", 
  server = "rsc.example.com", 
  account = "njones",
  render = "server"
)

quarto_publish_site(
  server = "rsc.example.com", 
  account = "njones",
  render = "server"
)
```

**Programmatically using [rsconnect](https://github.com/rstudio/rsconnect)**

```r
library(rsconnect)
library(quarto)

# Important note for code including Python
# We need to write the manifest so we can edit the requirements.txt file to only include the needed packages
# Remove anything with conda in the name!!!
# For other package errors using the no binary option IE `numpy --no-binary numpy` can be very useful

rsconnect::writeManifest()

rsconnect::deployApp(
  quarto = quarto::quarto_path(),
  appDir = getwd(),
  account = "lisa.anders",
  server = "colorado.rstudio.com"
)
```

**Programmatically using [rsconnect-python](https://github.com/rstudio/rsconnect-python)**

[Important: If your Quarto content contains R code, you cannot use the rsconnect-python CLI's rsconnect deploy quarto function. You can still use rsconnect deploy manifest to deploy content for which a manifest has already been generated.](https://quarto.org/docs/publishing/rstudio-connect.html)


## Quarto version 

Check your Quarto version with: 

```r
library(quarto)
quarto_path()

system(quarto --version)
```

Alternatively upgrade to QVM and experience a quality of life upgrade. 

## QVM: Installing multiple quarto versions 

WORK IN PROGRESS

Devins quarto versioning package: https://github.com/dpastoor/qvm

* Git should be already installed, as well as other installation requirements

* Install on Windows: 
* Install on Mac: brew install dpastoor/tap/qvm
* Install on Workbench (ubuntu server): 
* Install on Workbench (rhel server): 

Watch the video on the package page to see how to use it and to switch between versions

Alternatively, follow the instructions: <https://docs.rstudio.com/resources/install-quarto/>

```bash
export QUARTO_VERSION="1.2.245"

sudo mkdir -p /opt/quarto/${QUARTO_VERSION}

sudo curl -o quarto.tar.gz -L \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"

sudo tar -zxvf quarto.tar.gz \
    -C "/opt/quarto/${QUARTO_VERSION}" \
    --strip-components=1

sudo rm quarto.tar.gz

# Verify it is successfully installed with either of these, depending on where it was installed and whether you want to check the actual folder or the symlink: 
/opt/quarto/"${QUARTO_VERSION}"/bin/quarto check
/usr/local/bin/quarto check

#Optional, update the symlink (risky business): 
sudo ln -s /opt/quarto/${QUARTO_VERSION}/bin/quarto /usr/local/bin/quarto
```

## Lightbox extension

We can display images in a gallery using the lightbox extension. 

-   Tips on dealing with displaying images in a rendered quarto document: <https://quarto.org/docs/authoring/figures.html#figure-panels>

-   Installing the lightbox extension: <https://github.com/quarto-ext/lightbox>

-   For example, we could run this from terminal: `quarto install extension quarto-ext/lightbox`

-   To update an existing extension either re-install or run from terminal something like: `quarto update extension quarto-ext/fontawesome`

Tested Quarto and Lightbox versions that work together: 

Works: 

- Quarto: 1.0.36, 1.1.189
- Lightbox:  0.1.3

Does NOT work: 

- Quarto: 1.0.36, 1.1.189
- Lightbox:  0.1.4, 0.1.5

Error: 'Error running filter _extensions/quarto-ext/lightbox/lightbox.lua:
_extensions/quarto-ext/lightbox/lightbox.lua:113: attempt to call a nil value (field 'is_format')'


