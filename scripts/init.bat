@echo off

set /p createDirectory=Do you want to install dependencies? (y/n): 

if /i "%createDirectory%"=="y" (
    call npm i @reduxjs/toolkit antd dayjs react-hook-form yup classnames jalaliday numeral react-redux redux-persist async-mutex prettier husky lint-staged sass
    echo The packages were installed successfully :)
) else (
    echo The packages were not installed :(
)

set /p copyFiles=Do you want to copy files to the new directory? (y/n): 

if /i "%copyFiles%"=="y" (
    wsl tar -xf ./cli.tar 
    cp -r ./cli/common ../src/
    echo common created successfully.
    cp -r ./cli/modules ../src/
    echo modules created successfully.
    cp -r ./cli/redux ../src/
    echo redux created successfully.
    cp -r ./cli/styles ../src/
    echo styles created successfully.
    cp -f ./cli/files/.prettierrc.js ../
    cp -f ./cli/files/next.config.js ../
    cp -f ./cli/files/layout.tsx ../src/app
    cp -rf ./cli/files/.husky ../
    cp -rf ./cli/files/.vscode ../
    cp -rf ./cli/files/.lintstagedrc.js ../
    cp -rf ./cli/files/.env ../
    cp -rf ./cli/scripts/* .
    rm -rf ./cli
    rm -rf ./cli.tar
    rm -rf ./init.bat
    echo Files copied successfully.
) else (
    echo File copying aborted.
)

exit
