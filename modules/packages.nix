
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editor
    vim

    # Controle de versão
    git

    # Rede
    curl
    wget

    # Monitoramento
    btop
    lm_sensors

    # Diagnóstico de hardware
    pciutils
    usbutils
    nvme-cli

    # Manipulação de arquivos
    tree
    unzip
    zip

    # Ferramentas de terminal
    ripgrep
    fd
    jq

    # Gerenciamento ASUS
    asusctl
  ];

  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };
}
