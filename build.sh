#!/usr/bin/env fish

set year 2025
set day $argv[1]

swift build
./.build/debug/AoC $day
