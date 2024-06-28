{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./substituters.nix
  ];

  environment.systemPackages = [pkgs.git];

  nix = {
		# TODO: filter this for nixpkgs only
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      trusted-users = ["root" "@wheel"];
    };
  };
}
