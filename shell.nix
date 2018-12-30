{ compiler ? "ghc844", doBenchmark ? false }:

let
  pinnedVersion = builtins.fromJSON (builtins.readFile ./nix/nixpkgs-version.json);
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs-channels/archive/${pinnedVersion.rev}.tar.gz";
    sha256 = pinnedVersion.sha256;
  };
  pkgs = import nixpkgs {};

  jakewoodsnet = import ./default.nix;

  haskellPackages = pkgs.haskell.packages.${compiler}.override {
    overrides = haskellNew: haskellOld: rec {
      ghc = haskellOld.ghc // { withPackages = haskellOld.ghc.withHoogle; };
      ghcWithPackages = haskellNew.ghc.withPackages;
    };
  };

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage jakewoodsnet {});
in
  if pkgs.lib.inNixShell then drv.env else drv
