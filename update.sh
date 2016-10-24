#!/bin/bash

# emacs
ln -si `pwd`/emacs.d/init.el ~/.emacs.d/init.el && \
    ln -si `pwd`/emacs.d/elisp ~/.emacs.d/

# i3
i3_config_1=~/.i3/
i3_config_2=~/.config/i3/

if [ -d $i3_config_1 ]; then
    ln -si `pwd`/i3/config $i3_config_1
elif [ -d $i3_config_2 ]; then
    ln -si `pwd`/i3/config $i3_config_2
else
    echo "need to init i3 config"
fi
