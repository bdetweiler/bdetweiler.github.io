#!/bin/bash

cities=`cat cities-to-get.txt`
for city in $cities ; do
  wget $city
done
