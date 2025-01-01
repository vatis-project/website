# Contributing documentation

This documentation is published using Jekyll. The easiest way to write updates and test
them is using [Visual Studio Code](http://code.visualstudio.com/).

## Pre-requisites

1. Install [Docker](https://www.docker.com/get-started/)
2. Install [Visual Studio Code](https://code.visualstudio.com/Download) and the [devcontainer extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Using the devcontainer (Mac and Windows)

1. Fork the repo
2. Run VSCode
3. Select `Dev Containers: Clone Repository in Container Volume...`
4. Follow the prompts to authenticate with GitHub and select the forked repo
5. Select `master` as the branch
6. Wait for the devcontainer to build

Cloning the repository in a container volume greatly improves performance, and on Windows ensures live updating works.

## Using the devcontainer (Linux)

1. Fork the repo
2. Clone it locally
3. Open the repo in VSCode
4. When prompted click `Reopen in Container`
5. Wait for the devcontainer to build

## Testing documentation changes

The repo is set up with `F5` deployment in VSCode. Simply press `F5` and the documentation will build
and launch in a browser. Once run, documentation changes will automatically get rebuilt.

VSCode launch profiles for Chrome and Edge are provided, simply select the launch profile you want
in the debug tab.