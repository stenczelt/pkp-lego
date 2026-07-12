# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in
this repository.

## Project Overview

This is a Sphinx documentation project for the Pembroke Lego Robotics course. It's a
static documentation site built with Sphinx and uses the Read the Docs theme. The
content covers Python programming, EV3 LEGO robotics, motor control, sensors, PID
controllers, and project guidelines for students.

## Build System

The project uses Sphinx for documentation generation with a traditional Makefile setup:

- **Build docs**: `make html` - Generates HTML documentation in `_build/` directory
- **Clean build**: `make clean` - Removes all built files from `_build/`
- **View locally**: Open `_build/index.html` in browser after building
- **Link checking**: `make linkcheck` - Validates all external links

## Environment Setup

Python virtual environment is required:

```bash
python3 -m venv venv
source ./venv/bin/activate
python -m pip install -r requirements.txt
```

Dependencies are minimal: `sphinx` and `sphinx-rtd-theme`.

## Project Structure

- **Content files**: Root directory contains `.rst` files (reStructuredText) for each
  course section
- **Configuration**: `conf.py` - Sphinx configuration with project metadata, theme
  settings, and MathJax integration
- **Static assets**: `_static/` contains MathJax library and resources like images
- **Built output**: `_build/` directory (not tracked in git)
- **Resources**: `resources/` contains PDFs, images, and favicon

## Key Content Areas

The documentation covers:

- Course overview and inventory management
- Python programming introduction
- EV3 robot setup and configuration
- Motor control and sensor integration
- PID controller theory and implementation
- Student project guidelines and FAQ

## Publishing

The site auto-deploys to http://stenczelt.github.io/pkp-lego when changes are pushed to
the repository via git hooks.

## Important Notes

- Uses MathJax v2.3 for mathematical notation rendering
- Syntax highlighting defaults to MATLAB style
- Favicon and images are course-specific (Lego Designer icon)
- Content is educational material for a robotics programming course