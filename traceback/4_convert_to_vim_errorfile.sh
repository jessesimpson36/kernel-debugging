#!/bin/bash
cat gdb_errorfile | grep -o '[^ ]*\.c:[0-9]*' | sed 's/(//' > vim_errorfile
