# make-nerd-fonts.nix

A simple function that transforms given fonts package into nerd fonts package


## Usage

Lets say you want to create a nerd-fonts for jost font:

```nix
let 
  makeNerdFonts = pkgs.callPackage(pkgs.fetchFromGitHub {
    owner = "kubek2k";
    repo = "make-nerd-fonts.nix";
    rev = "0.2";
    sha256 = "1crixvp4kp2fc5wyg9jk0rs3ihi3b0x1bj4hq6g2xa4b4n4mirv8";
  });
in
  {
    jostNerdFonts = makeNerdFonts pkgs pkgs.jost;
  }
```
