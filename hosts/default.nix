{
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  core = "${self}/core/";

  specialArgs = {inherit inputs self;};
in {
  flake.nixosConfigurations = {
    # TODO: Make wrapper and automatically set hostName from name
    taiga = nixosSystem {
      inherit specialArgs;

      modules = [
        ./taiga
        # "${core}"
      ];
    };
  };
}
