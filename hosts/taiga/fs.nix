{
  lib,
  config,
  ...
}: let
  cfg = config.taga.fs;
in {
  options.taiga.fs = {
    mountData = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    fstrim = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    services = {
      fstrim = cfg.fstrim;
    };

    fileSystems."/mnt/data" = lib.mkIf cfg.mountaData {
      device = "/dev/disk/by-uuid/D262A93462A91E6B";
      fsType = "ntfs";
    };
  };
}
