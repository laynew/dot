# Dotfiles

My dotfiles, which are currently managed as GNU Stow packages.

Each top-level directory is a stow package. The install target for all packages
is $HOME and their contents are arranged as such.

There is a root-level `.stowrc` file that sets the stow target to be $HOME, so
the location of this repository is not important. Just `cd` into the root
directory and issue `stow` commads from there.

## Install

To install a package:  
`stow -S <package name>`

If files are added/removed from a package, the package can be "re-stowed"  
`stow -R <package name>`

For more info:  
`man stow` `info stow`

## TODO

- Add a script to automatically install all packages when bootstrapping a fresh
  environment instead of having to install each package individually
