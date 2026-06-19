-- Thunder UI Framework
-- Full UI System - Works in all games

local Thunder = {}

local function Create(className, props, parent)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do
        if k ~= "Children" then
            obj[k] = v
        end
    end
    if props and props.Children then
        for _, child in ipairs(props.Children) do
            child.Parent = obj
        end
    end
    if parent then
        obj.Parent = parent
    end
    return obj
end

function Thunder:GetSafeParent()
    local success, result = pcall(function()
        return gethui and gethui() or game:GetService("CoreGui")
    end)
    if success and result then
        return result
    end
    return game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

function Thunder:New()
    local gui = Create("ScreenGui", {
        Name = "Thunder",
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 999,
        OnTopOfCoreBlur = true
    })
    
    local parent = self:GetSafeParent()
    gui.Parent = parent
    
    local window = Create("Frame", {
        Name = "Window",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = gui
    })
    
    local body = Create("Frame", {
        Name = "Body",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(900, 580),
        BackgroundColor3 = Color3.fromRGB(18, 18, 20),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = window
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = body
    })
    
    -- Titlebar
    local titlebar = Create("Frame", {
        Name = "Titlebar",
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = Color3.fromRGB(38, 38, 42),
        BorderSizePixel = 0,
        Parent = body
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = titlebar
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 0),
        Parent = titlebar
    })
    
    local titlebarContent = Create("Frame", {
        Name = "Content",
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = titlebar
    })
    
    local leading = Create("Frame", {
        Name = "Leading",
        Size = UDim2.fromScale(0, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = titlebarContent
    })
    
    local titleStack = Create("Frame", {
        Name = "TitleSubtitle",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = leading
    })
    
    local titleLabel = Create("TextLabel", {
        Name = "Title",
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold),
        RichText = true,
        Size = UDim2.fromOffset(0, 22),
        Text = "Thunder",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 17,
        TextTransparency = 0,
        Parent = titleStack
    })
    
    local subtitle = Create("TextLabel", {
        Name = "Subtitle",
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium),
        RichText = true,
        Size = UDim2.fromOffset(0, 14),
        Text = "UI Framework",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextTransparency = 0.5,
        Visible = true,
        Parent = titleStack
    })
    
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = titleStack
    })
    
    local trailing = Create("Frame", {
        Name = "Trailing",
        Size = UDim2.fromScale(0, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = titlebarContent
    })
    
    -- Window Controls
    local windowControls = Create("Frame", {
        Name = "WindowControls",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(80, 36),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = trailing
    })
    
    local closeBtn = Create("ImageButton", {
        Name = "Exit",
        Size = UDim2.fromOffset(14, 14),
        Image = "rbxassetid://132228700346004",
        ImageColor3 = Color3.fromRGB(255, 69, 58),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = windowControls
    })
    
    local minimizeBtn = Create("ImageButton", {
        Name = "Minimize",
        Size = UDim2.fromOffset(14, 14),
        Image = "rbxassetid://132228700346004",
        ImageColor3 = Color3.fromRGB(255, 214, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        LayoutOrder = 1,
        Parent = windowControls
    })
    
    local zoomBtn = Create("ImageButton", {
        Name = "Zoom",
        Size = UDim2.fromOffset(14, 14),
        Image = "rbxassetid://132228700346004",
        ImageColor3 = Color3.fromRGB(48, 209, 88),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        LayoutOrder = 2,
        Parent = windowControls
    })
    
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = windowControls
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 18),
        PaddingRight = UDim.new(0, 18),
        Parent = windowControls
    })
    
    -- Search Field
    local searchField = Create("Frame", {
        Name = "SearchField",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(130, 30),
        Parent = trailing
    })
    
    local searchBox = Create("TextBox", {
        Name = "Field",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CursorPosition = -1,
        FontFace = Font.new("rbxassetid://12187365364"),
        PlaceholderText = "Search",
        Size = UDim2.fromOffset(90, 0),
        Text = "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = searchField
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        Parent = searchField
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = searchField
    })
    
    Create("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0.9,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = searchField
    })
    
    local searchIcon = Create("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://120817720539967",
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ImageTransparency = 0.6,
        Size = UDim2.fromOffset(14, 14),
        Parent = searchField
    })
    
    -- Content Body
    local bodyContent = Create("Frame", {
        Name = "ContentBody",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.new(1, -220, 1, 0),
        BackgroundColor3 = Color3.fromRGB(18, 18, 20),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = body
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = bodyContent
    })
    
    -- Sidebar
    local sidebar = Create("Frame", {
        Name = "Sidebar",
        Size = UDim2.fromOffset(220, 0),
        BackgroundColor3 = Color3.fromRGB(28, 28, 32),
        BackgroundTransparency = 0.9,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = body
    })
    
    local sidebarMargins = Create("Frame", {
        Name = "Margins",
        Size = UDim2.new(0, 220, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = sidebar
    })
    
    Create("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0.95,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = sidebar
    })
    
    local sidebarToolbar = Create("Frame", {
        Name = "Toolbar",
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = sidebarMargins
    })
    
    local sidebarList = Create("ScrollingFrame", {
        Name = "SidebarList",
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        Position = UDim2.fromOffset(0, 50),
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollBarImageTransparency = 0.5,
        ScrollBarThickness = 4,
        Size = UDim2.new(1, 0, 1, -50),
        Parent = sidebarMargins
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Parent = sidebarList
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingBottom = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 4),
        Parent = sidebarList
    })
    
    -- Content
    local content = Create("Frame", {
        Name = "Content",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromOffset(0, 50),
        Size = UDim2.new(1, 0, 1, -50),
        ClipsDescendants = true,
        Parent = bodyContent
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 6),
        PaddingLeft = UDim.new(0, 6),
        PaddingRight = UDim.new(0, 6),
        PaddingTop = UDim.new(0, 6),
        Parent = content
    })
    
    -- Window Pill
    local windowPill = Create("ImageButton", {
        Name = "WindowPill",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 8),
        Size = UDim2.fromOffset(160, 4),
        Image = "rbxassetid://93520763686656",
        ImageTransparency = 0.6,
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = gui
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = windowPill
    })
    
    -- Drag Area
    local topArea = Create("TextButton", {
        Name = "TopArea",
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Active = false,
        Text = "",
        Modal = false,
        Parent = body
    })
    
    -- Drop Shadow
    local shadow = Create("ImageLabel", {
        Name = "Dropshadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 4),
        Size = UDim2.new(1, 28, 1, 28),
        Image = "rbxassetid://138260268144845",
        ImageTransparency = 0.7,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(28, 26, 96, 94),
        ZIndex = 0,
        Interactable = false,
        Parent = body
    })
    
    -- Variables for dragging
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    topArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = body.Position
        end
    end)
    
    topArea.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            body.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    -- Window controls
    local minimized = false
    local maximized = false
    local prevSize = body.Size
    local prevPos = body.Position
    
    minimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            body.Size = UDim2.fromOffset(900, 50)
        else
            body.Size = prevSize
        end
    end)
    
    zoomBtn.MouseButton1Click:Connect(function()
        maximized = not maximized
        if maximized then
            prevSize = body.Size
            prevPos = body.Position
            body.Size = UDim2.fromScale(1, 1)
            body.Position = UDim2.fromScale(0.5, 0.5)
        else
            body.Size = prevSize
            body.Position = prevPos
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        minimized = true
        body.Size = UDim2.fromOffset(900, 50)
        task.delay(0.3, function()
            gui:Destroy()
        end)
    end)
    
    -- Window pill click
    windowPill.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            body.Size = UDim2.fromOffset(900, 50)
        else
            body.Size = UDim2.fromOffset(900, 580)
        end
    end)
    
    -- Hover effects on window pill
    windowPill.MouseEnter:Connect(function()
        windowPill.ImageTransparency = 0.2
    end)
    
    windowPill.MouseLeave:Connect(function()
        windowPill.ImageTransparency = 0.6
    end)
    
    -- Search functionality
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local query = searchBox.Text:lower()
        if query == "" then
            for _, child in ipairs(content:GetDescendants()) do
                if child:IsA("GuiObject") then
                    child.Visible = true
                end
            end
            return
        end
        
        for _, child in ipairs(content:GetDescendants()) do
            if child:IsA("GuiObject") then
                local searchIndex = child:GetAttribute("SearchIndex")
                if searchIndex and tostring(searchIndex):lower():find(query) then
                    child.Visible = true
                    local parent = child.Parent
                    while parent and parent ~= content do
                        if parent:IsA("GuiObject") then
                            parent.Visible = true
                        end
                        parent = parent.Parent
                    end
                else
                    child.Visible = false
                end
            end
        end
    end)
    
    return {
        Gui = gui,
        Window = window,
        Body = body,
        Titlebar = titlebar,
        Content = content,
        Sidebar = sidebar,
        SidebarList = sidebarList,
        WindowControls = windowControls,
        CloseButton = closeBtn,
        MinimizeButton = minimizeBtn,
        ZoomButton = zoomBtn,
        SearchField = searchField,
        SearchBox = searchBox,
        WindowPill = windowPill,
        TopArea = topArea,
        Shadow = shadow,
        Title = titleLabel,
        Subtitle = subtitle,
        Props = {
            Title = titleLabel,
            Subtitle = subtitle,
            Body = body,
            Content = content
        }
    }
