BACKUP_PREFIX=${HOME}/.bm-environment-bkups
BACKUP_DATE:=$(shell date +'%y.%m.%d_%H:%M:%S')
BACKUP_DIR=${BACKUP_PREFIX}_${BACKUP_DATE}

install:
	# backup the old
	mkdir -p ${BACKUP_DIR}
	mv ${HOME}/.vim ${BACKUP_DIR}
	mv ${HOME}/.gitconfig ${BACKUP_DIR}
	mv ${HOME}/.vimrc ${BACKUP_DIR}
	# symlink to these
	ln -s `pwd`/.vim ${HOME}/.vim
	ln -s `pwd`/.gitconfig ${HOME}/.gitconfig
	ln -s `pwd`/.vimrc ${HOME}/.vimrc
	ln -s `pwd`/.bashrc ${HOME}/.bashrc
	ln -s `pwd`/.bash_aliases ${HOME}/.bash_aliases

