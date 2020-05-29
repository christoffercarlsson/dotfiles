# Load initialization files from the home directory.
for file in ~/.bash_{exports,aliases,options,prompt,profile_local}
do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
