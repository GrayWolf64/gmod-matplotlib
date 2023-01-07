local Figure = {}

function Figure.Setup(panel, x, y, w, h, colorBG, colorOutline)
    local basePanel = vgui.Create("DPanel", panel)
    basePanel:SetSize(w, h)
    basePanel:SetPos(x, y)

    function basePanel.Paint()
        surface.SetDrawColor(colorBG)
        basePanel:DrawFilledRect()
        surface.SetDrawColor(colorOutline)
        basePanel:DrawOutlinedRect()
    end

    return basePanel
end

function Figure.AddSubPlot(figure)
    local subPlot = vgui.Create("DPanel", figure)

    return subPlot
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
    Figure.Setup(Frame, 40, 40, 400, 400, Color(220, 220, 220), Color(57, 57, 57))
end)