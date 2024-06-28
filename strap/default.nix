{pkgs, ...}: {
  formatter = pkgs.alejandra;

  devShells.default = pkgs.mkShell {
    packages = [
      pkgs.alejandra
      pkgs.git
      pkgs.nil
    ];
  };
}
