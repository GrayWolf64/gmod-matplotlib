local Figure = {}

function Figure.Setup(panel, x, y, w, h, colorbg, coloroutline, coloraxes)
    local BasePanel = vgui.Create("DPanel", panel)
    BasePanel:SetSize(w, h)
    BasePanel:SetPos(x, y)

    function BasePanel.Paint()
        surface.SetDrawColor(colorbg)
        BasePanel:DrawFilledRect()
        surface.SetDrawColor(coloroutline)
        BasePanel:DrawOutlinedRect()
        surface.SetDrawColor(coloraxes)
        surface.DrawLine(0, h / 2, w, h / 2)
        surface.DrawLine(w / 2, 0, w / 2, h)
    end

    return BasePanel
end

function Figure.Point(panel, x, y, color)
    surface.DrawCircle(x, y, 1, color)
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
    Figure.Setup(Frame, 40, 40, 400, 400, Color(220, 220, 220), Color(57, 57, 57), Color(0, 0, 0))
end)