end

function Thunder:Section(sectionData)
    local section = Create("TextButton", {
        Name = "SidebarItem",
        Size = UDim2.new(1, 0, 0, 32),
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Text = "",
        FontFace = Font.new("rbxassetid://12187365364"),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = self.SidebarList
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = section
    })
    
    local title = Create("TextLabel", {
        Name = "Title",
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Size = UDim2.new(1, 0, 0, 22),
        Text = sectionData.Title or "Section",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextTransparency = 0.2,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = section
    })
    
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = section
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 8),
        Parent = section
    })
    
    local tabs = {}
    
    section.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabs) do
            tab.Instance.Visible = false
            tab.SidebarItem.BackgroundTransparency = 1
            tab.SidebarItem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            tab.ItemTitle.TextTransparency = 0.2
        end
        -- First tab selected by default
        for name, tab in pairs(tabs) do
            tab.Instance.Visible = true
            tab.SidebarItem.BackgroundTransparency = 0.15
            tab.SidebarItem.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
            tab.ItemTitle.TextTransparency = 0
            break
        end
    end)
    
    return {
        Instance = section,
        Title = title,
        Tabs = tabs,
        AddTab = function(self, tabData)
            local tab = Create("Frame", {
                Name = "Tab",
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Visible = false,
                Parent = self.Content
            })
            
            local page = Create("ScrollingFrame", {
                Name = "Page",
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                CanvasSize = UDim2.new(),
                ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                ScrollBarImageTransparency = 0.4,
                ScrollBarThickness = 5,
                Size = UDim2.fromScale(1, 1),
                Parent = tab
            })
            
            Create("UIListLayout", {
                Padding = UDim.new(0, 12),
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = page
            })
            
            Create("UIPadding", {
                PaddingBottom = UDim.new(0, 20),
                PaddingLeft = UDim.new(0, 20),
                PaddingRight = UDim.new(0, 20),
                PaddingTop = UDim.new(0, 20),
                Parent = page
            })
            
            local sidebarItem = Create("TextButton", {
                Name = "SidebarItem",
                Size = UDim2.new(1, 0, 0, 32),
                AutoButtonColor = false,
                BorderSizePixel = 0,
                Text = "",
                FontFace = Font.new("rbxassetid://12187365364"),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = self.SidebarList
            })
            
            Create("UICorner", {
                CornerRadius = UDim.new(0, 6),
                Parent = sidebarItem
            })
            
            local itemTitle = Create("TextLabel", {
                Name = "Title",
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxassetid://12187365364"),
                Size = UDim2.new(1, 0, 0, 22),
                Text = tabData.Title or "Tab",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 14,
                TextTransparency = 0.2,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = sidebarItem
            })
            
            Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 12),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Parent = sidebarItem
            })
            
            Create("UIPadding", {
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 8),
                Parent = sidebarItem
            })
            
            local tabData = {
                Instance = tab,
                Page = page,
                SidebarItem = sidebarItem,
                ItemTitle = itemTitle,
                Props = tabData
            }
            
            tabs[tabData.Title] = tabData
            
            sidebarItem.MouseButton1Click:Connect(function()
                for name, t in pairs(tabs) do
                    t.Instance.Visible = (name == tabData.Title)
                    t.SidebarItem.BackgroundTransparency = (name == tabData.Title) and 0.15 or 1
                    t.SidebarItem.BackgroundColor3 = (name == tabData.Title) and Color3.fromRGB(0, 122, 255) or Color3.fromRGB(255, 255, 255)
                    t.ItemTitle.TextTransparency = (name == tabData.Title) and 0 or 0.2
                    t.ItemTitle.TextColor3 = (name == tabData.Title) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 255, 255)
                end
            end)
            
            -- Select first tab if none selected
            local hasVisible = false
            for name, t in pairs(tabs) do
                if t.Instance.Visible then
                    hasVisible = true
                    break
                end
            end
            if not hasVisible then
                tab.Instance.Visible = true
                sidebarItem.BackgroundTransparency = 0.15
                sidebarItem.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
                itemTitle.TextTransparency = 0
            end
            
            return tabData
        end
    }
