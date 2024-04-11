{
  description = "Flake with shell for python";
  #this project is about creating a simple java project with rest api
  #it allows to sort provided data using different algorithms and return sorted data though rest api

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
		  	export NIXPKGS_ALLOW_UNFREE=1
          '';

          packages = (with pkgs; [
            # vscode
            git
            python311
            # vscode-extensions.ms-toolsai.jupyter

          ]) ++ (with pkgs.python311Packages; [
            numpy
            pandas
            matplotlib
            seaborn
            scikit-learn
            jupyter
            ipython
            ipykernel
            ipython
            ipywidgets

          ]);
        };
    };
}
