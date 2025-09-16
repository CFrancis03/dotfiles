
{ config, pkgs, ... }:

{
	imports =
		[
		./hardware-configuration.nix
		];

# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


# Bluetooth support
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;

# Enable networking
	networking.networkmanager.enable = true;

# Set your time zone.
	time.timeZone = "America/Chicago";

# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

# Enable the X11 windowing system.
	services.xserver.enable = true;

# Enable the KDE Plasma Desktop Environment.
	services.displayManager.sddm.enable = true;
	services.desktopManager.plasma6.enable = true;

# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

# Optional, hint electron apps to use wayland:
# environment.sessionVariables.NIXOS_OZONE_WL = "1";


# Enable CUPS to print documents.
	services.printing.enable = true;

# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

# Enable touchpad support 
	services.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.colton = {
		isNormalUser = true;
		description = "Colton";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
			kdePackages.kate
		];
	};

# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
         		wget
			neofetch
			google-chrome
			curl
			git
			discord-ptb
			neovim
			wine
			tmux
	];


	system.stateVersion = "25.05";

	services.flatpak.enable = true;

# Automatic Garbage Collection
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";      
	};

}