end

function Thunder:PageSection(page, props)
    local section = Create("Frame", {
        Name = "PageSection",
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = page
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = section
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 18),
        Parent = section
    })
    
    local header = Create("Frame", {
        Name = "Header",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = section
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = header
    })
    
    local title = Create("TextLabel", {
        Name = "Title",
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold),
        Size = UDim2.fromOffset(0, 18),
        Text = props.Title or "Section Title",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16,
        TextTransparency = 0.1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = header
    })
    
    local subtitle = Create("TextLabel", {
        Name = "Subtitle",
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Size = UDim2.fromOffset(0, 14),
        Text = props.Subtitle or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        TextTransparency = 0.5,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = props.Subtitle ~= nil,
        Parent = header
    })
    
    return {
        Instance = section,
        Title = title,
        Subtitle = subtitle,
        Header = header
    }
end

function Thunder:Form(parent)
    local form = Create("Frame", {
        Name = "Form",
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
        BackgroundColor3 = Color3.fromRGB(28, 28, 32),
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = form
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 12),
        Parent = form
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 8),
        Parent = form
    })
    
    Create("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0.95,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = form
    })
    
    return form
end

function Thunder:Row(form)
    local row = Create("Frame", {
        Name = "Row",
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = form
    })
    
    local left = Create("Frame", {
        Name = "LeftAccessory",
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(0, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = row
    })
    
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = left
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
        Parent = left
    })
    
    local right = Create("Frame", {
        Name = "RightAccessory",
        AnchorPoint = Vector2.new(1, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = row
    })
    
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = right
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
        Parent = right
    })
    
    return {
        Instance = row,
        Left = left,
        Right = right,
        SetSearchIndex = function(self, index)
            row:SetAttribute("SearchIndex", index)
            if left then left:SetAttribute("SearchIndex", index) end
            if right then right:SetAttribute("SearchIndex", index) end
        end
    }
