#!/bin/bash
gdb vmlinux -x gdbscript --batch | sudo tee gdb_errorfile
