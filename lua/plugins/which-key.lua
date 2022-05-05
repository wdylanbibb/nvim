local wk = require('which-key')

wk.setup {
	popup_mappings = {
		scroll_down = '<C-n>',
		scroll_up = '<C-p>',
	}
}

wk.register({
	t = {
		name = 'Tree',
		t = 'Tree Toggle',
		f = 'Find File Toggle',
		r = 'Tree Refresh'
	},
	f = {
		name = 'Tile',
		f = 'Find File',
		g = 'Live Grep',
		b = 'Search Buffers',
		h = 'Search Help',
		t = 'Search Tags'
	},
	v = {
		name = 'Language server',
		g = 'Definition',
		i = 'Implementation',
		s = 'Signature Help',
		r = 'References',
		n = 'Rename',
		h = 'Hover',
		c = 'Code Action',
		f = 'Format',
		d = {
			name = 'Diagnostics',
			s = 'Show Line Diagnostics',
			n = 'Next Diagnostic',
			p = 'Previous Diagnostic'
		}
	}
}, { prefix = '<Leader>' })