end

function Thunder:TitleStack(parent, props)
    local stack = Create("Frame", {
        Name = "TitleStack",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = stack
    })
    
    local title = Create("TextLabel", {
        Name = "Title",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Size = UDim2.new(0, 0, 0, 18),
        Text = props.Title or "Title",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 15,
        TextTransparency = 0.1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        RichText = true,
        Parent = stack
    })
    
    local subtitle = Create("TextLabel", {
        Name = "Subtitle",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Size = UDim2.new(0, 0, 0, 14),
        Text = props.Subtitle or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        TextTransparency = 0.5,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        Visible = props.Subtitle ~= nil,
        RichText = true,
        Parent = stack
    })
    
    return {
        Instance = stack,
        Title = title,
        Subtitle = subtitle,
        SetSearchIndex = function(self, index)
            stack:SetAttribute("SearchIndex", index)
            if title then title:SetAttribute("SearchIndex", index) end
            if subtitle then subtitle:SetAttribute("SearchIndex", index) end
        end
    }
end

function Thunder:Label(parent, props)
    local label = Create("TextLabel", {
        Name = "Label",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Text = props.Text or "Label",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextTransparency = 0.5,
        TextWrapped = true,
        RichText = true,
        Parent = parent
    })
    
    return label
end

function Thunder:Button(parent, props)
    local style = props.Style or "Primary"
    local colors = {
        Primary = {bg = Color3.fromRGB(0, 122, 255), text = Color3.fromRGB(255, 255, 255)},
        Secondary = {bg = Color3.fromRGB(44, 44, 46), text = Color3.fromRGB(255, 255, 255)},
        Destructive = {bg = Color3.fromRGB(255, 69, 58), text = Color3.fromRGB(255, 255, 255)},
        Success = {bg = Color3.fromRGB(48, 209, 88), text = Color3.fromRGB(255, 255, 255)}
    }
    
    local color = colors[style] or colors.Primary
    
    local btn = Create("TextButton", {
        Name = "Button",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = color.bg,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = parent
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = btn
    })
    
    local label = Create("TextLabel", {
        Name = "Label",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Text = props.Label or "Button",
        TextColor3 = color.text,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        Parent = btn
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 4),
        Parent = label
    })
    
    -- Hover effects
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = color.bg:Lerp(Color3.fromRGB(255, 255, 255), 0.1)
    end)
    
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = color.bg
    end)
    
    btn.MouseButton1Down:Connect(function()
        btn.BackgroundColor3 = color.bg:Lerp(Color3.fromRGB(0, 0, 0), 0.2)
    end)
    
    btn.MouseButton1Up:Connect(function()
        btn.BackgroundColor3 = color.bg
    end)
    
    if props.Pushed then
        btn.MouseButton1Click:Connect(props.Pushed)
    end
    
    return {
        Instance = btn,
        Label = label,
        SetEnabled = function(self, enabled)
            btn.Active = enabled
            btn.BackgroundTransparency = enabled and 0 or 0.5
            label.TextTransparency = enabled and 0 or 0.5
        end
    }
