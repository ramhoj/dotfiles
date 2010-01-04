#!/bin/bash

rvm install 1.8.7
rvm 1.8.7 --default
rvm gems load rvm/default.gems

rvm install 1.9.1
rvm 1.9.1
rvm gems load rvm/default.gems
