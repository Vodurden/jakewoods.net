# Overview

This is the source for [jakewoods.net](https://jakewoods.net), my personal website.

# Pre-requisites

To build and operate this website you need:

- [nix](https://nixos.org/nix/)

That's it!

# Site

The site module contains the content of the site. It will be compiled into html, css and javascript by the
site generator.

To work on the site it can be convienient to set the `site-generator` to `watch` the site:

```
# In root (i.e. ./jakewoods.net)
nix-build -A site-generator
cd site
../result/bin/site-generator watch
```

The site will be available on http://localhost:8000 and changes made to the site folder will be available
immediately after refreshing.

# Site Generator

The site generator consumes the content from the site module and turns it into html, css and javascript. It
is built with [Hakyll](https://jaspervdj.be/hakyll/).

## Developing

To build the `site-generator` run `nix-build -A site-generator`. The bin will appear under
`result/bin/site-generator`.

When developing the `site-generator` it can be convienient to use `nix-shell` like so:

```
# In root (i.e. ./jakewoods.net)
cd site-generator
nix-shell
cabal new-build    # To build
cabal new-run      # To run
```

This uses cabal's incremental compilation so it is a lot faster if you're making a lot of changes to
the generator.
