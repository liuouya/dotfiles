#!/bin/bash

# emacs
ln -si `pwd`/emacs.d/init.el ~/.emacs.d/init.el && \
    ln -si `pwd`/emacs.d/elisp ~/.emacs.d/

# i3
ln -si `pwd`/i3/config ~/.i3/config
