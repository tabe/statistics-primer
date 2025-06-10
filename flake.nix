{
  description = "Statistics Primer";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = { self, nixpkgs }: let

    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    forAllSystems = nixpkgs.lib.genAttrs allSystems;

    statistics-primer = system: with nixpkgs.legacyPackages.${system};
      stdenv.mkDerivation {
        pname = "statistics-primer";
        version = "2025.06.10";

        nativeBuildInputs = [
          emacs
          texlive.combined.scheme-full
        ];

        src = ./src;

        preBuild = ''
          export HOME=$(mktemp -d) # https://github.com/NixOS/nixpkgs/issues/180639
        '';
      };

  in {

    packages = forAllSystems (system: {
      default = statistics-primer system;
    });

  };
}
