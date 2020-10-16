from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class ColorScheme(ColorScheme):

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg = {foreground}
            if context.empty or context.error:
                fg = {color1}
            if context.border:
                fg = {color6}
            if context.image:
                fg = {color2}
            if context.video:
                fg = {color5}
            if context.audio:
                fg = {color5}
            if context.document:
                fg = {color5}
            if context.container:
                fg = {color6}
            if context.directory:
                fg = {color7}
            elif context.executable and not \
                    any((context.media, context.container,
                       context.fifo, context.socket)):
                attr |= bold
                fg = {color5}
            if context.socket:
                fg = {color5}
                attr |= bold
            if context.fifo or context.device:
                fg = {color5}
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and red or red
            if context.bad:
                fg = 0
                bg = green
            if context.tag_marker and not context.selected:
                attr |= bold
                fg = 9
            if not context.selected and (context.cut or context.copied):
                attr = reverse
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = 9
            if context.badinfo:
                if attr & reverse:
                    bg = 1
                else:
                    fg = red
            if context.selected:
                attr = bold
                if fg == black:
                    fg = white
                bg = black
            else:
                attr = normal
           
        elif context.in_titlebar:
            attr |= normal
            if context.hostname:
                fg = context.bad and black or black
            elif context.directory:
                fg = black
            elif context.tab:
                if context.good:
                    bg = 2

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = black
                elif context.bad:
                    fg = red
            if context.marked:
                attr |= bold | reverse
                fg = 88
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 9
            if context.loaded:
                bg = 1


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = {color2}

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = 1
                else:
                    bg = 1

        return fg, bg, attr