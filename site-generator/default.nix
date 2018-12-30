{ compiler ? "ghc844" }:

let
  pkgs = import ./../nixpkgs.nix {};

  haskellPackages = pkgs.haskell.packages.${compiler}.override {
    overrides = self: super: rec {
      ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
      ghcWithPackages = self.ghc.withPackages;
    };
  };

  site-generator = haskellPackages.callPackage ./site-generator.nix {};
in
  site-generator
