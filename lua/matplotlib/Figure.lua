local Figure = {}

function Figure.Setup(panel, x, y, w, h, color_bg, color_outline)
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

local Frame = nil

concommand.Add("Matplotlib_TestWindow", function()
    if IsValid(Frame) then
        Frame:Remove()
    end

    Frame = vgui.Create("DFrame")
    Frame:SetSize(500, 500)
    Frame:SetTitle("Figure Test")
    Frame:SetVisible(true)
    Frame:ShowCloseButton(true)
    Frame:MakePopup()
    Frame:Center()
    Figure.Setup(Frame, 40, 40, 400, 400, color_white, color_black)
end)