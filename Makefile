BACKUP_PREFIX=${HOME}/.bm-environment-bkups
BACKUP_DATE:=$(shell date +'%y.%m.%d_%H:%M:%S')
BACKUP_DIR=${BACKUP_PREFIX}_${BACKUP_DATE}

dotfiles=\
.vim \
.gitconfig \
.vimrc \
.bashrc \
.bash_aliases \
.tmux.conf


install:
	# backup the old
	mkdir -p ${BACKUP_DIR}
	for fn in ${dotfiles}; do mv ${HOME}/$$fn ${BACKUP_DIR}; done

	# symlink to these
	for fn in ${dotfiles}; do ln -s `pwd`/$$fn ${HOME}/$$fn; done

