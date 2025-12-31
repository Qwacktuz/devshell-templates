{
  description = "Cactuz's Devshell Templates";

  # Add to local nix registry
  # https://nix.dev/manual/nix/2.28/command-ref/new-cli/nix3-registry.html
  # nix registry add devshells github:qwacktuz/devshell-templates

  outputs =
    { self }:
    {
      templates = {
        # How to start developing from a template:

        # First command is preferred
        # nix flake init -t devshells#python
        # nix flake init -t github:qwacktuz/devhell-templates#python

        # Create the envrc (if needed)
        # echo "use flake" > .envrc

        # Will also run nix develop under the hood
        # direnv allow

        # Other handy commands
        # direnv reload

        node = {
          path = ./node;
          description = "Node.js 24, pnpm, and Svelte setup";
        };

        python = {
          path = ./python;
          description = "Python 3.15 with pixi";
        };

        java = {
          path = ./java;
          description = "Java 25 (Temurin), Gradle, and Kotlin";
        };

        go = {
          path = ./go;
          description = "Go 1.25 and gopls";
        };

        rust = {
          path = ./rust;
          description = "Rust toolchain with rust-analyzer";
        };

      };
    };
}
