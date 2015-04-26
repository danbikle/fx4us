/home/ann/fx4us/readme.txt

I use the files in this folder to help me predict forex price deltas.

Instructions:

- Install Linux Ubuntu 14 somewhere

- Login as root

- apt-get install gitk wget

- useradd -m -s /bin/bash ann

- passwd ann

- ssh ann@yourhost
  (or sudo su - ann)

- git clone https://github.com/danbikle/fx4us.git

- Run this script as root:
  /home/ann/fx4us/install_postgres.bash

- wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.2.0-Linux-x86_64.sh

- bash Anaconda3-2.2.0-Linux-x86_64.sh

- mv ~ann/anaconda3/bin/curl ~ann/anaconda3/bin/curl_ana


- echo 'export PATH=~ann/anaconda3/bin:$PATH' >> ~ann/.bashrc

- Run this script:
  /home/ann/fx4us/fx4us.bash
  wait a long time for it to finish

- Inspect png files here:
  /home/ann/fit_predict/

- They should look like the png files here:
  https://github.com/danbikle/fx4us/tree/master/data/fit_predict
  /home/ann/fx4us/data/fit_predict/

Questions?
e-me: dan@bot4.us
Dan Bikle


