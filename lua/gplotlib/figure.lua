local figure = {}

function figure.setup(panel, x, y, w, h, color_bg, color_outline)
    local base_panel = vgui.Create("DPanel", panel)
    base_panel:SetPos(x, y)
    base_panel:SetSize(w, h)
    base_panel:Center()

    function base_panel.Paint()
        surface.SetDrawColor(color_bg)
        base_panel:DrawFilledRect()
        surface.SetDrawColor(color_outline)
        base_panel:DrawOutlinedRect()
    end

    return base_panel
end