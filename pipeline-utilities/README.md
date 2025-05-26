# Pipeline information
See ```.gitlab-ci``` for main pipeline, other components are:
 - build-base-images.yml
 - variables.yml
 - templates.yml

All Dockerfiles and required resources can be found in their respective folder in this directory.

## Child-pipeline
Build-base-images is ran as a child pipeline only in the case it is a fresh merge request and ALL images need to be built. With current build job rules if a MR is opened with only changes to front-end, it wont build a backend. Added this as a solution. In reality you can probably just always build all images anyways, since we are caching the images it wont take any additional time.

## Ports and connections
Currently everything communicates with port: 80
MSSQL runs over default 1433.
