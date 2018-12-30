{ compiler ? "ghc844" }:

let
  pkgs = import ./../nixpkgs.nix {};
  site-generator = import ./default.nix { inherit compiler; };
in
  if pkgs.lib.inNixShell then site-generator.env else site-generator
