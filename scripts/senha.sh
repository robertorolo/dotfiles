#!/bin/bash

cat realpath "$1" | grep -i $2
