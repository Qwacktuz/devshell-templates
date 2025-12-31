{
  description = "Java/Kotlin Environment";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # temurin-bin-21
          temurin-bin-25
          gradle
          maven
          kotlin

          # LSPs can be tricky for Java in Nix,
          # but usually IntelliJ/LazyVim handles the download via the extension.
          # We provide the runtime here.
        ];

        # Set JAVA_HOME so editors find it automatically
        shellHook = ''
          export JAVA_HOME=${pkgs.temurin-bin-25}
        '';
      };
    };
}
