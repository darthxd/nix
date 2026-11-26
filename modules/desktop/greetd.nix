{
	services.displayManager.sddm.enable = false;

	services.greetd = {
		enable = true;

		settings = {
			default_session = {
				command = "${pkgs.tuigreet}/bin/tuigreet \
					--time \
					--remember \
					--remember-session \
					--asterisks \
					--cmd '${pkgs.uwsm}/bin/uwsm start -eD Hyprland hyprland.desktop'";

				user = "greeter";
			};
		};
	};
}
