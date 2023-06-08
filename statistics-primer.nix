{ pkgs, stdenv }:
stdenv.mkDerivation {
  pname = "statistics-primer";
  version = "2023.06.08";

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
    install definitions.tex $out/
    install bayesian-statistics-primer-notes.pdf $out/
  '';
}
