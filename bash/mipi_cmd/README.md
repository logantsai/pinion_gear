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

5. for last two command you should add delay time by your self
```
static struct mipi_dsi_cmd maoshie_jd9168_1024x600_video_on_command[] = {
	....
    {0x08, maoshie_jd9168_1024x600_video_on_cmd22}, 0x??},
    {0x08, maoshie_jd9168_1024x600_video_on_cmd23}, 0x??},
};
```
