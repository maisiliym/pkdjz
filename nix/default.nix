{ self
, stdenv
, fetchpatch
, perl
, curl
, bzip2
, sqlite
, openssl
, xz
, pkgconfig
, boehmgc
, perlPackages
, libsodium
, brotli
, boost
, editline
, nlohmann_json
, jq
, libarchive
, busybox-sandbox-shell
, libseccomp
, bison
, flex
, autoconf-archive
, autoreconfHook
, gtest
, which
, mdbook
, lowdown
}:
let
  inherit (builtins) readFile concatStringsSep;
  confDir = "/etc";
  sh = busybox-sandbox-shell;
  mainVersion = readFile (self + /.version);

in
stdenv.mkDerivation {
  pname = "nix";
  version = concatStringsSep "-" [ mainVersion self.shortRev ];
  src = self;

  outputs = [ "out" "dev" "doc" ];

  nativeBuildInputs = [
    pkgconfig
    jq
    bison
    flex
    autoconf-archive
    autoreconfHook
    gtest
    mdbook
  ];

  buildInputs = [
    curl
    openssl
    sqlite
    xz
    bzip2
    nlohmann_json
    libsodium
    brotli
    boost
    editline
    libarchive
    libseccomp
    lowdown
  ];

  propagatedBuildInputs = [ boehmgc ];

  preConfigure = ''
    mkdir -p $out/lib
    cp -pd ${boost}/lib/{libboost_context*,libboost_thread*,libboost_system*} $out/lib
    rm -f $out/lib/*.a
    chmod u+w $out/lib/*.so.*
    patchelf --set-rpath $out/lib:${stdenv.cc.cc.lib}/lib $out/lib/libboost_thread.so.*
  '';

  configureFlags = [
    "--sysconfdir=${confDir}"
    "--with-sandbox-shell=${sh}/bin/busybox"
  ];

  makeFlags = [ "profiledir=$(out)/etc/profile.d" ];

  installFlags = [ "sysconfdir=$(out)/etc" ];

  doInstallCheck = true; # not cross

  separateDebugInfo = true;

  enableParallelBuilding = true;

}
