@echo off

REM Licensed to the Apache Software Foundation (ASF) under one or more
REM contributor license agreements.  See the NOTICE file distributed with
REM this work for additional information regarding copyright ownership.
REM The ASF licenses this file to You under the Apache License, Version 2.0
REM (the "License"); you may not use this file except in compliance with
REM the License.  You may obtain a copy of the License at
REM
REM    http://www.apache.org/licenses/LICENSE-2.0
REM
REM Unless required by applicable law or agreed to in writing, software
REM distributed under the License is distributed on an "AS IS" BASIS,
REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM See the License for the specific language governing permissions and
REM limitations under the License.

REM This scripts packages R files to create a package that can be loaded into R,
REM and also installs necessary packages.

setlocal enableextensions enabledelayedexpansion

set FWDIR=%~dp0
set LIB_DIR="%FWDIR%/../../R/lib"

mkdir %LIB_DIR%

pushd %FWDIR%

REM Generate Rd files if devtools is installed
REM Rscript -e ' if("devtools" %in% rownames(installed.packages())) { library(devtools); devtools::document(pkg="./pkg", roclets=c("rd")) }'

REM Install SparkR to $LIB_DIR
@echo on
R CMD INSTALL --library=%LIB_DIR% %FWDIR%\rzeppelin\

popd

@echo on