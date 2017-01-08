case $- in
  *i*)
    # Interactive session. Try switching to bash.
    if [ -z "$BASH" ]; then # do nothing if running under bash already
      bash=$(command -v bash)
      if [ -x "$bash" ]; then
        export TERM=xterm
        export SHELL="$bash"
        exec "$bash"
      fi
    fi
esac
