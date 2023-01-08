if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --no-heading\ --hidden
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
