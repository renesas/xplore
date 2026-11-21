SUBMODULE_DIR="./software-building-blocks"

STATUS=0

for dir in $SUBMODULE_DIR/*/
do
  BASENAME="$(basename $dir)"
  INDEX_EXISTS="$(find $dir -name "index.html" | wc -l)"
  if [[ $INDEX_EXISTS == 0 ]]; then
    echo "$BASENAME doesn't have an index.html file."
    STATUS=-1
  fi

  if ! [[ -s "$dir/LICENSE" ]]; then
    echo "$BASENAME doesn't have a license file with text in it."
    STATUS=-1
  fi

  if ! [[ -e $dir/doc || -e $dir/docs ]]; then
    echo "$BASENAME doesn't have a doc or docs directory."
    STATUS=-1
  fi

  if ! [[ -n "$(ls -A $dir/examples/vscode 2>/dev/null)" ]]; then
    echo "$BASENAME doesn't have an examples/vscode directory with files in it."
    STATUS=-1
  else
    HEX_EXISTS="$(find $dir/examples/vscode -name '*.hex' | wc -l)"
    SREC_EXISTS="$(find $dir/examples/vscode -name '*.srec' | wc -l)"
    if [[ $HEX_EXISTS == 0 ]]; then
      echo "$BASENAME doesn't have hex files"
      STATUS=-1
    fi;
  fi
done

exit $STATUS
