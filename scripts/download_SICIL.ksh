#!/bin/bash

for simulation in BLBT02 BLB002; do
  for period in y2009m07 y2009m08 y2009m09 y2010m01 y2010m02 y2010m03; do
    for var in votemper vosaline vozocrtx vomecrty vovecrtz; do 
      case $period in
        y2009m07|y2009m08|y2010m01|y2010m03) df=31;;
        y2009m09) df=30;;
        y2010m02) df=28;;
      esac
      for day in $(seq 1 $df); do
        dd=$(printf %02d $day)
        wget https://ige-meom-opendap.univ-grenoble-alpes.fr/thredds/fileServer/meomopendap/extract/MEOM/eNATL60/eNATL60-${simulation}/1h/SICIL/eNATL60SICIL-${simulation}_${period}d${dd}.1h_${var}.nc
      done
    done
  done
done
