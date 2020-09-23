# Fnfy

A simple shell alias to create commands

## How it works?

It's an alias that allows you to create another alias as a command to another command.
Did you get it? No? Ok, take a look on how to use it.

## How to use:

You can use to create any command like:

```sh
$ fnfy saymyname echo My name
$ saymyname
My name
```

or you can create an useful command like [this](https://twitter.com/b0rk/status/1308070270809317377/photo/1):

```sh
fnfy svg2png inkscape \"\$1\" -b white --export-png=\"\$2\"
```

> Pay attention to escape special characters.
> Thanks [@jvns](https://github.com/jvns) for the useful `svg2png` command!

## How to install:

You can install the fnfy alias using the install script:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/dapx/fnfy/master/install.sh)"
. ~/.functions # Load functions after install, or you can simply start a new shell session.
```

## How to uninstal:

Remove the load entry from your rc file:

```sh
printf "%s\n" "g/^\. ~\/\.functions$/d" w | ed -s ~/.$(basename $SHELL)rc
```

And if you don't want to keep your functions:

```sh
rm ~/.functions
```

## Where it works?

It does not work on `sh` and `bash`, and I only have tested on `zsh`. But I will try to make it works on `bash` and `sh` too.
