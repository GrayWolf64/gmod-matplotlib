local Figure = {}

function Figure.setup(panel, x, y, w, h, color_bg, color_outline)
    local base_panel = vgui.Create("DPanel", panel)
    base_panel:SetSize(w, h)
    base_panel:SetPos(x, y)

    function base_panel.Paint()
        surface.SetDrawColor(color_bg)
        base_panel:DrawFilledRect()
        surface.SetDrawColor(color_outline)
        base_panel:DrawOutlinedRect()
    end

    return base_panel
end

local frame = nil

concommand.Add("Matplotlib_TestWindow", function()
    if IsValid(frame) then
        frame:Remove()
    end

    frame = vgui.Create("DFrame")
    frame:SetSize(500, 500)
    frame:SetTitle("figure")
    frame:SetVisible(true)
    frame:ShowCloseButton(true)
    frame:MakePopup()
    frame:Center()
end)