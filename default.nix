{ pkgs ? import <nixpkgs> {
	crossSystem = (import <nixpkgs/lib>).systems.examples.mingwW64;
} }:
pkgs.stdenv.mkDerivation {
	name = "fl-dll";
	GOOS = "windows";
	GOARCH = "amd64";
	CGO_ENABLED = 1;
	HOME = "/build";
	GOCACHE = "/build";
	CC = "${pkgs.buildPackages.gcc}/bin/gcc";
	src = ./.;
	buildInputs = with pkgs; [
		buildPackages.gcc
		buildPackages.go
	];
	buildPhase = "${pkgs.buildPackages.go}/bin/go build -buildmode=c-shared -o idk.dll main.go";
	installPhase = "cp -r idk.dll $out";
}
