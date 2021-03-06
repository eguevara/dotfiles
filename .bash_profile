#!/bin/bash

# Load .bashrc and other files...
for file in ~/.{bashrc,bash_prompt,aliases,functions,path,dockerfunc,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

# Set up jump to read bash cds.
eval "$(jump shell)"

# Needed to set up ruby enviornment to run ruby on rails 
eval "$(rbenv init -)"
eval "$(nodenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
