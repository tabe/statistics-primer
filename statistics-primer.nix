{ pkgs, stdenv }:
stdenv.mkDerivation {
  pname = "statistics-primer";
  version = "2023.06.13";

  nativeBuildInputs = with pkgs; [
    emacs
    texlive.combined.scheme-full
  ];

  src = ./src;

  preBuild = ''
    export HOME=$(mktemp -d) # https://github.com/NixOS/nixpkgs/issues/180639
  '';

  installPhase = ''
    install -d $out
    install bayesian-statistics-primer-notes.pdf $out/
  '';
}
