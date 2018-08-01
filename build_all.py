#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import subprocess
from docopt import docopt

# This doc is used by docopt to make the server callable by command line and gather easily all the given parameters
doc = """>>> IntegrCiTy Docker image builder command <<<

Usage:
    build_all.py <tag> [--no-cache]

    build_all.py -h | --help
    build_all.py --version

Options
    --no-cache  force docker to build images without using cached elements 
    -h --help   show this
    --version   show version

"""

if __name__ == "__main__":
    args = docopt(doc, version="0.0.1")

    cache = ""

    if args["--no-cache"]:
        cache = "--no-cache"

    for name in ["base", "obnl", "simple", "pandapower"]:
        bashCommand = "docker build --build-arg source={1} {2} -f Dockerfile_ict_{0} -t ict-{0}:{1} .".format(name, args["<tag>"], cache)
        process = subprocess.check_call(bashCommand.split())
