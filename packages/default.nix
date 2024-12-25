inputs: pkgs:

{
  ageEnc = pkgs.callPackage ./ageEnc.nix { };
  ageDec = pkgs.callPackage ./ageDec.nix { };
  ageFile = pkgs.callPackage ./ageFile.nix { };
  battery = pkgs.callPackage ./battery.nix { };
  json2struct = pkgs.callPackage ./json2struct.nix { inherit inputs; };
}
