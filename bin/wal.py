import json


try: open("/home/mega_salo/.Xresources", "x")
except: ...
xresources = open("/home/mega_salo/.Xresources", "w")
colors = json.load(open("/home/mega_salo/.cache/wal/colors.json", "r"))['colors']
params = {
        'norm':      {'fg': '#000000', 'bg': 1, 'border': 2, 'float': 3},
        'sel':       {'fg': '#000000', 'bg': 5, 'border': 5, 'float': 5},
        'urg':       {'fg': '#000000', 'bg': 1, 'border': 7, 'float': 3},
        'titlenorm': {'fg': '#000000', 'bg': 1, 'border': 2, 'float': 3},
        'titlesel':  {'fg': '#000000', 'bg': 5, 'border': 5, 'float': 5},
        'tagsnorm':  {'fg': '#000000', 'bg': 1, 'border': 2, 'float': 3},
        'tagssel':   {'fg': '#000000', 'bg': 5, 'border': 5, 'float': 5},
        'hidnorm':   {'fg': 0,         'bg': 1},
        'hidsel':    {'fg': 6,         'bg': 1}
}
lines = []
for name, args in params.items():
    for arg, value in args.items():
        if type(value) is int: 
            value = colors[f'color{value}']
        lines.append(f'dwm.{name}{arg}color: {value}')
xresources.write('\n'.join(lines))
xresources.close()
