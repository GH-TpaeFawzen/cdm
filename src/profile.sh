# To avoid potential situation where cdm(1) crashes on every TTY, here we
# default to execute cdm(1) on tty1 only, and leave other TTYs untouched.
case "$(tty)" in (/dev/tty1)
    case "$CDM_SPAWN" in (?*) return;; esac
    case "$DISPLAY$SSH_TTY$(pgrep xinit)" in ('') exec cdm;; esac
esac
