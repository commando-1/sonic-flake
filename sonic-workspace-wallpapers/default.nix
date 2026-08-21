{ mkSonicDerivation, pkgs, pname, src, version, Sonic-DE, ... }:

mkSonicDerivation {

  inherit pname src version;

  patches = [
  ];

  buildDependencies = with pkgs; [
  ] 
  ++ (with pkgs.kdePackages; [
    qttools
    kconfig
    kdbusaddons
    kdeclarative
    kholidays
    ki18n
    kcmutils
    knotifications
    kservice
    sonnet
    kunitconversion
    kxmlgui
    knewstuff
    kjobwidgets
    ksvg
    qtwebengine
    polkit-qt-1
  ])
  ++ (with Sonic-DE; [
    sonic-frameworks-cmake-modules
    sonic-frameworks-core-addons
    sonic-frameworks-keybind
    sonic-frameworks-auth
    sonic-frameworks-io
    sonic-frameworks-runner
    sonic-interface-libraries
    sonic-frameworks-via
  ]);

  propagatedDependencies = with pkgs; [
    kdePackages.kirigami-addons
    kdePackages.kitemmodels
    kdePackages.qtquick3d
  ];

  extraNativeBuildInputs = with pkgs; [
    pkg-config
  ];

  extraCmakeFlags = with pkgs; [
  ];

  hasPythonBindings = false;

  meta = {
    description = "A collection of wallpapers for Sonic-DE!";
    homepage = "https://github.com/Sonic-DE/sonic-workspace-wallpapers";
    license = pkgs.lib.licenses.gpl2Plus;
    platforms = pkgs.lib.platforms.linux;
  };
}
