# Load initialization files from the home directory.
for file in ~/.bash_{exports,aliases,options,prompt}
do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

export NPM_AUTH_TOKEN=""
export NPM_AUTH_TOKEN_GITHUB=""
