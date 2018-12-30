{ # Nix dependencies
  mkDerivation, stdenv, hpack, cabal-install

  # Haskell lib dependencies
  , base, hakyll
}:
mkDerivation {
  pname = "site-generator";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ cabal-install ];
  executableHaskellDepends = [
    base hakyll
  ];
  license = stdenv.lib.licenses.bsd3;
}
