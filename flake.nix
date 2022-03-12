{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  flake-utils.lib.eachDefaultSystem( system:
    let pkgs = nixpkgs.legacyPackages.${system}; in
    rec{
      packages.ti_c2000 = pkgs.callPackage ( import ./default.nix ){};

      devShell = pkgs.mkShell {
        buildInputs = [packages.ti_c2000];
      };

      defaultPackage = packages.ti_c2000;
    });
}
