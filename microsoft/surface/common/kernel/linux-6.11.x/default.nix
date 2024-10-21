{ config, lib, pkgs, ... }:

let
  inherit (lib) mkIf mkOption;

  inherit (pkgs.callPackage ../linux-package.nix { }) linuxPackage surfacePatches isVersionOf versionsOfEnum;

  cfg = config.microsoft-surface;

  version = "6.11.4";
  kernelPatches = surfacePatches {
    inherit version;
    patchFn = ./patches.nix;
  };
  kernelPackages = linuxPackage {
    inherit version kernelPatches;
    sha256 = "02xzxf1vzpl8s55jjjbsxvlzf4dd9jw52ylcmhw8jpvr5praa8jr";
    ignoreConfigErrors=true;
  };

in {
  options.microsoft-surface.kernelVersion = mkOption {
    type = versionsOfEnum version;
  };

  config = mkIf (isVersionOf cfg.kernelVersion version) {
    boot = {
      inherit kernelPackages;
    };
  };
}