end

function Thunder:Toggle(parent, props)
    local toggle = Create("Frame", {
        Name = "Toggle",
        Size = UDim2.fromOffset(32, 18),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    local switch = Create("ImageButton", {
        Name = "Switch",
        Size = UDim2.fromOffset(32, 18),
        Image = "rbxassetid://104426531889908",
        ImageColor3 = Color3.fromRGB(122, 122, 122),
        ImageTransparency = 0.6,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = toggle
    })
    
    local knob = Create("ImageLabel", {
        Name = "Knob",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 2, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        Image = "rbxassetid://99107881432922",
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = switch
    })
    
    local value = props.Value or false
    
    local function setValue(newValue)
        value = newValue
        if value then
            switch.ImageColor3 = Color3.fromRGB(0, 122, 255)
            switch.ImageTransparency = 0
            knob.Position = UDim2.new(0, 16, 0.5, 0)
        else
            switch.ImageColor3 = Color3.fromRGB(122, 122, 122)
            switch.ImageTransparency = 0.6
            knob.Position = UDim2.new(0, 2, 0.5, 0)
        end
        if props.ValueChanged then
            props.ValueChanged(value)
        end
    end
    
    setValue(value)
    
    switch.MouseButton1Click:Connect(function()
        setValue(not value)
    end)
    
    return {
        Instance = toggle,
        Switch = switch,
        Knob = knob,
        SetValue = setValue,
        GetValue = function() return value end
    }
end

function Thunder:Slider(parent, props)
    local min = props.Minimum or 0
    local max = props.Maximum or 100
    local value = props.Value or 0
    
    local container = Create("Frame", {
        Name = "SliderContainer",
        Size = UDim2.fromOffset(150, 20),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    local slider = Create("ImageLabel", {
        Name = "Slider",
        Size = UDim2.new(1, 0, 0, 4),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Image = "rbxassetid://92966982499851",
        ImageColor3 = Color3.fromRGB(44, 44, 46),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = true,
        Selectable = true,
        Parent = container
    })
    
    local fill = Create("Frame", {
        Name = "Fill",
        Size = UDim2.fromScale(0, 1),
        BackgroundColor3 = Color3.fromRGB(0, 122, 255),
        BorderSizePixel = 0,
        Parent = slider
    })
    
    local thumb = Create("Frame", {
        Name = "Thumb",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(18, 18),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = true,
        Selectable = true,
        Parent = fill
    })
    
    local thumbBg = Create("ImageLabel", {
        Name = "Background",
        Size = UDim2.fromOffset(18, 18),
        Image = "rbxassetid://125496304036680",
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = thumb
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = thumbBg
    })
    
    local valueLabel = Create("TextLabel", {
        Name = "Value",
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.fromScale(0, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Text = tostring(value),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        TextTransparency = 0.5,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = container
    })
    
    local function setValue(newValue)
        value = math.clamp(newValue, min, max)
        local percent = (value - min) / (max - min)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        valueLabel.Text = string.format("%.1f", value)
        if props.ValueChanged then
            props.ValueChanged(value)
        end
    end
    
    setValue(value)
    
    local dragging = false
    
    thumb.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    thumb.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    slider.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local absoluteSize = slider.AbsoluteSize.X
            local position = input.Position.X - slider.AbsolutePosition.X
            local percent = math.clamp(position / absoluteSize, 0, 1)
            setValue(min + (max - min) * percent)
        end
    end)
    
    return {
        Instance = container,
        Slider = slider,
        Fill = fill,
        Thumb = thumb,
        SetValue = setValue,
        GetValue = function() return value end
    }
end

function Thunder:Dropdown(parent, props)
    local options = props.Options or {}
    local value = props.Value or options[1]
    
    local container = Create("Frame", {
        Name = "DropdownContainer",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    local btn = Create("TextButton", {
        Name = "Dropdown",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(44, 44, 46),
        BackgroundTransparency = 0.95,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = container
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = btn
    })
    
    local label = Create("TextLabel", {
        Name = "Label",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Text = tostring(value or props.Placeholder or "Select..."),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextTransparency = 0.4,
        Parent = btn
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 4),
        Parent = label
    })
    
    local dropdown = Create("Frame", {
        Name = "DropdownMenu",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(28, 28, 32),
        BackgroundTransparency = 0.95,
        BorderSizePixel = 0,
        Visible = false,
        Parent = container
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = dropdown
    })
    
    Create("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0.95,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = dropdown
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = dropdown
    })
    
    local function updateOptions()
        for _, child in ipairs(dropdown:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        for _, option in ipairs(options) do
            local optBtn = Create("TextButton", {
                Name = "Option",
                Size = UDim2.new(1, 0, 0, 28),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Text = tostring(option),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 14,
                TextTransparency = 0.2,
                FontFace = Font.new("rbxassetid://12187365364"),
                AutoButtonColor = false,
                Parent = dropdown
            })
            
            optBtn.MouseEnter:Connect(function()
                optBtn.BackgroundTransparency = 0.1
                optBtn.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
                optBtn.TextTransparency = 0
            end)
            
            optBtn.MouseLeave:Connect(function()
                optBtn.BackgroundTransparency = 1
                optBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                optBtn.TextTransparency = 0.2
            end)
            
            optBtn.MouseButton1Click:Connect(function()
                setValue(option)
                dropdown.Visible = false
            end)
        end
    end
    
    local function setValue(newValue)
        value = newValue
        label.Text = tostring(value)
        if props.ValueChanged then
            props.ValueChanged(value)
        end
    end
    
    btn.MouseButton1Click:Connect(function()
        dropdown.Visible = not dropdown.Visible
        if dropdown.Visible then
            updateOptions()
        end
    end)
    
    setValue(value)
    
    return {
        Instance = container,
        Button = btn,
        Label = label,
        Dropdown = dropdown,
        SetValue = setValue,
        GetValue = function() return value end,
        SetOptions = function(self, newOptions)
            options = newOptions
            updateOptions()
        end
    }
end

function Thunder:TextField(parent, props)
    local field = Create("Frame", {
        Name = "TextField",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(160, 26),
        Parent = parent
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 6),
        Parent = field
    })
    
    local stroke = Create("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0.9,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = field
    })
    
    local textBox = Create("TextBox", {
        Name = "Field",
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromOffset(148, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        PlaceholderText = props.Placeholder or "",
        Text = props.Value or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        CursorPosition = -1,
        Parent = field
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 4),
        PaddingTop = UDim.new(0, 4),
        Parent = textBox
    })
    
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        Parent = field
    })
    
    local focused = false
    
    textBox.Focused:Connect(function()
        focused = true
        stroke.Thickness = 2
        stroke.Color = Color3.fromRGB(0, 122, 255)
        stroke.Transparency = 0.4
    end)
    
    textBox.FocusLost:Connect(function()
        focused = false
        stroke.Thickness = 1
        stroke.Color = Color3.fromRGB(255, 255, 255)
        stroke.Transparency = 0.9
        if props.ValueChanged then
            props.ValueChanged(textBox.Text)
        end
    end)
    
    textBox:GetPropertyChangedSignal("Text"):Connect(function()
        if props.TextChanged then
            props.TextChanged(textBox.Text)
        end
    end)
    
    return {
        Instance = field,
        TextBox = textBox,
        SetValue = function(self, newValue)
            textBox.Text = newValue
        end,
        GetValue = function(self)
            return textBox.Text
        end
    }
end

function Thunder:Notification(props)
    local parent = self:GetSafeParent()
    
    local notification = Create("Frame", {
        Name = "Notification",
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -15, 1, -15),
        Size = UDim2.fromOffset(350, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    local canvas = Create("Frame", {
        Name = "Canvas",
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(28, 28, 32),
        BackgroundTransparency = 0.9,
        BorderSizePixel = 0,
        Parent = notification
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = canvas
    })
    
    Create("UIStroke", {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 0.95,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = canvas
    })
    
    Create("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = canvas
    })
    
    local content = Create("Frame", {
        Name = "Content",
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0),
        Parent = canvas
    })
    
    local titleContainer = Create("Frame", {
        Name = "TitleContainer",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = content
    })
    
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = titleContainer
    })
    
    local icon = Create("ImageLabel", {
        Name = "Icon",
        Size = UDim2.fromOffset(20, 20),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = props.Icon or "",
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        Visible = props.Icon ~= nil,
        Parent = titleContainer
    })
    
    local titleLabel = Create("TextLabel", {
        Name = "Title",
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold),
        Size = UDim2.new(1, 0, 0, 22),
        Text = props.Title or "Notification",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        TextTransparency = 0.1,
        TextWrapped = true,
        RichText = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = titleContainer
    })
    
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = content
    })
    
    local subtitleLabel = Create("TextLabel", {
        Name = "Subtitle",
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://12187365364"),
        Size = UDim2.fromScale(1, 0),
        Text = props.Subtitle or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        TextTransparency = 0.5,
        TextWrapped = true,
        RichText = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = props.Subtitle ~= nil,
        Parent = content
    })
    
    Create("UIPadding", {
        PaddingBottom = UDim.new(0, 14),
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14),
        Parent = content
    })
    
    -- Close button
    local closeBtn = Create("TextButton", {
        Name = "Exit",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromOffset(4, 4),
        Size = UDim2.fromOffset(22, 22),
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(44, 44, 46),
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        Text = "",
        Parent = canvas
    })
    
    Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = closeBtn
    })
    
    local closeIcon = Create("ImageLabel", {
        Name = "Icon",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(16, 16),
        Image = "rbxassetid://72660323302468",
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ImageTransparency = 0.5,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = closeBtn
    })
    
    local duration = props.Duration or 4
    local function dismiss()
        notification:Destroy()
    end
    
    closeBtn.MouseButton1Click:Connect(dismiss)
    
    -- Animate in
    notification.Position = UDim2.new(1, 380, 1, -15)
    notification.BackgroundTransparency = 1
    
    task.spawn(function()
        task.wait(0.05)
        notification.Position = UDim2.new(1, -15, 1, -15)
    end)
    
    task.delay(duration, dismiss)
    
    return {
        Instance = notification,
        Canvas = canvas,
        Title = titleLabel,
        Subtitle = subtitleLabel,
        Dismiss = dismiss
    }
end

function Thunder:CreateWindow(title, subtitle)
    local window = self:New()
    if title then
        window.Title.Text = title
    end
    if subtitle then
        window.Subtitle.Text = subtitle
        window.Subtitle.Visible = true
    end
    
    return window
end

return Thunder