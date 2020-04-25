import neovim
import ctypes

@neovim.plugin
class DisableImeOnInsertLeavePlugin(object):

    def __init__(self, nvim):
        self.nvim = nvim

    @neovim.autocmd('InsertLeave', pattern='*', eval='exists("GuiLoaded")', sync=True)
    def on_insertleave(self, isGuiLoaded):
        if not(isGuiLoaded):
            return

        nvqHwnd = self.nvim.eval('v:windowid')
        imeHwnd = ctypes.windll.imm32.ImmGetDefaultIMEWnd(nvqHwnd)
        #self.nvim.out_write("" + str(imeHwnd) + "\n")
        ctypes.windll.user32.SendMessageA(imeHwnd, 0x0283, 0x006, 0)

