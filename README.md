# make-nerd-fonts.nix

A simple function that transforms given fonts package into nerd fonts package


## Usage

Lets say you want to create a nerd-fonts for jost font:

```nix
let 
  makeNerdFonts = pkgs.callPackage(pkgs.fetchFromGithub {
    owner = "kubek2k";
    repo = "make-nerd-fonts.nix";
    rev = "0.1";
    sha256 = "1ascm10kbwcci454yxhals320q1g0n2arxk918mr2bw1nimbw48j";
  });
in
  {
    jostNerdFonts = makeNerdFonts pkgs pkgs.jost;
  }
```
