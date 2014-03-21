{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wine
    dmenu
    scrot
    # xmonad needs xmessage to communicate with xmobar
    xlibs.xmessage
    # xmonad also needs ghc to compile itself
    haskellPackages.haskellPlatform
    haskellPackages.haskellPlatform.ghc
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonadContrib
    haskellPackages.xmonadExtras
    trayer
  ];

  services.xserver = {
    enable = true;
    layout = "us";
    windowManager.xmonad.enable = true;
    windowManager.default = "xmonad";
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
  };
  
  services.nixosManual.showManual = true;
}
