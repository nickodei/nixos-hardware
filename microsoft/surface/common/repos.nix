{ fetchFromGitHub, lib }:

{
  linux-surface = fetchFromGitHub {
    owner = "linux-surface";
    repo = "linux-surface";
    rev = "arch-6.11.4-1";
    hash = lib.fakeHash;
  };

  # This is the owner and repo for the pre-patched kernel from the "linux-surface" project:
  linux-surface-kernel = { rev, sha256 }:
    fetchFromGitHub {
      owner = "linux-surface";
      repo = "kernel";
      inherit rev sha256;
    };

  surface-go-ath10k-firmware_backup = fetchFromGitHub {
    owner = "mexisme";
    repo = "linux-surface_ath10k-firmware";
    rev = "74e5409e699383d6ca2bc4da4a8433d16f3850b1";
    sha256 = "169vgvxpgad9anmchs22fj5qm6ahzjfdnwhd8pc280q705vx6pjk";
  };
}
