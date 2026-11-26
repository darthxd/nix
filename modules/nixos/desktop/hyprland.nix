{ pkgs, ... }:

{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		withUWSM = true;
	};

	security.polkit.enable = true;

	programs.hyprlock.enable = true;

	programs.dconf.enable = true;

	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-gtk
		];
	};

	services = {
		gvfs.enable = true;
		udisks2.enable = true;
		tumbler.enable = true;
		upower.enable = true;
		blueman.enable = true;
	};

	programs.nm-applet.enable = true;

	fonts = {
		enableDefaultPackages = true;


		packages = with pkgs; [
			noto-fonts
			noto-fonts-color-emoji
			liberation_ttf
			nerd-fonts.jetbrains-mono
		];

		fontconfig.defaultFonts = {
			serif = [ "Noto Serif" ];
			sansSerif = [ "Noto Sans" ];
			monospace = [ "JetBrainsMono Nerd Font" ];
			emoji = [ "Noto Color Emoji" ];
		};
	};
}
