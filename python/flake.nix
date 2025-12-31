{
  description = "Python Environment";
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
          python315 # backup, pixi should manage pyversions
          pixi
          # uv

          # LSPs
          basedpyright # better pyright
          ruff # linter
        ];

        shellHook = ''
          # Autoinstall if existing p
          if [ -f pixi.toml ]; then 
            pixi install > /dev/null 2>&1;
          fi

          # pixi install
          # pixi add pandas

          # Add the pixi environment to PATH (first hit)
          export PATH="$PWD/.pixi/envs/default/bin:$PATH"

          echo "🐍 Python Environment Active (Pixi)"
          echo "   Python Version: $(python --version)"
          echo "   Make sure to configure pixi.toml"
        '';

        # Automatically sets up a local venv if it doesn't exist
        # shellHook = ''
        #   if [ ! -d ".venv" ]; then
        #     echo "Creating virtual environment..."
        #     uv venv .venv
        #   fi
        #   source .venv/bin/activate
        # '';
      };
    };
}
