if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " markdown
  au! BufRead,BufNewFile *.md.txt setfiletype markdown
augroup END
