#!/bin/bash

echo "Once inside vim, run :set efm=%f:%l "
read -p "Press Enter to continue" </dev/tty

nvim -q vim_errorfile

