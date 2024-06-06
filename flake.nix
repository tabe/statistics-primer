{
  description = "Statistics Primer";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = { self, nixpkgs }: let

    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f (import nixpkgs { inherit system; }));

    statistics-primer = pkgs:
      with pkgs; callPackage ./statistics-primer.nix {};

  in {

    packages = forAllSystems (pkgs: {
      default = statistics-primer pkgs;
    });

  };
}
