local figure = {}

function figure.setup(panel, w, h, color_bg, color_outline)
    local base_panel = vgui.Create("DPanel", panel)
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

function axis.setup(fig, space_x, space_y, length_x, length_y, color_axis)
    local layer_axis = vgui.Create("DPanel", fig)
    layer_axis:Dock(FILL)
    local num_spaces_x, num_spaces_y = math.floor(fig:GetWide() / space_x), math.floor(fig:GetTall() / space_y)
    surface.SetDrawColor(color_axis)

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

    local fig_x, fig_y = fig:GetPos()
    local layer_label = vgui.Create("DPanel", fig:GetParent())
    layer_label:Dock(FILL)

    function layer_label.Paint()
        for i = 0, num_spaces_x do
            draw.SimpleText(tostring(i * space_x), "DermaDefault", fig_x + i * space_x, fig:GetTall() + layer_label:GetY(), color_white)
        end
    end
end

local frame = nil
frame = vgui.Create("DFrame")
frame:SetSize(500, 500)
frame:SetTitle("figure")
frame:SetVisible(true)
frame:ShowCloseButton(true)
frame:MakePopup()
frame:Center()
local fig = figure.setup(frame, 400, 400, Color(204, 204, 204), Color(68, 68, 68))
axis.setup(fig, 40, 40, 5, 5, color_black)