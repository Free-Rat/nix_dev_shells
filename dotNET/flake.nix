{
  description = "Flake with shell for Web .NET Project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      # system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
	  pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell {

          shellHook = ''
          '';

          packages = (with pkgs; [
		  	dotnet-sdk_8

			vscode
			vscode-extensions.ms-dotnettools.csharp
			vscode-extensions.ms-dotnettools.csdevkit

			chromium

			nss
          ]);
        };
    };
}
