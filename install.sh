#!/bin/sh

git submodule init
git submodule update

#install essential package
sudo apt-get install fonts-inconsolata

sudo apt-get install global

gem install rubocop

# install pymacs
cd 3rd-party/pymacs/ && sudo python setup.py install

cd -

sudo cp 3rd-party/pycomplete/pycomplete.py /usr/local/lib/python2.7/dist-packages/

sudo ln -svf $(pwd)/.emacs ~/
