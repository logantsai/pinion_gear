
DEBUG=0

usage()
{
cat << "USAGE"
    sh $0 hex_value start_bit length
	example:
	  sh hex2bin.sh 100a 1 4
USAGE
}

# only for 32bit data
input_char_num=${#1}
if [[ $input_char_num -gt 8 ]]; then
	echo "too much!"
	exit 1
fi

# fill string to 32 byte (relace whitespace to 0)
if [[ $input_char_num -le 8 ]]; then
	hex_val=$(printf '%8s' $1 | tr [:blank:] '0')
fi
[ "$DEBUG" == 1 ] && echo "$hex_val"

# hex to bin
bin_dump=$(echo $hex_val | xxd -r -p | xxd -b -c 4)
[ "$DEBUG" == 1 ] && echo "$bin_dump"

# awk to deal with col
bin_string=$(echo $bin_dump | awk '{out=""; for(i=2;i<=NF-1;i++){out=out""$i}; print out}')
[ "$DEBUG" == 1 ] && echo "$bin_string"

# calc the range
if [[ ! -z $2 ]]; then
	end_bit=$((31 - $2));
	len=$3
	start_bit=$( expr 32 - '(' $2 + $3 ')' );
fi
[ "$DEBUG" == 1 ] && echo "start:$start_bit  end:$end_bit"


bin_slice=${bin_string:$start_bit:$len}
bin_slice_shift=$(($end_bit + 1))

# output
printf "index    :  %8s%8s%8s%8s\n" "24" "16" "8" "0"
printf "         :  %8s%8s%8s%8s\n" "|" "|" "|" "|"
printf "bin str  :  %32s\n" $bin_string
printf "bin slice:  %${bin_slice_shift}s\n" $bin_slice
printf "dec: %d\n" "$((2#$bin_slice))"
printf "hex: %x\n" "$((2#$bin_slice))"
