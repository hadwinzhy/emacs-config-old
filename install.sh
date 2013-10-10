#!/bin/sh

#install essential package
sudo apt-get install ttf-inconsolata

sudo apt-get install global

# install pymacs
cd 3rd-party/pymacs/ && sudo python setup.py install

cd -

sudo cp 3rd-party/pycomplete/pycomplete.py /usr/local/lib/python2.7/dist-packages/
