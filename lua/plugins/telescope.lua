require('telescope').setup{
    extensions = {
        ctags_outline = {
            --ctags option
            ctags = {'ctags'},
            --ctags filetype option
            ft_opt = {
                vim = '--vim-kinds=fk',
                lua = '--lua-kinds=fk',
            },
        },
    },
}
