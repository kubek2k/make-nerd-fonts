pkgs:
let 
  nerd-font-patcher = pkgs.fetchgit {
                            url = "https://github.com/ryanoasis/nerd-fonts.git";
                            rev = "v2.0.0";
                            sha256 = "09i467hyskvzj2wn5sj6shvc9pb0a0rx5iknjkkkbg1ng3bla7nm";
                        };
in
fontPkg: pkgs.stdenv.mkDerivation {
      name = "${fontPkg.name}-nerd-font";
      builtInputs = [fontPkg];
      propagatedBuildInputs = [pkgs.fontforge pkgs.python27Packages.configparser];
      unpackPhase = "true";
      installPhase = ''
        mkdir -p $out
        cp -R ${fontPkg.outPath}/* $out
        LANG=en_US.UTF-8 find $out -name '*.otf' -exec fontforge ${nerd-font-patcher.outPath}/font-patcher {} \;
        LANG=en_US.UTF-8 find $out -name '*.ttf' -exec fontforge ${nerd-font-patcher.outPath}/font-patcher {} \;
      '';
    }
