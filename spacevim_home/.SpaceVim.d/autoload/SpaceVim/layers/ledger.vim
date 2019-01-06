function! SpaceVim#layers#ledger#plugins() abort
    return [
                \ ['ledger/vim-ledger', {'merged' : 0, 'on_ft' : 'ledger'}],
                \ ]
endfunction

function! SpaceVim#layers#ledger#config() abort
  call SpaceVim#mapping#space#def('nnoremap', ['i', 'a'], 'call ledger#entry()', 'LedgerEntry', 1)
endfunction
