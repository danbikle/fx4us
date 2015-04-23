#!/bin/bash

# /home/ann/fx4us/wget10.bash

# This script should get data from truefx.com

mkdir -p ~/fxcsv/
cd       ~/fxcsv/

for pair in AUDUSD EURUSD EURGBP GBPUSD NZDUSD USDCAD USDJPY
do
  for yr in 2009 2010 2011 2012 2013 2014 2015
  do
    for month in 1 2 3 4 5 6 7 8 9 10 11 12
    do
      nummonth=` date --date="${yr}-${month}-01" '+%m'`
      namemonth=`date --date="${yr}-${month}-01" '+%B'`
      upmonth=${namemonth^^}
      myzip="truefx.com/dev/data/${yr}/${upmonth}-${yr}/${pair}-${yr}-${nummonth}.zip"
      wget --user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' $myzip
      sleep 2
    done
  done
done

exit

wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
truefx.com
sleep 2

wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--load-cookies=/tmp/truefx_cookies.txt \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
http://truefx.com/?page=logina
sleep 2


wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--load-cookies=/tmp/truefx_cookies.txt \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
--post-data='page=loginz&USERNAME=ann411&PASSWORD=annwasher3' \
http://truefx.com
sleep 2

wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--load-cookies=/tmp/truefx_cookies.txt \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
truefx.com/?page=downloads
sleep 2

for yr in 2009 2010
do

  wget --user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
  --load-cookies=/tmp/truefx_cookies.txt --save-cookies=/tmp/truefx_cookies.txt --keep-session-cookies truefx.com/dev/data/${yr}/MAY-${yr}/EURUSD-${yr}-05.zip
  sleep 2

done

wget \
--user-agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36' \
--load-cookies=/tmp/truefx_cookies.txt \
--save-cookies=/tmp/truefx_cookies.txt \
--keep-session-cookies \
truefx.com/?page=logout
