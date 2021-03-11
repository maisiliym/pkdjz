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

stdenv.mkDerivation (attrs // {
  name = namePrefix + "${pname}-${version}";

  inherit unpackPhase configurePhase buildPhase preInstall postInstall;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r . $out
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
