_: {
  system = "x86_64-linux";
	networking.hostName = "taiga";

  imports = [
    ./fs.nix
		./kernel.nix
  ];
}
