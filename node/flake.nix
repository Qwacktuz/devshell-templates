{
  description = "Node.js Svelte Environment";
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
          nodejs_25
          typescript
          pnpm

          # LSPs for LazyVim
          nodePackages.typescript-language-server
          nodePackages.svelte-language-server
          vscode-langservers-extracted # HTML/CSS/JSON
        ];
      };
    };
}
