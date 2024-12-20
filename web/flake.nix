{
  description = "Flake with shell for Web Project";

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
		  	cd ~/uni/web
          '';

          packages = (with pkgs; [
            # git
			# sass

			# react
			nodejs_21
			# nodePackages_latest.nodemon
			# yarn
			# nodePackages.create-react-app

          ]);
        };
    };
}
