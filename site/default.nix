{ site-generator ? import ../generator }:

let
  pkgs = import ./../nixpkgs.nix {};
in
  pkgs.stdenv.mkDerivation {
    name = "site";
    src = ./.;

    phases = [ "unpackPhase" "buildPhase" "installPhase" ];
    buildInputs = [ site-generator ];

    buildPhase = ''
      # Resolve a locale issue where some locale environment variables are
      # not correctly set and result in Hakyll being unable to parse unicode.
      export LOCALE_ARCHIVE="${pkgs.glibcLocales}/lib/locale/locale-archive";
      export LANG=en_US.UTF-8

      site-generator build

      mkdir $out

    '';

    installPhase = ''
      mkdir -p $out/site
      cp -r _site/* $out/site/
    '';
}
