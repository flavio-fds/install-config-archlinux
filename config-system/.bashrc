#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Infp System
#neofetch

alias v='vim'
alias ..='cd ..'
alias ll='ls -l'
alias la='ls -la'
alias itop='sudo intel_gpu_top'
alias ls='ls --color=auto'
alias neo='neofetch'
alias c='calc'
alias matrix='cmatrix'
alias logout='dm-tool switch-to-greeter'

    #Atributo da fonte
#00 - Reset (Nenhum)/1-Negrito/4-Sublinhado/5-Piscant/7-Reverso/8-Oculto
    #Cor da fonte
#30 - Preto/31-Vermelho/32-Verde/33-Amarelo/34-Azul/35-Magenta/36-Ciano/37-Branco
    #Cor de fundo
#40-Preto/41 - Vermelho/42-Verde/43-Amarelo/44-Azul/45-Magenta/46-Ciano/47-Branco
#\[\e[0;30;40m\]   

#PS1='[\u@\h \w]\$ '
#PS1='\[\e[1;34m\][ \u\[\e[1;34m\]@\[\e[1;34m\]\h \[\e[1;32m\]\w\[\e[1;34m\]]  \[\e[00;34m\]\[\e[1;37m\]'
PS1='\[\e[1;34m\][\[\e[1;32m\] \[\e[1;34m\]Flavio\[\e[1;34m\]@\[\e[1;34m\]Arch \[\e[1;32m\]\w\[\e[1;34m\]]  \[\e[00;34m\]\[\e[1;37m\]'

#LS_COLORS=$LS_COLORS':no=00'
#LS_COLORS=$LS_COLORS':di=36;01'
#LS_COLORS=$LS_COLORS':tw=33;01'
#LS_COLORS=$LS_COLORS':ow=33;01'
#LS_COLORS=$LS_COLORS':fi=93'
#LS_COLORS=$LS_COLORS':ln=00'
#LS_COLORS=$LS_COLORS':pi=00'
#LS_COLORS=$LS_COLORS':so=00'
#LS_COLORS=$LS_COLORS':ex=00'
#LS_COLORS=$LS_COLORS':bd=00'
#LS_COLORS=$LS_COLORS':cd=00'
#LS_COLORS=$LS_COLORS':or=00'
#LS_COLORS=$LS_COLORS':mi=00'
#LS_COLORS=$LS_COLORS':*.sh=31'
#LS_COLORS=$LS_COLORS':*.sh=31'
#LS_COLORS=$LS_COLORS':*.exe=31'
#LS_COLORS=$LS_COLORS':*.bat=31'
#LS_COLORS=$LS_COLORS':*.com=31'

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
