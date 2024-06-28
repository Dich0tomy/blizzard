{
  description = "My neovim config";

  outputs = inputs @ {parts, ...}:
    parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./hosts # Hosts specific modules
        ./core # Core modules for things like nix, hardware, services
        ./modules # General modules for all hosts
      ];

      perSystem = _: {
        imports = [
          ./strap
        ];
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    parts.url = "github:hercules-ci/flake-parts";
  };
}
