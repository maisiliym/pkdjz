{ kor
, stdenv
, neovim
}:
let
  namePrefix = "nvimPlogin-";

in
attrs@
{ pname
, version
, src
, unpackPhase ? ""
, configurePhase ? ":"
, buildPhase ? ":"
, preInstall ? ""
, postInstall ? ""
, ...
}:
let
  inherit (builtins) elem readDir;
  inherit (kor) mapAttrsToList;

  srcDirs = readDir src;

  ploginComponents = [
    "lua"
    "filetype.vim"
    "scripts.vim"
    "autoload"
    "colors"
    "doc"
    "ftplugin"
    "indent"
    "keymap"
    "plugin"
    "rplugin"
    "syntax"
  ];

  getComponent = dirNeim: fileType:
    if ((fileType == "directory") && (elem dirNeim ploginComponents))
    then dirNeim else null;

  components = mapAttrsToList getComponent srcDirs;

in
stdenv.mkDerivation (attrs // {
  name = namePrefix + "${pname}-${version}";

  inherit unpackPhase configurePhase buildPhase preInstall postInstall components;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    for dir in ''${components[@]}; do
      cp -r $dir $out
    done
  ''
  + # build help tags
  ''
    if [ -d "$out/doc" ]; then
    echo "Building help tags"
    if ! ${neovim}/bin/nvim -N -u NONE -i NONE -n -E -s -V1 -c "helptags $out/doc" +quit!; then
    echo "Failed to build help tags!"
    exit 1
    fi
    else
    echo "No docs available"
    fi

    runHook postInstall
  '';
})
