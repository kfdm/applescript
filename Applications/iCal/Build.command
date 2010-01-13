#!/bin/bash

#Change script to the location of this file
script_path=`dirname $0`
echo "---Moving to ($script_path)---"
cd $script_path

#Call the makefile
make install