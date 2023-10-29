SOURCES := vim
DOTFILES := $(patsubst %, ${HOME}/.%, $(SOURCES))

DEFAULT_TARGETS := $(DOTFILES) ${HOME}/.vimrc

$(DOTFILES): $(addprefix ${HOME}/., %) : ${PWD}/%
	ln -fs $< $@

${HOME}/.vimrc:
	ln -fs $(PWD)/vim/vimrc $@

.PHONY : install
install: $(DEFAULT_TARGETS) dotfiles

.PHONY: dotfiles
dotfiles:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
	ln -fn $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -snf $(CURDIR)/.bash_profile $(HOME)/.profile;
	ln -snf $(CURDIR)/.vimrc $(HOME)/.ideavimrc;
