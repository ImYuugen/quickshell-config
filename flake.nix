{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, quickshell, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      quickshellWith = (
        quickshell.packages.${system}.default.override {
          withJemalloc = true;
          withQtSvg = true;
          withPipewire = true;
          withWayland = true;
          withHyprland = true;
        }
      );
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          quickshellWith
          pkgs.kdePackages.qtdeclarative
        ];
      };
    };
}
