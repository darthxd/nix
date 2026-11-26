{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Terminal
		kitty

		# Desktop
		waybar
		fuzzel
		mako
		libnotify

		# Hyprland
		hyprpaper
		hypridle
		hyprpolkitagent

		# File Manager
		thunar

		#Screenshot e Clipboard
		grim
		slurp
		wl-clipboard

		# Audio e Brilho
		pavucontrol
		playerctl
		brightnessctl

		# Integracoes
		xdg-utils
		adwaita-icon-theme

		# Diagnostico Grafico
		mesa-demos
		vulkan-tools
		wayland-utils

		# Navegador
		firefox
	];
}
