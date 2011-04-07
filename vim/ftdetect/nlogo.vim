if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.nls{,~}		setfiletype nlogo
augroup end
