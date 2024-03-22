{
  description = "Flake with shell for Java dev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell {

          shellHook = ''
            echo "nix develop"
          '';

          packages = with pkgs; [
            maven
			gradle
            jdk21
            git
			jetbrains.idea-community
			jetbrains.jdk
          ];
        };
    };
}
