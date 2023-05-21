## usage
1. modify targetPanel
targetPanel="maoshie_jd9168_1024x600_video"

2. 
```
sh kernel2lk_mipi.sh
```

3.
output file is tmp.txt

4.
tmp.txt have redundancy space and newline, you should remove by your self
or add below to your vimrc file
```
function! ClearTailSp()
	:%s/\s\+$//e
endfunction

## run "call ClearTailSp" on vim
```
