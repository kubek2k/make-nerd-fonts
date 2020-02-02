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
        if [ -d "${fontPkg.outPath}/share/fonts/opentype" ]; then
          mkdir -p $out/share/fonts/opentype
          cd $out/share/fonts/opentype
          LANG=en_US.UTF-8 find ${fontPkg.outPath}/share/fonts/opentype -name '*.otf' -exec fontforge ${nerd-font-patcher.outPath}/font-patcher {} \;
        fi
        
        if [ -d "${fontPkg.outPath}/share/fonts/truetype" ]; then
          mkdir -p $out/share/fonts/truetype
          cd $out/share/fonts/truetype
          LANG=en_US.UTF-8 find ${fontPkg.outPath}/share/fonts/truetype -name '*.ttf' -exec fontforge ${nerd-font-patcher.outPath}/font-patcher {} \;
        fi
      '';
    }
