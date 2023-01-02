local figure = {}

function figure.setup(panel, w, h, color_bg, color_outline)
    local base_panel = vgui.Create("DPanel", panel)
    base_panel:Dock(FILL)
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

local axis = {}

function axis.setup(fig, space_x, space_y, length_x, length_y)
    local layer_axis = vgui.Create("DPanel", fig)
    layer_axis:Dock(FILL)
    local num_spaces_x, num_spaces_y = math.floor(fig:GetWide() / space_x), math.floor(fig:GetTall() / space_y)
    surface.SetDrawColor(color_black)

    function layer_axis.Paint(self, w, h)
        for i = 1, num_spaces_x do
            local start_end_x = i * space_x
            surface.DrawLine(start_end_x, h, start_end_x, h - length_x)
        end

        for i = 1, num_spaces_y do
            local start_end_y = h - i * space_y
            surface.DrawLine(0, start_end_y, length_y, start_end_y)
        end
    end
end

local frame = nil
frame = vgui.Create("DFrame")
frame:SetSize(400, 400)
frame:SetTitle("figure")
frame:SetVisible(true)
frame:ShowCloseButton(true)
frame:MakePopup()
frame:Center()
local fig = figure.setup(frame, 380, 380, Color(204, 204, 204), Color(68, 68, 68))
axis.setup(fig, 10, 10, 5, 5)