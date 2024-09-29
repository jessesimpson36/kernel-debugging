#!/bin/bash
sed 's/^/search *(/' tracefiles | sed 's/$/)/' > gdbscript
