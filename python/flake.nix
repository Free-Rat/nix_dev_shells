{
	description = "Flake with shell for python";
	#this project is about creating a simple java project with rest api
	#it allows to sort provided data using different algorithms and return sorted data though rest api

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, ... }@inputs:
		let
			# system = "x86_64-linux";
			# pkgs = nixpkgs.legacyPackages.${system};
			pkgs = import nixpkgs { 
				system = "x86_64-linux";
				config = {
					allowUnfree = true; 
				};
			};
		in
			{
			devShells.x86_64-linux.default =
				pkgs.mkShell {
  					nativeBuildInputs = (with pkgs; [
						qt5.full
						python3Packages.autopep8
						python3Packages.flake8
					]);
					shellHook = ''
			export NIXPKGS_ALLOW_UNFREE=1
			export QT_QPA_PLATFORM_PLUGIN_PATH=“${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins”;
			export LD_LIBRARY_PATH=“${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins”;
			'';

					packages = (with pkgs; [
						git
						python311
						(vscode-with-extensions.override {
							vscodeExtensions = with vscode-extensions; [
								ms-toolsai.jupyter
								ms-python.python
								ms-pyright.pyright
								vscodevim.vim
							];
						})
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
							sklearn-deap

						]);
				};
		};
}
