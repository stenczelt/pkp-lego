# Setup

Install a python environment from `requirements.txt`

```bash
python3 -m venv venv
source ./venv/bin/activate
python -m pip install -r requirements.txt
```

# Build the docs

1. Run `make html`
2. Open the results at `_build/index.html`

# Pushing to the public instance

When you commit changes and push them, a git hook will automatically build and publish
the new version of the site to http://stenczelt.github.io/pkp-lego