rpubnt() {
	case $1 in
		st)
			repo status $(repo list -g ubnt -p | tr "\n" " ")
		;;
		unpush)
			repo forall -p -g ubnt -c 'git log --branches --not --remotes --decorate --oneline'
		;;
		start)
			if [ -z $2 ]; then
				echo "!! You should enter branch name first"
				exit 1
			fi
			repo start $2 $(repo list -g ubnt -p | tr "\n" " ")
		;;
		sync)
			repo sync -c $(repo list -g ubnt -p | tr "\n" " ")
		;;
	esac
}
