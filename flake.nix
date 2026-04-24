{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages.${system} = {
        default = { };
      };
    });
}
