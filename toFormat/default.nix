{ kor, tojson, runCommandLocal }:
let
  inherit (builtins) toJSON;
  inherit (kor) optionalString;

  kynvyrtKmd = "${tojson}/bin/tojson --from json";

  toFormat = { neim ? "data", valiu, preti ? true, format ? "toml" }:
    let
      jsonValiu = toJSON valiu;
      prettyFlag = optionalString preti "--pretty";
    in
    runCommandLocal "${neim}.${format}" { inherit jsonValiu format prettyFlag; } ''
      printf '%s' """$jsonValiu""" | ${kynvyrtKmd} --to $format $prettyFlag > $out
    '';

in
toFormat
