sudo apt install zsh git -y

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

chsh -s /bin/zsh

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/joelthelion/autojump.git ~/.oh-my-zsh/custom/plugins/autojump


sed -i '/^plugins=/c\plugins=(git sudo z zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' ~/.zshrc
sed -i '/^ZSH_THEME=/c\ZSH_THEME="ys"' ~/.zshrc
! grep -q "autoload -U compinit && compinit" ~/.zshrc && echo "autoload -U compinit && compinit" >> ~/.zshrc

zsh
cd ~/.oh-my-zsh/custom/plugins/autojump
./install.py | awk -v home="$HOME" '/source/ { gsub(/^[ \t]+/, ""); print >> home"/.zshrc" }'
source ~/.zshrc
