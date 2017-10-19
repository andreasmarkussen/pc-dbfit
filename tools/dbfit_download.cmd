@echo off
echo This script installs 
choco install wget
choco install unzip
mkdir temp
mkdir temp\dbfit-complete
wget -nc https://github.com/dbfit/dbfit/releases/download/v3.2.0/dbfit-complete-3.2.0.zip -O temp\dbfit-complete.zip
unzip -n temp\dbfit-complete.zip -d temp\dbfit-complete
