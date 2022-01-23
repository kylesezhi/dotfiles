sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim git fzf tmux zoxide -y
bash <(curl -Ss https://my-netdata.io/kickstart.sh) --stable-channel --disable-telemetry
sudo raspi-config
curl -sSL https://install.pi-hole.net | bash
