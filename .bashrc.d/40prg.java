#!/bin/bash

test -x /usr/libexec/java_home && export JAVA_HOME=$(/usr/libexec/java_home)
