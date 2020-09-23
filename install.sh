#!/bin/sh
rc_filename=".$(basename $SHELL)rc"
functions_filename=".functions"

fns_alias="alias fns='sed \"/^alias fns/d; /^alias fnfy/d; /^alias unfnfy/d; s/alias //g; s/=/ /g\" ~/$functions_filename'"
fnfy_function_alias="alias fnfy='fnfy() { name=\$1; shift; echo \"alias \$name='\''\$name() { \$@; unset -f \$name; }; \$name'\''\" >> ~/.functions; unset name; unset -f fnfy; . ~/.functions; }; fnfy'"

add_text_to_file_if_not_exists() {
  text=$1
  file=$2
  grep -qxF "$text" $file || echo $text >> $file
  unset text file
}

remove_alias() {
  # Uses printf with ed
  # 'cause the default 'sed -i' is different between Linux and BSD like.
  printf "%s\n" "g/alias $1=/d" w | ed -s ~/$functions_filename &>/dev/null
}

add_text_to_file_if_not_exists ". ~/$functions_filename" ~/$rc_filename

remove_alias fns_alias
remove_alias fnfy_function_alias

echo $fns_alias >> ~/$functions_filename
echo $fnfy_function_alias >> ~/$functions_filename

unset fns_alias fnfy_function_alias rc_filename functions_filename
