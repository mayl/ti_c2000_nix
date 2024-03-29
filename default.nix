{patchelf, stdenv, fetchurl, ...}:
stdenv.mkDerivation rec{
  pname = "ti_c2000";
  version = "20.12.0.STS";

  installFile = "ti_cgt_c2000_${version}_linux-x64_installer.bin";

  src = fetchurl {
    url = "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-xqxJ05PLfM/20.12.0.STS/${installFile}";
    sha256 = "CaXDCJVmMKYcTaJ3yCCUcuoAk+zRAmFJ8Jiy2q7xn5E=";
  };

  dontUnpack = true;

  installPhase = '' 
    mkdir -p $out
    cp $src $out/$installFile
    chmod u+rwx $out/$installFile
    patchelf --set-interpreter ${stdenv.cc.bintools.dynamicLinker} $out/$installFile
    $out/$installFile --mode unattended --prefix $out
    mv $out/ti-cgt-c2000_${version}/* $out
    ln $out/bin/cl2000 $out/bin/cl2000.exe
    rm -r $out/ti-cgt-c2000_${version}
  '';
}
