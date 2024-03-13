with import <nixpkgs> {}; mkShell.override { stdenv = swift.stdenv; } {
    buildInputs = [
        swift
        swiftPackages.Foundation
    ];
}
