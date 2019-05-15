function famima()
{
# PowerShellで某コンビニの入店音ぽい音 - Segmentation Fault
# https://www.segmentation-fault.xyz/entry/2017/02/17/225921
# a certain convenience store

[Console]::Beep(1479, 400) # F#5
[Console]::Beep(1174, 400) # D5
[Console]::Beep(880,  400) # A4
[Console]::Beep(1174, 400) # D5
[Console]::Beep(1318, 400) # E5
[Console]::Beep(1760,1000) # A5

[Console]::Beep(1318, 400) # E5
[Console]::Beep(1479, 400) # F#5
[Console]::Beep(1318, 400) # E5
[Console]::Beep(880,  400) # A4
[Console]::Beep(1174,1000) # D5
}
