#!/bin/bash

## Should remove all unused tail space or newline char
## !! modifiy this to fit your target !!
file="maoshie_jd9168_1024x600_video_CMD.txt"
targetPanel="maoshie_jd9168_1024x600_video"

## panel info
structHead="static char %s_on_cmd%d[] = {"
structTail="};"

structTableHead="static struct mipi_dsi_cmd %s_on_command[] = {"


## lines read from file
lines=()

## output file
outfile="tmp.txt"
outfile2="tmp2.txt"

function kernel2lk()
{
    local size=${lines[6]}
    local mipi_cmd=${lines[0]}

	printf "$structHead\n" $targetPanel $i >> $outfile
    printf "    0x%s, 0x00, 0x%s, 0xc0,\n    " "$size" "$mipi_cmd" >> $outfile

	read -r -a payload <<< "${lines[@]:7}"

	local start_index=0
	## Iterate over the array from the start index
	for (( index=start_index; index<${#payload[@]}; index++ ))
	do
		printf "0x%s, " ${payload[$index]} >> $outfile

		## newline for eache four byte
		if (( index % 4 == 3 )); then
			printf "\n    " >> $outfile
		fi
	done

	## full with 0xff
	local complement=$((3 - (${#lines[@]} % 4)))
	for (( index=0; index<complement; index++ ))
	do
		printf "0xff, ">> $outfile
	done
    printf "\n$structTail\n\n" >> $outfile
}


# main() {
	rm -rf $outfile $outfile2

	## commnad table
	printf "$structTableHead" $targetPanel >> $outfile2

	# Check if the file exists
	if [ -f "$file" ]; then
		# Read the file line by line
		i=0
		while IFS= read -r line; do
			# Read the string into an array using space as the delimiter
			read -r -a lines <<< "$line"

			kernel2lk $i


			## estimate command length
			size=$(echo "ibase=16; ${lines[6]^^}" | bc)
			ceiling=$(echo "scale=0; ($size+3)/4" | bc)
			((ceiling++)) ## add 1
			cmd_size=$((ceiling*4))

			printf "\n    {0x%02x, %s_on_cmd%d, 0x%s}," \
				$cmd_size $targetPanel $i ${lines[4]} >> $outfile2

			((i++))
		done < "$file"
	else
		echo "File not found: $file"
	fi

	## command table end
    printf "\n$structTail\n" >> $outfile2


# } end of main




