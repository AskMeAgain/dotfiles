# -*- coding: utf-8 -*-

from pygments.style import Style
from pygments.token import Comment, Error, Generic, Keyword, Name, Number, \
    Operator, String, Token


def make_style(colors):
    return {
        Token:               colors['black'],

        Comment:             'italic ' + colors['grey'],
        Comment.Hashbang:    'italic ' + colors['grey'],
        Comment.Multiline:   'italic ' + colors['grey'],
        Comment.Preproc:     'italic ' + colors['grey'],
        Comment.PreprocFile: 'italic ' + colors['grey'],

        Keyword:             colors['orange'],
        Keyword.Constant:    colors['orange'],
        Keyword.Declaration: colors['orange'],
        Keyword.Namespace:   colors['orange'],
        Keyword.Type:        colors['yellow'],

        Operator:            colors['base01'],
        Operator.Word:       colors['green'],

        Name.Builtin:        colors['blue'],
        Name.Builtin.Pseudo: colors['blue'],
        Name.Class:          colors['blue'],
        Name.Constant:       colors['red'],
        Name.Decorator:      colors['blue'],
        Name.Entity:         colors['blue'],
        Name.Exception:      colors['blue'],
        Name.Function:       colors['cyan'],
        Name.Function.Magic: colors['cyan'],
        Name.Label:          colors['blue'],
        Name.Namespace:      'italic ' + colors['grey'],
        Name.Tag:            colors['blue'],
        Name.Variable:       colors['cyan'],
        Name.Variable.Global:colors['blue'],
        Name.Variable.Magic: colors['blue'],

        String:              colors['green'],
        String.Doc:          colors['green'],
        String.Regex:        colors['red'],

        Number:              colors['red'],

        Generic.Deleted:     colors['red'],
        Generic.Emph:        'italic',
        Generic.Error:       colors['red'],
        Generic.Heading:     'bold',
        Generic.Subheading:  'underline',
        Generic.Inserted:    colors['green'],
        Generic.Strong:      'bold',
        Generic.Traceback:   colors['blue'],

        Error:               'bg:' + colors['red'],
    }


COLORS = {
    'base03':  '#002b36',
    'base02':  '#073642',
    'base01':  '#586e75',
    'base00':  '#657b83',
    'base0':   '#839496',
    'base1':   '#93a1a1',
    'base2':   '#eee8d5',
    'base3':   '#fdf6e3',
    'yellow':  '#b58900',
    'orange':  '#ef3220',
    'red':     '#ee0000',
    'magenta': '#d33682',
    'violet':  '#6c71c4',
    'blue':    '#268bd2',
    'cyan':    '#0044ff',
    'green':   '#71BE6B',
    'black':   '#000000',
    'grey':   '#555555',
}

class Orchid(Style):
    styles = make_style(COLORS)
    background_color = COLORS['base03']
    highlight_color = COLORS['base02']