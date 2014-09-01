# =^..^= cookievim
Jaime's personal vim configuration

This is the CookieVim framework that I put together to simplify my life now
that I use, and regularly change between vim plugins. The idea is simple, just
store each plugin specific config in its own file in a directory, and load
them all. If you don't use a plugin anymore, get rid of it and all configs
easily by renaming or removing the file.

This approach allows the framework to be updated without affecting configs,
and to store configurations safely in a separate repo.

My config's are stored in a separate repo,
(cookievim-config) located here:
https://github.com/jaimetarrant/cookievim-config.git

I have created a simple (probably buggy) installer that gives the option to
install CookieVim without any configs so that you can add only the ones that
you want to use, or with mine.

This framework provides a way to configure vim using self contained
configuration files created for each plugin that a user desires to use. It
uses `vundle` to manage those plugins.

You can rip out a plugin, and all its config simply by renaming or deleting
the plugin file that you created, an example lives in
`.cookievim-config/bundle-loaded/EXAMPLE.config`.

It is called *CookieVim* because I am going through a phase where I name
everything after my little dog. :)

## Philosophy

 - Keep it simple
 - Write your own
 - Add only what you need and understand

I have tried to follow the above after more than 10 years with an ever
growing .vimrc and for a short period, trying out some of the vim
distributions that can be found on Github.

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

A quick way to get started would be to install cookievim and then place your
.vimrc into the `~/.cookievim-config/personal/` directory with a file name of
your choice .. `myconfig.vim` as an example.


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
such as building YouCompleteMe after BundleInstall if I happen to still be
using it. Just remember that some plugins require extra steps that you may
need to take care of after install.,

## cookievim-config directory

You may want to fork or create your own repo for the `cookievim-config`
configuration directory. To deactivate anything in my configuration that you
do not want, simply delete it or rename it without a .config extension. My
repo has a few `something.notloaded` files where I have disabled them, but
might decide to use them again - so I just keep them there.

My one is located here: https://github.com/jaimetarrant/cookievim-config

## When you make changes to your config

If you have added a new plugin, be sure to run this from within vim:

```viml
:BundleInstall
```

If you have removed a plugin, or renamed it from a `.config` extension.

```viml
:BundleClean
```

If you just feel like updating everything

```viml
:BundleUpdate
```

At this point, given that it may take a moment, if you feel like a coffee

```
get coffee
```

## Finally

Its not perfect, if you find issues, have suggestions, or even happen to just
like it, or hate it, feel free to let me know :)


