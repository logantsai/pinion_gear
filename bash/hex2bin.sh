
input_char_num=${#1}

if [[ $input_char_num -gt 8 ]]; then
	echo "too much!"
	exit 1
fi

if [[ $input_char_num -lt 8 ]]; then
	hex_val=$(printf '%8s' $1 | tr [:blank:] '0')
fi

bin_dump=$(echo $hex_val | xxd -r -p | xxd -b -c 4)
# echo $bin_dump

bin_string=$(echo $bin_dump | awk '{out=""; for(i=2;i<=NF-1;i++){out=out""$i}; print out}')

if [[ ! -z $2 ]]; then
	# end_bit=$(($2 * -1));
	# start_bit=$( expr 31 - '(' $2 + $3 ')' );
	end_bit=$((31 - $2));
	start_bit=$( expr 32 - '(' $2 + $3 ')' );
fi
# echo $start_bit
# echo $end_bit

echo $bin_string
echo ${bin_string:$start_bit:$end_bit}
