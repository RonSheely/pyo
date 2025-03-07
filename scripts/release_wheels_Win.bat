echo off

RMDIR /S /Q build
RMDIR /S /Q dist

py -3.9 -m build --wheel --config-setting="--build-option=--use-double"
py -3.10 -m build --wheel --config-setting="--build-option=--use-double"
py -3.11 -m build --wheel --config-setting="--build-option=--use-double"
py -3.12 -m build --wheel --config-setting="--build-option=--use-double"
py -3.13 -m build --wheel --config-setting="--build-option=--use-double"
