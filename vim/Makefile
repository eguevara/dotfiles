FILES := vimrc
SOURCES := $(filter-out $(METAS),$(FILES))
DOTFILES := $(patsubst %, ${HOME}/.%, $(SOURCES))
PLUGINSDIR := pack/plugins/start

# plugin definitions
plugin_vim-colors-solarized := https://github.com/altercation/vim-colors-solarized/tarball/master
plugin_vim-fugitive         := https://github.com/tpope/vim-fugitive/tarball/master
plugin_vim-endwise          := https://github.com/tpope/vim-endwise/tarball/master
plugin_vim-ctrlp            := https://github.com/ctrlpvim/ctrlp.vim/tarball/master

# this filters out all variables with a plugin_ prefix and regards them as
# plugin definitions
ALL_DEFINED_PLUGINS := $(filter plugin_%, $(.VARIABLES))
# from the defined variables list we only extract the name
ALL_PLUGINS := $(subst plugin_,,$(ALL_DEFINED_PLUGINS))

# this will install all plugins via the wildcard matching target below
.PHONY: install-plugins
install-plugins: $(patsubst %, $(PLUGINSDIR)/%, $(ALL_PLUGINS))

.PHONY: clean-plugins
clean-plugins:
	rm -rf ./pack/plugins/start/*

.PHONY: update-plugins
update-plugins: clean-plugins install-plugins

$(PLUGINSDIR):
	install -d $@

$(PLUGINSDIR)/%: $(PLUGINSDIR)
	@echo "Installing $@ from $(plugin_$*)"
	@install -d $@
	@curl -Lfs $(plugin_$*) | tar xz -C $@ --strip-components=1
	
.PHONY: install
install: $(DOTFILES)

uninstall:
	@echo "Cleaning up dotfiles"
	@for f in $(DOTFILES); do if [ -h $$f ]; then rm -i $$f; fi ; done
