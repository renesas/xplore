# Xplore

Xplore provides a central location for getting started with Renesas Xplore applications and exploring reusable Software Building Blocks (SBBs).

This repository contains the source for the Xplore GitHub Pages site and references the individual Software Building Block repositories through Git submodules.

## Xplore Documentation

The Xplore GitHub Pages site provides two main resources:

### Quick Start Guide

The main Xplore page (`index.html`) provides the **Quick Start Guide for Xplore**.

The guide walks through the basic workflow for opening, building, flashing, and debugging an Xplore project using the Renesas development environment.

### Projects and Software Building Blocks

The project page (`project.html`) provides access to additional Xplore resources, including:

- **Getting Started Guides** for three hands-on applications
- **Software Application Documents** for the available Software Building Blocks

These documents provide application-level information, project setup instructions, hardware requirements, configuration details, and additional technical information for each project.

## Repository Structure

The repository is organized as follows:

```text
xplore/
├── index.html                  # Xplore Quick Start Guide
├── project.html                # Xplore projects and documentation
├── media/                      # Images and site resources
├── software-building-blocks/   # Software Building Block Git submodules
│   ├── <sbb-repository>/
│   ├── <sbb-repository>/
│   └── ...
├── .gitmodules                 # Git submodule configuration
└── README.md
```

The individual Software Building Blocks are maintained in their own GitHub repositories and referenced from this repository as **Git submodules**.

## Working with Git Submodules

A Git submodule allows one Git repository to reference another repository at a specific commit.

Xplore uses submodules so that the individual Software Building Block projects can remain independent repositories while also being accessible from the central Xplore repository.

### Clone the Xplore Repository

To clone the main Xplore repository:

```bash
git clone https://github.com/renesas/xplore.git
cd xplore
```

When cloned this way, the Xplore repository is downloaded, but the contents of the submodules are not automatically populated.

### Download a Specific Software Building Block

To view all Software Building Blocks available as submodules:
```bash
git submodule status
```

This lists each submodule and its path. If you only want to work with a specific Software Building Block, initialize that submodule individually:

```bash
git submodule update --init <submodule-path>
```

For example:

```bash
git submodule update --init software-building-blocks/acmphs-voltage-comparator
cd software-building-blocks/acmphs-voltage-comparator
```

This downloads only the selected project rather than every Software Building Block referenced by Xplore.

### Download All Software Building Blocks

To initialize and download all submodules:

```bash
git submodule update --init --recursive
```

Alternatively, when cloning the repository for the first time:

```bash
git clone --recurse-submodules https://github.com/renesas/xplore.git
```

### Check Submodule Status

To see the submodules referenced by the Xplore repository and their current revisions:

```bash
git submodule status
```

You can also view the configured submodule paths and repository URLs in the `.gitmodules` file.

### Update Submodules

To update initialized submodules to the commits currently referenced by the Xplore repository:

```bash
git submodule update --init --recursive
```

> **Note:** A Git submodule points to a specific commit in another repository. Updating the Xplore repository does not necessarily move a submodule to the newest commit in its source repository. The revision recorded by Xplore determines which version is checked out.

## Cloning an Individual Project Directly

If you do not need the Xplore repository or its other projects, you can also clone an individual Software Building Block directly from its GitHub repository:

```bash
git clone <project-repository-url>
```

This is often the simplest option when developing with only one Software Building Block.

## Additional Resources

- [Xplore GitHub Repository](https://github.com/renesas/xplore)
- Xplore Quick Start Guide: available through the repository's GitHub Pages site
- Software Building Block documentation: available from the Xplore project page

## License

Refer to the license information provided in this repository and in each individual Software Building Block repository. Individual projects may contain additional license information applicable to their source code or third-party components.
