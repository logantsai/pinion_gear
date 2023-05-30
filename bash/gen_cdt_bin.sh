
set -e


xml_file="msm8953_jedec_lpddr3_2gb_1ch_2rank_ecdt_${1}_v${2}.xml"
bin_file="platform_ddr_${1}_v${2}.bin"

python cdt_generator.py $xml_file $bin_file

cp rawprogram2.xml rawprogram2_${1^^}_v${2}.xml

sed -i "s/platform_ddr.bin/platform_ddr_${1}_v${2}.bin/g" rawprogram2_${1^^}_v${2}.xml
