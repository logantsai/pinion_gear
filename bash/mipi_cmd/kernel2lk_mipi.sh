#!/bin/bash

## Should remove all unused tail space or newline char
file="kernel_mipi_cmd.txt"

## panel info
structHead="static char %s_on_cmd%d[] = {"
structTail="};"
targetPanel="maoshie_jd9168_1024x600_video"

## lines read from file
lines=()

## output file
outfile="tmp.txt"

function kernel2lk()
{
    local size=${lines[0]}
    local mipi_cmd=${lines[6]}

	printf "$structHead\n" $targetPanel $i >> $outfile
    printf "    0x%s, 0x00, 0x%s, 0x0c,\n    " "$size" "$mipi_cmd" >> $outfile

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
	rm -rf $outfile

	# Check if the file exists
	if [ -f "$file" ]; then
		# Read the file line by line
		i=0
		while IFS= read -r line; do
			# Read the string into an array using space as the delimiter
			read -r -a lines <<< "$line"

			kernel2lk $i

			((i++))
		done < "$file"
	else
		echo "File not found: $file"
	fi

# } end of main




