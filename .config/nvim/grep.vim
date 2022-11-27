if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
