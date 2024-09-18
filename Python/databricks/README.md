

Restore the environment: 

```
python -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
```

To create a kernel use: 

```
python -m venv .venv
source .venv/bin/activate
#pip install jupyter
ipython kernel install --user --name=.venv-something
ipython kernel install --user --name=.venv-databricks
python -m ipykernel install --user --name .venv-something
#jupyter notebook
```

From top right in vs code select a kernel, jupyter kernel, and select the one that is needed (use refresh if it doesn't show up)

It is important the Databricks VS Code extension is installed and is using the `workbench` profile.

Create a `.env` file containing one variable. Change `DATABRICKS_PATH` to the `HTTP Path` of the SQL Warehouse to be used (found under Connection details in Databricks).

```
DATABRICKS_PATH="/sql/1.0/warehouses/<path>"
```
