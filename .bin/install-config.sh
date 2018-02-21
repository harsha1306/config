###########################################################
##
## Script to clone config and export the config command
##
###########################################################

## Setup a bare repo
git clone --bare https://github.com/harsha1306/config.git $HOME/.cfg

## mappings to make config a command
function config {
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

## Directory to backup any existing dot files
mkdir -p .config-backup
config checkout
## Attempt to clone the config
if [ $? = 0 ]; then
    echo "Checked out config.";
else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

config checkout
config config status.showUntrackedFiles no
