{ config, pkgs, ... }:

let
  sessionData = config.services.displayManager.sessionData.desktops;
in
{
  services.displayManager.sddm.enable = false;

  services.greetd = {
    enable = true;

    settings.default_session = {
      user = "greeter";

      command = builtins.concatStringsSep " " [
        "${pkgs.tuigreet}/bin/tuigreet"

        "--time"
        "--remember"
        "--asterisks"

        "--sessions ${sessionData}/share/wayland-sessions"
        "--xsessions ${sessionData}/share/xsessions"

        "--cmd '${pkgs.uwsm}/bin/uwsm start hyprland.desktop'"
      ];
    };
  };
}

