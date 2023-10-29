SOURCES := vim
DOTFILES := $(patsubst %, ${HOME}/.%, $(SOURCES))

DEFAULT_TARGETS := $(DOTFILES) ${HOME}/.vimrc

$(DOTFILES): $(addprefix ${HOME}/., %) : ${PWD}/%
	ln -fs $< $@

${HOME}/.vimrc:
	ln -fs $(PWD)/vim/vimrc $@

.PHONY : install
install: $(DEFAULT_TARGETS) dotfiles vscode

${HOME}/.config/Code/User/settings.json:
	install -d $(dir $@)
	ln -fs $(PWD)/settings.json $@

.PHONY: vscode
vscode: ${HOME}/.config/Code/User/settings.json

.PHONY: dotfiles
dotfiles:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
	ln -fs $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -fs $(CURDIR)/.bash_profile $(HOME)/.profile;
	ln -fs $(CURDIR)/.vimrc $(HOME)/.ideavimrc;
