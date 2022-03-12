{patchelf, stdenv, glib, fetchurl, lib, ...}:
stdenv.mkDerivation rec{
  pname = "ti_c2000";
  version = "21.12.0.STS";

  src = fetchurl {
    url = "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-xqxJ05PLfM/20.12.0.STS/ti_cgt_c2000_20.12.0.STS_linux-x64_installer.bin";
    sha256 = "CaXDCJVmMKYcTaJ3yCCUcuoAk+zRAmFJ8Jiy2q7xn5E=";
  };

  nativeBuildInputs = [
    glib
  ];

  sourceRoot = ".";

  dontUnpack = true;

  installPhase = '' 
    mkdir -p $out
    cp $src $out/ti_cgt_c2000_20.12.20.STS_linux-x64_installer.bin
    chmod u+rwx $out/ti_cgt_c2000_20.12.20.STS_linux-x64_installer.bin
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/ti_cgt_c2000_20.12.20.STS_linux-x64_installer.bin
    $out/ti_cgt_c2000_20.12.20.STS_linux-x64_installer.bin --mode unattended --prefix $out
  '';
}
