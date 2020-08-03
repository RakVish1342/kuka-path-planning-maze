#!/bin/bash

set -e

CLANG_TIDY_CMD="run-clang-tidy-7.py -p /root/target_ws/build"

# header files need to be included this way to avoid that the autogenerated headers for the services
# get checked
$CLANG_TIDY_CMD/rll_planning_project -header-filter=planning_iface*

pip -q install 'pylint<2.0.0'
. /root/target_ws/install/setup.bash
find * -iname '*.py' | xargs python -m pylint