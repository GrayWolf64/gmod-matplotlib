local figure = {}

function figure.setup(panel, x, y, w, h, color_bg, color_outline)
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

local axis = {}

function axis.setup(fig, space_x, space_y, length_x, length_y, color_axis, color_text)
    local layer_axis = vgui.Create("DPanel", fig)
    layer_axis:SetSize(fig:GetWide() - 100, fig:GetTall() - 100)
    layer_axis:Center()
    local num_spaces_x, num_spaces_y = math.floor(layer_axis:GetWide() / space_x), math.floor(layer_axis:GetTall() / space_y)

    function layer_axis.Paint(self, w, h)
        surface.SetDrawColor(color_axis)
        layer_axis:DrawOutlinedRect()

        for i = 1, num_spaces_x do
            local start_end_x = i * space_x
            surface.DrawLine(start_end_x, h, start_end_x, h - length_x)
        end

        for i = 1, num_spaces_y do
            local start_end_y = h - i * space_y
            surface.DrawLine(0, start_end_y, length_y, start_end_y)
        end
    end

    local layer_axis_x, layer_axis_y = layer_axis:GetPos()
    local layer_axis_tall = layer_axis:GetTall()
    local layer_label = vgui.Create("DPanel", fig)
    layer_label:Dock(FILL)

    function layer_label.Paint(self)
        for i = 0, num_spaces_x do
            draw.DrawText(tostring(i * space_x), "DermaDefault", layer_axis_x + i * space_x, layer_axis_y + layer_axis_tall, color_text)
        end

        for i = 1, num_spaces_y do
            draw.DrawText(tostring(i * space_y), "DermaDefault", layer_axis_x, layer_axis_tall + layer_axis_y - i * space_y, color_text, TEXT_ALIGN_RIGHT)
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
local fig = figure.setup(frame, 20, 20, 400, 400, Color(241, 241, 241, 218), Color(68, 68, 68))
axis.setup(fig, 40, 40, 5, 5, color_black, color_black)