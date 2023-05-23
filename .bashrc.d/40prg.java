#!/bin/bash

test -x /usr/libexec/java_home && jh="$(/usr/libexec/java_home 2>/dev/null)" && export JAVA_HOME="$jh"
