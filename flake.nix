{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
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
        shellHook = ''
          export QMLLS_BUILD_DIRS=${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml/:${quickshellWith}/lib/qt-6/qml/
          export QML_IMPORT_PATH=$PWD/src
        '';
      };
    };
}
