#!/bin/bash

states=`cat states.txt`
for state in $states ; do
  wget $state
done
