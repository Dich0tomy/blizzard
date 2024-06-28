{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.taiga.kernelMods;
in {
  options.taiga.kernelMods = {
    enable = lib.mkOption {
    	type = lib.types.bool;
    	default = true;
    };
  };

	config = lib.mkIf cfg.enable
	{
		boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;

		environment.systemPackages = [ pkgs.scx ];

		boot.kernelParams = lib.mkIf cfg.enable [
			"amd_pstate=active"
		];
	};
}
