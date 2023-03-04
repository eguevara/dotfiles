#!/bin/bash

# Load .bashrc and other files...
for file in ~/.{bashrc,bash_prompt,aliases,functions,path,dockerfunc,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

eval "$(/opt/homebrew/bin/rbenv init -)"
eval "$(/opt/homebrew/bin/jump shell)"

eval "$(/opt/homebrew/bin/brew shellenv)"
