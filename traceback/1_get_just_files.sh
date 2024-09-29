#!/bin/bash
cat original_traceback | grep -o '[^ ]*+[^ ]*' | sed 's/\/.*//' | sudo tee tracefiles
