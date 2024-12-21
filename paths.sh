#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Created by `pipx` on 2024-10-29 00:50:18
export PATH="$PATH:/home/betterluis/.local/bin"

export EDITOR=vim
export VISUAL=vim
 
#utils
pyenvs="/media/terakek/Coding/pyEnvs"
mic1="/home/betterluis/utils/monitorMic.out 1"
mic0="/home/betterluis/utils/monitorMic.out 0"

# path shortcuts
repos="/media/terakek/repos"
python="/media/terakek/Coding/python/"
flask="/media/terakek/Coding/python/flaskk"
codewars="/media/terakek/repos/codewars"
configs="/media/terakek/repos/configs"
testing="/media/terakek/repos/Testing-Grounds"
gitv="/media/terakek/Coding/GIT-VSC"
cbeg="/media/terakek/Coding/GIT-VSC/C"
cadv="/media/terakek/Coding/GIT-VSC/C/advanced"
sql="/media/terakek/Coding/GIT-VSC/sql"
suckless="/home/betterluis/suckless"

playwii="/media/terakek/PLAYWII"
ddr="/media/terakek/ddr"
bashcode="/media/terakek/repos/bash"
lexpincode="/media/terakek/repos/18CPW"
xampp="sudo /opt/lampp/manager-linux-x64.run"
telegram="/media/terakek/repos/bash/telegram.sh"
#sql
sqltraining="mariadb -u betterluis -p training_db"


captureCard="ffplay -f v4l2 -input_format mjpeg -video_size 1280x720 -framerate 59.94 -i /dev/video0"

export IMAGE_VIEWER="feh"
