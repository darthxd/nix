{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;

    extraConfig = ''
	set rnu
	set si
	set fillchars+=eob:\ 

	let &t_SI = "\e[6 q"  " Steady vertical bar in Insert mode
	let &t_EI = "\e[2 q"  " Steady block in Normal mode
	let &t_SR = "\e[4 q"  " Steady underline in Replace mode

	syntax on
    '';
  };
}

