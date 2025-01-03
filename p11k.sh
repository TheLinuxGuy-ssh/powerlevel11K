echo "
██████╗  ██████╗ ██╗    ██╗███████╗██████╗ ██╗     ███████╗██╗   ██╗███████╗██╗     ██╗ ██╗██╗  ██╗
██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗██║     ██╔════╝██║   ██║██╔════╝██║    ███║███║██║ ██╔╝
██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝██║     █████╗  ██║   ██║█████╗  ██║    ╚██║╚██║█████╔╝ 
██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗██║     ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║ ██║██╔═██╗ 
██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║███████╗███████╗ ╚████╔╝ ███████╗███████╗██║ ██║██║  ██╗
╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝  ╚═══╝  ╚══════╝╚══════╝╚═╝ ╚═╝╚═╝  ╚═╝
";
read -p "Welcome to Powerlevel11K setup! Begin Installation? (y/n)" confirm

if [ "$confirm" == 'y' ] || [ "$confirm" == 'Y' ]; then

    echo "[+] Installing ZSH...";

    update_apt() {
        sudo apt update;
        sudo apt upgrade;
        sudo apt install zsh;
    }

    update_pacman() {
        sudo pacman -Syu;
        sudo pacman -S zsh;
        sudo pacman -S zsh-syntax-highlighting;
    }

    update_brew() {
        brew update;
        brew upgrade;
        brew install zsh;
    }


    if [ $OSTYPE == "linux-gnu" ]; then
        # Check if apt command exists
        if command -v apt &> /dev/null; then
            update_apt
        # Check if pacman command exists
        elif command -v pacman &> /dev/null; then
            update_pacman
        fi
    elif [ "$OSTYPE" == "darwin23.0" ]; then
        # Check if brew command exists
        if command -v brew &> /dev/null; then
            update_brew
        else
            echo "[-] brew not found, installing brew...";
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            update_brew
        fi
    fi

    echo "[!] Configuring ZSH.";
    cp -r ./.* ~
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
    echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
    echo "[!] Changing default shell to zsh."
    sudo chsh -s /bin/zsh
    chsh -s /bin/zsh
    exec zsh

else 
    echo "Installation Cancelled!"
fi
