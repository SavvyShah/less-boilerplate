#!/bin/bash
# A simple script
function sayInGreen () {
GREEN="\e[92m"
clear
echo -e $GREEN$1$END
}

sayInGreen "Creating react project"

sayInGreen "Initializing git"
git init
# $(pwd) stores the current working directory
#echo $(pwd)

#SCRIPT DIR is different from current directory.
#Current directory is where you have opened the terminal
#Script dir is where the script resides
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sayInGreen "Copying config files"

cp "$SCRIPT_DIR/react-config/webpack.config.js" "$(pwd)"
cp "$SCRIPT_DIR/react-config/webpack.config.prod.js" "$(pwd)"
cp "$SCRIPT_DIR/react-config/prettier.config.js" "$(pwd)"
cp "$SCRIPT_DIR/react-config/babel.config.js" "$(pwd)"
cp "$SCRIPT_DIR/react-config/.eslintrc.js" "$(pwd)"
cp "$SCRIPT_DIR/react-config/.gitignore" "$(pwd)"

sayInGreen "Making package"
npm init -y

sayInGreen "Installing babel packages"
npm i @babel/core @babel/preset-env @babel/preset-react babel-loader
sayInGreen "Installing react"
npm i react react-dom
sayInGreen "Installing webpack"
npm i -D webpack webpack-cli webpack-dev-server
sayInGreen "Installing webpack loaders"
npm i -D css-loader file-loader style-loader
sayInGreen "Installing webpack plugins"
npm i -D clean-webpack-plugin html-webpack-plugin terser-webpack-plugin
sayInGreen "Installing eslint"
npm i -D eslint eslint-plugin-react
sayInGreen "Installing prettier"
npm i -D prettier

#add scripts
python $SCRIPT_DIR/add_scripts.py
#format package.json after adding scripts
npx prettier --write package.json
