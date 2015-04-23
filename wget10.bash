#!/bin/bash

# /home/ann/fx4us/wget10.bash

# This script should get data from truefx.com

mkdir -p ~/fxcsv/
cd       ~/fxcsv/

wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--load-cookies=/tmp/truefx_cookies.txt \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
truefx.com/?page=logina
sleep 2

wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--load-cookies=/tmp/truefx_cookies.txt \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
--post-data='page=loginz&USERNAME=ann411&PASSWORD=annwasher3' \
truefx.com
sleep 2

for pair in AUDUSD EURUSD EURGBP GBPUSD NZDUSD USDCAD USDJPY
do
  for yr in 2009 2010 2011 2012 2013 2014 2015
  do
    for month in 1 2 3 4 5 6 7 8 9 10 11 12
    do
      nummonth=` date --date="${yr}-${month}-01" '+%m'`
      namemonth=`date --date="${yr}-${month}-01" '+%B'`
      upmonth=${namemonth^^}
      zipurl="truefx.com/dev/data/${yr}/${upmonth}-${yr}/${pair}-${yr}-${nummonth}.zip"
      wget --user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' $zipurl
      sleep 2
    done
  done
done

wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--load-cookies=/tmp/truefx_cookies.txt \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
truefx.com/?page=logout

exit
