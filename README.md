# Setup

Install Sphinx: http://sphinx-doc.org/latest/install.html#mac-os-x-install-sphinx-using-macports

Install the Sphinx Theme: https://github.com/snide/sphinx_rtd_theme

# Build the docs

Install a python environment from `requirements.txt`

1. Run `make html`
2. Open the results at `docs/index.html`

# Pushing to the public instance

When you commit changes and push them, a git hook will automatically build and publish the new version of the site to http://gabor1.github.io/pkp-lego
