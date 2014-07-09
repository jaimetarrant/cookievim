# =^..^= cookievim
Jaime's personal vim configuration

This is the CookieVim framework. All config's are stored in a separate repo,
(cookievim-config) located here:
https://github.com/jaimetarrant/cookievim-config.git

## Philosophy

 - Keep it simple
 - Write your own
 - Add only what you need and understand

I have tried to follow the above after more than 10 years with an ever
growing .vimrc and for a short period, trying out some of the vim
distributions that can be found on Github.

It is called *CookieVim* because I am going through a phase where I name
everything after my little dog. :)

I have decided to share it as maybe somebody will find something useful for
their own configuration in here. The vast majority of it has been put together
from things I have learned reviewing other people's configurations and on blog
posts people have written. I guess its only fair that my config should also be
available for others to check out too.

## How it works

There are two main directory locations.

 - `~/.vim/cookievim/*` is the framework
 - `~/.cookievim-config/*` is the configuration directory.

The `~/.vimrc` only loads cookievim, and contains:

```viml
" Source CookieVim config  {
"
if filereadable(expand('~/.vim/cookievim/cookievim.vim'))
  source ~/.vim/cookievim/cookievim.vim
endif

" }
```

I keep the configurations separate from the framework so that the framework
can be updated independantly of the config and vise-versa.

The only thing that `cookievim.vim` does, is load any `.config` file found in
the `.cookievim-config/bundle-loaded` directory, all files contained in the
`~/.cookievim-config/personal/` directory, and configure vundle.

The `~/.cookievim-config/bundle-loaded/` directory has a `EXAMPLE.config` that
shows the basics for configuring a plugin. I have found it makes my life
easier if I configure each plugin in its own file - this allows me to easily
find the plugin specific configurations that I have set and also allows me to
remove a plugin and its associated config simply by moving the file out of the
`bundle-loaded` directory.

Inside the `~/.cookievim-config/personal/` personal directory, you can have as
many files as you like or a single big one. Put all your vim specific config
options in here.

## Install

There is a rough and ready little shell script that will back up your existing
vim configuration and install cookievim. It provides options to install my
configuration, or an empty starter config.

    cookievim/utils/install.sh

Try this to install:

    curl https://raw.githubusercontent.com/jaimetarrant/cookievim/master/util/install.sh > cookievim-install.sh && bash cookievim-install.sh

You can install cookievim and continue to use your own configuration simply by
placing the configuration file into your `~/.cookievim-config/personal/`
directory.

## Important Note
At the moment, there are some post installation things that need to be done,
such as building YouCompleteMe after BundleInstall. I plan to update the
install script to take care of this too soon.

## cookievim-config directory

You may want to fork or create your own repo for the `cookievim-config`
configuration directory. To deactivate anything in my configuration that you
do not want, simply delete it or rename it without a .config extension.

My one is located here: https://github.com/jaimetarrant/cookievim-config


