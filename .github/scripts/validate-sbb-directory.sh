#!/bin/bash
IS_SUBMODULE_VALID=0
SUBMODULE_DIR="$1"
BASENAME="$(basename "$SUBMODULE_DIR")"
INDEX_EXISTS="$(find "$SUBMODULE_DIR" -name "index.html" | wc -l)"
if [[ $INDEX_EXISTS == 0 ]]; then
  echo "$BASENAME doesn't have an index.html file."
  IS_SUBMODULE_VALID=-1
fi

if ! [[ -s "$SUBMODULE_DIR/LICENSE" ]]; then
  echo "$BASENAME doesn't have a license file with text in it."
  IS_SUBMODULE_VALID=-1
fi

if ! [[ -e "$SUBMODULE_DIR/doc" || -e $SUBMODULE_DIR/docs ]]; then
  echo "$BASENAME doesn't have a doc or docs directory."
  IS_SUBMODULE_VALID=-1
fi

if [[ -z "$(ls -A "$SUBMODULE_DIR/examples/vscode" 2>/dev/null)" ]]; then
  echo "$BASENAME doesn't have an examples/vscode directory with files in it."
  IS_SUBMODULE_VALID=-1
else
  HEX_EXISTS="$(find "$SUBMODULE_DIR/examples/vscode" -name '*.hex' | wc -l)"
  if [[ $HEX_EXISTS == 0 ]]; then
    echo "$BASENAME doesn't have hex files"
    IS_SUBMODULE_VALID=-1
  fi;
fi

exit $IS_SUBMODULE_VALID
