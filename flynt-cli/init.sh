#! /bin/sh
case "$1" in
    \.*|\/*)
      $@ ;;
    *)
      flynt $@ ;;
esac
