{
  description = "pkdjz - pkgs replacements";

  outputs = registry@{ self }: {
    SobUyrldz = {
      dunst = {
        lamdy = import ./dunst.nix;
        modz = [ "pkgs" ];
        selfHob = "dunst";
      };

      nightlyRust = {
        lamdy = import ./nightlyRust.nix;
        modz = [ "mozPkgs" ];
        selfHob = "nixpkgs-mozilla"; /* currently unused */
      };

    };
  };
}
