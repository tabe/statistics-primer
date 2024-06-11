{
  description = "Statistics Primer";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = { self, nixpkgs }: let

    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f (import nixpkgs { inherit system; }));

    statistics-primer = pkgs: with pkgs;
      stdenv.mkDerivation {
        pname = "statistics-primer";
        version = "2024.06.11";

        nativeBuildInputs = [
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
      };

  in {

    packages = forAllSystems (pkgs: {
      default = statistics-primer pkgs;
    });

  };
}
