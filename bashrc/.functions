# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

# Find shorthand
function f() {
	find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# Show colors
function colors() {
  for code in {0..255}; do echo -e "\033[38;05;${code}m $code: Test"; done
}
