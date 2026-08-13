local a
a = {
	cache = {},
	load = function(b)
		if not a.cache[b] then
			a.cache[b] = {
				c = a[b]()
			}
		end
		return a.cache[b].c
	end
}
do
	function a.a()
		local b, d = {
			New = nil,
			Init = nil,
			Wrappers = setmetatable({}, {
				__mode = 'k'
			}),
			Shapes = {
				Circle = {
					Image = 'rbxassetid://111665032676235',
					Rect = Rect.new(512, 512, 512, 512),
					Radius = 512
				},
				CircleOutline = {
					Image = 'rbxassetid://108556680453287',
					Rect = Rect.new(512, 512, 512, 512),
					Radius = 512
				},
				CircleGlass = {
					Image = 'rbxassetid://95600044758841',
					Rect = Rect.new(512, 512, 512, 512),
					Radius = 512
				},
				SquircleH = {
					Image = 'rbxassetid://125083578015333',
					Rect = Rect.new(512, 325, 512, 325),
					Radius = 325
				},
				SquircleHOutline = {
					Image = 'rbxassetid://107043713170567',
					Rect = Rect.new(512, 325, 512, 325),
					Radius = 325
				},
				SquircleHGlass = {
					Image = 'rbxassetid://84819521201001',
					Rect = Rect.new(512, 325, 512, 325),
					Radius = 325
				},
				['SquircleH-TL-TR'] = {
					Image = 'rbxassetid://90680657206619',
					Rect = Rect.new(807, 512, 807, 512),
					Radius = 325,
					AutoChange = false
				},
				['SquircleH-BL-BR'] = {
					Image = 'rbxassetid://99216342056719',
					Rect = Rect.new(0, 512, 0, 512),
					Radius = 325,
					AutoChange = false
				},
				SquircleV = {
					Image = 'rbxassetid://124965260437653',
					Rect = Rect.new(325, 512, 325, 512),
					Radius = 325
				},
				SquircleVOutline = {
					Image = 'rbxassetid://88808835404198',
					Rect = Rect.new(325, 512, 325, 512),
					Radius = 325
				},
				SquircleVGlass = {
					Image = 'rbxassetid://124982801466667',
					Rect = Rect.new(325, 512, 325, 512),
					Radius = 325
				},
				Squircle = {
					Image = 'rbxassetid://89641024074289',
					Rect = Rect.new(460, 460, 460, 460),
					Radius = 310
				},
				SquircleOutline = {
					Image = 'rbxassetid://74029063732681',
					Rect = Rect.new(512, 512, 512, 512),
					Radius = 310
				},
				SquircleGlass = {
					Image = 'rbxassetid://131126436897551',
					Rect = Rect.new(512, 512, 512, 512),
					Radius = 310
				},
				['Squircle-TL-TR'] = {
					Image = 'rbxassetid://75712142040725',
					Rect = Rect.new(512, 512, 512, 512),
					Radius = 310,
					AutoChange = false
				},
				['Squircle-BL-BR'] = {
					Image = 'rbxassetid://83676684425544',
					Rect = Rect.new(512, 0, 512, 0),
					Radius = 310,
					AutoChange = false
				},
				Square = {
					Image = 'rbxassetid://82909646051652',
					Rect = Rect.new(512, 512, 512, 512),
					Radius = 512,
					AutoChange = false
				}
			}
		}
		function b.Init(e, f)
			d = f
			return e.New
		end
		function b.New(e, f, g, h, i, j, l)
			local m, p = {
				Radius = f or 0,
				Type = g or 'Circle',
				GetRadius = nil,
				GetType = nil,
				SetRadius = nil,
				SetType = nil,
				SetLinkedCorners = nil
			}, {
				['Glass-0.7'] = 'SquircleGlass',
				['Glass-1'] = 'SquircleGlass',
				['Glass-1.4'] = 'SquircleGlass',
				['Squircle-Outline'] = 'SquircleOutline'
			}
			local function GetShape(r)
				return b.Shapes[p[r] or r] or b.Shapes.Circle
			end
			local r = d.New(j and 'ImageButton' or 'ImageLabel', {
				Image = '',
				ScaleType = l ~= false and 'Slice' or nil,
				SliceCenter = m.Type ~= 'Squircle' and Rect.new(512, 512, 512, 512) or nil,
				SliceScale = 1,
				ThemeTag = h and h.ThemeTag or nil,
				BackgroundTransparency = 1
			}, i)
			for u, v in next, h do
				if not table.find({
					'ThemeTag'
				}, u) then
					r[u] = v
				end
			end
			function m.SetRadius(u, v)
				m.Radius = v
				r.SliceScale = math.max(v / GetShape(m.Type).Radius, 0.0001)
				return m
			end
			local function ApplyType(u)
				m.Type = u
				local v = GetShape(u)
				r.Image = v.Image
				r.SliceCenter = v.Rect
				m:SetRadius(m.Radius)
			end
			function m.SetType(u, v)
				if m.LinkedCorners then
					m.LinkedBaseType = v
					return m
				end
				ApplyType(v)
				return m
			end
			function m.SetLinkedCorners(u, v, x)
				if v then
					if not m.LinkedCorners then
						m.LinkedBaseType = m.Type
					end
					m.LinkedCorners = v
					ApplyType'Square'
					local z = r:FindFirstChild'WindUILinkedCorner'
					if not z then
						z = d.New('UICorner', {
							Name = 'WindUILinkedCorner',
							Parent = r
						})
					end
					d.ApplyCornerRadii(z, x or m.Radius, v)
				else
					m.LinkedCorners = nil
					ApplyType(m.LinkedBaseType or 'Squircle')
					m.LinkedBaseType = nil
					local z = r:FindFirstChild'WindUILinkedCorner'
					if z then
						z:Destroy()
					end
				end
				return m
			end
			function m.GetRadius(u)
				return m.Radius
			end
			function m.GetType(u)
				return m.Type
			end
			m:SetRadius(f)
			m:SetType(g)
			b.Wrappers[r] = m
			d.AddSignal(r:GetPropertyChangedSignal'AbsoluteSize', function()
				local u = GetShape(m.Type)
				if u.AutoChange == false or m.LinkedCorners then
					return
				end
				if string.find(m.Type, 'Squircle') then
					local v, x, z, A = string.find(m.Type, 'Glass') and 'Glass' or nil, string.find(m.Type, 'Outline') and 'Outline' or nil, math.round(r.AbsoluteSize.X / d.UIScale), math.round(r.AbsoluteSize.Y / d.UIScale)
					local B, C = m.Radius ~= 0 and m.Radius or math.min(z, A) / 2, b.Shapes.Squircle.Radius / 1024
					local F, G = (B / math.min(z, A))
					if z > A then
						if F >= C then
							G = 'SquircleH' .. (x or v or '')
						else
							G = 'Squircle' .. (x or v or '')
						end
					elseif z < A then
						if F >= C then
							G = 'SquircleV' .. (x or v or '')
						else
							G = 'Squircle' .. (x or v or '')
						end
					else
						if F >= C then
							G = 'Circle' .. (x or v or '')
						else
							G = 'Squircle' .. (x or v or '')
						end
					end
					if G ~= m:GetType() then
						m:SetType(G)
					end
				end
			end)
			return r, m
		end
		function b.GetWrapper(e, f)
			return b.Wrappers[f]
		end
		return b
	end
	function a.b()
		local b = (cloneref or clonereference or function(b)
			return b
		end)
		local d, e, f, g = b(game:GetService'ReplicatedStorage'), b(game:GetService'HttpService'), b(game:GetService'RunService'), 'https://article-hub-studio.github.io/WindUI-Skibidi/vendor/icons/Main-v2.lua'
		local function LoadBaseIcons()
			local h = d:FindFirstChild'GetIcons'
			if h and h:IsA'RemoteFunction' and (f:IsStudio() or h:GetAttribute'WindUIIcons' == true) then
				local i, j = pcall(function()
					return h:InvokeServer()
				end)
				if i and typeof(j) == 'table' then
					return j
				end
			end
			local i, j = pcall(function()
				if game.HttpGet then
					return game:HttpGet(g)
				end
				return e:GetAsync(g)
			end)
			if i and type(j) == 'string' and type(loadstring) == 'function' then
				local l = loadstring(j)
				if l then
					local m, p = pcall(l)
					if m and typeof(p) == 'table' then
						return p
					end
				end
			end
			warn'[ WindUI.Icons ] Unable to load the base icon catalog; custom sources remain available'
			return {}
		end
		local h = LoadBaseIcons()
		h.AdapterVersion = 3
		local i = {
			lucidev = 'lucide',
			lucideicons = 'lucide',
			sf = 'sfsymbols',
			sfsymbol = 'sfsymbols',
			sf_symbols = 'sfsymbols',
			gravityui = 'gravity',
			gravity_ui = 'gravity'
		}
		h.Icons = if typeof(h.Icons) == 'table' then h.Icons else {}
		h.IconsType = h.IconsType or 'lucide'
		h.SourceAliases = if typeof(h.SourceAliases) == 'table' then h.SourceAliases else {}
		h.Resolvers = if typeof(h.Resolvers) == 'table' then h.Resolvers else {}
		h.FallbackAcrossSources = h.FallbackAcrossSources ~= false
		for j, l in i do
			if h.SourceAliases[j] == nil then
				h.SourceAliases[j] = l
			end
		end
		local j
		local function NormalizeSourceName(l)
			if type(l) ~= 'string' then
				return nil
			end
			local m = l:lower():gsub('%s+', ''):gsub('[^%w_%-]', '')
			if m == '' then
				return nil
			end
			return m
		end
		local function ResolveSourceAlias(l)
			local m, p = NormalizeSourceName(l), {}
			for r = 1, 8 do
				if not m or p[m] then
					break
				end
				p[m] = true
				local u = h.SourceAliases[m]
				if not u then
					break
				end
				m = NormalizeSourceName(u)
			end
			return m
		end
		local function NormalizeImage(l)
			if type(l) == 'number' then
				return 'rbxassetid://' .. tostring(l)
			end
			if type(l) ~= 'string' then
				return nil
			end
			if l:match'^%d+$' then
				return 'rbxassetid://' .. l
			end
			return l
		end
		local function IsDirectImage(l)
			if type(l) == 'number' then
				return true
			end
			if type(l) ~= 'string' then
				return false
			end
			return l:match'^%d+$' ~= nil or l:match'^rbxassetid://' ~= nil or l:match'^rbxthumb://' ~= nil or l:match'^rbxgameasset://' ~= nil or l:match'^https?://' ~= nil
		end
		local function NormalizeVector2(l)
			if typeof(l) == 'Vector2' then
				return l
			end
			if typeof(l) == 'table' then
				return Vector2.new(tonumber(l.X or l.x or l[1]) or 0, tonumber(l.Y or l.y or l[2]) or 0)
			end
			return Vector2.zero
		end
		local function NormalizeDescriptor(l)
			if IsDirectImage(l) then
				return {
					Image = NormalizeImage(l),
					ImageRectSize = Vector2.zero,
					ImageRectPosition = Vector2.zero,
					Parts = nil
				}
			end
			if typeof(l) ~= 'table' then
				return nil
			end
			local m = l.Image or l.Asset or l.AssetId or l.Id or l.URL or l.Url
			if not IsDirectImage(m) then
				return nil
			end
			return {
				Image = NormalizeImage(m),
				ImageRectSize = NormalizeVector2(l.ImageRectSize or l.RectSize or l.Size),
				ImageRectPosition = NormalizeVector2(l.ImageRectPosition or l.ImageRectOffset or l.RectPosition or l.Offset),
				Parts = l.Parts
			}
		end
		local function ParseIconReference(l)
			if typeof(l) == 'table' then
				return l.Source or l.Pack or l.Library or l.Type, l.Name or l.Icon or l.Key, l
			end
			if type(l) ~= 'string' or IsDirectImage(l) then
				return nil, l, l
			end
			local m, p = l:match'^@([%w_%-]+)/(.+)$'
			if not m then
				m, p = l:match'^([%w_%-]+):(.+)$'
			end
			if not m then
				m, p = l:match'^([%w_%-]+)/(.+)$'
			end
			return m, p or l, l
		end
		local function FindSource(l)
			local m = ResolveSourceAlias(l)
			if not m then
				return nil, nil
			end
			if h.Icons[m] then
				return h.Icons[m], m
			end
			for p, r in h.Icons do
				if NormalizeSourceName(p) == m then
					return r, p
				end
			end
			return nil, m
		end
		local function GetSourceNames()
			local l = {}
			for m in h.Icons do
				table.insert(l, tostring(m))
			end
			table.sort(l, function(m, p)
				return m:lower() < p:lower()
			end)
			return l
		end
		local l
		local function ResolvePackIcon(m, p, r)
			if typeof(m) ~= 'table' or p == nil then
				return nil
			end
			local u = if typeof(m.Icons) == 'table' then m.Icons else m
			local v = u[p]
			if v == nil then
				local x = tostring(p):lower()
				for z, A in u do
					if tostring(z):lower() == x then
						v = A
						break
					end
				end
			end
			if typeof(v) == 'table' and v.Alias then
				return l(v.Alias, nil, (r or 0) + 1)
			end
			local x, z = typeof(v) == 'table' and (v.Image or v.Asset or v.AssetId or v.Id or v.URL or v.Url) or v, NormalizeDescriptor(v)
			if not z then
				return nil
			end
			if typeof(m.Spritesheets) == 'table' then
				z.Image = m.Spritesheets[x] or m.Spritesheets[tostring(x)] or m.Spritesheets[z.Image] or m.Spritesheets[tostring(z.Image)] or z.Image
			end
			return z
		end
		local function ResolveProviderIcon(m, p)
			local r = h.Resolvers[ResolveSourceAlias(m)]
			if typeof(r) ~= 'function' then
				return nil
			end
			local u, v = pcall(r, p, m)
			if not u then
				warn(string.format("[ WindUI.Icons ] Source '%s' failed: %s", tostring(m), tostring(v)))
				return nil
			end
			return NormalizeDescriptor(v)
		end
		l = function(m, p, r)
			if (r or 0) > 8 then
				return nil
			end
			local u = NormalizeDescriptor(m)
			if u then
				return u
			end
			local v, x, z = ParseIconReference(m)
			if typeof(z) == 'table' and z.Alias then
				return l(z.Alias, p, (r or 0) + 1)
			end
			local A = ResolveSourceAlias(v or p or h.IconsType)
			if A then
				local B = FindSource(A)
				local C = ResolvePackIcon(B, x, r) or ResolveProviderIcon(A, x)
				if C then
					return C
				end
			end
			if v or not h.FallbackAcrossSources then
				return nil
			end
			for B, C in GetSourceNames() do
				if ResolveSourceAlias(C) ~= A then
					local F = ResolvePackIcon(h.Icons[C], x, r)
					if F then
						return F
					end
				end
			end
			for B, C in h.Resolvers do
				if B ~= A and typeof(C) == 'function' then
					local F = ResolveProviderIcon(B, x)
					if F then
						return F
					end
				end
			end
			return nil
		end
		local function FormatDescriptor(m, p)
			if not m then
				return nil
			end
			if p == false and m.ImageRectSize == Vector2.zero and not m.Parts then
				return m.Image
			end
			return {
				m.Image,
				m
			}
		end
		function h.AddSourceAlias(m, p)
			local r, u = NormalizeSourceName(m), NormalizeSourceName(p)
			assert(r and u, 'AddSourceAlias: alias and source must be non-empty strings')
			h.SourceAliases[r] = u
			return h
		end
		function h.RegisterIconSource(m, p, r)
			local u = NormalizeSourceName(m)
			assert(u, 'RegisterIconSource: source must be a non-empty string')
			if typeof(p) == 'function' then
				h.Resolvers[u] = p
			elseif typeof(p) == 'table' then
				h.AddIcons(u, p)
			else
				error'RegisterIconSource: provider must be a function or icon table'
			end
			if typeof(r) == 'table' then
				for v, x in r.Aliases or {} do
					h.AddSourceAlias(x, u)
				end
			end
			return h
		end
		function h.AddIcons(m, p)
			local r = NormalizeSourceName(m)
			assert(r and typeof(p) == 'table', 'AddIcons: packName must be string and iconsData must be table')
			local u = h.Icons[r]
			if typeof(u) ~= 'table' or typeof(u.Icons) ~= 'table' then
				u = {
					Icons = {},
					Spritesheets = {}
				}
				h.Icons[r] = u
			end
			for v, x in p do
				local z = NormalizeDescriptor(x)
				if z then
					u.Icons[v] = z
					u.Spritesheets[z.Image] = z.Image
				elseif typeof(x) == 'table' and x.Alias then
					u.Icons[v] = {
						Alias = x.Alias
					}
				else
					warn(string.format("[ WindUI.Icons ] Ignored invalid icon '%s:%s'", r, tostring(v)))
				end
			end
			return h
		end
		h.RegisterIconPack = h.AddIcons
		h.AddIconSource = h.RegisterIconSource
		function h.AddIcon(m, p, r)
			return h.AddIcons(m, {
				[p] = r
			})
		end
		function h.SetIconsType(m)
			local p = ResolveSourceAlias(m)
			assert(p, 'SetIconsType: icon type must be a non-empty string')
			h.IconsType = p
			return h
		end
		function h.GetIconSources()
			local m = GetSourceNames()
			for p in h.Resolvers do
				if not table.find(m, p) then
					table.insert(m, p)
				end
			end
			table.sort(m)
			return m
		end
		function h.HasIcon(m, p)
			return l(m, p, 0) ~= nil
		end
		function h.Init(m, p)
			h.New = m
			h.IconThemeTag = p
			j = m
			return h
		end
		function h.Icon(m, p, r)
			return FormatDescriptor(l(m, p, 0), r ~= false)
		end
		function h.GetIcon(m, p)
			return h.Icon(m, p, false)
		end
		function h.Icon2(m, p)
			return h.Icon(m, p, true)
		end
		local function ResolveStyle(m, p, r)
			local u = m[p]
			if u == nil then
				u = m[1]
			end
			if u == nil then
				u = r
			end
			return {
				ThemeTag = typeof(u) == 'string' and u or nil,
				Color = typeof(u) == 'Color3' and u or nil,
				Value = typeof(u) == 'number' and u or nil
			}
		end
		local function CreateImageLabel(m)
			if j then
				return j('ImageLabel', m)
			end
			local p = Instance.new'ImageLabel'
			for r, u in m do
				if r ~= 'ThemeTag' and u ~= nil then
					p[r] = u
				end
			end
			return p
		end
		function h.Image(m)
			m = if typeof(m) == 'table' then m else {}
			local p = {
				Icon = m.Icon,
				Type = m.Type,
				Colors = m.Colors or {
					h.IconThemeTag or Color3.new(1, 1, 1)
				},
				Transparency = m.Transparency or {
					0
				},
				Size = m.Size or UDim2.fromOffset(24, 24),
				IconFrame = nil
			}
			local r = h.Icon2(p.Icon, p.Type)
			local u, v, x, z = r and r[1] or '', r and r[2] or {
				ImageRectSize = Vector2.zero,
				ImageRectPosition = Vector2.zero
			}, ResolveStyle(p.Colors, 1, h.IconThemeTag or Color3.new(1, 1, 1)), ResolveStyle(p.Transparency, 1, 0)
			local A, B = CreateImageLabel{
				Name = 'Icon',
				Size = p.Size,
				BackgroundTransparency = 1,
				ImageColor3 = x.Color,
				ImageTransparency = z.Value,
				ThemeTag = x.ThemeTag and {
					ImageColor3 = x.ThemeTag,
					ImageTransparency = z.ThemeTag
				} or nil,
				Image = u,
				ImageRectSize = v.ImageRectSize,
				ImageRectOffset = v.ImageRectPosition
			}, ParseIconReference(p.Icon)
			for C, F in v.Parts or {} do
				local G = h.Icon2(F, B or p.Type)
				if G then
					local H, J = ResolveStyle(p.Colors, C + 1, x.Color or x.ThemeTag), ResolveStyle(p.Transparency, C + 1, z.Value or 0)
					CreateImageLabel{
						Name = 'Part' .. tostring(C),
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						ImageColor3 = H.Color,
						ImageTransparency = J.Value,
						ThemeTag = H.ThemeTag and {
							ImageColor3 = H.ThemeTag,
							ImageTransparency = J.ThemeTag
						} or nil,
						Image = G[1],
						ImageRectSize = G[2].ImageRectSize,
						ImageRectOffset = G[2].ImageRectPosition,
						Parent = A
					}
				end
			end
			p.IconFrame = A
			return p
		end
		return h
	end
	function a.c()
		return function(b)
			return {
				Primary = 'Icon',
				White = Color3.new(1, 1, 1),
				Black = Color3.new(0, 0, 0),
				Dialog = 'Accent',
				Background = 'Accent',
				BackgroundTransparency = 0,
				Hover = 'Text',
				PanelBackground = 'White',
				PanelBackgroundTransparency = 0.95,
				WindowBackground = 'Background',
				WindowShadow = 'Black',
				WindowTopbarTitle = 'Text',
				WindowTopbarAuthor = 'Text',
				WindowTopbarIcon = 'Icon',
				WindowTopbarButtonIcon = 'Icon',
				WindowSearchBarBackground = 'Dialog',
				TabBackground = 'Hover',
				TabBackgroundHover = 'Hover',
				TabBackgroundHoverTransparency = 0.97,
				TabBackgroundActive = 'Hover',
				TabBackgroundActiveTransparency = 0.93,
				TabText = 'Text',
				TabTextTransparency = 0.3,
				TabTextTransparencyActive = 0,
				TabTitle = 'Text',
				TabIcon = 'Icon',
				TabIconTransparency = 0.4,
				TabIconTransparencyActive = 0.1,
				TabBorderTransparency = 1,
				TabBorderTransparencyActive = 0.75,
				TabBorder = 'White',
				ElementBackground = 'Text',
				ElementBackgroundTransparency = 0.93,
				ElementBackgroundHover = b:AddColor('ElementBackground', '#ffffff', 0.1),
				ElementTitle = 'Text',
				ElementDesc = 'Text',
				ElementIcon = 'Icon',
				RadioGroupBackground = 'ElementBackground',
				RadioGroupText = 'Text',
				RadioGroupBorder = 'Text',
				RadioGroupActive = 'Primary',
				CheckboxGroupBackground = 'ElementBackground',
				CheckboxGroupText = 'Text',
				CheckboxGroupBorder = 'Text',
				CheckboxGroupActive = 'Primary',
				CheckboxGroupIcon = 'White',
				SegmentedControlBackground = 'ElementBackground',
				SegmentedControlActive = 'Primary',
				SegmentedControlText = 'Text',
				StepperButton = 'ElementBackground',
				StepperValueBackground = 'ElementBackground',
				StepperIcon = 'Icon',
				StepperText = 'Text',
				BadgeBackground = 'Primary',
				BadgeText = 'White',
				BadgeIcon = 'White',
				KeyValueIcon = 'Icon',
				ChipListBackground = 'ElementBackground',
				TimelineLine = 'Text',
				AccordionBackground = 'ElementBackground',
				AccordionIcon = 'Icon',
				TabBoxTabBackground = 'ElementBackground',
				TabBoxIcon = 'Icon',
				EmptyStateIcon = 'Icon',
				DiscordCardBackground = 'ElementBackground',
				DiscordCardAccent = 'Primary',
				Path2DBackground = 'ElementBackground',
				Path2DTrack = 'ElementBackground',
				Path2DLine = 'Primary',
				Path2DMarker = 'Primary',
				Path2DLabel = 'Text',
				PopupBackground = 'Background',
				PopupBackgroundTransparency = 'BackgroundTransparency',
				PopupTitle = 'Text',
				PopupContent = 'Text',
				PopupIcon = 'Icon',
				DialogBackground = 'Dialog',
				DialogBackgroundTransparency = 'BackgroundTransparency',
				DialogTitle = 'Text',
				DialogContent = 'Text',
				DialogIcon = 'Icon',
				Toggle = 'Button',
				ToggleBar = 'White',
				Checkbox = 'Primary',
				CheckboxIcon = 'White',
				CheckboxBorder = 'White',
				CheckboxBorderTransparency = 0.75,
				SliderIcon = 'Icon',
				Slider = 'Primary',
				SliderThumb = 'White',
				SliderIconFrom = 'SliderIcon',
				SliderIconTo = 'SliderIcon',
				ProgressBar = 'Primary',
				ProgressBarTrack = 'Text',
				ProgressBarTrackTransparency = 0.9,
				ProgressBarText = 'Text',
				Tooltip = Color3.fromHex'4C4C4C',
				TooltipText = 'White',
				TooltipSecondary = 'Primary',
				TooltipSecondaryText = 'White',
				TabSectionIcon = 'Icon',
				SectionIcon = 'Icon',
				SectionExpandIcon = 'Icon',
				SectionExpandIconTransparency = 0.4,
				SectionBox = 'Text',
				SectionBoxTransparency = 0.95,
				SectionBoxBorder = 'White',
				SectionBoxBorderTransparency = 0.75,
				SectionBoxBackground = 'Text',
				SectionBoxBackgroundTransparency = 0.97,
				SearchBarBorder = 'White',
				SearchBarBorderTransparency = 0.75,
				Notification = 'Dialog',
				NotificationTransparency = 0.08,
				NotificationGlass = 'Dialog',
				NotificationGlassTransparency = 0.28,
				NotificationGlassSurface = 'White',
				NotificationGlassSurfaceTransparency = 0.91,
				NotificationGlassHighlight = 'White',
				NotificationGlassTextureTransparency = 0.78,
				Notification2 = 'White',
				Notification2Transparency = 0.985,
				NotificationTitle = 'Text',
				NotificationTitleTransparency = 0,
				NotificationContent = 'Text',
				NotificationContentTransparency = 0.32,
				NotificationDuration = 'White',
				NotificationDurationTransparency = 0.94,
				NotificationBorder = 'White',
				NotificationBorderTransparency = 0.76,
				DropdownTabBorder = 'White',
				DropdownTabBackground = 'ElementBackground',
				DropdownBackground = 'Background',
				LabelBackground = 'White',
				LabelBackgroundTransparency = 0.95,
				ViewportBackground = 'ElementBackground',
				ViewportBackgroundTransparency = 'ElementBackgroundTransparency'
			}
		end
	end
	function a.d()
		local b = (cloneref or clonereference or function(b)
			return b
		end)
		local d, e, f, g, h, i, j = b(game:GetService'RunService'), b(game:GetService'UserInputService'), b(game:GetService'TweenService'), b(game:GetService'LocalizationService'), b(game:GetService'HttpService'), a.load'a', a.load'b'
		local l = d.Heartbeat
		j.SetIconsType'lucide'
		local m, p
		p = {
			Font = 'rbxassetid://12187365364',
			Localization = nil,
			CanDraggable = true,
			Theme = nil,
			Themes = nil,
			Icons = j,
			IconAdapterVersion = j.AdapterVersion or 1,
			Signals = {},
			Objects = {},
			LocalizationObjects = {},
			UIScale = 1,
			FontObjects = {},
			Language = string.match(g.SystemLocaleId, '^[a-z]+'),
			Request = http_request or (syn and syn.request) or request,
			DefaultProperties = {
				ScreenGui = {
					ResetOnSpawn = false,
					ZIndexBehavior = 'Sibling'
				},
				CanvasGroup = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1)
				},
				Frame = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1)
				},
				TextLabel = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = '',
					RichText = true,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14
				},
				TextButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = '',
					AutoButtonColor = false,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14
				},
				TextBox = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderColor3 = Color3.new(0, 0, 0),
					ClearTextOnFocus = false,
					Text = '',
					TextColor3 = Color3.new(0, 0, 0),
					TextSize = 14
				},
				ImageLabel = {
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0
				},
				ImageButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					AutoButtonColor = false
				},
				UIListLayout = {
					SortOrder = 'LayoutOrder'
				},
				ScrollingFrame = {
					ScrollBarImageTransparency = 1,
					BorderSizePixel = 0
				},
				VideoFrame = {
					BorderSizePixel = 0
				}
			},
			Colors = {
				Red = '#e53935',
				Orange = '#f57c00',
				Green = '#43a047',
				Blue = '#039be5',
				White = '#ffffff',
				Grey = '#484848'
			},
			ThemeFallbacks = nil,
			ThemeChangeCallbacks = {}
		}
		function p.Init(r)
			m = r
			p.ThemeFallbacks = a.load'c'(p)
			p.UIScale = r.UIScale
			i:Init(p)
		end
		function p.AddSignal(r, u)
			local v = r:Connect(u)
			table.insert(p.Signals, v)
			return v
		end
		function p.DisconnectSignal(r)
			if not r then
				return
			end
			local u = table.find(p.Signals, r)
			if u then
				table.remove(p.Signals, u)
			end
			r:Disconnect()
		end
		function p.DisconnectAll()
			for r = # p.Signals, 1, - 1 do
				local u = p.Signals[r]
				p.Signals[r] = nil
				if u then
					u:Disconnect()
				end
			end
			table.clear(p.Signals)
		end
		function p.SafeCallback(r, ...)
			if not r then
				return
			end
			local u, v = pcall(r, ...)
			if not u then
				if m and m.Window and m.Window.Debug then
					local x, z = v:find':%d+: '
					warn('[ WindUI: DEBUG Mode ] ' .. v)
					return m:Notify{
						Title = 'DEBUG Mode: Error',
						Content = not z and v or v:sub(z + 1),
						Style = 'Error',
						Duration = 8
					}
				end
			end
		end
		function p.Gradient(r, u)
			if m and m.Gradient then
				return m:Gradient(r, u)
			end
			local v, x = {}, {}
			for z, A in next, r do
				local B = tonumber(z)
				if B then
					B = math.clamp(B / 100, 0, 1)
					table.insert(v, ColorSequenceKeypoint.new(B, A.Color))
					table.insert(x, NumberSequenceKeypoint.new(B, A.Transparency or 0))
				end
			end
			table.sort(v, function(z, A)
				return z.Time < A.Time
			end)
			table.sort(x, function(z, A)
				return z.Time < A.Time
			end)
			if # v < 2 then
				error'ColorSequence requires at least 2 keypoints'
			end
			local z = {
				Color = ColorSequence.new(v),
				Transparency = NumberSequence.new(x)
			}
			if u then
				for A, B in pairs(u) do
					z[A] = B
				end
			end
			return z
		end
		function p.SetTheme(r)
			if typeof(r) ~= 'table' then
				r = p.Theme or (p.Themes and p.Themes.Dark)
			end
			if typeof(r) ~= 'table' then
				return nil
			end
			local u = p.Theme
			p.Theme = r
			p.UpdateTheme(nil, false)
			for v, x in next, p.ThemeChangeCallbacks do
				p.SafeCallback(x, r, u)
			end
			return r
		end
		function p.AddFontObject(r)
			table.insert(p.FontObjects, r)
			p.UpdateFont(p.Font)
		end
		function p.UpdateFont(r)
			p.Font = r
			for u, v in next, p.FontObjects do
				v.FontFace = Font.new(r, v.FontFace.Weight, v.FontFace.Style)
			end
		end
		function p.GetThemeProperty(r, u)
			local function getValue(v, x)
				if typeof(x) ~= 'table' then
					return nil
				end
				local z = x[v]
				if z == nil then
					return nil
				end
				if typeof(z) == 'string' and string.sub(z, 1, 1) == '#' then
					return Color3.fromHex(z)
				end
				if typeof(z) == 'Color3' then
					return z
				end
				if typeof(z) == 'number' then
					return z
				end
				if typeof(z) == 'table' and z.Color and z.Transparency then
					return z
				end
				if typeof(z) == 'function' then
					return z(x)
				end
				return z
			end
			u = if typeof(u) == 'table' then u else p.Theme
			local v = getValue(r, u)
			if v ~= nil then
				if typeof(v) == 'string' and string.sub(v, 1, 1) ~= '#' then
					local x = p.GetThemeProperty(v, u)
					if x ~= nil then
						return x
					end
				else
					return v
				end
			end
			local x = p.ThemeFallbacks and p.ThemeFallbacks[r]
			if x ~= nil then
				if typeof(x) == 'string' and string.sub(x, 1, 1) ~= '#' then
					return p.GetThemeProperty(x, u)
				else
					return getValue(r, {
						[r] = x
					})
				end
			end
			local z = p.Themes and p.Themes.Dark
			v = getValue(r, z)
			if v ~= nil then
				if typeof(v) == 'string' and string.sub(v, 1, 1) ~= '#' then
					local A = p.GetThemeProperty(v, z)
					if A ~= nil then
						return A
					end
				else
					return v
				end
			end
			if x ~= nil then
				if typeof(x) == 'string' and string.sub(x, 1, 1) ~= '#' then
					return p.GetThemeProperty(x, z)
				else
					return getValue(r, {
						[r] = x
					})
				end
			end
			return nil
		end
		function p.AddThemeObject(r, u, v)
			if p.Objects[r] then
				for x, z in pairs(u) do
					p.Objects[r].Properties[x] = z
				end
			else
				p.Objects[r] = {
					Object = r,
					Properties = u
				}
			end
			if not v then
				p.UpdateTheme(r, false)
			end
			return r
		end
		function p.AddLangObject(r)
			local u = p.LocalizationObjects[r]
			if not u then
				return
			end
			local v = u.Object
			p.SetLangForObject(r)
			return v
		end
		function p.UpdateTheme(r, u, v, x, z, A)
			local function ApplyTheme(B)
				for C, F in pairs(B.Properties or {}) do
					local G = p.GetThemeProperty(F, p.Theme)
					if G ~= nil then
						if typeof(G) == 'Color3' then
							local H = B.Object:FindFirstChild'LibraryGradient'
							if H then
								H:Destroy()
							end
							if v then
								p.Tween(B.Object, x or 0.2, {
									[C] = G
								}, z or Enum.EasingStyle.Quint, A or Enum.EasingDirection.Out):Play()
							elseif u then
								p.Tween(B.Object, 0.08, {
									[C] = G
								}):Play()
							else
								B.Object[C] = G
							end
						elseif typeof(G) == 'table' and G.Color and G.Transparency then
							B.Object[C] = Color3.new(1, 1, 1)
							local H = B.Object:FindFirstChild'LibraryGradient'
							if not H then
								H = Instance.new'UIGradient'
								H.Name = 'LibraryGradient'
								H.Parent = B.Object
							end
							H.Color = G.Color
							H.Transparency = G.Transparency
							for J, L in pairs(G) do
								if J ~= 'Color' and J ~= 'Transparency' and H[J] ~= nil then
									H[J] = L
								end
							end
						elseif typeof(G) == 'number' then
							if v then
								p.Tween(B.Object, x or 0.2, {
									[C] = G
								}, z or Enum.EasingStyle.Quint, A or Enum.EasingDirection.Out):Play()
							elseif u then
								p.Tween(B.Object, 0.08, {
									[C] = G
								}):Play()
							else
								B.Object[C] = G
							end
						end
					else
						local H = B.Object:FindFirstChild'LibraryGradient'
						if H then
							H:Destroy()
						end
					end
				end
			end
			if r then
				local B = p.Objects[r]
				if B then
					ApplyTheme(B)
				end
			else
				for B, C in pairs(p.Objects) do
					ApplyTheme(C)
				end
			end
		end
		function p.SetThemeTag(r, u, v, x, z)
			p.AddThemeObject(r, u)
			p.UpdateTheme(r, false, true, v, x, z)
		end
		function p.SetLangForObject(r)
			if p.Localization and p.Localization.Enabled then
				local u = p.LocalizationObjects[r]
				if not u then
					return
				end
				local v, x, z = u.Object, u.TranslationId, p.Localization.Translations[p.Language]
				if z and z[x] then
					v.Text = z[x]
				else
					local A = p.Localization and p.Localization.Translations and p.Localization.Translations.en or nil
					if A and A[x] then
						v.Text = A[x]
					else
						v.Text = '[' .. x .. ']'
					end
				end
			end
		end
		function p.ChangeTranslationKey(r, u, v)
			if p.Localization and p.Localization.Enabled then
				local x = string.match(v, '^' .. p.Localization.Prefix .. '(.+)')
				if x then
					for z, A in ipairs(p.LocalizationObjects) do
						if A.Object == u then
							A.TranslationId = x
							p.SetLangForObject(z)
							return
						end
					end
					table.insert(p.LocalizationObjects, {
						TranslationId = x,
						Object = u
					})
					p.SetLangForObject(# p.LocalizationObjects)
				end
			end
		end
		function p.UpdateLang(r)
			if r then
				p.Language = r
			end
			for u = 1, # p.LocalizationObjects do
				local v = p.LocalizationObjects[u]
				if v.Object and v.Object.Parent ~= nil then
					p.SetLangForObject(u)
				else
					p.LocalizationObjects[u] = nil
				end
			end
		end
		function p.SetLanguage(r)
			p.Language = r
			p.UpdateLang()
		end
		function p.Icon(r, u)
			return j.Icon(r, nil, u ~= false)
		end
		function p.AddIcons(r, u)
			return j.AddIcons(r, u)
		end
		function p.AddIcon(r, u, v)
			return j.AddIcon(r, u, v)
		end
		function p.RegisterIconSource(r, u, v)
			return j.RegisterIconSource(r, u, v)
		end
		p.RegisterIconPack = p.AddIcons
		p.AddIconSource = p.RegisterIconSource
		function p.AddIconSourceAlias(r, u)
			return j.AddSourceAlias(r, u)
		end
		function p.SetIconSource(r)
			return j.SetIconsType(r)
		end
		function p.GetIconSources()
			return j.GetIconSources()
		end
		function p.HasIcon(r, u)
			return j.HasIcon(r, u)
		end
		function p.New(r, u, v)
			local x = Instance.new(r)
			for z, A in next, p.DefaultProperties[r] or {} do
				x[z] = A
			end
			for z, A in next, u or {} do
				if z ~= 'ThemeTag' then
					x[z] = A
				end
				if p.Localization and p.Localization.Enabled and z == 'Text' then
					local B = string.match(A, '^' .. p.Localization.Prefix .. '(.+)')
					if B then
						local C = # p.LocalizationObjects + 1
						p.LocalizationObjects[C] = {
							TranslationId = B,
							Object = x
						}
						p.SetLangForObject(C)
					end
				end
			end
			for z, A in next, v or {} do
				A.Parent = x
			end
			if u and u.ThemeTag then
				p.AddThemeObject(x, u.ThemeTag)
			end
			if u and u.FontFace then
				p.AddFontObject(x)
			end
			return x
		end
		function p.Tween(r, u, v, ...)
			return f:Create(r, TweenInfo.new(u, ...), v)
		end
		function p.ClampTransparency(r, u)
			local v = tonumber(r)
			if v == nil then
				return u
			end
			return math.clamp(v, 0, 1)
		end
		function p.ToUDimRadius(r, u)
			if typeof(r) == 'UDim' then
				return r
			end
			if type(r) == 'number' then
				return UDim.new(0, math.max(r, 0))
			end
			if typeof(u) == 'UDim' then
				return u
			end
			return UDim.new(0, tonumber(r) or tonumber(u) or 0)
		end
		function p.ApplyCornerRadii(r, u, v)
			if typeof(r) ~= 'Instance' or not r:IsA'UICorner' then
				return r
			end
			local x, z = p.ToUDimRadius(u, r.CornerRadius), v or {
				TopLeft = true,
				TopRight = true,
				BottomLeft = true,
				BottomRight = true
			}
			local function ResolveCorner(A)
				if A == false then
					return UDim.new(0, 0)
				end
				if typeof(A) == 'UDim' then
					return A
				end
				if type(A) == 'number' then
					return UDim.new(0, math.max(A, 0))
				end
				return x
			end
			r.CornerRadius = x
			pcall(function()
				r.TopLeftRadius = ResolveCorner(z.TopLeft)
				r.TopRightRadius = ResolveCorner(z.TopRight)
				r.BottomRightRadius = ResolveCorner(z.BottomRight)
				r.BottomLeftRadius = ResolveCorner(z.BottomLeft)
			end)
			return r
		end
		function p.CreateUIShadow(r, u)
			local v
			local x = pcall(function()
				v = Instance.new'UIShadow'
				for x, z in u or {} do
					if x ~= 'Parent' and x ~= 'ThemeTag' then
						v[x] = z
					end
				end
				v.Parent = r or (u and u.Parent)
			end)
			if not x then
				if v then
					v:Destroy()
				end
				return nil
			end
			if u and u.ThemeTag then
				p.AddThemeObject(v, u.ThemeTag)
			end
			return v
		end
		function p.ApplyLinkedCornerSurface(r, u, v, x)
			if typeof(r) ~= 'Instance' or not r:IsA'GuiObject' then
				return nil
			end
			local z = i:GetWrapper(r)
			if z and z.SetLinkedCorners then
				z:SetLinkedCorners(x and v or nil, u)
				return z
			end
			local A = r:FindFirstChild'WindUILinkedCorner'
			local B = A or r:FindFirstChildWhichIsA'UICorner'
			if not x then
				if A then
					A:Destroy()
				elseif B then
					p.ApplyCornerRadii(B, u, p.DefaultCornerMap())
				end
				return nil
			end
			A = B
			if not A then
				A = p.New('UICorner', {
					Name = 'WindUILinkedCorner',
					Parent = r
				})
			end
			p.ApplyCornerRadii(A, u, v)
			return A
		end
		function p.DefaultCornerMap()
			return {
				TopLeft = true,
				TopRight = true,
				BottomLeft = true,
				BottomRight = true
			}
		end
		function p.GetLinkedCornerDirection(r, u, v)
			if typeof(v) == 'table' then
				local x = tostring(v.Orientation or v.Direction or ''):lower()
				if x == 'horizontal' or x == 'row' or x == 'x' then
					return true
				elseif x == 'vertical' or x == 'column' or x == 'y' then
					return false
				end
			end
			local x = u or (r and r.__type)
			if x == 'Group' then
				return true
			end
			if x == 'HStack' then
				if r and r.IsStacked == true then
					return false
				end
				local z = r and r.ElementFrame
				local A = z and z:FindFirstChildWhichIsA'UIListLayout'
				if A then
					return A.FillDirection == Enum.FillDirection.Horizontal
				end
				return true
			end
			return false
		end
		function p.GetLinkedCornerShape(r, u, v, x, z)
			return p:GetElementPosition(r, u, p.GetLinkedCornerDirection(v, x, z), z)
		end
		function p.NewRoundFrame(r, u, v, x, z, A)
			return i:New(r, u, v, x, z, nil)
		end
		local r, u = p.New, p.Tween
		function p.SetDraggable(v)
			p.CanDraggable = v
		end
		function p.Drag(v, x, z)
			local A, B, C, F, G, H, J, L = m.GenerateGUID(), false, {}, {
				CanDraggable = true
			}
			if not x or typeof(x) ~= 'table' then
				x = {
					v
				}
			end
			local function TrackConnection(M, N)
				local O = p.AddSignal(M, N)
				table.insert(C, O)
				return O
			end
			local function StopDragging()
				if m and m.CurrentInput == A then
					m.CurrentInput = nil
				end
				local M = B
				B = false
				L = nil
				G = nil
				if M and z and typeof(z) == 'function' then
					z(false, nil)
				end
			end
			local function update(M)
				if not B or not p.CanDraggable or not F.CanDraggable then
					return
				end
				local N = M.Position - H
				p.Tween(v, 0.02, {
					Position = UDim2.new(J.X.Scale, J.X.Offset + N.X, J.Y.Scale, J.Y.Offset + N.Y)
				}):Play()
			end
			for M, N in pairs(x) do
				TrackConnection(N.InputBegan, function(O)
					if not p.CanDraggable or not F.CanDraggable or B then
						return
					end
					if O.UserInputType == Enum.UserInputType.MouseButton1 or O.UserInputType == Enum.UserInputType.Touch then
						if m and m.CurrentInput and m.CurrentInput ~= A then
							return
						end
						m.CurrentInput = A
						B = true
						L = O
						G = N
						H = O.Position
						J = v.Position
						if z and typeof(z) == 'function' then
							z(true, G)
						end
					end
				end)
			end
			TrackConnection(e.InputChanged, function(M)
				if not B then
					return
				end
				if m.CurrentInput and m.CurrentInput ~= A then
					return
				end
				if L.UserInputType == Enum.UserInputType.MouseButton1 then
					if M.UserInputType == Enum.UserInputType.MouseMovement then
						update(M)
					end
				elseif L.UserInputType == Enum.UserInputType.Touch then
					if M == L then
						update(M)
					end
				end
			end)
			TrackConnection(e.InputEnded, function(M)
				if not B or m.CurrentInput ~= A then
					return
				end
				if M == L or (L.UserInputType == Enum.UserInputType.MouseButton1 and M.UserInputType == Enum.UserInputType.MouseButton1) then
					StopDragging()
				end
			end)
			function F.Set(M, N)
				F.CanDraggable = N ~= false
				if not F.CanDraggable then
					StopDragging()
				end
			end
			function F.Destroy(M)
				StopDragging()
				for N = # C, 1, - 1 do
					p.DisconnectSignal(C[N])
					C[N] = nil
				end
				table.clear(C)
			end
			return F
		end
		j.Init(r, 'Icon')
		function p.SanitizeFilename(v)
			local x = v:match'([^/]+)$' or v
			x = x:gsub('%.[^%.]+$', '')
			x = x:gsub('[^%w%-_]', '_')
			if # x > 50 then
				x = x:sub(1, 50)
			end
			return x
		end
		p.SupportsDirectImageLabel = true
		function p.Image(v, x, z, A, B, C, F, G, H)
			local J = if typeof(A) == 'table' then A.Folder else A
			J = tostring(J or 'Temp')
			x = p.SanitizeFilename(tostring(x or 'Image'))
			B = tostring(B or 'Image')
			H = H == true
			if H and typeof(v) == 'table' then
				v = v.Image or v.Asset or v.AssetId or v.Id or v.Url or v.URL
			end
			local L = type(v) == 'string' and v:match'^https?://' ~= nil and v:find('roblox.com', 1, true) == nil
			local M = if H or L or typeof(v) == 'Instance' then nil else p.Icon(v)
			local N = (M or F) and C and (G or 'Icon') or nil
			local O = r('ImageLabel', {
				Name = 'ImageLabel',
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ScaleType = Enum.ScaleType.Crop,
				ThemeTag = N and {
					ImageColor3 = N
				} or nil
			}, {
				r('UICorner', {
					CornerRadius = UDim.new(0, tonumber(z) or 0)
				})
			})
			local P = if H then O else r('Frame', {
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1
			}, {
				O
			})
			if typeof(v) == 'Instance' then
				if H then
					local Q = if v:IsA'ImageLabel' or v:IsA'ImageButton' then v else v:FindFirstChildWhichIsA('ImageLabel', true) or v:FindFirstChildWhichIsA('ImageButton', true)
					if Q then
						O.Image = Q.Image
						O.ImageRectOffset = Q.ImageRectOffset
						O.ImageRectSize = Q.ImageRectSize
						O.ImageColor3 = Q.ImageColor3
						O.ImageTransparency = Q.ImageTransparency
					else
						P.Visible = false
					end
				else
					O:Destroy()
					local Q = v:Clone()
					Q.Name = 'ImageLabel'
					if Q:IsA'GuiObject' then
						Q.Size = UDim2.fromScale(1, 1)
						Q.Position = UDim2.fromScale(0.5, 0.5)
						Q.AnchorPoint = Vector2.new(0.5, 0.5)
					end
					Q.Parent = P
				end
			elseif M then
				O:Destroy()
				local Q = j.Image{
					Icon = v,
					Size = UDim2.fromScale(1, 1),
					Colors = {
						N or false,
						'Button'
					}
				}.IconFrame
				Q.Name = 'ImageLabel'
				Q.Parent = P
			elseif L then
				local Q = 'WindUI/' .. J .. '/assets/.' .. B .. '-' .. x .. '.png'
				local R, S = pcall(function()
					task.spawn(function()
						local R = p.Request and p.Request{
							Url = v,
							Method = 'GET'
						} or nil
						local S = typeof(R) == 'table' and R.Body or R
						if S and writefile then
							writefile(Q, S)
						end
						local T, U = pcall(getcustomasset, Q)
						if T then
							O.Image = U
						elseif not T then
							warn(string.format("[ WindUI.Creator ] Failed to load '%s': %s", Q, tostring(U)))
						end
					end)
				end)
				if not R then
					warn(string.format('[ WindUI.Creator ] URL image is unavailable: %s', tostring(S)))
					P.Visible = false
				end
			elseif v == nil or v == '' then
				P.Visible = false
			elseif type(v) == 'number' then
				O.Image = 'rbxassetid://' .. tostring(v)
			elseif type(v) == 'string' then
				O.Image = v
			else
				warn(string.format('[ WindUI.Creator ] Unsupported image value: %s', typeof(v)))
				P.Visible = false
			end
			return P
		end
		function p.Color3ToHSB(v)
			local x, z, A = v.R, v.G, v.B
			local B, C = math.max(x, z, A), math.min(x, z, A)
			local F, G = B - C, 0
			if F ~= 0 then
				if B == x then
					G = (z - A) / F % 6
				elseif B == z then
					G = (A - x) / F + 2
				else
					G = (x - z) / F + 4
				end
				G = G * 60
			else
				G = 0
			end
			local H, J = (B == 0) and 0 or (F / B), B
			return {
				h = math.floor(G + 0.5),
				s = H,
				b = J
			}
		end
		function p.GetPerceivedBrightness(v)
			local x, z, A = v.R, v.G, v.B
			return 0.299 * x + 0.587 * z + 0.114 * A
		end
		function p.GetTextColorForHSB(v, x)
			local z = p.Color3ToHSB(v)
			local A, B, C = z.h, z.s, z.b
			if p.GetPerceivedBrightness(v) > (x or 0.5) then
				return Color3.fromHSV(A / 360, 0, 0.05)
			else
				return Color3.fromHSV(A / 360, 0, 0.98)
			end
		end
		function p.GetAverageColor(v)
			local x, z, A, B = 0, 0, 0, v.Color.Keypoints
			for C, F in ipairs(B) do
				x = x + F.Value.R
				z = z + F.Value.G
				A = A + F.Value.B
			end
			local C = # B
			return Color3.new(x / C, z / C, A / C)
		end
		function p.GenerateUniqueID(v)
			return h:GenerateGUID(false)
		end
		function p.OnThemeChange(v, x)
			if typeof(x) ~= 'function' then
				return
			end
			local z = h:GenerateGUID(false)
			p.ThemeChangeCallbacks[z] = x
			return {
				Disconnect = function()
					p.ThemeChangeCallbacks[z] = nil
				end
			}
		end
		function p.AddColor(v, x, z, A)
			A = math.clamp(A or 1, 0, 1)
			if typeof(z) == 'string' then
				z = Color3.fromHex(z)
			end
			return function(B)
				local C
				if typeof(x) == 'string' and string.sub(x, 1, 1) ~= '#' then
					C = p.GetThemeProperty(x, B)
				elseif typeof(x) == 'string' then
					C = Color3.fromHex(x)
				else
					C = x
				end
				if not C or typeof(C) ~= 'Color3' then
					return nil
				end
				return Color3.new(math.clamp(C.R + z.R * A, 0, 1), math.clamp(C.G + z.G * A, 0, 1), math.clamp(C.B + z.B * A, 0, 1))
			end
		end
		function p.GetElementPosition(v, x, z, A, B)
			B = if typeof(B) == 'table' then B else {}
			if type(z) ~= 'number' or z ~= math.floor(z) then
				return 'Squircle', p.DefaultCornerMap(), {
					Position = 'Single',
					Count = 1
				}
			end
			local C = x and x[z]
			if C == nil then
				return 'Squircle', p.DefaultCornerMap(), {
					Position = 'Single',
					Count = 1
				}
			end
			local F = if B.IncludeDefaultBreaks == false then {} else {
				Divider = true,
				Space = true,
				Section = true
			}
			if typeof(B.BreakTypes) == 'table' then
				for G, H in B.BreakTypes do
					if type(G) == 'number' then
						F[tostring(H)] = true
					else
						F[tostring(G)] = H == true
					end
				end
			end
			local function GetFrame(G)
				return G and (G.ElementFrame or (G.UIElements and G.UIElements.Main))
			end
			local function IsHidden(G)
				if B.IgnoreHidden == false then
					return false
				end
				local H = GetFrame(G)
				return typeof(H) == 'Instance' and H:IsA'GuiObject' and H.Visible == false
			end
			local function IsDelimiter(G)
				return G == nil or G.CornerBreak == true or G.LinkCornerBreak == true or F[tostring(G.__type)] == true
			end
			local function GetGroup(G)
				if typeof(B.GroupBy) == 'function' then
					local H, J = pcall(B.GroupBy, G)
					if H then
						return J
					end
				elseif type(B.GroupBy) == 'string' then
					return G[B.GroupBy]
				end
				return G.CornerGroup or G.LinkCornerGroup or G.LinkedCornerGroup
			end
			if IsDelimiter(C) or IsHidden(C) then
				return 'Squircle', p.DefaultCornerMap(), {
					Position = 'Single',
					Count = 1
				}
			end
			local G = {}
			for H, J in x or {} do
				if type(H) == 'number' and J ~= nil then
					table.insert(G, H)
				end
			end
			table.sort(G)
			local H, J, L, M = {}, {}
			local function Flush()
				if # J > 0 then
					table.insert(H, J)
					J = {}
				end
				L = nil
				M = nil
			end
			for N, O in G do
				local P = x[O]
				if IsHidden(P) then
					if B.BridgeHidden ~= true then
						Flush()
					else
						M = O
					end
				elseif IsDelimiter(P) then
					Flush()
				else
					local Q, R, S, T, U = P.LinkCorners == false or P.LinkCorner == false, P.CornerBreakBefore == true or P.LinkCornerBreakBefore == true, M ~= nil and O - M > 1 and B.BridgeSparse ~= true, L ~= nil and GetGroup(L) ~= GetGroup(P), L and (L.CornerBreakAfter == true or L.LinkCornerBreakAfter == true)
					if # J > 0 and (Q or R or S or T or U) then
						Flush()
					end
					table.insert(J, O)
					L = P
					M = O
					if Q then
						Flush()
					end
				end
			end
			Flush()
			local N, O
			for P, Q in H do
				for R, S in Q do
					if S == z then
						N = Q
						O = R
						break
					end
				end
				if N then
					break
				end
			end
			if not N or not O then
				return 'Squircle', p.DefaultCornerMap(), {
					Position = 'Single',
					Count = 1
				}
			end
			local P = # N
			local Q, R, S, T, U = if B.Reverse == true then P - O + 1 else O, if B.InnerRadius ~= nil then p.ToUDimRadius(B.InnerRadius, UDim.new(0, 0)) else false, 'Squircle', p.DefaultCornerMap(), 'Single'
			if P > 1 and Q == 1 then
				U = 'First'
				if A then
					S = 'Squircle-TL-BL'
					T.TopRight = R
					T.BottomRight = R
				else
					S = 'Squircle-TL-TR'
					T.BottomLeft = R
					T.BottomRight = R
				end
			elseif P > 1 and Q == P then
				U = 'Last'
				if A then
					S = 'Squircle-TR-BR'
					T.TopLeft = R
					T.BottomLeft = R
				else
					S = 'Squircle-BL-BR'
					T.TopLeft = R
					T.TopRight = R
				end
			elseif P > 1 then
				U = 'Middle'
				S = 'Square'
				if A then
					T.TopLeft = R
					T.TopRight = R
					T.BottomLeft = R
					T.BottomRight = R
				else
					T.TopLeft = R
					T.TopRight = R
					T.BottomLeft = R
					T.BottomRight = R
				end
			end
			local V = {
				Position = U,
				Index = Q,
				Count = P,
				Horizontal = A == true,
				SourceIndex = z,
				Group = GetGroup(C)
			}
			if typeof(B.Resolver) == 'function' then
				local W, X, Y = pcall(B.Resolver, V, S, T, C)
				if W then
					S = X or S
					T = Y or T
				end
			end
			return S, T, V
		end
		return p
	end
	function a.e()
		local b, d = game:GetService'TweenService', {
			Preset = 'Subtle',
			Enabled = true,
			Reduced = false
		}
		d.Durations = {
			Fast = 0.08,
			Hover = 0.1,
			Press = 0.12,
			Select = 0.14,
			Focus = 0.14,
			DropdownOpen = 0.16,
			DropdownClose = 0.14,
			Notification = 0.24,
			NotificationClose = 0.2,
			WindowOpen = 0.26,
			WindowClose = 0.2,
			WindowMorph = 0.42,
			Resize = 0.22,
			Highlight = 0.28,
			Background = 0.22,
			Expand = 0.2,
			Switch = 0.16,
			Reveal = 0.18
		}
		d.PresetDurations = {
			Liquid = {
				Fast = 0.1,
				Hover = 0.14,
				Press = 0.1,
				Select = 0.2,
				Focus = 0.18,
				DropdownOpen = 0.2,
				DropdownClose = 0.16,
				WindowOpen = 0.32,
				WindowClose = 0.22,
				WindowMorph = 0.46,
				Resize = 0.28,
				Highlight = 0.34,
				Background = 0.28,
				Expand = 0.24,
				Switch = 0.22,
				Reveal = 0.22
			},
			Snappy = {
				Fast = 0.06,
				Hover = 0.08,
				Press = 0.08,
				Select = 0.11,
				Focus = 0.1,
				DropdownOpen = 0.12,
				DropdownClose = 0.1,
				WindowOpen = 0.2,
				WindowClose = 0.16,
				WindowMorph = 0.3,
				Resize = 0.16,
				Highlight = 0.22,
				Background = 0.16,
				Expand = 0.16,
				Switch = 0.12,
				Reveal = 0.14
			}
		}
		d.PresetEasing = {
			Liquid = {
				Style = Enum.EasingStyle.Quint,
				Direction = Enum.EasingDirection.Out
			},
			Snappy = {
				Style = Enum.EasingStyle.Quart,
				Direction = Enum.EasingDirection.Out
			}
		}
		d.PresetPressAmount = {
			Liquid = 0.965,
			Snappy = 0.975
		}
		local e, f = setmetatable({}, {
			__mode = 'k'
		}), {}
		function f.Play(g)
		end
		function f.Cancel(g)
		end
		local g = {
			Position = true,
			Size = true,
			CanvasPosition = true,
			Rotation = true,
			Scale = true
		}
		local function IsPointerInput(h)
			return h.UserInputType == Enum.UserInputType.MouseButton1 or h.UserInputType == Enum.UserInputType.Touch
		end
		local function ApplyProperties(h, i)
			for j, l in next, i or {} do
				h[j] = l
			end
		end
		local function SplitReducedProperties(h)
			local i, j, l, m = {}, {}, false, false
			for p, r in next, h or {} do
				if g[p] then
					i[p] = r
					l = true
				else
					j[p] = r
					m = true
				end
			end
			return l and i or nil, m and j or nil
		end
		function d.GetDuration(h)
			if typeof(h) == 'string' then
				local i = d.PresetDurations[d.Preset]
				return (i and i[h]) or d.Durations[h] or d.Durations.Fast
			end
			return math.max(tonumber(h) or d.Durations.Fast, 0)
		end
		function d.IsEnabled(h)
			return d.Enabled and d.Preset ~= 'None'
		end
		function d.Configure(h, i)
			if i == false then
				d.Enabled = false
				d.Preset = 'None'
				return d:GetConfig()
			end
			if typeof(i) == 'string' then
				return d:SetPreset(i)
			end
			if typeof(i) == 'table' then
				if i.Preset ~= nil then
					d:SetPreset(i.Preset)
				elseif i.Enabled ~= false and d.Preset == 'None' then
					d:SetPreset'Subtle'
				end
				d.Enabled = i.Enabled ~= false and d.Preset ~= 'None'
				d.Reduced = i.Reduced == true
			else
				d.Enabled = true
				if d.Preset == 'None' then
					d.Preset = 'Subtle'
				end
				d.Reduced = false
			end
			return d:GetConfig()
		end
		function d.SetPreset(h, i)
			i = tostring(i or 'Subtle')
			if i ~= 'Subtle' and i ~= 'Liquid' and i ~= 'Snappy' and i ~= 'None' then
				i = 'Subtle'
			end
			d.Preset = i
			d.Enabled = i ~= 'None'
			return d:GetConfig()
		end
		function d.SetReducedMotion(h, i)
			d.Reduced = i == true
			return d:GetConfig()
		end
		function d.GetConfig(h)
			return {
				Preset = d.Preset,
				Enabled = d.Enabled,
				Reduced = d.Reduced
			}
		end
		function d.ShouldAnimate(h)
			if h and (h.Animation == false or h.Motion == false) then
				return false
			end
			return d:IsEnabled()
		end
		function d.Cancel(h, i)
			if not h then
				return
			end
			local j = e[h]
			if not j then
				return
			end
			i = i or 'Default'
			local l = j[i]
			if l then
				l:Cancel()
				j[i] = nil
			end
		end
		function d.Tween(h, i, j, l, m, p)
			if not h or typeof(h) ~= 'Instance' then
				return f
			end
			local r = d.GetDuration(i)
			p = p or 'Default'
			local u, v = j
			if d.Reduced then
				v, u = SplitReducedProperties(j)
				r = math.min(r, d.Durations.Focus)
			end
			local x, z = {}
			function x.Play(A)
				d.Cancel(h, p)
				if v then
					ApplyProperties(h, v)
				end
				if not d:IsEnabled() or r <= 0 or not u then
					ApplyProperties(h, u or j)
					return
				end
				local B = d.PresetEasing[d.Preset]
				z = b:Create(h, TweenInfo.new(r, l or (B and B.Style) or Enum.EasingStyle.Quint, m or (B and B.Direction) or Enum.EasingDirection.Out), u)
				e[h] = e[h] or {}
				e[h][p] = z
				z.Completed:Connect(function()
					local C = e[h]
					if C and C[p] == z then
						C[p] = nil
					end
				end)
				z:Play()
			end
			function x.Cancel(A)
				if z then
					z:Cancel()
				end
				d.Cancel(h, p)
			end
			return x
		end
		function d.Play(h, i, j, l, m, p)
			local r = d.Tween(h, i, j, l, m, p)
			r:Play()
			return r
		end
		function d.GetScale(h)
			if not h then
				return nil
			end
			if h:IsA'UIScale' then
				return h
			end
			local i = h:FindFirstChildOfClass'UIScale'
			if not i then
				i = Instance.new'UIScale'
				i.Scale = 1
				i.Parent = h
			end
			return i
		end
		function d.Press(h, i, j)
			local l = d.GetScale(h)
			if not l then
				return
			end
			if not d:IsEnabled() or d.Reduced then
				if not i then
					l.Scale = 1
				end
				return
			end
			d.Play(l, 'Press', {
				Scale = i and (j or d.PresetPressAmount[d.Preset] or 0.97) or 1
			}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Press')
		end
		function d.AttachPress(h, i, j)
			if not h or not i then
				return nil
			end
			j = j or {}
			local l, m, p = j.Amount or 0.97, j.Enabled, d.GetScale(h)
			local function CanPress()
				if typeof(m) == 'function' then
					return m()
				end
				return m ~= false
			end
			i.AddSignal(h.InputBegan, function(r)
				if CanPress() and IsPointerInput(r) then
					d.Press(p, true, l)
				end
			end)
			i.AddSignal(h.InputEnded, function(r)
				if IsPointerInput(r) then
					d.Press(p, false, l)
				end
			end)
			if h.MouseLeave then
				i.AddSignal(h.MouseLeave, function()
					d.Press(p, false, l)
				end)
			end
			return p
		end
		return d
	end
	function a.f()
		local b = {}
		function b.New(d, e, f)
			local g = {
				Enabled = e.Enabled or false,
				Translations = e.Translations or {},
				Prefix = e.Prefix or 'loc:',
				DefaultLanguage = e.DefaultLanguage or 'en'
			}
			f.Localization = g
			return g
		end
		return b
	end
	function a.g()
		local b, d = a.load'd', a.load'e'
		local e, f, g, h, i, j, l, m, p, r, u, v, x, z, A, B, C, F, G, H, J, L, M, N, O, P, Q, R, S, T, U, V = b.New, b.Tween, 14, 58, 72, 420, 240, 18, 10, 8, 30, 40, 44, 24, 30, 36, 2, 38, 48, 2, 4, 18, 14, 4, 356, 300, 404, {
			Info = {
				Icon = 'info',
				Color = Color3.fromHex'#60A5FA'
			},
			Notice = {
				Icon = 'bell',
				Color = Color3.fromHex'#38BDF8'
			},
			Success = {
				Icon = 'circle-check',
				Color = Color3.fromHex'#34D399'
			},
			Warning = {
				Icon = 'triangle-alert',
				Color = Color3.fromHex'#FBBF24'
			},
			Error = {
				Icon = 'circle-x',
				Color = Color3.fromHex'#FB7185'
			},
			Neutral = {
				Icon = 'message-circle',
				Color = Color3.fromHex'#A1A1AA'
			}
		}, {
			default = 'Info',
			info = 'Info',
			notice = 'Notice',
			message = 'Notice',
			success = 'Success',
			successful = 'Success',
			ok = 'Success',
			green = 'Success',
			warn = 'Warning',
			warning = 'Warning',
			caution = 'Warning',
			error = 'Error',
			fail = 'Error',
			failed = 'Error',
			danger = 'Error',
			neutral = 'Neutral'
		}, {
			default = 'Compact',
			compact = 'Compact',
			minimal = 'Compact',
			pill = 'Compact',
			capsule = 'Compact',
			card = 'Card',
			avatar = 'Card',
			glass = 'Glass',
			liquid = 'Glass',
			liquidglass = 'Glass',
			frosted = 'Glass',
			legacy = 'Glass'
		}, {
			default = 'Normal',
			normal = 'Normal',
			modern = 'Normal',
			toast = 'Normal',
			window = 'Window',
			windows = 'Window',
			desktop = 'Window',
			windownotification = 'Window',
			windownotify = 'Window',
			original = 'Originally',
			originally = 'Originally',
			legacy = 'Originally',
			classic = 'Originally'
		}, {
			Holder = nil,
			NotificationIndex = 0,
			Notifications = {}
		}
		local function ResolveColor(W, X)
			if typeof(W) == 'Color3' then
				return W
			end
			if typeof(W) == 'string' and string.sub(W, 1, 1) == '#' then
				local Y, aa = pcall(Color3.fromHex, W)
				if Y then
					return aa
				end
			end
			return X
		end
		local function NormalizeStyleName(aa)
			local W = tostring(aa or 'Info'):lower():gsub('%s+', '')
			return S[W] or 'Info'
		end
		local function NormalizeNotificationType(aa)
			if aa == nil then
				return nil
			end
			local W = tostring(aa):lower():gsub('%s+', '')
			return U[W]
		end
		local function NormalizeAppearance(aa, W)
			if aa == nil and (W.Avatar ~= nil or W.Timestamp ~= nil or W.Time ~= nil) then
				return 'Card'
			end
			local X = tostring(aa or 'Compact'):lower():gsub('%s+', '')
			return T[X] or 'Compact'
		end
		local function ResolveDuration(aa)
			if aa == false then
				return false
			end
			local W = tonumber(aa)
			if W == nil then
				return 5
			end
			return math.max(W, 0)
		end
		local function NormalizeIcon(aa)
			if typeof(aa) == 'number' then
				return 'rbxassetid://' .. tostring(aa)
			end
			if typeof(aa) == 'string' then
				return aa
			end
			if typeof(aa) == 'table' or typeof(aa) == 'Instance' then
				return aa
			end
			return nil
		end
		local function PaintIcon(aa, W, X)
			if typeof(aa) ~= 'Instance' then
				return
			end
			local Y = {}
			if aa:IsA'ImageLabel' or aa:IsA'ImageButton' then
				table.insert(Y, aa)
			end
			for ab, ac in aa:GetDescendants() do
				if ac:IsA'ImageLabel' or ac:IsA'ImageButton' then
					table.insert(Y, ac)
				end
			end
			for ab, ac in Y do
				ac.ImageColor3 = W
				if X ~= nil then
					ac.ImageTransparency = X
				end
			end
		end
		local function CreateCorner(aa, ab)
			local ac = e('UICorner', {
				CornerRadius = UDim.new(0, aa)
			})
			return b.ApplyCornerRadii(ac, aa, ab)
		end
		local function ResolveCornerValue(aa, ab, ac)
			local W = aa[ab]
			if W == nil then
				W = aa[ab .. 'Radius']
			end
			if W == nil then
				return ac
			end
			return W
		end
		local function GetActions(aa)
			local ab = {}
			if typeof(aa) ~= 'table' then
				return ab
			end
			for ac = 1, math.min(# aa, C) do
				local W = aa[ac]
				if typeof(W) == 'table' then
					table.insert(ab, W)
				end
			end
			return ab
		end
		local function TrimNotifications(aa, ab)
			local ac = {}
			for W, X in V.Notifications do
				if not X.Closed then
					table.insert(ac, X)
				end
			end
			table.sort(ac, function(W, X)
				return W.Index < X.Index
			end)
			local W = math.max(# ac - 1, 0) * r
			for X, Y in ac do
				W = W + (Y.LayoutHeight or 64)
			end
			while # ac > 1 and (# ac > aa or W > ab) do
				local X = table.remove(ac, 1)
				W = W - (X.LayoutHeight or 64) - r
				X:Close'Overflow'
			end
		end
		function V.Init(aa)
			local ab = {
				Lower = false
			}
			ab.Frame = e('Frame', {
				Name = 'NotificationHolder',
				Position = UDim2.new(1, - g, 0, h),
				AnchorPoint = Vector2.new(1, 0),
				Size = UDim2.new(1, - (g * 2), 1, - (h + i)),
				Parent = aa,
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				ZIndex = 100
			}, {
				e('UISizeConstraint', {
					MinSize = Vector2.new(l, 0),
					MaxSize = Vector2.new(j, 10000)
				}),
				e('UIListLayout', {
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, r)
				})
			})
			function ab.SetLower(ac)
				ab.Lower = ac == true
				local W = if ab.Lower then 12 else i
				ab.Frame.Size = UDim2.new(1, - (g * 2), 1, - (h + W))
			end
			V.Holder = ab.Frame
			return ab
		end
		function V.New(aa)
			aa = if typeof(aa) == 'table' then aa else {}
			local ab = NormalizeNotificationType(aa.Type)
			local ac = NormalizeNotificationType(aa.NotificationType) or ab
			local W, X = ac or 'Normal', if ab == nil then aa.Type else nil
			local Y, ad = NormalizeStyleName(aa.Style or aa.Variant or X), if W == 'Window' then 'Window' elseif W == 'Originally' then 'Originally' else NormalizeAppearance(aa.Appearance or aa.Layout, aa)
			local ae = R[Y] or R.Info
			local af, ag, ah = ResolveColor(aa.AccentColor or aa.Color, ae.Color), if W == 'Window' then (if aa.Avatar ~= nil then aa.Avatar else aa.BodyIcon) else (if aa.Avatar ~= nil then aa.Avatar else aa.Icon)
			if ag == false or ag == '' then
				ah = nil
			elseif ag ~= nil then
				ah = NormalizeIcon(ag)
			elseif W ~= 'Window' then
				ah = ae.Icon
			end
			local ai, aj = aa.LiquidGlass == true or aa.Glass == true or ad == 'Glass' or (W == 'Window' and aa.LiquidGlass ~= false and aa.Glass ~= false), aa.Decorated == true or aa.Accented == true or ad == 'Glass'
			local ak = {
				Type = W,
				Title = tostring(aa.Title or 'Notification'),
				Content = aa.Content ~= nil and tostring(aa.Content) or nil,
				Icon = ah,
				IsAvatar = aa.Avatar ~= nil,
				IconThemed = aa.IconThemed,
				IconColor = ResolveColor(aa.IconColor, if aj or aa.AccentColor ~= nil or aa.Color ~= nil then af else Color3.fromHex'#A1A1AA'),
				Style = Y,
				Appearance = ad,
				LiquidGlass = ai,
				Decorated = aj,
				DarkOverlay = aa.DarkOverlay == true or aa.Overlay == true or W == 'Originally',
				Timestamp = aa.Timestamp ~= nil and tostring(aa.Timestamp) or (aa.Time ~= nil and tostring(aa.Time) or nil),
				AppName = tostring(aa.AppName or aa.Application or aa.App or 'WindUI'),
				AppIcon = NormalizeIcon(aa.AppIcon or aa.ApplicationIcon or (W == 'Window' and aa.Icon) or 'bell'),
				Selection = aa.Selection or aa.Dropdown or aa.Select,
				AccentColor = af,
				ProgressColor = ResolveColor(aa.ProgressColor, af),
				Background = aa.Background,
				BackgroundImageTransparency = b.ClampTransparency(aa.BackgroundImageTransparency, 0.35),
				Duration = ResolveDuration(aa.Duration),
				Buttons = GetActions(aa.Buttons),
				CanClose = aa.CanClose ~= false,
				PauseOnHover = aa.PauseOnHover ~= false,
				OnOpen = aa.OnOpen,
				OnClose = aa.OnClose,
				UIElements = {},
				Closed = false,
				Paused = false
			}
			V.NotificationIndex = V.NotificationIndex + 1
			ak.Index = V.NotificationIndex
			V.Notifications[ak.Index] = ak
			local al = aa.Holder or V.Holder
			assert(al, 'Notification holder is not initialized')
			local am, an = ak.Type == 'Window', ak.Type == 'Originally'
			local ao, ap = ak.Appearance == 'Card' or am, math.max(tonumber(aa.Width) or (am and Q or (an and P or O)), l)
			local aq, ar, as = if am or an then 14 elseif ao then 12 else p, math.max(tonumber(aa.Radius) or (am and 20 or (an and 18 or (ao and 20 or m))), 8), if typeof(aa.Corners or aa.CornerRadii) == 'table' then aa.Corners or aa.CornerRadii else aa
			local at, au, av, aw = {
				TopLeft = ResolveCornerValue(as, 'TopLeft', ar),
				TopRight = ResolveCornerValue(as, 'TopRight', ar),
				BottomRight = ResolveCornerValue(as, 'BottomRight', ar),
				BottomLeft = ResolveCornerValue(as, 'BottomLeft', ar)
			}, if ao then v elseif an then 38 else u, if ak.Timestamp and not am then 72 else 0, typeof(ak.Duration) == 'number' and ak.Duration > 0
			local ax, ay, az, aA, aB = ak.Icon and (au + 9) or 0, (ak.CanClose and not am and A or 0) + av, aa.Shadow ~= false, aa.FallbackShadow == true, ak.DarkOverlay
			local aC = {
				BackgroundColor3 = if aB then (if ak.LiquidGlass then 'NotificationGlass' else 'Notification') else 'NotificationGlassSurface'
			}
			if aa.Transparency == nil and aB then
				aC.BackgroundTransparency = if ak.LiquidGlass then 'NotificationGlassTransparency' else 'NotificationTransparency'
			end
			local aD, aE, aF, aG, aH, aI, aJ, aK = 0, if aw then ak.Duration else 0, false, false, 64, {}
			local function Connect(aL, aM)
				local aN = aL:Connect(aM)
				table.insert(aI, aN)
				return aN
			end
			local function AttachPress(aL, aM)
				Connect(aL.InputBegan, function(aN)
					if aN.UserInputType == Enum.UserInputType.MouseButton1 or aN.UserInputType == Enum.UserInputType.Touch then
						d.Press(aL, true, aM)
					end
				end)
				Connect(aL.InputEnded, function(aN)
					if aN.UserInputType == Enum.UserInputType.MouseButton1 or aN.UserInputType == Enum.UserInputType.Touch then
						d.Press(aL, false, aM)
					end
				end)
				Connect(aL.MouseLeave, function()
					d.Press(aL, false, aM)
				end)
			end
			local function AttachHover(aL, aM, aN, aO)
				Connect(aL.MouseEnter, function()
					d.Play(aM, 'Hover', {
						BackgroundTransparency = aN
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
				end)
				Connect(aL.MouseLeave, function()
					d.Play(aM, 'Hover', {
						BackgroundTransparency = aO
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
				end)
			end
			local function DisconnectSignals()
				for aL, aM in aI do
					aM:Disconnect()
				end
				table.clear(aI)
			end
			local aL, aM = e('Frame', {
				Name = 'NotificationContainer',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				ClipsDescendants = false,
				LayoutOrder = - ak.Index,
				ZIndex = 100,
				Parent = al
			}, {
				e('UISizeConstraint', {
					MinSize = Vector2.new(math.min(ap, l), 0),
					MaxSize = Vector2.new(ap, 10000)
				})
			}), e('UIScale', {
				Name = 'TransitionScale',
				Scale = 0.965
			})
			local aN = e('CanvasGroup', {
				Name = 'NotificationTransition',
				Active = true,
				BackgroundTransparency = 1,
				GroupTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, aH),
				Position = UDim2.new(0, L, 0, 0),
				ClipsDescendants = false,
				ZIndex = 101,
				Parent = aL
			}, {
				aM
			})
			local aO, aP = e('Frame', {
				Name = 'Shadow',
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.78,
				BorderSizePixel = 0,
				Size = UDim2.new(1, - 4, 1, - 4),
				Position = UDim2.new(0, 2, 0, N),
				Visible = az,
				ZIndex = 101,
				Parent = aN
			}, {
				CreateCorner(ar, at)
			}), e('UIStroke', {
				Color = Color3.new(1, 1, 1),
				Transparency = 0.76,
				Thickness = 1,
				ThemeTag = {
					Color = 'NotificationBorder',
					Transparency = 'NotificationBorderTransparency'
				}
			})
			local aQ = e('Frame', {
				Name = 'Notification',
				BackgroundColor3 = if aB then Color3.fromRGB(24, 25, 29) else Color3.new(1, 1, 1),
				BackgroundTransparency = b.ClampTransparency(aa.Transparency, if aB then (if ak.LiquidGlass then 0.28 else 0.08) else (if ak.LiquidGlass then 0.64 else 0.72)),
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				ClipsDescendants = true,
				ZIndex = 102,
				ThemeTag = aC,
				Parent = aN
			}, {
				CreateCorner(ar, at),
				aP
			})
			aQ:SetAttribute('Appearance', ak.Appearance)
			aQ:SetAttribute('Type', ak.Type)
			aQ:SetAttribute('LiquidGlass', ak.LiquidGlass)
			aQ:SetAttribute('DarkOverlay', aB)
			aQ:SetAttribute('LayoutVersion', 4)
			local aR
			if az then
				aR = b.CreateUIShadow(aQ, {
					Name = 'NativeShadow',
					BlurRadius = b.ToUDimRadius(aa.ShadowBlur, UDim.new(0, 16)),
					Color = ResolveColor(aa.ShadowColor, Color3.new(0, 0, 0)),
					Offset = if typeof(aa.ShadowOffset) == 'UDim2' then aa.ShadowOffset else UDim2.fromOffset(0, 5),
					Spread = if typeof(aa.ShadowSpread) == 'UDim2' then aa.ShadowSpread else UDim2.fromOffset(2, 2),
					Transparency = b.ClampTransparency(aa.ShadowTransparency, 0.68),
					ZIndex = 0
				})
			end
			aO.Visible = az and aR == nil and aA
			local aS, aT = e('Frame', {
				Name = 'CapsuleSurface',
				BackgroundColor3 = Color3.new(1, 1, 1),
				BorderSizePixel = 0,
				BackgroundTransparency = if aB then (if ak.LiquidGlass then 0.91 else 0.985) else (if ak.LiquidGlass then 0.94 else 1),
				Size = UDim2.fromScale(1, 1),
				ZIndex = 103,
				ThemeTag = {
					BackgroundColor3 = if ak.LiquidGlass then 'NotificationGlassSurface' else 'Notification2',
					BackgroundTransparency = if aB then (if ak.LiquidGlass then 'NotificationGlassSurfaceTransparency' else 'Notification2Transparency') else nil
				},
				Parent = aQ
			}, {
				CreateCorner(ar, at)
			}), b.NewRoundFrame(ar, 'SquircleGlass', {
				Name = 'LiquidGlass',
				ImageColor3 = Color3.new(1, 1, 1),
				ImageTransparency = b.ClampTransparency(aa.GlassTransparency, 0.78),
				Size = UDim2.fromScale(1, 1),
				Visible = ak.LiquidGlass,
				ZIndex = 104,
				ThemeTag = if aa.GlassTransparency == nil then {
					ImageColor3 = 'NotificationGlassHighlight',
					ImageTransparency = 'NotificationGlassTextureTransparency'
				} else {
					ImageColor3 = 'NotificationGlassHighlight'
				},
				Parent = aQ
			})
			if typeof(ak.Background) == 'string' and ak.Background ~= '' then
				e('ImageLabel', {
					Name = 'Background',
					Image = ak.Background,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ScaleType = Enum.ScaleType.Crop,
					ImageTransparency = ak.BackgroundImageTransparency,
					ZIndex = 104,
					Parent = aQ
				}, {
					CreateCorner(ar, at)
				})
			end
			local aU, aV, aW, aX = e('Frame', {
				Name = 'ToneWash',
				BackgroundColor3 = ak.AccentColor,
				BackgroundTransparency = 0.94,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				Visible = ak.Decorated,
				ZIndex = 105,
				Parent = aQ
			}, {
				CreateCorner(ar, at),
				e('UIGradient', {
					Rotation = 18,
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.42),
						NumberSequenceKeypoint.new(0.38, 0.86),
						NumberSequenceKeypoint.new(1, 1)
					}
				})
			}), e('Frame', {
				Name = 'AccentLine',
				BackgroundColor3 = ak.AccentColor,
				BackgroundTransparency = 0.08,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 3, 0.48, 0),
				Position = UDim2.new(0, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				Visible = ak.Decorated,
				ZIndex = 106,
				Parent = aQ
			}, {
				CreateCorner(3, {
					TopLeft = at.TopLeft,
					TopRight = 3,
					BottomRight = 3,
					BottomLeft = at.BottomLeft
				}),
				e('UIGradient', {
					Rotation = 90,
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.32, 0.08),
						NumberSequenceKeypoint.new(0.68, 0.08),
						NumberSequenceKeypoint.new(1, 1)
					}
				})
			}), e('Frame', {
				Name = 'TopHighlight',
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 0.94,
				BorderSizePixel = 0,
				Size = UDim2.new(0.72, 0, 0, 1),
				Position = UDim2.new(0.14, 0, 0, 0),
				ZIndex = 106,
				Parent = aQ
			}, {
				e('UIGradient', {
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.5, 0.15),
						NumberSequenceKeypoint.new(1, 1)
					}
				})
			}), e('Frame', {
				Name = 'Body',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, - (aq * 2), 0, 0),
				Position = UDim2.fromOffset(aq, aq),
				ZIndex = 107,
				Parent = aQ
			})
			local aY, aZ, a_, a0, a1 = (e('UIListLayout', {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if am then 10 elseif an then 5 else 8),
				Parent = aX
			}))
			if am then
				aZ = e('Frame', {
					Name = 'AppHeader',
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 28),
					LayoutOrder = 0,
					ZIndex = 108,
					Parent = aX
				})
				if ak.AppIcon then
					a_ = b.Image(ak.AppIcon, ak.AppName .. ':AppIcon', 4, aa.Window and aa.Window.Folder, 'NotificationApp', true, aa.AppIconThemed, 'NotificationTitle')
					a_.Name = 'AppIcon'
					a_.Size = UDim2.fromOffset(22, 22)
					a_.Position = UDim2.new(0, 0, 0.5, 0)
					a_.AnchorPoint = Vector2.new(0, 0.5)
					a_.ZIndex = 109
					a_.Parent = aZ
				end
				local a2 = if a_ then 30 else 0
				a0 = e('TextLabel', {
					Name = 'AppName',
					Text = ak.AppName,
					TextSize = 13,
					FontFace = Font.new(b.Font, Enum.FontWeight.Medium),
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, - (a2 + 92), 1, 0),
					Position = UDim2.fromOffset(a2, 0),
					ZIndex = 109,
					ThemeTag = {
						TextColor3 = 'NotificationTitle'
					},
					Parent = aZ
				})
				a1 = e('TextLabel', {
					Name = 'AppTimestamp',
					Text = ak.Timestamp or os.date'%H:%M',
					TextSize = 11,
					FontFace = Font.new(b.Font, Enum.FontWeight.Medium),
					TextXAlignment = Enum.TextXAlignment.Right,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(48, 28),
					Position = UDim2.new(1, - (ak.CanClose and 46 or 0), 0, 0),
					AnchorPoint = Vector2.new(1, 0),
					TextTransparency = 0.3,
					ZIndex = 109,
					ThemeTag = {
						TextColor3 = 'NotificationContent'
					},
					Parent = aZ
				})
			end
			local a2, a3 = (e('Frame', {
				Name = 'Header',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, math.max(ak.Icon and au or 0, 20)),
				LayoutOrder = 1,
				ZIndex = 107,
				Parent = aX
			}))
			if ak.Timestamp and not am then
				a3 = e('TextLabel', {
					Name = 'Timestamp',
					Text = ak.Timestamp,
					TextSize = 11,
					FontFace = Font.new(b.Font, Enum.FontWeight.Medium),
					TextXAlignment = Enum.TextXAlignment.Right,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(av, 18),
					Position = UDim2.new(1, - (ak.CanClose and A or 0), 0, 1),
					AnchorPoint = Vector2.new(1, 0),
					TextTransparency = 0.22,
					ZIndex = 109,
					ThemeTag = {
						TextColor3 = 'NotificationContent'
					},
					Parent = aZ or a2
				})
			end
			local a4 = e('Frame', {
				Name = 'TextContainer',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, - (ax + ay), 0, 0),
				Position = UDim2.fromOffset(ax, 0),
				ZIndex = 108,
				Parent = a2
			})
			local a5, a6, a7, a8, a9 = e('UIListLayout', {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 2),
				Parent = a4
			}), e('TextLabel', {
				Name = 'Title',
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = ak.Title,
				TextWrapped = ao or an or aa.Wrap == true,
				TextTruncate = Enum.TextTruncate.AtEnd,
				RichText = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = if am then 19 elseif an then 18 elseif ao then 15 else 14,
				LineHeight = 1,
				FontFace = Font.new(b.Font, Enum.FontWeight.SemiBold),
				LayoutOrder = 1,
				ZIndex = 108,
				ThemeTag = {
					TextColor3 = 'NotificationTitle',
					TextTransparency = 'NotificationTitleTransparency'
				},
				Parent = a4
			}, {
				e('UISizeConstraint', {
					MinSize = Vector2.new(0, 18),
					MaxSize = Vector2.new(10000, F)
				})
			}), (e('TextLabel', {
				Name = 'Content',
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = ak.Content or '',
				TextWrapped = ao or an or aa.Wrap == true,
				TextTruncate = Enum.TextTruncate.AtEnd,
				RichText = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = if am then 14 elseif an then 15 else 12,
				LineHeight = 1.05,
				FontFace = Font.new(b.Font, Enum.FontWeight.Regular),
				LayoutOrder = 2,
				Visible = ak.Content ~= nil,
				ZIndex = 108,
				ThemeTag = {
					TextColor3 = 'NotificationContent',
					TextTransparency = 'NotificationContentTransparency'
				},
				Parent = a4
			}, {
				e('UISizeConstraint', {
					MinSize = Vector2.new(0, 16),
					MaxSize = Vector2.new(10000, G)
				})
			}))
			if ak.Icon then
				local ba = not ak.IsAvatar and (type(ak.Icon) ~= 'string' or (ak.Icon:match'^rbxassetid://' == nil and ak.Icon:match'^https?://' == nil))
				a9 = b.Image(ak.Icon, ak.Title .. ':' .. tostring(ak.Icon), ak.IsAvatar and au / 2 or 0, aa.Window and aa.Window.Folder, 'Notification', true, ak.IconThemed, nil, ak.IsAvatar)
				a9.Name = if ak.IsAvatar then 'Avatar' else 'Icon'
				a9.Size = if ak.IsAvatar then UDim2.fromScale(1, 1) else UDim2.fromOffset(if ao then 22 else 18, if ao then 22 else 18)
				a9.Position = UDim2.fromScale(0.5, 0.5)
				a9.AnchorPoint = Vector2.new(0.5, 0.5)
				a9.ZIndex = 110
				if ba and b.Icon(ak.Icon) and ak.IconThemed ~= true then
					PaintIcon(a9, ak.IconColor, 0)
				end
				a8 = e('Frame', {
					Name = 'IconBubble',
					BackgroundColor3 = if ak.IsAvatar then Color3.new(1, 1, 1) else ak.IconColor,
					BackgroundTransparency = if ak.IsAvatar then 0.9 elseif ak.Decorated then 0.88 else 0.95,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(au, au),
					ClipsDescendants = true,
					ZIndex = 109,
					Parent = a2
				}, {
					CreateCorner(au / 2),
					e('UIStroke', {
						Color = ak.IconColor,
						Transparency = if ak.Decorated then 0.72 else 0.88,
						Thickness = 1
					}),
					e('UIGradient', {
						Rotation = 35,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0, ak.AccentColor:Lerp(Color3.new(1, 1, 1), 0.16)),
							ColorSequenceKeypoint.new(1, ak.AccentColor)
						}
					}),
					a9
				})
			end
			local ba, bb
			if ak.CanClose then
				local bc = b.Icon'x'
				bb = e('Frame', {
					Name = 'Surface',
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 0.98,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(z, z),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ZIndex = 109,
					ThemeTag = {
						BackgroundColor3 = 'Notification2'
					}
				}, {
					CreateCorner(z / 2),
					e('ImageLabel', {
						Name = 'Icon',
						Image = bc and bc[1] or '',
						ImageRectSize = bc and bc[2] and bc[2].ImageRectSize or Vector2.zero,
						ImageRectOffset = bc and bc[2] and bc[2].ImageRectPosition or Vector2.zero,
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(14, 14),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ImageTransparency = 0.46,
						ZIndex = 110,
						ThemeTag = {
							ImageColor3 = 'NotificationTitle'
						}
					})
				})
				ba = e('TextButton', {
					Name = 'CloseButton',
					Text = '',
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(x, x),
					Position = UDim2.new(1, 4, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					ZIndex = 109,
					Parent = if am then aZ else a2
				}, {
					bb
				})
				AttachPress(ba, 0.96)
				AttachHover(ba, bb, 0.91, 0.98)
			end
			local bc, bd
			if am and ak.Selection ~= nil then
				local be = if typeof(ak.Selection) == 'table' then ak.Selection else {
					Value = ak.Selection
				}
				local bf, bg = if typeof(be.Values or be.Options) == 'table' then be.Values or be.Options else {}, math.max(tonumber(be.Index) or 1, 1)
				local function GetSelectionValue(bh)
					if typeof(bh) == 'table' then
						return bh.Value or bh.Title or bh.Name
					end
					return bh
				end
				local bh = be.Value or be.Default
				if bh ~= nil and # bf > 0 then
					for bi, bj in bf do
						local bk = GetSelectionValue(bj)
						if bk == bh or tostring(bk) == tostring(bh) then
							bg = bi
							break
						end
					end
				end
				if bh == nil and # bf > 0 then
					bh = GetSelectionValue(bf[bg] or bf[1])
				end
				bh = bh or 'Select'
				local bi = b.Icon'chevron-down'
				bc = e('TextButton', {
					Name = 'Selection',
					Text = '',
					AutoButtonColor = false,
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 0.9,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 40),
					LayoutOrder = 2,
					ZIndex = 108,
					ThemeTag = {
						BackgroundColor3 = 'Notification2'
					},
					Parent = aX
				}, {
					CreateCorner(10),
					e('UIStroke', {
						Color = Color3.new(1, 1, 1),
						Transparency = 0.8,
						Thickness = 1,
						ThemeTag = {
							Color = 'NotificationBorder',
							Transparency = 'NotificationBorderTransparency'
						}
					}),
					e('TextLabel', {
						Name = 'Value',
						Text = tostring(bh),
						TextSize = 14,
						FontFace = Font.new(b.Font, Enum.FontWeight.Medium),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, - 48, 1, 0),
						Position = UDim2.fromOffset(14, 0),
						ZIndex = 109,
						ThemeTag = {
							TextColor3 = 'NotificationTitle'
						}
					}),
					e('ImageLabel', {
						Name = 'Chevron',
						Image = bi and bi[1] or '',
						ImageRectSize = bi and bi[2] and bi[2].ImageRectSize or Vector2.zero,
						ImageRectOffset = bi and bi[2] and bi[2].ImageRectPosition or Vector2.zero,
						ImageTransparency = 0.35,
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(16, 16),
						Position = UDim2.new(1, - 14, 0.5, 0),
						AnchorPoint = Vector2.new(1, 0.5),
						ZIndex = 109,
						ThemeTag = {
							ImageColor3 = 'NotificationTitle'
						}
					})
				})
				bd = bc.Value
				AttachPress(bc, 0.985)
				AttachHover(bc, bc, 0.84, 0.9)
				Connect(bc.MouseButton1Click, function()
					if # bf > 0 then
						bg = (bg % # bf) + 1
						bh = GetSelectionValue(bf[bg])
						bd.Text = tostring(bh)
					end
					b.SafeCallback(be.Callback, bh, bg, ak)
				end)
			end
			local be, bf = if am then 40 else B
			if # ak.Buttons > 0 then
				bf = e('Frame', {
					Name = 'Actions',
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, be),
					LayoutOrder = if am then 3 else 2,
					ZIndex = 107,
					Parent = aX
				})
				e('UIListLayout', {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 6),
					Parent = bf
				})
				for bg, bh in ak.Buttons do
					local bi, bj = (bg == 1)
					if # ak.Buttons == 2 then
						bj = UDim2.new(0.5, - 3, 0, be)
					else
						bj = UDim2.new(1, 0, 0, be)
					end
					local bk, bl = if bi then 0.16 else 0.93, e('UIStroke', {
						Color = if bi then ak.AccentColor else Color3.new(1, 1, 1),
						Transparency = if bi then 0.55 else 0.78,
						Thickness = 1,
						ThemeTag = if bi then nil else {
							Color = 'NotificationBorder',
							Transparency = 'NotificationBorderTransparency'
						}
					})
					local bm = e('TextButton', {
						Name = 'Action' .. bg,
						Text = tostring(bh.Title or bh.Text or 'Action'),
						TextSize = 12,
						FontFace = Font.new(b.Font, Enum.FontWeight.SemiBold),
						AutoButtonColor = false,
						BackgroundColor3 = if bi then ak.AccentColor else Color3.new(1, 1, 1),
						BackgroundTransparency = bk,
						BorderSizePixel = 0,
						Size = bj,
						LayoutOrder = bg,
						ZIndex = 108,
						ThemeTag = if bi then {
							TextColor3 = 'White'
						} else {
							BackgroundColor3 = 'Notification2',
							TextColor3 = 'NotificationTitle'
						},
						Parent = bf
					}, {
						CreateCorner(9),
						bl
					})
					AttachPress(bm, 0.97)
					AttachHover(bm, bm, if bi then 0.06 else 0.87, bk)
					Connect(bm.MouseButton1Click, function()
						b.SafeCallback(bh.Callback, ak, bh)
						if bh.Close ~= false and bh.CloseOnClick ~= false then
							ak:Close'Action'
						end
					end)
				end
			end
			local bg, bh = aw and d:IsEnabled() and not d.Reduced, e('Frame', {
				Name = 'ProgressTrack',
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 0.94,
				BorderSizePixel = 0,
				Size = if an then UDim2.new(1, - (aq * 2), 0, H) else UDim2.new(0.32, 0, 0, H),
				Position = UDim2.new(0.5, 0, 1, if an then - 3 else - 5),
				AnchorPoint = Vector2.new(0.5, 1),
				Visible = aw,
				ZIndex = 111,
				ThemeTag = {
					BackgroundColor3 = 'NotificationDuration',
					BackgroundTransparency = 'NotificationDurationTransparency'
				},
				Parent = aQ
			}, {
				CreateCorner(H)
			})
			local bi = e('Frame', {
				Name = 'ProgressFill',
				BackgroundColor3 = ak.ProgressColor,
				BackgroundTransparency = b.ClampTransparency(aa.ProgressTransparency, 0.12),
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				ZIndex = 112,
				Parent = bh
			}, {
				CreateCorner(H),
				e('UIGradient', {
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, ak.ProgressColor),
						ColorSequenceKeypoint.new(1, ak.ProgressColor:Lerp(Color3.new(1, 1, 1), 0.22))
					}
				})
			})
			local function UpdateContainerHeight(bj)
				local bk = math.max(math.ceil(aY.AbsoluteContentSize.Y), a2.Size.Y.Offset)
				aH = aq + bk + aq
				ak.LayoutHeight = aH
				aN.Size = UDim2.new(1, 0, 0, aH)
				if aF then
					if bj == false then
						aL.Size = UDim2.new(1, 0, 0, aH)
					else
						d.Play(aL, 'Resize', {
							Size = UDim2.new(1, 0, 0, aH)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Resize')
					end
				end
				if aG then
					local bl = math.max(al.AbsoluteSize.Y, aH)
					TrimNotifications(math.max(math.floor(tonumber(aa.MaxVisible) or J), 1), bl)
				end
			end
			local function UpdateTextHeight()
				local bj = math.max(math.ceil(a5.AbsoluteContentSize.Y), 20)
				a4.Size = UDim2.new(1, - (ax + ay), 0, bj)
				a2.Size = UDim2.new(1, 0, 0, math.max(bj, ak.Icon and au or 0, 20))
				UpdateContainerHeight(aF)
			end
			Connect(a5:GetPropertyChangedSignal'AbsoluteContentSize', function()
				UpdateTextHeight()
			end)
			Connect(aY:GetPropertyChangedSignal'AbsoluteContentSize', function()
				UpdateContainerHeight(aF)
			end)
			local function StopProgressTween()
				if aJ then
					aJ:Cancel()
					aJ = nil
				end
			end
			local function CaptureRemainingTime()
				if aK then
					aE = math.max(aE - (os.clock() - aK), 0)
					aK = nil
				end
				ak.Remaining = aE
			end
			local function SetProgressRatio(bj)
				bi.Size = UDim2.new(math.clamp(bj, 0, 1), 0, 1, 0)
			end
			local function StartTimer()
				if not aw or not aF or ak.Closed or ak.Paused then
					return
				end
				if aE <= 0 then
					ak:Close'Timeout'
					return
				end
				aD = aD + 1
				local bj = aD
				aK = os.clock()
				ak.Remaining = aE
				StopProgressTween()
				local bk = aE / ak.Duration
				SetProgressRatio(bk)
				if bg then
					aJ = f(bi, aE, {
						Size = UDim2.new(0, 0, 1, 0)
					}, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
					aJ:Play()
				end
				task.delay(aE, function()
					if bj == aD and not ak.Closed and not ak.Paused then
						aE = 0
						ak.Remaining = 0
						ak:Close'Timeout'
					end
				end)
			end
			function ak.Pause(bj)
				if not aw or ak.Closed or ak.Paused then
					return ak
				end
				ak.Paused = true
				aD = aD + 1
				CaptureRemainingTime()
				StopProgressTween()
				SetProgressRatio(aE / ak.Duration)
				return ak
			end
			function ak.Resume(bj)
				if not aw or ak.Closed or not ak.Paused then
					return ak
				end
				ak.Paused = false
				StartTimer()
				return ak
			end
			function ak.GetRemainingDuration(bj)
				if not aw then
					return 0
				end
				local bk = aE
				if aK then
					bk = math.max(bk - (os.clock() - aK), 0)
				end
				return bk
			end
			function ak.Update(bj, bk)
				if typeof(bk) ~= 'table' or ak.Closed then
					return ak
				end
				if bk.Title ~= nil then
					ak.Title = tostring(bk.Title)
					a6.Text = ak.Title
				end
				if bk.Content ~= nil then
					ak.Content = if bk.Content == false then nil else tostring(bk.Content)
					a7.Text = ak.Content or ''
					a7.Visible = ak.Content ~= nil
				end
				if bk.Duration ~= nil then
					local bl = ak.Paused
					aD = aD + 1
					CaptureRemainingTime()
					StopProgressTween()
					ak.Duration = ResolveDuration(bk.Duration)
					aw = typeof(ak.Duration) == 'number' and ak.Duration > 0
					bg = aw and d:IsEnabled() and not d.Reduced
					aE = if aw then ak.Duration else 0
					ak.Remaining = aE
					ak.Paused = bl
					bh.Visible = aw
					SetProgressRatio(if aw then 1 else 0)
					StartTimer()
				end
				UpdateTextHeight()
				return ak
			end
			function ak.Close(bj, bk)
				if ak.Closed then
					return ak
				end
				ak.Closed = true
				ak.CloseReason = tostring(bk or 'Manual')
				aD = aD + 1
				CaptureRemainingTime()
				DisconnectSignals()
				StopProgressTween()
				d.Cancel(aL, 'Open')
				d.Cancel(aL, 'Resize')
				d.Cancel(aN, 'Open')
				d.Cancel(aM, 'Open')
				d.Play(aL, 'NotificationClose', {
					Size = UDim2.new(1, 0, 0, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Close')
				d.Play(aN, 'NotificationClose', {
					Position = UDim2.new(0, M, 0, 0),
					GroupTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Close')
				d.Play(aM, 'NotificationClose', {
					Scale = 0.98
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Close')
				b.SafeCallback(ak.OnClose, ak, ak.CloseReason)
				local bl = if d:IsEnabled() and not d.Reduced then d.GetDuration'NotificationClose' + 0.02 else 0
				task.delay(bl, function()
					V.Notifications[ak.Index] = nil
					if aL.Parent then
						aL:Destroy()
					end
				end)
				return ak
			end
			if ba then
				Connect(ba.MouseButton1Click, function()
					ak:Close'Dismissed'
				end)
			end
			if ak.PauseOnHover then
				Connect(aN.MouseEnter, function()
					ak:Pause()
				end)
				Connect(aN.MouseLeave, function()
					ak:Resume()
				end)
			end
			ak.UIElements = {
				Container = aL,
				Main = aQ,
				Card = aQ,
				Type = ak.Type,
				Transition = aN,
				TransitionScale = aM,
				Shadow = aO,
				NativeShadow = aR,
				Stroke = aP,
				Surface = aS,
				LiquidGlass = aT,
				ToneWash = aU,
				AccentLine = aV,
				TopHighlight = aW,
				Body = aX,
				Header = a2,
				AppHeader = aZ,
				AppIcon = a_,
				AppName = a0,
				AppTimestamp = a1,
				TextContainer = a4,
				Title = a6,
				Content = a7,
				Timestamp = a3,
				Icon = a9,
				Avatar = if ak.IsAvatar then a9 else nil,
				IconBubble = a8,
				CloseButton = ba,
				CloseSurface = bb,
				Actions = bf,
				Selection = bc,
				SelectionValue = bd,
				ProgressTrack = bh,
				ProgressFill = bi
			}
			UpdateTextHeight()
			aG = true
			TrimNotifications(math.max(math.floor(tonumber(aa.MaxVisible) or J), 1), math.max(al.AbsoluteSize.Y, aH))
			task.spawn(function()
				task.wait()
				if ak.Closed then
					return
				end
				UpdateTextHeight()
				aF = true
				d.Play(aL, 'Notification', {
					Size = UDim2.new(1, 0, 0, aH)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Open')
				d.Play(aN, 'Notification', {
					Position = UDim2.new(0, 0, 0, 0),
					GroupTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Open')
				d.Play(aM, 'Notification', {
					Scale = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Open')
				b.SafeCallback(ak.OnOpen, ak)
				StartTimer()
			end)
			return ak
		end
		return V
	end
	function a.h()
		local aa = 4294967296
		local ab = aa - 1
		local function c(ac, ad)
			local ae, af = 0, 1
			while ac ~= 0 or ad ~= 0 do
				local ag, ah = ac % 2, ad % 2
				local ai = (ag + ah) % 2
				ae = ae + ai * af
				ac = math.floor(ac / 2)
				ad = math.floor(ad / 2)
				af = af * 2
			end
			return ae % aa
		end
		local function k(ac, ad, ae, ...)
			local af
			if ad then
				ac = ac % aa
				ad = ad % aa
				af = c(ac, ad)
				if ae then
					af = k(af, ae, ...)
				end
				return af
			elseif ac then
				return ac % aa
			else
				return 0
			end
		end
		local function n(ac, ad, ae, ...)
			local af
			if ad then
				ac = ac % aa
				ad = ad % aa
				af = (ac + ad - c(ac, ad)) / 2
				if ae then
					af = n(af, ae, ...)
				end
				return af
			elseif ac then
				return ac % aa
			else
				return ab
			end
		end
		local function o(ac)
			return ab - ac
		end
		local function q(ac, ad)
			if ad < 0 then
				return lshift(ac, - ad)
			end
			return math.floor(ac % 4294967296 / 2 ^ ad)
		end
		local function s(ac, ad)
			if ad > 31 or ad < - 31 then
				return 0
			end
			return q(ac % aa, ad)
		end
		local function lshift(ac, ad)
			if ad < 0 then
				return s(ac, - ad)
			end
			return ac * 2 ^ ad % 4294967296
		end
		local function t(ac, ad)
			ac = ac % aa
			ad = ad % 32
			local ae = n(ac, 2 ^ ad - 1)
			return s(ac, ad) + lshift(ae, 32 - ad)
		end
		local ac = {
			0x428a2f98,
			0x71374491,
			0xb5c0fbcf,
			0xe9b5dba5,
			0x3956c25b,
			0x59f111f1,
			0x923f82a4,
			0xab1c5ed5,
			0xd807aa98,
			0x12835b01,
			0x243185be,
			0x550c7dc3,
			0x72be5d74,
			0x80deb1fe,
			0x9bdc06a7,
			0xc19bf174,
			0xe49b69c1,
			0xefbe4786,
			0xfc19dc6,
			0x240ca1cc,
			0x2de92c6f,
			0x4a7484aa,
			0x5cb0a9dc,
			0x76f988da,
			0x983e5152,
			0xa831c66d,
			0xb00327c8,
			0xbf597fc7,
			0xc6e00bf3,
			0xd5a79147,
			0x6ca6351,
			0x14292967,
			0x27b70a85,
			0x2e1b2138,
			0x4d2c6dfc,
			0x53380d13,
			0x650a7354,
			0x766a0abb,
			0x81c2c92e,
			0x92722c85,
			0xa2bfe8a1,
			0xa81a664b,
			0xc24b8b70,
			0xc76c51a3,
			0xd192e819,
			0xd6990624,
			0xf40e3585,
			0x106aa070,
			0x19a4c116,
			0x1e376c08,
			0x2748774c,
			0x34b0bcb5,
			0x391c0cb3,
			0x4ed8aa4a,
			0x5b9cca4f,
			0x682e6ff3,
			0x748f82ee,
			0x78a5636f,
			0x84c87814,
			0x8cc70208,
			0x90befffa,
			0xa4506ceb,
			0xbef9a3f7,
			0xc67178f2
		}
		local function w(ad)
			return string.gsub(ad, '.', function(ae)
				return string.format('%02x', string.byte(ae))
			end)
		end
		local function y(ad, ae)
			local af = ''
			for ag = 1, ae do
				local ah = ad % 256
				af = string.char(ah) .. af
				ad = (ad - ah) / 256
			end
			return af
		end
		local function D(ad, ae)
			local af = 0
			for ag = ae, ae + 3 do
				af = af * 256 + string.byte(ad, ag)
			end
			return af
		end
		local function E(ad, ae)
			local af = 64 - (ae + 9) % 64
			ae = y(8 * ae, 8)
			ad = ad .. '\128' .. string.rep('\0', af) .. ae
			assert(# ad % 64 == 0)
			return ad
		end
		local function I(ad)
			ad[1] = 0x6a09e667
			ad[2] = 0xbb67ae85
			ad[3] = 0x3c6ef372
			ad[4] = 0xa54ff53a
			ad[5] = 0x510e527f
			ad[6] = 0x9b05688c
			ad[7] = 0x1f83d9ab
			ad[8] = 0x5be0cd19
			return ad
		end
		local function K(ad, ae, af)
			local ag = {}
			for ah = 1, 16 do
				ag[ah] = D(ad, ae + (ah - 1) * 4)
			end
			for ah = 17, 64 do
				local ai = ag[ah - 15]
				local aj = k(t(ai, 7), t(ai, 18), s(ai, 3))
				ai = ag[ah - 2]
				ag[ah] = (ag[ah - 16] + aj + ag[ah - 7] + k(t(ai, 17), t(ai, 19), s(ai, 10))) % aa
			end
			local ah, ai, aj, ak, al, am, an, ao = af[1], af[2], af[3], af[4], af[5], af[6], af[7], af[8]
			for ap = 1, 64 do
				local aq, ar = k(t(ah, 2), t(ah, 13), t(ah, 22)), k(n(ah, ai), n(ah, aj), n(ai, aj))
				local as, at, au = (aq + ar) % aa, k(t(al, 6), t(al, 11), t(al, 25)), k(n(al, am), n(o(al), an))
				local av = (ao + at + au + ac[ap] + ag[ap]) % aa
				ao = an
				an = am
				am = al
				al = (ak + av) % aa
				ak = aj
				aj = ai
				ai = ah
				ah = (av + as) % aa
			end
			af[1] = (af[1] + ah) % aa
			af[2] = (af[2] + ai) % aa
			af[3] = (af[3] + aj) % aa
			af[4] = (af[4] + ak) % aa
			af[5] = (af[5] + al) % aa
			af[6] = (af[6] + am) % aa
			af[7] = (af[7] + an) % aa
			af[8] = (af[8] + ao) % aa
		end
		local function Z(ad)
			ad = E(ad, # ad)
			local ae = I{}
			for af = 1, # ad, 64 do
				K(ad, af, ae)
			end
			return w(y(ae[1], 4) .. y(ae[2], 4) .. y(ae[3], 4) .. y(ae[4], 4) .. y(ae[5], 4) .. y(ae[6], 4) .. y(ae[7], 4) .. y(ae[8], 4))
		end
		local ad, ae, af = {
			['\\'] = '\\',
			['"'] = '"',
			['\b'] = 'b',
			['\f'] = 'f',
			['\n'] = 'n',
			['\r'] = 'r',
			['\t'] = 't'
		}, {
			['/'] = '/'
		}
		for ag, ah in pairs(ad) do
			ae[ah] = ag
		end
		local ag, ah, ai = function(ag)
			return '\\' .. (ad[ag] or string.format('u%04x', ag:byte()))
		end, function(ag)
			return 'null'
		end, function(ag, ah)
			local ai = {}
			ah = ah or {}
			if ah[ag] then
				error'circular reference'
			end
			ah[ag] = true
			if rawget(ag, 1) ~= nil or next(ag) == nil then
				local aj = 0
				for ak in pairs(ag) do
					if type(ak) ~= 'number' then
						error'invalid table: mixed or invalid key types'
					end
					aj = aj + 1
				end
				if aj ~= # ag then
					error'invalid table: sparse array'
				end
				for ak, al in ipairs(ag) do
					table.insert(ai, af(al, ah))
				end
				ah[ag] = nil
				return '[' .. table.concat(ai, ',') .. ']'
			else
				for aj, ak in pairs(ag) do
					if type(aj) ~= 'string' then
						error'invalid table: mixed or invalid key types'
					end
					table.insert(ai, af(aj, ah) .. ':' .. af(ak, ah))
				end
				ah[ag] = nil
				return '{' .. table.concat(ai, ',') .. '}'
			end
		end
		local aj, ak = function(aj)
			return '"' .. aj:gsub('[%z\1-\31\\"]', ag) .. '"'
		end, function(aj)
			if aj ~= aj or aj <= - math.huge or aj >= math.huge then
				error("unexpected number value '" .. tostring(aj) .. "'")
			end
			return string.format('%.14g', aj)
		end
		local al = {
			['nil'] = ah,
			table = ai,
			string = aj,
			number = ak,
			boolean = tostring
		}
		af = function(am, an)
			local ao = type(am)
			local ap = al[ao]
			if ap then
				return ap(am, an)
			end
			error("unexpected type '" .. ao .. "'")
		end
		local am, an, ao = function(am)
			return af(am)
		end, function(...)
			local am = {}
			for an = 1, select('#', ...) do
				am[select(an, ...)] = true
			end
			return am
		end
		local ap, aq, ar, as, at, au, av, aw = an(' ', '\t', '\r', '\n'), an(' ', '\t', '\r', '\n', ']', '}', ','), an('\\', '/', '"', 'b', 'f', 'n', 'r', 't', 'u'), an('true', 'false', 'null'), {
			['true'] = true,
			['false'] = false,
			null = nil
		}, function(ap, aq, ar, as)
			for at = aq, # ap do
				if ar[ap:sub(at, at)] ~= as then
					return at
				end
			end
			return # ap + 1
		end, function(ap, aq, ar)
			local as, at = 1, 1
			for au = 1, aq - 1 do
				at = at + 1
				if ap:sub(au, au) == '\n' then
					as = as + 1
					at = 1
				end
			end
			error(string.format('%s at line %d col %d', ar, as, at))
		end, function(ap)
			local aq = math.floor
			if ap <= 0x7f then
				return string.char(ap)
			elseif ap <= 0x7ff then
				return string.char(aq(ap / 64) + 192, ap % 64 + 128)
			elseif ap <= 0xffff then
				return string.char(aq(ap / 4096) + 224, aq(ap % 4096 / 64) + 128, ap % 64 + 128)
			elseif ap <= 0x10ffff then
				return string.char(aq(ap / 262144) + 240, aq(ap % 262144 / 4096) + 128, aq(ap % 4096 / 64) + 128, ap % 64 + 128)
			end
			error(string.format("invalid unicode codepoint '%x'", ap))
		end
		local ax = function(ax)
			local ay, az = tonumber(ax:sub(1, 4), 16), tonumber(ax:sub(7, 10), 16)
			if az then
				return aw((ay - 0xd800) * 0x400 + az - 0xdc00 + 0x10000)
			else
				return aw(ay)
			end
		end
		local ay, az, aA, aB, aC = function(ay, az)
			local aA, aB = '', az + 1
			local aC = aB
			while aB <= # ay do
				local aD = ay:byte(aB)
				if aD < 32 then
					av(ay, aB, 'control character in string')
				elseif aD == 92 then
					aA = aA .. ay:sub(aC, aB - 1)
					aB = aB + 1
					local aE = ay:sub(aB, aB)
					if aE == 'u' then
						local aF = ay:match('^[dD][89aAbB]%x%x\\u%x%x%x%x', aB + 1) or ay:match('^%x%x%x%x', aB + 1) or av(ay, aB - 1, 'invalid unicode escape in string')
						aA = aA .. ax(aF)
						aB = aB + # aF
					else
						if not ar[aE] then
							av(ay, aB - 1, "invalid escape char '" .. aE .. "' in string")
						end
						aA = aA .. ae[aE]
					end
					aC = aB + 1
				elseif aD == 34 then
					aA = aA .. ay:sub(aC, aB - 1)
					return aA, aB + 1
				end
				aB = aB + 1
			end
			av(ay, az, 'expected closing quote for string')
		end, function(ay, az)
			local aA = au(ay, az, aq)
			local aB = ay:sub(az, aA - 1)
			local aC = tonumber(aB)
			if not aC then
				av(ay, az, "invalid number '" .. aB .. "'")
			end
			return aC, aA
		end, function(ay, az)
			local aA = au(ay, az, aq)
			local aB = ay:sub(az, aA - 1)
			if not as[aB] then
				av(ay, az, "invalid literal '" .. aB .. "'")
			end
			return at[aB], aA
		end, function(ay, az)
			local aA, aB = {}, 1
			az = az + 1
			while 1 do
				local aC
				az = au(ay, az, ap, true)
				if ay:sub(az, az) == ']' then
					az = az + 1
					break
				end
				aC, az = ao(ay, az)
				aA[aB] = aC
				aB = aB + 1
				az = au(ay, az, ap, true)
				local aD = ay:sub(az, az)
				az = az + 1
				if aD == ']' then
					break
				end
				if aD ~= ',' then
					av(ay, az, "expected ']' or ','")
				end
			end
			return aA, az
		end, function(ay, az)
			local aA = {}
			az = az + 1
			while 1 do
				local aB, aC
				az = au(ay, az, ap, true)
				if ay:sub(az, az) == '}' then
					az = az + 1
					break
				end
				if ay:sub(az, az) ~= '"' then
					av(ay, az, 'expected string for key')
				end
				aB, az = ao(ay, az)
				az = au(ay, az, ap, true)
				if ay:sub(az, az) ~= ':' then
					av(ay, az, "expected ':' after key")
				end
				az = au(ay, az + 1, ap, true)
				aC, az = ao(ay, az)
				aA[aB] = aC
				az = au(ay, az, ap, true)
				local aD = ay:sub(az, az)
				az = az + 1
				if aD == '}' then
					break
				end
				if aD ~= ',' then
					av(ay, az, "expected '}' or ','")
				end
			end
			return aA, az
		end
		local aD = {
			['"'] = ay,
			['0'] = az,
			['1'] = az,
			['2'] = az,
			['3'] = az,
			['4'] = az,
			['5'] = az,
			['6'] = az,
			['7'] = az,
			['8'] = az,
			['9'] = az,
			['-'] = az,
			t = aA,
			f = aA,
			n = aA,
			['['] = aB,
			['{'] = aC
		}
		ao = function(aE, aF)
			local aG = aE:sub(aF, aF)
			local aH = aD[aG]
			if aH then
				return aH(aE, aF)
			end
			av(aE, aF, "unexpected character '" .. aG .. "'")
		end
		local aE = function(aE)
			if type(aE) ~= 'string' then
				error('expected argument of type string, got ' .. type(aE))
			end
			local aF, aG = ao(aE, au(aE, 1, ap, true))
			aG = au(aE, aG, ap, true)
			if aG <= # aE then
				av(aE, aG, 'trailing garbage')
			end
			return aF
		end
		local aF, aG, aH, aI, aJ = am, aE, Z, {}, (cloneref or clonereference or function(aF)
			return aF
		end)
		function aI.New(aK, aL)
			local aM, aN, aO, aP = aK, aL, true, function(aM)
			end
			repeat
				task.wait(1)
			until game:IsLoaded()
			local aQ, aR, aS, aT, aU, aV, aW, aX, aY, aZ, a_, a0, a1 = false, setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function()
				return aJ(game:GetService'Players').LocalPlayer.UserId
			end, '', 0, 'https://api.platoboost.app'
			local a2 = aS{
				Url = a1 .. '/public/connectivity',
				Method = 'GET'
			}
			if a2.StatusCode ~= 200 and a2.StatusCode ~= 429 then
				a1 = 'https://api.platoboost.net'
			end
			function cacheLink()
				if a0 + (600) < aW() then
					local a3 = aS{
						Url = a1 .. '/public/start',
						Method = 'POST',
						Body = aF{
							service = aM,
							identifier = aH(aZ())
						},
						Headers = {
							['Content-Type'] = 'application/json',
							['User-Agent'] = 'Roblox/Exploit'
						}
					}
					if a3.StatusCode == 200 then
						local a4 = aG(a3.Body)
						if a4.success == true then
							a_ = a4.data.url
							a0 = aW()
							return true, a_
						else
							aP(a4.message)
							return false, a4.message
						end
					elseif a3.StatusCode == 429 then
						local a4 = 'you are being rate limited, please wait 20 seconds and try again.'
						aP(a4)
						return false, a4
					end
					local a4 = 'Failed to cache link.'
					aP(a4)
					return false, a4
				else
					return true, a_
				end
			end
			cacheLink()
			local a3 = function()
				local a3 = ''
				for a4 = 1, 16 do
					a3 = a3 .. aT(aY(aX() * (26)) + 97)
				end
				return a3
			end
			for a4 = 1, 5 do
				local a5 = a3()
				task.wait(0.2)
				if a3() == a5 then
					local a6 = 'platoboost nonce error.'
					aP(a6)
					error(a6)
				end
			end
			local a4, a5 = function()
				local a4, a5 = cacheLink()
				if a4 then
					aR(a5)
				end
			end, function(a4)
				local a5, a6, a7 = a3(), a1 .. '/public/redeem/' .. aU(aM), {
					identifier = aH(aZ()),
					key = a4
				}
				if aO then
					a7.nonce = a5
				end
				local a8 = aS{
					Url = a6,
					Method = 'POST',
					Body = aF(a7),
					Headers = {
						['Content-Type'] = 'application/json'
					}
				}
				if a8.StatusCode == 200 then
					local a9 = aG(a8.Body)
					if a9.success == true then
						if a9.data.valid == true then
							if aO then
								if a9.data.hash == aH('true' .. '-' .. a5 .. '-' .. aN) then
									return true
								else
									aP'failed to verify integrity.'
									return false
								end
							else
								return true
							end
						else
							aP'key is invalid.'
							return false
						end
					else
						if aV(a9.message, 1, 27) == 'unique constraint violation' then
							aP'you already have an active key, please wait for it to expire before redeeming it.'
							return false
						else
							aP(a9.message)
							return false
						end
					end
				elseif a8.StatusCode == 429 then
					aP'you are being rate limited, please wait 20 seconds and try again.'
					return false
				else
					aP'server returned an invalid status code, please try again later.'
					return false
				end
			end
			local a6, a7 = function(a6)
				if aQ == true then
					return false, ('A request is already being sent, please slow down.')
				else
					aQ = true
				end
				local a7, a8 = a3(), a1 .. '/public/whitelist/' .. aU(aM) .. '?identifier=' .. aH(aZ()) .. '&key=' .. a6
				if aO then
					a8 = a8 .. '&nonce=' .. a7
				end
				local a9 = aS{
					Url = a8,
					Method = 'GET'
				}
				aQ = false
				if a9.StatusCode == 200 then
					local b = aG(a9.Body)
					if b.success == true then
						if b.data.valid == true then
							if aO then
								if b.data.hash == aH('true' .. '-' .. a7 .. '-' .. aN) then
									return true, ''
								else
									return false, ('failed to verify integrity.')
								end
							else
								return true
							end
						else
							if aV(a6, 1, 4) == 'KEY_' then
								return true, a5(a6)
							else
								return false, ('Key is invalid.')
							end
						end
					else
						return false, (b.message)
					end
				elseif a9.StatusCode == 429 then
					return false, ('You are being rate limited, please wait 20 seconds and try again.')
				else
					return false, ('Server returned an invalid status code, please try again later.')
				end
			end, function(a6)
				local a7, a8 = a3(), a1 .. '/public/flag/' .. aU(aM) .. '?name=' .. a6
				if aO then
					a8 = a8 .. '&nonce=' .. a7
				end
				local a9 = aS{
					Url = a8,
					Method = 'GET'
				}
				if a9.StatusCode == 200 then
					local b = aG(a9.Body)
					if b.success == true then
						if aO then
							if b.data.hash == aH(aU(b.data.value) .. '-' .. a7 .. '-' .. aN) then
								return b.data.value
							else
								aP'failed to verify integrity.'
								return nil
							end
						else
							return b.data.value
						end
					else
						aP(b.message)
						return nil
					end
				else
					return nil
				end
			end
			return {
				Verify = a6,
				GetFlag = a7,
				Copy = a4
			}
		end
		return aI
	end
	function a.i()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local ab, ac = aa(game:GetService'HttpService'), {}
		function ac.New(ad)
			local ae, af, ag = gethwid or function()
				return aa(game:GetService'Players').LocalPlayer.UserId
			end, request or http_request or syn_request, setclipboard or toclipboard
			function ValidateKey(ah)
				local ai, aj = 'https://api.pandauth.com/api/v1/keys/validate', {
					ServiceID = ad,
					HWID = tostring(ae()),
					Key = tostring(ah)
				}
				local ak = ab:JSONEncode(aj)
				local al, am = pcall(function()
					return af{
						Url = ai,
						Method = 'POST',
						Headers = {
							['User-Agent'] = 'Roblox/Exploit',
							['Content-Type'] = 'application/json'
						},
						Body = ak
					}
				end)
				if al and am then
					if am.Success then
						local an, ao = pcall(function()
							return ab:JSONDecode(am.Body)
						end)
						if an and ao then
							if ao.Authenticated_Status and ao.Authenticated_Status == 'Success' then
								return true, 'Authenticated'
							else
								local ap = ao.Note or 'Unknown reason'
								return false, 'Authentication failed: ' .. ap
							end
						else
							return false, 'JSON decode error'
						end
					else
						warn(' HTTP request was not successful. Code: ' .. tostring(am.StatusCode) .. ' Message: ' .. am.StatusMessage)
						return false, 'HTTP request failed: ' .. am.StatusMessage
					end
				else
					return false, 'Request pcall error'
				end
			end
			function GetKeyLink()
				return 'https://new.pandadevelopment.net/getkey/' .. tostring(ad) .. '?hwid=' .. tostring(ae())
			end
			function CopyLink()
				return ag(GetKeyLink())
			end
			return {
				Verify = ValidateKey,
				Copy = CopyLink
			}
		end
		return ac
	end
	function a.j()
		local aa = {}
		function aa.New(ab, ac)
			local ad = 'https://sdkapi-public.luarmor.net/library.lua'
			local ae, af = loadstring(game.HttpGet and game:HttpGet(ad) or HttpService:GetAsync(ad))(), setclipboard or toclipboard
			ae.script_id = ab
			function ValidateKey(ag)
				local ah = ae.check_key(ag)
				if ah.code == 'KEY_VALID' then
					return true, 'Whitelisted!'
				elseif ah.code == 'KEY_HWID_LOCKED' then
					return false, 'Key linked to a different HWID. Please reset it using our bot'
				elseif ah.code == 'KEY_INCORRECT' then
					return false, 'Key is wrong or deleted!'
				else
					return false, 'Key check failed:' .. ah.message .. ' Code: ' .. ah.code
				end
			end
			function CopyLink()
				af(tostring(ac))
			end
			return {
				Verify = ValidateKey,
				Copy = CopyLink
			}
		end
		return aa
	end
	function a.k()
		local aa = {}
		function aa.New(ab, ac, ad)
			JunkieProtected.API_KEY = ac
			JunkieProtected.PROVIDER = ad
			JunkieProtected.SERVICE_ID = ab
			local function ValidateKey(ae)
				if not ae or ae == '' then
					print'No key provided!'
					return false, 'No key provided. Please get a key.'
				end
				local af = JunkieProtected.IsKeylessMode()
				if af and af.keyless_mode then
					print'Keyless mode enabled. Starting script...'
					return true, 'Keyless mode enabled. Starting script...'
				end
				local ag = JunkieProtected.ValidateKey{
					Key = ae
				}
				if ag == 'valid' then
					print'Key is valid! Starting script...'
					load()
					if _G.JD_IsPremium then
						print'Premium user detected!'
					else
						print'Standard user'
					end
					return true, 'Key is valid!'
				else
					local ah = JunkieProtected.GetKeyLink()
					print'Invalid key!'
					return false, 'Invalid key. Get one from:' .. ah
				end
			end
			local function copyLink()
				local ae = JunkieProtected.GetKeyLink()
				if setclipboard then
					setclipboard(ae)
				end
			end
			return {
				Verify = ValidateKey,
				Copy = copyLink
			}
		end
		return aa
	end
	function a.l()
		return {
			platoboost = {
				Name = 'Platoboost',
				Icon = 'rbxassetid://75920162824531',
				Args = {
					'ServiceId',
					'Secret'
				},
				New = a.load'h'.New
			},
			pandadevelopment = {
				Name = 'Panda Development',
				Icon = 'panda',
				Args = {
					'ServiceId'
				},
				New = a.load'i'.New
			},
			luarmor = {
				Name = 'Luarmor',
				Icon = 'rbxassetid://130918283130165',
				Args = {
					'ScriptId',
					'Discord'
				},
				New = a.load'j'.New
			},
			junkiedevelopment = {
				Name = 'Junkie Development',
				Icon = 'rbxassetid://106310347705078',
				Args = {
					'ServiceId',
					'ApiKey',
					'Provider'
				},
				New = a.load'k'.New
			}
		}
	end
	function a.m()
		return [[{
    "name": "windui",
    "version": "1.6.65",
    "main": "./dist/main.lua",
    "repository": "https://github.com/article-hub-studio/WindUI-Skibidi",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "bash build/build.sh dev $INPUT_FILE",
        "build": "bash build/build.sh build $INPUT_FILE",
        "live": "python3 -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "example-live-build": "INPUT_FILE=main_example.lua npm run live-build",
        "updater": "python3 updater/main.py",
        "docs:dev": "npm --prefix website run dev",
        "docs:build": "npm --prefix website run build",
        "docs:start": "npm --prefix website run start",
        "verify:notification": "stylua --syntax Luau --check src/components/Notification.lua tests/Notification.lua && node tests/notification-layout-safety.test.js",
        "verify:ui": "stylua --syntax Luau --check src/modules/Icons.lua src/modules/Creator.lua src/Init.lua src/components/Notification.lua src/components/window/Openbutton.lua src/themes/Fallbacks.lua tests/Notification.lua && node tests/notification-layout-safety.test.js && node tests/ui-library-advanced.test.js",
        "test:static": "node tests/acrylic-theme-safety.test.js && node tests/notification-layout-safety.test.js && node tests/ui-library-advanced.test.js && node tests/input-lifecycle-safety.test.js"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}
]]
	end
	function a.n()
		local aa, ab = {}, a.load'd'
		local ac, ad = ab.New, ab.Tween
		function aa.New(ae, af, ag, ah, ai, aj, ak, al)
			ah = ah or 'Primary'
			local am, an = al or (not ak and 10 or 999)
			if af and af ~= '' then
				an = ac('ImageLabel', {
					Image = ab.Icon(af)[1],
					ImageRectSize = ab.Icon(af)[2].ImageRectSize,
					ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ImageColor3 = ah == 'White' and Color3.new(0, 0, 0) or nil,
					ImageTransparency = ah == 'White' and 0.4 or 0,
					ThemeTag = {
						ImageColor3 = ah ~= 'White' and 'Icon' or nil
					}
				})
			end
			local ao = ac('TextButton', {
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = 'X',
				Parent = ai,
				BackgroundTransparency = 1
			}, {
				ab.NewRoundFrame(am, 'Squircle', {
					ThemeTag = {
						ImageColor3 = ah ~= 'White' and 'Button' or nil
					},
					ImageColor3 = ah == 'White' and Color3.new(1, 1, 1) or nil,
					Size = UDim2.new(1, 0, 1, 0),
					Name = 'Squircle',
					ImageTransparency = ah == 'Primary' and 0 or ah == 'White' and 0 or 0.9
				}),
				ab.NewRoundFrame(am, 'Squircle', {
					ImageColor3 = Color3.new(1, 1, 1),
					Size = UDim2.new(1, 0, 1, 0),
					Name = 'Special',
					ImageTransparency = ah == 'Secondary' and 0.95 or 1
				}),
				ab.NewRoundFrame(am, 'Shadow-sm', {
					ImageColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 3, 1, 3),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = 'Shadow',
					ImageTransparency = 1,
					Visible = not ak
				}),
				ab.NewRoundFrame(am, 'SquircleGlass', {
					ThemeTag = {
						ImageColor3 = 'White'
					},
					Size = UDim2.new(1, 1, 1, 1),
					ImageTransparency = 0.9,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = 'Outline'
				}, {}),
				ab.NewRoundFrame(am, 'Squircle', {
					Size = UDim2.new(1, 0, 1, 0),
					Name = 'Frame',
					ThemeTag = {
						ImageColor3 = ah ~= 'White' and 'Text' or nil
					},
					ImageColor3 = ah == 'White' and Color3.new(0, 0, 0) or nil,
					ImageTransparency = 1
				}, {
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16)
					}),
					ac('UIListLayout', {
						FillDirection = 'Horizontal',
						Padding = UDim.new(0, 8),
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Center'
					}),
					an,
					ac('TextLabel', {
						BackgroundTransparency = 1,
						FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
						Text = ae or 'Button',
						ThemeTag = {
							TextColor3 = (ah ~= 'Primary' and ah ~= 'White') and 'Text'
						},
						TextColor3 = ah == 'Primary' and Color3.new(1, 1, 1) or ah == 'White' and Color3.new(0, 0, 0) or nil,
						AutomaticSize = 'XY',
						TextSize = 18
					})
				})
			})
			ab.AddSignal(ao.MouseEnter, function()
				ad(ao.Frame, 0.047, {
					ImageTransparency = 0.95
				}):Play()
			end)
			ab.AddSignal(ao.MouseLeave, function()
				ad(ao.Frame, 0.047, {
					ImageTransparency = 1
				}):Play()
			end)
			ab.AddSignal(ao.MouseButton1Click, function()
				if aj then
					aj:Close()()
				end
				if ag then
					ab.SafeCallback(ag)
				end
			end)
			return ao
		end
		return aa
	end
	function a.o()
		local aa, ab, ac = {}, a.load'd', a.load'e'
		local ad = ab.New
		function aa.New(ae, af, ag, ah, ai, aj, ak, al, am)
			ah = ah or 'Input'
			local an, ao = ak or 10
			if af and af ~= '' then
				ao = ad('ImageLabel', {
					Image = ab.Icon(af)[1],
					ImageRectSize = ab.Icon(af)[2].ImageRectSize,
					ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'Icon'
					}
				})
			end
			local ap = ah == 'Textarea'
			local aq, ar, as = ad('TextBox', {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, ao and - 29 or 0, 1, 0),
				PlaceholderText = ae,
				ClearTextOnFocus = al or false,
				ClipsDescendants = true,
				TextWrapped = ap,
				MultiLine = ap,
				TextXAlignment = 'Left',
				TextYAlignment = ah ~= 'Textarea' and 'Center' or 'Top',
				ThemeTag = {
					PlaceholderColor3 = 'PlaceholderText',
					TextColor3 = 'Text'
				}
			}), ab.NewRoundFrame(an, 'Squircle', {
				ThemeTag = {
					ImageColor3 = 'Placeholder'
				},
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 0.85
			}), not am and ab.NewRoundFrame(an - 1, 'SquircleGlass', {
				ThemeTag = {
					ImageColor3 = 'Outline'
				},
				Size = UDim2.new(1, 1, 1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ImageTransparency = 0.8
			}) or nil
			local at = ab.NewRoundFrame(an, 'Squircle', {
				Size = UDim2.new(1, 0, 1, 0),
				Name = 'Frame',
				ThemeTag = {
					ImageColor3 = 'LabelBackground',
					ImageTransparency = 'LabelBackgroundTransparency'
				}
			}, {
				ad('UIPadding', {
					PaddingTop = UDim.new(0, ah ~= 'Textarea' and 0 or 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, ah ~= 'Textarea' and 0 or 12)
				}),
				ad('UIListLayout', {
					FillDirection = 'Horizontal',
					Padding = UDim.new(0, 8),
					VerticalAlignment = ah ~= 'Textarea' and 'Center' or 'Top',
					HorizontalAlignment = 'Left'
				}),
				ao,
				aq
			})
			local au = ad('Frame', {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = ag,
				BackgroundTransparency = 1
			}, {
				ad('Frame', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					ar,
					as,
					at
				})
			})
			if aj then
				ab.AddSignal(aq:GetPropertyChangedSignal'Text', function()
					if ai then
						ab.SafeCallback(ai, aq.Text)
					end
				end)
			else
				ab.AddSignal(aq.FocusLost, function()
					if ai then
						ab.SafeCallback(ai, aq.Text)
					end
				end)
			end
			ab.AddSignal(aq.Focused, function()
				ac.Play(ar, 'Focus', {
					ImageTransparency = 0.78
				}, nil, nil, 'Focus')
				if as then
					ac.Play(as, 'Focus', {
						ImageTransparency = 0.65
					}, nil, nil, 'Focus')
				end
			end)
			ab.AddSignal(aq.FocusLost, function()
				ac.Play(ar, 'Focus', {
					ImageTransparency = 0.85
				}, nil, nil, 'Focus')
				if as then
					ac.Play(as, 'Focus', {
						ImageTransparency = 0.8
					}, nil, nil, 'Focus')
				end
			end)
			return au
		end
		return aa
	end
	function a.p()
		local aa = a.load'd'
		local ab, ac, ad = aa.New, aa.Tween, {
			Holder = nil,
			Parent = nil
		}
		function ad.Create(ae, af, ag, ah, ai)
			local aj = {
				UICorner = 28,
				UIPadding = 12,
				Window = ag,
				WindUI = ah,
				UIElements = {}
			}
			if ae then
				aj.UIPadding = 0
			end
			if ae then
				aj.UICorner = 26
			end
			af = af or 'Dialog'
			if not ae then
				aj.UIElements.FullScreen = ab('Frame', {
					ZIndex = 999,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromHex'#000000',
					Size = UDim2.new(1, 0, 1, 0),
					Active = false,
					Visible = false,
					Parent = ad.Parent or (ag and ag.UIElements and ag.UIElements.Main and ag.UIElements.Main.Main)
				}, {
					ab('UICorner', {
						CornerRadius = UDim.new(0, ag.UICorner)
					})
				})
			end
			ab('ImageLabel', {
				Image = 'rbxassetid://8992230677',
				ThemeTag = {
					ImageColor3 = 'WindowShadow'
				},
				ImageTransparency = 1,
				Size = UDim2.new(1, 100, 1, 100),
				Position = UDim2.new(0, - 50, 0, - 50),
				ScaleType = 'Slice',
				SliceCenter = Rect.new(99, 99, 99, 99),
				BackgroundTransparency = 1,
				ZIndex = - 999999999999999,
				Name = 'Blur'
			})
			aj.UIElements.Main = ab('Frame', {
				Size = UDim2.new(0, 280, 0, 0),
				ThemeTag = {
					BackgroundColor3 = af .. 'Background'
				},
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Visible = false,
				ZIndex = 99999
			}, {
				ab('UIPadding', {
					PaddingTop = UDim.new(0, aj.UIPadding),
					PaddingLeft = UDim.new(0, aj.UIPadding),
					PaddingRight = UDim.new(0, aj.UIPadding),
					PaddingBottom = UDim.new(0, aj.UIPadding)
				})
			})
			aj.UIElements.MainContainer = aa.NewRoundFrame(aj.UICorner, 'Squircle', {
				Visible = false,
				ImageTransparency = ae and 0.15 or 0,
				Parent = ai or aj.UIElements.FullScreen,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = 'XY',
				ThemeTag = {
					ImageColor3 = af .. 'Background',
					ImageTransparency = af .. 'BackgroundTransparency'
				},
				ZIndex = 9999
			}, {
				aj.UIElements.Main
			})
			function aj.Open(ak)
				if not ae then
					aj.UIElements.FullScreen.Visible = true
					aj.UIElements.FullScreen.Active = true
				end
				task.spawn(function()
					aj.UIElements.MainContainer.Visible = true
					if not ae then
						ac(aj.UIElements.FullScreen, 0.1, {
							BackgroundTransparency = 0.65
						}):Play()
					end
					ac(aj.UIElements.MainContainer, 0.1, {
						ImageTransparency = 0
					}):Play()
					task.spawn(function()
						task.wait(0.05)
						aj.UIElements.Main.Visible = true
					end)
				end)
			end
			function aj.Close(ak)
				if not ae then
					ac(aj.UIElements.FullScreen, 0.1, {
						BackgroundTransparency = 1
					}):Play()
					aj.UIElements.FullScreen.Active = false
					task.spawn(function()
						task.wait(0.1)
						aj.UIElements.FullScreen.Visible = false
					end)
				end
				aj.UIElements.Main.Visible = false
				ac(aj.UIElements.MainContainer, 0.1, {
					ImageTransparency = 1
				}):Play()
				task.spawn(function()
					task.wait(0.1)
					if not ae then
						aj.UIElements.FullScreen:Destroy()
					else
						aj.UIElements.MainContainer:Destroy()
					end
				end)
				return function()
				end
			end
			return aj
		end
		return ad
	end
	function a.q()
		local aa, ab, ac = {}, a.load'd', a.load'e'
		local ad, ae, af, ag = ab.New, game:GetService'Workspace', a.load'n'.New, a.load'o'.New
		local function GetViewportSize()
			local ah = ae.CurrentCamera
			return ah and ah.ViewportSize or Vector2.new(1280, 720)
		end
		function aa.new(ah, ai, aj, ak)
			local al = a.load'p'
			local am, an, ao, ap = al.Create(true, 'Popup', ah.Window, ah.WindUI, ah.WindUI.ScreenGui.KeySystem), {}, (GetViewportSize())
			local aq = ao.X < 560
			local ar = ah.KeySystem.Thumbnail and ah.KeySystem.Thumbnail.Image and not aq
			local as, at = (ar and ah.KeySystem.Thumbnail.Width) or 200, ah.KeySystem.Width or 430
			if ar then
				at = 430 + (as / 2)
			end
			at = math.floor(math.min(at, math.max(300, ao.X - 24)))
			am.UIElements.Main.AutomaticSize = 'Y'
			am.UIElements.Main.Size = UDim2.new(0, at, 0, 0)
			am.UIElements.MainContainer.ClipsDescendants = true
			local au = ad('UIScale', {
				Name = 'Scale',
				Scale = 0.96,
				Parent = am.UIElements.MainContainer
			})
			ab.NewRoundFrame(26, 'SquircleGlass', {
				Name = 'GlassLayer',
				Size = UDim2.new(1, 1, 1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ImageTransparency = 0.84,
				ZIndex = 9998,
				Parent = am.UIElements.MainContainer,
				ThemeTag = {
					ImageColor3 = 'Primary'
				}
			})
			ab.NewRoundFrame(26, 'SquircleOutline', {
				Name = 'Outline',
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 0.62,
				ZIndex = 9998,
				Parent = am.UIElements.MainContainer,
				ThemeTag = {
					ImageColor3 = 'Outline'
				}
			})
			local av
			if ah.Icon then
				av = ab.Image(ah.Icon, ah.Title .. ':' .. ah.Icon, 0, 'Temp', 'KeySystem', ah.IconThemed)
				av.Size = UDim2.new(0, 24, 0, 24)
				av.LayoutOrder = - 1
			end
			local aw, ax = ad('TextLabel', {
				AutomaticSize = 'XY',
				BackgroundTransparency = 1,
				Text = ah.KeySystem.Title or ah.Title,
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = 'Text'
				},
				TextSize = 20
			}), ad('TextLabel', {
				AutomaticSize = 'Y',
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = ah.KeySystem.Subtitle or ah.KeySystem.Description or '',
				TextXAlignment = 'Left',
				TextTransparency = 0.34,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = 'Text'
				},
				TextSize = 13
			})
			local ay, az = ad('Frame', {
				BackgroundTransparency = 1,
				AutomaticSize = 'XY'
			}, {
				ad('UIListLayout', {
					Padding = UDim.new(0, 14),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				}),
				av,
				aw
			}), ad('TextLabel', {
				BackgroundTransparency = 1,
				Text = 'Waiting',
				TextSize = 12,
				TextTransparency = 0.08,
				AutomaticSize = 'XY',
				FontFace = Font.new(ab.Font, Enum.FontWeight.Bold),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			local aA = ab.NewRoundFrame(999, 'Squircle', {
				Size = UDim2.new(0, 0, 0, 28),
				AutomaticSize = 'X',
				ImageTransparency = 0.84,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ad('UIPadding', {
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				ad('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					Padding = UDim.new(0, 6)
				}),
				ab.NewRoundFrame(999, 'Squircle', {
					Name = 'Dot',
					Size = UDim2.fromOffset(7, 7),
					ImageTransparency = 0,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				}),
				az
			})
			local aB = ad('Frame', {
				AutomaticSize = 'Y',
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1
			}, {
				ad('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				}),
				ay,
				aA
			})
			ay.Size = UDim2.new(1, - 112, 0, 0)
			local aC, aD, aE = ab.NewRoundFrame(18, 'Squircle', {
				AutomaticSize = 'Y',
				Size = UDim2.new(1, 0, 0, 0),
				ImageTransparency = 0.86,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ad('UIGradient', {
					Rotation = 18,
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.06),
						NumberSequenceKeypoint.new(1, 0.34)
					}
				}),
				ad('UIPadding', {
					PaddingTop = UDim.new(0, 14),
					PaddingLeft = UDim.new(0, 14),
					PaddingRight = UDim.new(0, 14),
					PaddingBottom = UDim.new(0, 14)
				}),
				ad('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Vertical'
				}),
				aB,
				ax
			}), (ag(ah.KeySystem.Placeholder or 'Enter Key', 'key', nil, 'Input', function(aC)
				ap = aC
			end))
			if ah.KeySystem.Note and ah.KeySystem.Note ~= '' then
				aE = ad('TextLabel', {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
					TextXAlignment = 'Left',
					Text = ah.KeySystem.Note,
					TextSize = 18,
					TextTransparency = 0.4,
					ThemeTag = {
						TextColor3 = 'Text'
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true
				})
			end
			local aF = ad('UIGradient', {
				Name = 'FillGradient',
				Rotation = 0,
				Offset = Vector2.new(- 0.2, 0),
				Transparency = NumberSequence.new{
					NumberSequenceKeypoint.new(0, 0.08),
					NumberSequenceKeypoint.new(0.45, 0),
					NumberSequenceKeypoint.new(1, 0.2)
				}
			})
			local aG, aH = ab.NewRoundFrame(999, 'Squircle', {
				Name = 'Fill',
				Size = UDim2.new(0.18, 0, 1, 0),
				ClipsDescendants = true,
				ImageTransparency = 0.02,
				ZIndex = 3,
				ThemeTag = {
					ImageColor3 = 'Primary'
				}
			}, {
				aF,
				ab.NewRoundFrame(999, 'SquircleGlass', {
					Name = 'LiquidSheen',
					Size = UDim2.new(0.42, 0, 1, 0),
					Position = UDim2.new(0.18, 0, 0, 0),
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 0.7,
					ZIndex = 4
				}, {
					ad('UIGradient', {
						Rotation = 0,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 1),
							NumberSequenceKeypoint.new(0.48, 0.22),
							NumberSequenceKeypoint.new(1, 1)
						}
					})
				})
			}), ad('TextLabel', {
				Size = UDim2.new(1, 0, 0, 16),
				BackgroundTransparency = 1,
				Text = 'Access check ready',
				TextSize = 12,
				TextTransparency = 0.34,
				TextXAlignment = 'Left',
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			local aI = ab.NewRoundFrame(999, 'Squircle', {
				Name = 'ProgressTrack',
				Size = UDim2.new(1, 0, 0, 10),
				ClipsDescendants = true,
				ImageTransparency = 0.84,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ab.NewRoundFrame(999, 'SquircleGlass', {
					Name = 'TrackGlass',
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 0.92,
					ZIndex = 2
				}),
				aG,
				ab.NewRoundFrame(999, 'SquircleOutline', {
					Name = 'TrackOutline',
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.72,
					ZIndex = 5,
					ThemeTag = {
						ImageColor3 = 'Outline'
					}
				})
			})
			local aJ = ad('Frame', {
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundTransparency = 1
			}, {
				ad('UIListLayout', {
					FillDirection = 'Vertical',
					Padding = UDim.new(0, 6)
				}),
				aH,
				aI
			})
			local function SetState(aK, aL, aM)
				az.Text = tostring(aK or az.Text)
				aH.Text = tostring(aK or aH.Text)
				if aM then
					aA.Dot.ImageColor3 = Color3.fromRGB(255, 94, 94)
					aG.ImageColor3 = Color3.fromRGB(255, 94, 94)
				else
					ab.SetThemeTag(aA.Dot, {
						ImageColor3 = 'Primary'
					}, 0.12)
					ab.SetThemeTag(aG, {
						ImageColor3 = 'Primary'
					}, 0.12)
				end
				if aL ~= nil then
					aF.Offset = Vector2.new(- 0.2, 0)
					ac.Play(aG, 'Switch', {
						Size = UDim2.new(math.clamp(tonumber(aL) or 0, 0, 1), 0, 1, 0)
					}, nil, nil, 'KeySystemProgress')
					ac.Play(aF, 'Background', {
						Offset = Vector2.new(0.45, 0)
					}, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 'KeySystemProgressSheen')
				end
			end
			local aK, aL = (ad('Frame', {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1
			}, {
				ad('Frame', {
					BackgroundTransparency = 1,
					AutomaticSize = 'X',
					Size = UDim2.new(0, 0, 1, 0)
				}, {
					ad('UIListLayout', {
						Padding = UDim.new(0, 9),
						FillDirection = 'Horizontal'
					})
				})
			}))
			if ar then
				local aM
				if ah.KeySystem.Thumbnail.Title then
					aM = ad('TextLabel', {
						Text = ah.KeySystem.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = 'Text'
						},
						TextSize = 18,
						FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = 'XY',
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					})
				end
				aL = ad('ImageLabel', {
					Image = ah.KeySystem.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, as, 1, - 12),
					Position = UDim2.new(0, 6, 0, 6),
					Parent = am.UIElements.Main,
					ScaleType = 'Crop'
				}, {
					aM,
					ad('UICorner', {
						CornerRadius = UDim.new(0, 20)
					})
				})
			end
			ad('Frame', {
				Size = UDim2.new(1, aL and - as or 0, 1, 0),
				Position = UDim2.new(0, aL and as or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = am.UIElements.Main
			}, {
				ad('Frame', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					ad('UIListLayout', {
						Padding = UDim.new(0, 18),
						FillDirection = 'Vertical'
					}),
					aC,
					aE,
					aD,
					aJ,
					aK,
					ad('UIPadding', {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16)
					})
				})
			})
			local aM = af('Exit', 'log-out', function()
				am:Close()()
			end, 'Tertiary', aK.Frame)
			if aL then
				aM.Parent = aL
				aM.Size = UDim2.new(0, 0, 0, 42)
				aM.Position = UDim2.new(0, 10, 1, - 10)
				aM.AnchorPoint = Vector2.new(0, 1)
			end
			local function NotifyKeySystem(aN, aO, aP)
				if ah.WindUI and ah.WindUI.Notify then
					ah.WindUI:Notify{
						Title = 'Key System',
						Content = aN,
						Icon = aO or 'key',
						Style = aP
					}
				end
			end
			local function CopyRawLink(aN)
				aN = aN and tostring(aN) or ''
				if aN == '' then
					return false, 'No key link configured.'
				end
				local aO = setclipboard or toclipboard
				if not aO then
					return false, 'Clipboard is not available on this executor.'
				end
				aO(aN)
				return true
			end
			local function PickServiceLink(aN)
				return aN.Discord or aN.URL or aN.Url or aN.url or aN.Link or aN.link
			end
			local function CopyServiceLink(aN)
				local aO, aP, aQ = (PickServiceLink(aN.Config))
				if aO then
					aP, aQ = CopyRawLink(aO)
				elseif aN.Instance and type(aN.Instance.Copy) == 'function' then
					aP, aQ = pcall(aN.Instance.Copy)
				else
					aP, aQ = false, aN.Error or 'Service link is not ready.'
				end
				if aP then
					SetState('Key link copied', 0.36)
					NotifyKeySystem('Key link copied to clipboard.', 'key', 'Success')
				else
					SetState('Copy unavailable', 0.08, true)
					NotifyKeySystem(tostring(aQ or 'Unable to copy key link.'), 'triangle-alert', 'Warning')
				end
			end
			if ah.KeySystem.URL and not ah.KeySystem.API then
				af('Get key', 'key', function()
					local aN, aO = CopyRawLink(ah.KeySystem.URL)
					if aN then
						SetState('Key link copied', 0.36)
						NotifyKeySystem('Key link copied to clipboard.', 'key', 'Success')
					else
						SetState('Copy unavailable', 0.08, true)
						NotifyKeySystem(tostring(aO), 'triangle-alert', 'Warning')
					end
				end, 'Secondary', aK.Frame)
			end
			if ah.KeySystem.API then
				local aN = {}
				for aO, aP in next, ah.KeySystem.API do
					local aQ = ah.WindUI.Services[aP.Type]
					if aQ then
						local aR = {}
						for aS, aT in next, aQ.Args do
							table.insert(aR, aP[aT])
						end
						local aS, aT = pcall(function()
							return aQ.New(table.unpack(aR))
						end)
						local aU = {
							Config = aP,
							Definition = aQ,
							Instance = nil,
							Error = nil
						}
						if aS and aT then
							aT.Type = aP.Type
							aU.Instance = aT
							table.insert(an, aT)
						else
							aU.Error = aT
						end
						table.insert(aN, aU)
					end
				end
				local aO, aP = math.min(240, math.max(190, at - 42)), false
				if # aN == 1 then
					af('Get key', 'key', function()
						CopyServiceLink(aN[1])
					end, 'Secondary', aK.Frame)
				elseif # aN > 1 then
					local aQ, aR = af('Get key', 'key', nil, 'Secondary', aK.Frame), ab.NewRoundFrame(99, 'Squircle', {
						Size = UDim2.new(0, 1, 1, 0),
						ThemeTag = {
							ImageColor3 = 'Text'
						},
						ImageTransparency = 0.9
					})
					ad('Frame', {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 0, 1, 0),
						AutomaticSize = 'X',
						Parent = aQ.Frame
					}, {
						aR,
						ad('UIPadding', {
							PaddingLeft = UDim.new(0, 5),
							PaddingRight = UDim.new(0, 5)
						})
					})
					local aS = ab.Image('chevron-down', 'chevron-down', 0, 'Temp', 'KeySystem', true)
					aS.Size = UDim2.new(1, 0, 1, 0)
					ad('Frame', {
						Size = UDim2.new(0, 21, 0, 21),
						Parent = aQ.Frame,
						BackgroundTransparency = 1
					}, {
						aS
					})
					local aT = ab.NewRoundFrame(15, 'Squircle', {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						ZIndex = 99999,
						ThemeTag = {
							ImageColor3 = 'Background'
						}
					}, {
						ad('UIPadding', {
							PaddingTop = UDim.new(0, 5),
							PaddingLeft = UDim.new(0, 5),
							PaddingRight = UDim.new(0, 5),
							PaddingBottom = UDim.new(0, 5)
						}),
						ad('UIListLayout', {
							FillDirection = 'Vertical',
							Padding = UDim.new(0, 5)
						})
					})
					local aU = ad('Frame', {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, aO, 0, 0),
						ClipsDescendants = true,
						AnchorPoint = Vector2.new(1, 0),
						Parent = aQ,
						Position = UDim2.new(1, 0, 1, 10),
						ZIndex = 99999
					}, {
						aT
					})
					ad('TextLabel', {
						Text = 'Select Service',
						BackgroundTransparency = 1,
						FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
						ThemeTag = {
							TextColor3 = 'Text'
						},
						TextTransparency = 0.2,
						TextSize = 15,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						TextWrapped = true,
						TextXAlignment = 'Left',
						Parent = aT,
						ZIndex = 100000
					}, {
						ad('UIPadding', {
							PaddingTop = UDim.new(0, 8),
							PaddingLeft = UDim.new(0, 10),
							PaddingRight = UDim.new(0, 10),
							PaddingBottom = UDim.new(0, 8)
						})
					})
					for aV, aW in next, aN do
						local aX, aY = aW.Config, aW.Definition
						local aZ = aX.Icon or aY.Icon or 'key-round'
						local a_ = ab.Image(aZ, aZ, 0, 'Temp', 'KeySystem', true)
						a_.Size = UDim2.new(0, 20, 0, 20)
						a_.ZIndex = 100000
						local a0 = ab.NewRoundFrame(10, 'Squircle', {
							Size = UDim2.new(1, 0, 0, 0),
							ThemeTag = {
								ImageColor3 = 'Text'
							},
							ImageTransparency = 1,
							Parent = aT,
							AutomaticSize = 'Y',
							ZIndex = 100000
						}, {
							ad('UIListLayout', {
								FillDirection = 'Horizontal',
								Padding = UDim.new(0, 8),
								VerticalAlignment = 'Center'
							}),
							a_,
							ad('UIPadding', {
								PaddingTop = UDim.new(0, 9),
								PaddingLeft = UDim.new(0, 10),
								PaddingRight = UDim.new(0, 10),
								PaddingBottom = UDim.new(0, 9)
							}),
							ad('Frame', {
								BackgroundTransparency = 1,
								Size = UDim2.new(1, - 28, 0, 0),
								AutomaticSize = 'Y',
								ZIndex = 100000
							}, {
								ad('UIListLayout', {
									FillDirection = 'Vertical',
									Padding = UDim.new(0, 5),
									HorizontalAlignment = 'Center'
								}),
								ad('TextLabel', {
									Text = aX.Title or aY.Name,
									BackgroundTransparency = 1,
									FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
									ThemeTag = {
										TextColor3 = 'Text'
									},
									TextTransparency = 0.05,
									TextSize = 18,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = 'Y',
									TextWrapped = true,
									TextXAlignment = 'Left',
									ZIndex = 100001
								}),
								ad('TextLabel', {
									Text = aX.Desc or '',
									BackgroundTransparency = 1,
									FontFace = Font.new(ab.Font, Enum.FontWeight.Regular),
									ThemeTag = {
										TextColor3 = 'Text'
									},
									TextTransparency = 0.2,
									TextSize = 16,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = 'Y',
									TextWrapped = true,
									Visible = aX.Desc and true or false,
									TextXAlignment = 'Left',
									ZIndex = 100001
								})
							})
						}, true)
						ab.AddSignal(a0.MouseEnter, function()
							ac.Play(a0, 'Hover', {
								ImageTransparency = 0.94
							}, nil, nil, 'ServiceHover')
						end)
						ab.AddSignal(a0.InputEnded, function()
							ac.Play(a0, 'Hover', {
								ImageTransparency = 1
							}, nil, nil, 'ServiceHover')
						end)
						ac.AttachPress(a0, ab, {
							Amount = 0.985
						})
						ab.AddSignal(a0.MouseButton1Click, function()
							CopyServiceLink(aW)
						end)
					end
					ab.AddSignal(aQ.MouseButton1Click, function()
						if not aP then
							ac.Play(aU, 'Expand', {
								Size = UDim2.new(0, aO, 0, aT.AbsoluteSize.Y + 1)
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'KeyService')
							ac.Play(aS, 'Expand', {
								Rotation = 180
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'KeyServiceChevron')
						else
							ac.Play(aU, 'Expand', {
								Size = UDim2.new(0, aO, 0, 0)
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'KeyService')
							ac.Play(aS, 'Expand', {
								Rotation = 0
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'KeyServiceChevron')
						end
						aP = not aP
					end)
				end
			end
			local function handleSuccess(aN, aO)
				SetState('Access granted', 1)
				am:Close()()
				if aO and writefile then
					pcall(function()
						writefile((ah.Folder or 'Temp') .. '/' .. ai .. '.key', tostring(aN))
					end)
				end
				task.wait(0.35)
				aj(true)
			end
			local aN = false
			local aO = af('Submit', 'arrow-right', function()
				if aN then
					return
				end
				aN = true
				SetState('Checking key', 0.72)
				local aO = tostring(ap or 'empty')
				local function Reject(aP)
					aN = false
					SetState('Invalid key', 0.08, true)
					ah.WindUI:Notify{
						Title = 'Key System',
						Content = aP or 'Invalid key.',
						Icon = 'triangle-alert',
						Style = 'Error'
					}
				end
				if ah.KeySystem.KeyValidator then
					local aP, aQ, aR = pcall(ah.KeySystem.KeyValidator, aO)
					if not aP then
						Reject(tostring(aQ))
						return
					end
					if aQ then
						handleSuccess(aO, ah.KeySystem.SaveKey)
					else
						Reject(aR or 'Invalid key.')
					end
				elseif not ah.KeySystem.API then
					local aP = type(ah.KeySystem.Key) == 'table' and table.find(ah.KeySystem.Key, aO) or ah.KeySystem.Key == aO
					if aP then
						handleSuccess(aO, ah.KeySystem.SaveKey)
					else
						Reject'Invalid key.'
					end
				else
					local aP, aQ
					for aR, aS in next, an do
						local aT, aU, aV = pcall(aS.Verify, aO)
						if not aT then
							local aW = aU
							aU = false
							aV = tostring(aW)
						end
						if aU then
							aP, aQ = true, aV
							break
						end
						aQ = aV
					end
					if aP then
						handleSuccess(aO, ah.KeySystem.SaveKey ~= false)
					else
						Reject(aQ or 'Invalid key.')
					end
				end
			end, 'Primary', aK)
			aO.AnchorPoint = Vector2.new(1, 0.5)
			aO.Position = UDim2.new(1, 0, 0.5, 0)
			SetState('Waiting for key', 0.18)
			am:Open()
			ac.Play(au, 'DropdownOpen', {
				Scale = 1
			}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'KeySystemScale')
		end
		return aa
	end
	function a.r()
		local aa, ab, ac = {}, a.load'd', a.load'e'
		local ad, ae = ab.New, game:GetService'Workspace'
		local function AsConfig(af)
			if af == true then
				return {}
			end
			return typeof(af) == 'table' and af or {}
		end
		local function ClampProgress(af)
			return math.clamp(tonumber(af) or 0, 0, 1)
		end
		local function CreateIcon(af, ag, ah, ai)
			local aj = ab.Image(af or 'sparkles', af or 'sparkles', 0, ai or 'Temp', 'LoadingScreen', true, true)
			aj.Size = UDim2.fromOffset(ah or 22, ah or 22)
			aj.Parent = ag
			return aj
		end
		local function GetViewportSize()
			local af = ae.CurrentCamera
			return af and af.ViewportSize or Vector2.new(1280, 720)
		end
		function aa.new(af, ag)
			ag = AsConfig(ag)
			local ah = ag.Steps or {
				'Theme',
				'Motion',
				'Interface'
			}
			if # ah == 0 then
				ah = {
					'Interface'
				}
			end
			local ai = GetViewportSize()
			local aj, ak, al, am = math.floor(math.min(ag.Width or 360, math.max(286, ai.X - 28))), math.max(tonumber(ag.Height) or 188, 168), {
				Closed = false,
				Progress = ClampProgress(ag.Progress or 0.08),
				UIElements = {}
			}, ad('Frame', {
				Name = ag.Name or 'WindUILoadingScreen',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Active = true,
				ZIndex = ag.ZIndex or 11000,
				Parent = ag.Parent or af.ScreenGui
			})
			local an, ao = ad('Frame', {
				Name = 'Scrim',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 1,
				ZIndex = am.ZIndex,
				Parent = am
			}), ad('CanvasGroup', {
				Name = 'Content',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				GroupTransparency = 1,
				ZIndex = am.ZIndex + 1,
				Parent = am
			})
			local ap = ab.NewRoundFrame(ag.Corner or 28, 'Squircle', {
				Name = 'Card',
				Size = UDim2.fromOffset(aj, ak),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ImageTransparency = 1,
				ZIndex = am.ZIndex + 2,
				Parent = ao,
				ThemeTag = {
					ImageColor3 = 'Background'
				}
			}, {
				ad('UIScale', {
					Name = 'Scale',
					Scale = 0.96
				}),
				ab.NewRoundFrame(ag.Corner or 28, 'SquircleGlass', {
					Name = 'Glass',
					Size = UDim2.new(1, 1, 1, 1),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ImageTransparency = 0.82,
					ZIndex = am.ZIndex + 3,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				}),
				ab.NewRoundFrame(ag.Corner or 28, 'SquircleOutline', {
					Name = 'Outline',
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.64,
					ZIndex = am.ZIndex + 4,
					ThemeTag = {
						ImageColor3 = 'Outline'
					}
				})
			})
			ab.CreateUIShadow(ap, {
				BlurRadius = UDim.new(0, tonumber(ag.ShadowBlur) or 24),
				Color = Color3.new(0, 0, 0),
				Offset = UDim2.fromOffset(0, 8),
				Spread = UDim2.fromOffset(2, 2),
				Transparency = ab.ClampTransparency(ag.ShadowTransparency, 0.42),
				ZIndex = 0
			})
			local aq = ad('Frame', {
				Name = 'Body',
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				ZIndex = am.ZIndex + 5,
				Parent = ap
			}, {
				ad('UIPadding', {
					PaddingTop = UDim.new(0, 16),
					PaddingLeft = UDim.new(0, 16),
					PaddingRight = UDim.new(0, 16),
					PaddingBottom = UDim.new(0, 16)
				}),
				ad('UIListLayout', {
					FillDirection = 'Vertical',
					Padding = UDim.new(0, 10),
					SortOrder = 'LayoutOrder'
				})
			})
			local ar = ab.NewRoundFrame(24, 'Squircle', {
				Name = 'Accent',
				Size = UDim2.new(1, 0, 0, 64),
				ImageTransparency = 0.82,
				LayoutOrder = 1,
				ZIndex = am.ZIndex + 5,
				Parent = aq,
				ThemeTag = {
					ImageColor3 = 'Primary'
				}
			}, {
				ad('UIGradient', {
					Name = 'AccentGradient',
					Rotation = 18,
					Offset = Vector2.new(- 0.25, 0),
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.1),
						NumberSequenceKeypoint.new(0.5, 0.24),
						NumberSequenceKeypoint.new(1, 0.5)
					}
				}),
				ad('UIPadding', {
					PaddingLeft = UDim.new(0, 14),
					PaddingRight = UDim.new(0, 14)
				}),
				ad('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					Padding = UDim.new(0, 12)
				})
			})
			local as = ab.NewRoundFrame(999, 'Squircle', {
				Size = UDim2.fromOffset(42, 42),
				ImageTransparency = 0.72,
				ZIndex = am.ZIndex + 6,
				Parent = ar,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			})
			local at = CreateIcon(ag.Icon or 'sparkles', as, 21, ag.Folder)
			at.AnchorPoint = Vector2.new(0.5, 0.5)
			at.Position = UDim2.new(0.5, 0, 0.5, 0)
			local au = ad('Frame', {
				Size = UDim2.new(1, - 54, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ar,
				ZIndex = am.ZIndex + 6
			}, {
				ad('UIListLayout', {
					FillDirection = 'Vertical',
					Padding = UDim.new(0, 3)
				})
			})
			ad('TextLabel', {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Text = ag.Title or 'WindUI',
				TextSize = 18,
				TextXAlignment = 'Left',
				TextWrapped = true,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Bold),
				Parent = au,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			ad('TextLabel', {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Text = ag.Desc or 'Preparing interface',
				TextSize = 13,
				TextTransparency = 0.34,
				TextXAlignment = 'Left',
				TextWrapped = true,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				Parent = au,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			local av = ad('Frame', {
				Name = 'StatusRow',
				Size = UDim2.new(1, 0, 0, 18),
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Parent = aq
			})
			local aw, ax, ay, az, aA = ad('TextLabel', {
				Name = 'Status',
				Size = UDim2.new(1, - 48, 1, 0),
				BackgroundTransparency = 1,
				Text = ag.Status or ah[1] or 'Loading',
				TextSize = 13,
				TextTransparency = 0.18,
				TextXAlignment = 'Left',
				TextTruncate = 'AtEnd',
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				Parent = av,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), ad('TextLabel', {
				Name = 'Percent',
				Size = UDim2.new(0, 44, 1, 0),
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Text = tostring(math.floor(al.Progress * 100 + 0.5)) .. '%',
				TextSize = 12,
				TextTransparency = 0.36,
				TextXAlignment = 'Right',
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				Parent = av,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), ab.NewRoundFrame(999, 'Squircle', {
				Name = 'ProgressTrack',
				Size = UDim2.new(1, 0, 0, 10),
				ImageTransparency = 0.82,
				LayoutOrder = 3,
				ZIndex = am.ZIndex + 5,
				Parent = aq,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ab.NewRoundFrame(999, 'Squircle', {
					Name = 'Fill',
					Size = UDim2.new(al.Progress, 0, 1, 0),
					ImageTransparency = 0.06,
					ZIndex = am.ZIndex + 6,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				}, {
					ad('UIGradient', {
						Name = 'FillGradient',
						Rotation = 0,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.05),
							NumberSequenceKeypoint.new(0.5, 0),
							NumberSequenceKeypoint.new(1, 0.18)
						}
					})
				})
			}), ad('Frame', {
				Name = 'Steps',
				Size = UDim2.new(1, 0, 0, 28),
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Parent = aq
			}, {
				ad('UIListLayout', {
					FillDirection = 'Horizontal',
					Padding = UDim.new(0, 8)
				})
			}), {}
			for aB, aC in next, ah do
				local aD = ab.NewRoundFrame(12, 'Squircle', {
					Size = UDim2.new(1 / # ah, - 6, 1, 0),
					ImageTransparency = aB == 1 and 0.84 or 0.94,
					Parent = az,
					ThemeTag = {
						ImageColor3 = 'ElementBackground'
					}
				}, {
					ad('UIPadding', {
						PaddingLeft = UDim.new(0, 8),
						PaddingRight = UDim.new(0, 8)
					}),
					ad('TextLabel', {
						Name = 'Title',
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Text = tostring(aC),
						TextSize = 11,
						TextTransparency = aB == 1 and 0.08 or 0.4,
						TextTruncate = 'AtEnd',
						FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
				})
				table.insert(aA, aD)
			end
			local aB, aC = 0, 1
			local function UpdateStepVisuals(aD)
				aC = math.clamp(tonumber(aD) or 1, 1, math.max(# aA, 1))
				for aE, aF in next, aA do
					local aG = aE <= aC
					ac.Play(aF, 'Switch', {
						ImageTransparency = aG and 0.84 or 0.94
					}, nil, nil, 'Step')
					if aF.Title then
						ac.Play(aF.Title, 'Switch', {
							TextTransparency = aG and 0.08 or 0.4
						}, nil, nil, 'StepText')
					end
				end
			end
			function al.SetStatus(aD, aE)
				aw.Text = tostring(aE or '')
				return al
			end
			function al.SetProgress(aD, aE)
				al.Progress = ClampProgress(aE)
				ax.Text = tostring(math.floor(al.Progress * 100 + 0.5)) .. '%'
				ac.Play(ay.Fill, 'Switch', {
					Size = UDim2.new(al.Progress, 0, 1, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'LoadingProgress')
				if # aA > 0 and ag.SyncSteps ~= false then
					UpdateStepVisuals(math.clamp(math.ceil(al.Progress * # aA), 1, # aA))
				end
				return al
			end
			function al.Step(aD, aE, aF)
				local aG = math.max(# aA, 1)
				local aH = math.clamp(tonumber(aE) or 1, 1, aG)
				if aF then
					al:SetStatus(aF)
				else
					al:SetStatus(ah[aH] or aw.Text)
				end
				local aI = aG == 1 and 1 or (aH - 1) / (aG - 1)
				al:SetProgress(aI)
				UpdateStepVisuals(aH)
				return al
			end
			function al.Close(aD, aE)
				if al.Closed then
					return al
				end
				aB += 1
				al.Closed = true
				task.delay(tonumber(aE) or 0, function()
					ac.Play(ao, 'DropdownClose', {
						GroupTransparency = 1
					}, nil, nil, 'LoadingContent')
					ac.Play(an, 'DropdownClose', {
						BackgroundTransparency = 1
					}, nil, nil, 'LoadingScrim')
					ac.Play(ap, 'DropdownClose', {
						ImageTransparency = 1
					}, nil, nil, 'LoadingCard')
					ac.Play(ap.Scale, 'DropdownClose', {
						Scale = 0.96
					}, nil, nil, 'LoadingScale')
					task.wait(ac.GetDuration'DropdownClose' + 0.03)
					if am then
						am:Destroy()
					end
				end)
				return al
			end
			function al.Open(aD)
				aB += 1
				al.Closed = false
				am.Visible = true
				an.BackgroundTransparency = 1
				ao.GroupTransparency = 1
				ap.ImageTransparency = 1
				ap.Scale.Scale = 0.96
				ac.Play(an, 'DropdownOpen', {
					BackgroundTransparency = ag.ScrimTransparency or 0.2
				}, nil, nil, 'LoadingScrim')
				ac.Play(ao, 'DropdownOpen', {
					GroupTransparency = 0
				}, nil, nil, 'LoadingContent')
				ac.Play(ap, 'DropdownOpen', {
					ImageTransparency = ag.CardTransparency or 0.16
				}, nil, nil, 'LoadingCard')
				ac.Play(ap.Scale, 'DropdownOpen', {
					Scale = 1
				}, nil, nil, 'LoadingScale')
				return al
			end
			function al.Play(aD, aE)
				local aF = math.max(tonumber(aE) or tonumber(ag.Duration) or 1.2, 0.05)
				aB += 1
				local aG, aH, aI = aB, os.clock(), 0
				task.spawn(function()
					while aG == aB and not al.Closed and am.Parent do
						local aJ = math.clamp((os.clock() - aH) / aF, 0, 1)
						local aK = math.clamp(math.floor(aJ * # ah) + 1, 1, math.max(# ah, 1))
						if aK ~= aI then
							aI = aK
							if ag.AutoStatus ~= false and ah[aK] then
								al:SetStatus(ah[aK])
							end
						end
						al:SetProgress(aJ)
						if aJ >= 1 then
							break
						end
						task.wait(0.05)
					end
					if aG ~= aB or al.Closed or not am.Parent then
						return
					end
					al:SetStatus(ag.CompleteStatus or 'Ready')
					al:SetProgress(1)
					al:Close(ag.CloseDelay or 0.18)
				end)
				return al
			end
			al.UIElements.Root = am
			al.UIElements.Scrim = an
			al.UIElements.Content = ao
			al.UIElements.Card = ap
			al.UIElements.Body = aq
			al.UIElements.Status = aw
			al.UIElements.Percent = ax
			al.UIElements.ProgressFill = ay.Fill
			al:Open()
			if ac:IsEnabled() and not ac.Reduced then
				task.spawn(function()
					local aD = 1
					while not al.Closed and ar and ar.Parent do
						local aE, aF = ar:FindFirstChild'AccentGradient', ay.Fill and ay.Fill:FindFirstChild'FillGradient'
						if aE then
							ac.Play(aE, 'Background', {
								Offset = Vector2.new(aD * 0.28, 0)
							}, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 'LoadingSheen')
						end
						if aF then
							ac.Play(aF, 'Background', {
								Offset = Vector2.new(aD * 0.38, 0)
							}, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 'LoadingFillSheen')
						end
						aD *= - 1
						task.wait(ac.GetDuration'Background' + 0.18)
					end
				end)
			end
			if ag.Duration or ag.AutoClose then
				al:Play(tonumber(ag.Duration) or 1.2)
			end
			return al
		end
		return aa
	end
	function a.s()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local function map(ab, ac, ad, ae, af)
			return (ab - ac) * (af - ae) / (ad - ac) + ae
		end
		local function viewportPointToWorld(ab, ac)
			local ad = aa(game:GetService'Workspace').CurrentCamera:ScreenPointToRay(ab.X, ab.Y)
			return ad.Origin + ad.Direction * ac
		end
		local function getOffset()
			local ab = aa(game:GetService'Workspace').CurrentCamera.ViewportSize.Y
			return map(ab, 0, 2560, 8, 56)
		end
		return {
			viewportPointToWorld,
			getOffset
		}
	end
	function a.t()
		local aa, ab = (cloneref or clonereference or function(aa)
			return aa
		end), a.load'd'
		local ac, ad, ae = ab.New, unpack(a.load's')
		local af = Instance.new('Folder', aa(game:GetService'Workspace').CurrentCamera)
		local function createAcrylic()
			local ag = ac('Part', {
				Name = 'Body',
				Color = Color3.new(0, 0, 0),
				Material = Enum.Material.Glass,
				Size = Vector3.new(1, 1, 0),
				Anchored = true,
				CanCollide = false,
				Locked = true,
				CastShadow = false,
				Transparency = 0.98
			}, {
				ac('SpecialMesh', {
					MeshType = Enum.MeshType.Brick,
					Offset = Vector3.new(0, 0, - 1E-6)
				})
			})
			return ag
		end
		local function createAcrylicBlur(ag)
			local ah = {}
			ag = ag or 0.001
			local ai, aj = {
				topLeft = Vector2.new(),
				topRight = Vector2.new(),
				bottomRight = Vector2.new()
			}, createAcrylic()
			aj.Parent = af
			local function updatePositions(ak, al)
				ai.topLeft = al
				ai.topRight = al + Vector2.new(ak.X, 0)
				ai.bottomRight = al + ak
			end
			local function render()
				local ak = aa(game:GetService'Workspace').CurrentCamera
				if ak then
					ak = ak.CFrame
				end
				local al = ak
				if not al then
					al = CFrame.new()
				end
				local am, an, ao, ap = al, ai.topLeft, ai.topRight, ai.bottomRight
				local aq, ar, as = ad(an, ag), ad(ao, ag), ad(ap, ag)
				local at, au = (ar - aq).Magnitude, (ar - as).Magnitude
				aj.CFrame = CFrame.fromMatrix((aq + as) / 2, am.XVector, am.YVector, am.ZVector)
				aj.Mesh.Scale = Vector3.new(at, au, 0)
			end
			local function onChange(ak)
				local al = ae()
				local am, an = ak.AbsoluteSize - Vector2.new(al, al), ak.AbsolutePosition + Vector2.new(al / 2, al / 2)
				updatePositions(am, an)
				task.spawn(render)
			end
			local function renderOnChange()
				local ak = aa(game:GetService'Workspace').CurrentCamera
				if not ak then
					return
				end
				table.insert(ah, ak:GetPropertyChangedSignal'CFrame':Connect(render))
				table.insert(ah, ak:GetPropertyChangedSignal'ViewportSize':Connect(render))
				table.insert(ah, ak:GetPropertyChangedSignal'FieldOfView':Connect(render))
				task.spawn(render)
			end
			aj.Destroying:Connect(function()
				for ak, al in ah do
					pcall(function()
						al:Disconnect()
					end)
				end
			end)
			renderOnChange()
			return onChange, aj
		end
		return function(ag)
			local ah, ai, aj = {}, createAcrylicBlur(ag)
			local ak = ac('Frame', {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1)
			})
			ab.AddSignal(ak:GetPropertyChangedSignal'AbsolutePosition', function()
				ai(ak)
			end)
			ab.AddSignal(ak:GetPropertyChangedSignal'AbsoluteSize', function()
				ai(ak)
			end)
			ah.AddParent = function(al)
				ab.AddSignal(al:GetPropertyChangedSignal'Visible', function()
				end)
			end
			ah.SetVisibility = function(al)
				aj.Transparency = al and 0.98 or 1
			end
			ah.Frame = ak
			ah.Model = aj
			return ah
		end
	end
	function a.u()
		local aa, ab = a.load'd', a.load't'
		local ac = aa.New
		return function(ad)
			local ae = {}
			ae.Frame = ac('Frame', {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0
			}, {
				ac('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				ac('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Name = 'Background',
					ThemeTag = {
						BackgroundColor3 = 'AcrylicMain'
					}
				}, {
					ac('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				ac('Frame', {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1)
				}, {}),
				ac('ImageLabel', {
					Image = 'rbxassetid://9968344105',
					ImageTransparency = 0.98,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1
				}, {
					ac('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				ac('ImageLabel', {
					Image = 'rbxassetid://9968344227',
					ImageTransparency = 0.9,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageTransparency = 'AcrylicNoise'
					}
				}, {
					ac('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				}),
				ac('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2
				}, {})
			})
			local af
			task.wait()
			if ad.UseAcrylic then
				af = ab()
				af.Frame.Parent = ae.Frame
				ae.Model = af.Model
				ae.AddParent = af.AddParent
				ae.SetVisibility = af.SetVisibility
			end
			return ae, af
		end
	end
	function a.v()
		local aa, ab = (cloneref or clonereference or function(aa)
			return aa
		end), {
			AcrylicBlur = a.load't',
			AcrylicPaint = a.load'u'
		}
		function ab.init()
			local ac = Instance.new'DepthOfFieldEffect'
			ac.FarIntensity = 0
			ac.InFocusRadius = 0.1
			ac.NearIntensity = 1
			local ad = {}
			function ab.Enable()
				for ae, af in pairs(ad) do
					af.Enabled = false
				end
				ac.Parent = aa(game:GetService'Lighting')
			end
			function ab.Disable()
				for ae, af in pairs(ad) do
					af.Enabled = af.enabled
				end
				ac.Parent = nil
			end
			local function registerDefaults()
				local function register(ae)
					if ae:IsA'DepthOfFieldEffect' then
						ad[ae] = {
							enabled = ae.Enabled
						}
					end
				end
				for ae, af in pairs(aa(game:GetService'Lighting'):GetChildren()) do
					register(af)
				end
				if aa(game:GetService'Workspace').CurrentCamera then
					for ae, af in pairs(aa(game:GetService'Workspace').CurrentCamera:GetChildren()) do
						register(af)
					end
				end
			end
			registerDefaults()
			ab.Enable()
		end
		return ab
	end
	function a.w()
		local aa, ab = {}, a.load'd'
		local ac, ad = ab.New, ab.Tween
		function aa.new(ae, af)
			local ag, ah = {
				Title = ae.Title or 'Dialog',
				Content = ae.Content,
				Icon = ae.Icon,
				IconThemed = ae.IconThemed,
				Thumbnail = ae.Thumbnail,
				Buttons = ae.Buttons,
				IconSize = 22
			}, a.load'p'
			local ai, aj, ak = ah.Create(true, 'Popup', ae.WindUI.Window, ae.WindUI, af), 200, 430
			if ag.Thumbnail and ag.Thumbnail.Image then
				ak = 430 + (aj / 2)
			end
			ai.UIElements.Main.AutomaticSize = 'Y'
			ai.UIElements.Main.Size = UDim2.new(0, ak, 0, 0)
			local al
			if ag.Icon then
				al = ab.Image(ag.Icon, ag.Title .. ':' .. ag.Icon, 0, ae.WindUI.Window, 'Popup', true, ae.IconThemed, 'PopupIcon')
				al.Size = UDim2.new(0, ag.IconSize, 0, ag.IconSize)
				al.LayoutOrder = - 1
			end
			local am = ac('TextLabel', {
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Text = ag.Title,
				TextXAlignment = 'Left',
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = 'PopupTitle'
				},
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, al and - ag.IconSize - 14 or 0, 0, 0)
			})
			local an = ac('Frame', {
				BackgroundTransparency = 1,
				AutomaticSize = 'XY'
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 14),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				}),
				al,
				am
			})
			local ao, ap = (ac('Frame', {
				AutomaticSize = 'Y',
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1
			}, {
				an
			}))
			if ag.Content and ag.Content ~= '' then
				ap = ac('TextLabel', {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
					TextXAlignment = 'Left',
					Text = ag.Content,
					TextSize = 18,
					TextTransparency = 0.2,
					ThemeTag = {
						TextColor3 = 'PopupContent'
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true
				})
			end
			local aq, ar = (ac('Frame', {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 9),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Right'
				})
			}))
			if ag.Thumbnail and ag.Thumbnail.Image then
				local as
				if ag.Thumbnail.Title then
					as = ac('TextLabel', {
						Text = ag.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = 'Text'
						},
						TextSize = 18,
						FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = 'XY',
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					})
				end
				ar = ac('ImageLabel', {
					Image = ag.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, aj, 1, 0),
					Parent = ai.UIElements.Main,
					ScaleType = 'Crop'
				}, {
					as,
					ac('UICorner', {
						CornerRadius = UDim.new(0, 0)
					})
				})
			end
			ac('Frame', {
				Size = UDim2.new(1, ar and - aj or 0, 1, 0),
				Position = UDim2.new(0, ar and aj or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = ai.UIElements.Main
			}, {
				ac('Frame', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					ac('UIListLayout', {
						Padding = UDim.new(0, 18),
						FillDirection = 'Vertical'
					}),
					ao,
					ap,
					aq,
					ac('UIPadding', {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16)
					})
				})
			})
			local as = a.load'n'.New
			for at, au in next, ag.Buttons do
				as(au.Title, au.Icon, au.Callback, au.Variant, aq, ai)
			end
			ai:Open()
			return ag
		end
		return aa
	end
	function a.x()
		return function(aa, ab)
			return {
				Dark = {
					Name = "Doggue Hub Theme",
					Primary = Color3.fromRGB(255, 0, 0),
					White = Color3.new(1, 1, 1),
					Black = Color3.new(0, 0, 0),
					Dialog = Color3.fromRGB(15, 15, 15),
					Background = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 0,
					Hover = Color3.new(1, 1, 1),
					PanelBackground = Color3.fromRGB(10, 10, 10),
					PanelBackgroundTransparency = 0.96,
					WindowBackground = Color3.fromRGB(0, 0, 0),
					WindowShadow = Color3.new(0, 0, 0),
					WindowTopbarTitle = Color3.new(1, 1, 1),
					WindowTopbarAuthor = Color3.fromRGB(210, 210, 210),
					WindowTopbarButtonIcon = Color3.fromRGB(255, 0, 0),
					WindowSearchBarBackground = Color3.fromRGB(20, 20, 20),
					TabBackground = Color3.fromRGB(255, 0, 0),
					TabBackgroundHover = Color3.fromRGB(255, 0, 0),
					TabBackgroundHoverTransparency = 0.90,
					TabBackgroundActive = Color3.fromRGB(255, 0, 0),
					TabBackgroundActiveTransparency = 0.80,
					TabText = Color3.new(1, 1, 1),
					TabTextTransparency = 0.35,
					TabTextTransparencyActive = 0,
					TabTitle = Color3.new(1, 1, 1),
					TabIcon = Color3.fromRGB(255, 0, 0),
					TabIconTransparency = 0.25,
					TabIconTransparencyActive = 0,
					TabBorderTransparency = 1,
					TabBorderTransparencyActive = 0.4,
					TabBorder = Color3.fromRGB(255, 0, 0),
					ElementBackground = Color3.fromRGB(20, 20, 20),
					ElementBackgroundTransparency = 0.94,
					ElementTitle = Color3.new(1, 1, 1),
					ElementDesc = Color3.fromRGB(220, 220, 220),
					ElementIcon = Color3.fromRGB(255, 0, 0),
					PopupBackground = Color3.fromRGB(0, 0, 0),
					PopupBackgroundTransparency = "BackgroundTransparency",
					PopupTitle = Color3.new(1, 1, 1),
					PopupContent = Color3.fromRGB(220, 220, 220),
					PopupIcon = Color3.fromRGB(255, 0, 0),
					DialogBackground = Color3.fromRGB(30, 30, 30),
					DialogBackgroundTransparency = "BackgroundTransparency",
					DialogTitle = Color3.new(1, 1, 1),
					DialogContent = Color3.fromRGB(220, 220, 220),
					DialogIcon = Color3.fromRGB(255, 255, 255),
					Toggle = Color3.fromRGB(255, 0, 0),
					ToggleBar = Color3.new(1, 1, 1),
					Checkbox = Color3.fromRGB(255, 0, 0),
					CheckboxIcon = Color3.new(1, 1, 1),
					CheckboxBorder = Color3.fromRGB(255, 0, 0),
					CheckboxBorderTransparency = 0.4,
					SliderIcon = Color3.fromRGB(255, 0, 0),
					Slider = Color3.fromRGB(255, 0, 0),
					SliderThumb = Color3.new(1, 1, 1),
					SliderIconFrom = Color3.fromRGB(255, 0, 0),
					SliderIconTo = Color3.fromRGB(255, 0, 0),
					Tooltip = Color3.fromRGB(20, 20, 20),
					TooltipText = Color3.new(1, 1, 1),
					TooltipSecondary = Color3.fromRGB(255, 0, 0),
					TooltipSecondaryText = Color3.new(1, 1, 1),
					TabSectionIcon = Color3.fromRGB(255, 0, 0),
					SectionIcon = Color3.fromRGB(255, 0, 0),
					SectionExpandIcon = Color3.new(1, 1, 1),
					SectionExpandIconTransparency = 0.3,
					SectionBox = Color3.fromRGB(255, 0, 0),
					SectionBoxTransparency = 0.97,
					SectionBoxBorder = Color3.fromRGB(255, 0, 0),
					SectionBoxBorderTransparency = 0.45,
					SectionBoxBackground = Color3.fromRGB(255, 0, 0),
					SectionBoxBackgroundTransparency = 0.97,
					SearchBarBorder = Color3.fromRGB(20, 20, 20),
					SearchBarBorderTransparency = 0.55,
					Notification = Color3.fromRGB(0, 0, 0),
					NotificationTitle = Color3.new(1, 1, 1),
					NotificationTitleTransparency = 0,
					NotificationContent = Color3.fromRGB(225, 225, 225),
					NotificationContentTransparency = 0.2,
					NotificationDuration = Color3.fromRGB(255, 0, 0),
					NotificationDurationTransparency = 0.1,
					NotificationBorder = Color3.fromRGB(255, 0, 0),
					NotificationBorderTransparency = 0.45,
					DropdownTabBorder = Color3.fromRGB(255, 0, 0),
					LabelBackground = Color3.fromRGB(255, 0, 0),
					LabelBackgroundTransparency = 0.97
				},
				Light = {
					Name = 'Light',
					Accent = Color3.fromHex'#efefef',
					Dialog = Color3.fromHex'#f4f4f5',
					Outline = Color3.fromHex'#ffffff',
					Text = Color3.fromHex'#000000',
					Placeholder = Color3.fromHex'#555555',
					Background = Color3.fromHex'#FFFFFF',
					Button = Color3.fromHex'#18181b',
					Icon = Color3.fromHex'#52525b',
					Toggle = Color3.fromHex'#33C759',
					Slider = Color3.fromHex'#0091FF',
					Checkbox = Color3.fromHex'#0091FF',
					DropdownTabBackground = Color3.fromHex'#bebebe',
					DropdownBackground = Color3.fromHex'#ffffff',
					TabBackground = Color3.fromHex'#ffffff',
					TabBackgroundHover = Color3.fromHex'#f3f3f3',
					TabBackgroundHoverTransparency = 0,
					TabBackgroundActive = Color3.fromHex'#efefef',
					TabBackgroundActiveTransparency = 0,
					PanelBackground = Color3.fromHex'#efefef',
					PanelBackgroundTransparency = 0,
					LabelBackground = Color3.fromHex'#efefef',
					LabelBackgroundTransparency = 0,
					ElementBackground = Color3.fromHex'#ffffff',
					ElementBackgroundTransparency = 0
				},
				Rose = {
					Name = 'Rose',
					Accent = Color3.fromHex'#be185d',
					Dialog = Color3.fromHex'#4c0519',
					Text = Color3.fromHex'#fdf2f8',
					Placeholder = Color3.fromHex'#d67aa6',
					Background = Color3.fromHex'#1f0308',
					Button = Color3.fromHex'#e95f74',
					Icon = Color3.fromHex'#fb7185',
					ElementBackground = Color3.fromHex'#381E23',
					ElementBackgroundTransparency = 0
				},
				Plant = {
					Name = 'Plant',
					Accent = Color3.fromHex'#166534',
					Dialog = Color3.fromHex'#052e16',
					Text = Color3.fromHex'#f0fdf4',
					Placeholder = Color3.fromHex'#4fbf7a',
					Background = Color3.fromHex'#0a1b0f',
					Button = Color3.fromHex'#16a34a',
					Icon = Color3.fromHex'#4ade80',
					ElementBackground = Color3.fromHex'#28342A',
					ElementBackgroundTransparency = 0
				},
				Red = {
					Name = 'Red',
					Accent = Color3.fromHex'#991b1b',
					Dialog = Color3.fromHex'#450a0a',
					Text = Color3.fromHex'#fef2f2',
					Placeholder = Color3.fromHex'#d95353',
					Background = Color3.fromHex'#1c0606',
					Button = Color3.fromHex'#dc2626',
					Icon = Color3.fromHex'#ef4444',
					ElementBackground = Color3.fromHex'#322221',
					ElementBackgroundTransparency = 0
				},
				Indigo = {
					Name = 'Indigo',
					Accent = Color3.fromHex'#3730a3',
					Dialog = Color3.fromHex'#1e1b4b',
					Text = Color3.fromHex'#f1f5f9',
					Placeholder = Color3.fromHex'#7078d9',
					Background = Color3.fromHex'#0f0a2e',
					Button = Color3.fromHex'#4f46e5',
					Icon = Color3.fromHex'#6366f1',
					ElementBackground = Color3.fromHex'#282543',
					ElementBackgroundTransparency = 0
				},
				Sky = {
					Name = 'Sky',
					Accent = Color3.fromHex'#00d4ff',
					Dialog = Color3.fromHex'#0a4d66',
					Text = Color3.fromHex'#e6f7ff',
					Placeholder = Color3.fromHex'#66b3cc',
					Background = Color3.fromHex'#051a26',
					Button = Color3.fromHex'#00a8cc',
					Icon = Color3.fromHex'#2db8d9',
					Toggle = Color3.fromHex'#00d9d9',
					Slider = Color3.fromHex'#00d4ff',
					Checkbox = Color3.fromHex'#00d4ff',
					PanelBackground = Color3.fromHex'#0d3a47',
					PanelBackgroundTransparency = 0.8,
					ElementBackground = Color3.fromHex'#172E3B',
					ElementBackgroundTransparency = 0
				},
				Violet = {
					Name = 'Violet',
					Accent = Color3.fromHex'#6d28d9',
					Dialog = Color3.fromHex'#3c1361',
					Text = Color3.fromHex'#faf5ff',
					Placeholder = Color3.fromHex'#8f7ee0',
					Background = Color3.fromHex'#1e0a3e',
					Button = Color3.fromHex'#7c3aed',
					Icon = Color3.fromHex'#8b5cf6',
					ElementBackground = Color3.fromHex'#342650',
					ElementBackgroundTransparency = 0
				},
				Amber = {
					Name = 'Amber',
					Accent = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#b45309',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#d97706',
							Transparency = 0
						}
					}, {
						Rotation = 45
					}),
					Dialog = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#451a03',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#6b2e05',
							Transparency = 0
						}
					}, {
						Rotation = 90
					}),
					Text = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#fffbeb',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#fff7ed',
							Transparency = 0
						}
					}, {
						Rotation = 45
					}),
					Placeholder = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#d1a326',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#fbbf24',
							Transparency = 0
						}
					}, {
						Rotation = 45
					}),
					Background = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#1c1003',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#3f210d',
							Transparency = 0
						}
					}, {
						Rotation = 90
					}),
					Button = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#d97706',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#f59e0b',
							Transparency = 0
						}
					}, {
						Rotation = 45
					}),
					Icon = Color3.fromHex'#f59e0b',
					Toggle = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#d97706',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#f59e0b',
							Transparency = 0
						}
					}, {
						Rotation = 45
					}),
					Slider = Color3.fromHex'#d97706',
					Checkbox = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#d97706',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#fbbf24',
							Transparency = 0
						}
					}, {
						Rotation = 45
					}),
					PanelBackground = Color3.fromHex'#FFFFFF',
					PanelBackgroundTransparency = 0.95,
					ElementBackground = Color3.fromHex'#3A2E22',
					ElementBackgroundTransparency = 0
				},
				Emerald = {
					Name = 'Emerald',
					Accent = Color3.fromHex'#047857',
					Dialog = Color3.fromHex'#022c22',
					Text = Color3.fromHex'#ecfdf5',
					Placeholder = Color3.fromHex'#3fbf8f',
					Background = Color3.fromHex'#011411',
					Button = Color3.fromHex'#059669',
					Icon = Color3.fromHex'#10b981',
					ElementBackground = Color3.fromHex'#202E2A',
					ElementBackgroundTransparency = 0
				},
				Midnight = {
					Name = 'Midnight',
					Accent = Color3.fromHex'#1e3a8a',
					Dialog = Color3.fromHex'#0c1e42',
					Text = Color3.fromHex'#dbeafe',
					Placeholder = Color3.fromHex'#2f74d1',
					Background = Color3.fromHex'#0a0f1e',
					Button = Color3.fromHex'#2563eb',
					Primary = Color3.fromHex'#2563eb',
					Icon = Color3.fromHex'#5591f4',
					ElementBackground = Color3.fromHex'#242836',
					ElementBackgroundTransparency = 0
				},
				Crimson = {
					Name = 'Crimson',
					Accent = Color3.fromHex'#b91c1c',
					Dialog = Color3.fromHex'#450a0a',
					Text = Color3.fromHex'#fef2f2',
					Placeholder = Color3.fromHex'#6f757b',
					Background = Color3.fromHex'#0c0404',
					Button = Color3.fromHex'#991b1b',
					Icon = Color3.fromHex'#dc2626',
					ElementBackground = Color3.fromHex'#251F1F',
					ElementBackgroundTransparency = 0
				},
				MonokaiPro = {
					Name = 'Monokai Pro',
					Accent = Color3.fromHex'#fc9867',
					Dialog = Color3.fromHex'#1e1e1e',
					Text = Color3.fromHex'#fcfcfa',
					Placeholder = Color3.fromHex'#afafaf',
					Background = Color3.fromHex'#191622',
					Button = Color3.fromHex'#ab9df2',
					Icon = Color3.fromHex'#a9dc76',
					ElementBackground = Color3.fromHex'#323039',
					ElementBackgroundTransparency = 0,
					Metadata = {
						PullRequest = 23
					}
				},
				CottonCandy = {
					Name = 'Cotton Candy',
					Accent = Color3.fromHex'#ec4899',
					Dialog = Color3.fromHex'#2d1b3d',
					Text = Color3.fromHex'#fdf2f8',
					Placeholder = Color3.fromHex'#8a5fd3',
					Background = Color3.fromHex'#1a0b2e',
					Button = Color3.fromHex'#d946ef',
					Slider = Color3.fromHex'#d946ef',
					Icon = Color3.fromHex'#06b6d4',
					ElementBackground = Color3.fromHex'#312643',
					ElementBackgroundTransparency = 0
				},
				Mellowsi = {
					Name = 'Mellowsi',
					Accent = Color3.fromHex'#342A1E',
					Dialog = Color3.fromHex'#291C13',
					Text = Color3.fromHex'#F5EBDD',
					Placeholder = Color3.fromHex'#9C8A73',
					Background = Color3.fromHex'#1C1002',
					Button = Color3.fromHex'#342A1E',
					Icon = Color3.fromHex'#C9B79C',
					Toggle = Color3.fromHex'#a9873f',
					Slider = Color3.fromHex'#C9A24D',
					Checkbox = Color3.fromHex'#C9A24D',
					ElementBackground = Color3.fromHex'#33291E',
					ElementBackgroundTransparency = 0,
					Metadata = {
						PullRequest = 52
					}
				},
				Rainbow = {
					Name = 'Rainbow',
					Accent = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#00ff41',
							Transparency = 0
						},
						['33'] = {
							Color = Color3.fromHex'#00ffff',
							Transparency = 0
						},
						['66'] = {
							Color = Color3.fromHex'#0080ff',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#8000ff',
							Transparency = 0
						}
					}, {
						Rotation = 45
					}),
					Dialog = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#ff0080',
							Transparency = 0
						},
						['25'] = {
							Color = Color3.fromHex'#8000ff',
							Transparency = 0
						},
						['50'] = {
							Color = Color3.fromHex'#0080ff',
							Transparency = 0
						},
						['75'] = {
							Color = Color3.fromHex'#00ff80',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#ff8000',
							Transparency = 0
						}
					}, {
						Rotation = 135
					}),
					Text = Color3.fromHex'#ffffff',
					Placeholder = Color3.fromHex'#00ff80',
					Background = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#ff0040',
							Transparency = 0
						},
						['20'] = {
							Color = Color3.fromHex'#ff4000',
							Transparency = 0
						},
						['40'] = {
							Color = Color3.fromHex'#ffff00',
							Transparency = 0
						},
						['60'] = {
							Color = Color3.fromHex'#00ff40',
							Transparency = 0
						},
						['80'] = {
							Color = Color3.fromHex'#0040ff',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#4000ff',
							Transparency = 0
						}
					}, {
						Rotation = 90
					}),
					Button = aa:Gradient({
						['0'] = {
							Color = Color3.fromHex'#ff0080',
							Transparency = 0
						},
						['25'] = {
							Color = Color3.fromHex'#ff8000',
							Transparency = 0
						},
						['50'] = {
							Color = Color3.fromHex'#ffff00',
							Transparency = 0
						},
						['75'] = {
							Color = Color3.fromHex'#80ff00',
							Transparency = 0
						},
						['100'] = {
							Color = Color3.fromHex'#00ffff',
							Transparency = 0
						}
					}, {
						Rotation = 60
					}),
					Icon = Color3.fromHex'#ffffff'
				}
			}
		end
	end
	function a.y()
		local aa, ab = {}, a.load'd'
		local ac, ad = ab.New, ab.Tween
		function aa.New(ae, af, ag, ah, ai, aj)
			local ak, al = ai or 10
			if af and af ~= '' then
				al = ac('ImageLabel', {
					Image = ab.Icon(af)[1],
					ImageRectSize = ab.Icon(af)[2].ImageRectSize,
					ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'Icon'
					}
				})
			end
			local am = ac('TextLabel', {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, al and - 29 or 0, 1, 0),
				TextXAlignment = 'Left',
				ThemeTag = {
					TextColor3 = ah and 'Placeholder' or 'Text'
				},
				Text = ae
			})
			local an = ac('TextButton', {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = ag,
				BackgroundTransparency = 1,
				Text = ''
			}, {
				ac('Frame', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					ab.NewRoundFrame(ak, 'Squircle', {
						ThemeTag = {
							ImageColor3 = 'Placeholder'
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = 0.85
					}),
					not aj and ab.NewRoundFrame(ak, 'SquircleGlass', {
						ThemeTag = {
							ImageColor3 = 'Outline'
						},
						Size = UDim2.new(1, 1, 1, 1),
						ImageTransparency = 0.9,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					}) or nil,
					ab.NewRoundFrame(ak, 'Squircle', {
						Size = UDim2.new(1, 0, 1, 0),
						Name = 'Frame',
						ThemeTag = {
							ImageColor3 = 'LabelBackground',
							ImageTransparency = 'LabelBackgroundTransparency'
						}
					}, {
						ac('UIPadding', {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						ac('UIListLayout', {
							FillDirection = 'Horizontal',
							Padding = UDim.new(0, 8),
							VerticalAlignment = 'Center',
							HorizontalAlignment = 'Left'
						}),
						al,
						am
					})
				})
			})
			return an
		end
		return aa
	end
	function a.z()
		local aa, ab = {}, cloneref or clonereference or function(aa)
			return aa
		end
		local ac, ad = ab(game:GetService'UserInputService'), a.load'd'
		local ae = ad.New
		function aa.New(af, ag, ah, ai, aj)
			local ak = ae('Frame', {
				Size = UDim2.new(0, ai, 1, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				Parent = ag,
				ZIndex = 999,
				Active = true
			})
			local al = ad.NewRoundFrame(ai / 2, 'Squircle', {
				Size = UDim2.new(1, 0, 0, 0),
				ImageTransparency = 0.85,
				ThemeTag = {
					ImageColor3 = 'Text'
				},
				Parent = ak
			})
			local am, an, ao, ap, aq = ae('Frame', {
				Size = UDim2.new(1, 12, 1, 12),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Active = true,
				ZIndex = 999,
				Parent = al
			}), ad:GenerateUniqueID(), false
			local function UpdateVisuals()
				local ar, as = af.AbsoluteCanvasSize.Y, af.AbsoluteWindowSize.Y
				if ar <= as then
					al.Visible = false
					return
				end
				al.Visible = true
				local at = math.clamp(as / ar, 0.05, 1)
				al.Size = UDim2.new(1, 0, at, 0)
				local au, av = ar - as, 1 - at
				if au > 0 then
					local aw = af.CanvasPosition.Y / au
					al.Position = UDim2.new(0, 0, math.clamp(aw * av, 0, av), 0)
				else
					al.Position = UDim2.new(0, 0, 0, 0)
				end
			end
			local function StopDrag()
				if aj.CurrentInput == an then
					aj.CurrentInput = nil
				end
				ao = false
				af.ScrollingEnabled = true
				if ap then
					ad.DisconnectSignal(ap)
					ap = nil
				end
				if aq then
					ad.DisconnectSignal(aq)
					aq = nil
				end
			end
			ad.AddSignal(am.InputBegan, function(ar)
				if ar.UserInputType ~= Enum.UserInputType.MouseButton1 and ar.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if ao then
					return
				end
				if aj.CurrentInput and aj.CurrentInput ~= an then
					return
				end
				aj.CurrentInput = an
				ao = true
				af.ScrollingEnabled = false
				local as, at = ar.Position.Y, af.CanvasPosition.Y
				ap = ad.AddSignal(ac.InputChanged, function(au)
					if ar.UserInputType == Enum.UserInputType.Touch and au ~= ar then
						return
					end
					if au.UserInputType == Enum.UserInputType.MouseMovement or au.UserInputType == Enum.UserInputType.Touch then
						local av, aw, ax = au.Position.Y - as, af.AbsoluteCanvasSize.Y, af.AbsoluteWindowSize.Y
						local ay, az, aA = math.max(aw - ax, 0), ak.AbsoluteSize.Y, al.AbsoluteSize.Y
						local aB = math.max(az - aA, 1)
						local aC = av * (ay / aB)
						af.CanvasPosition = Vector2.new(af.CanvasPosition.X, math.clamp(at + aC, 0, ay))
					end
				end)
				aq = ad.AddSignal(ac.InputEnded, function(au)
					local av, aw = ar.UserInputType == Enum.UserInputType.Touch and au == ar, ar.UserInputType == Enum.UserInputType.MouseButton1 and au.UserInputType == Enum.UserInputType.MouseButton1
					if av or aw then
						StopDrag()
					end
				end)
			end)
			ad.AddSignal(af:GetPropertyChangedSignal'AbsoluteWindowSize', UpdateVisuals)
			ad.AddSignal(af:GetPropertyChangedSignal'AbsoluteCanvasSize', UpdateVisuals)
			ad.AddSignal(af:GetPropertyChangedSignal'CanvasPosition', UpdateVisuals)
			UpdateVisuals()
			return ak
		end
		return aa
	end
	function a.A()
		local aa, ab = {}, a.load'd'
		local ac, ad = ab.New, ab.Tween
		function aa.New(ae, af, ag)
			local ah, ai = {
				Title = af.Title or 'Tag',
				Icon = af.Icon,
				Color = af.Color or Color3.fromHex'#315dff',
				Radius = af.Radius or 999,
				Border = af.Border or false,
				TagFrame = nil,
				Height = 26,
				Padding = 10,
				TextSize = 14,
				IconSize = 16
			}
			if ah.Icon then
				ai = ab.Image(ah.Icon, ah.Icon, 0, af.Window, 'Tag', false)
				ai.Size = UDim2.new(0, ah.IconSize, 0, ah.IconSize)
				ai.ImageLabel.ImageColor3 = typeof(ah.Color) == 'Color3' and ab.GetTextColorForHSB(ah.Color) or typeof(ah.Color) == 'string' and (ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color, ab.Theme)))
			end
			local aj, ak = (ac('TextLabel', {
				BackgroundTransparency = 1,
				AutomaticSize = 'XY',
				TextSize = ah.TextSize,
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				Text = ah.Title,
				TextColor3 = typeof(ah.Color) == 'Color3' and ab.GetTextColorForHSB(ah.Color) or typeof(ah.Color) == 'string' and (ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color, ab.Theme)))
			}))
			if typeof(ah.Color) == 'table' then
				ak = ac'UIGradient'
				for al, am in next, ah.Color do
					ak[al] = am
				end
				aj.TextColor3 = ab.GetTextColorForHSB(ab.GetAverageColor(ak))
				if ai then
					ai.ImageLabel.ImageColor3 = ab.GetTextColorForHSB(ab.GetAverageColor(ak))
				end
			end
			local al = ab.NewRoundFrame(ah.Radius, 'Squircle', {
				AutomaticSize = 'X',
				Size = UDim2.new(0, 0, 0, ah.Height),
				Parent = ag,
				ImageColor3 = typeof(ah.Color) == 'Color3' and ah.Color or typeof(ah.Color) == 'table' and Color3.new(1, 1, 1) or nil,
				ThemeTag = typeof(ah.Color) == 'string' and {
					ImageColor3 = ah.Color
				}
			}, {
				ak,
				ab.NewRoundFrame(ah.Radius + 1, 'SquircleGlass', {
					Size = UDim2.new(1, 1, 1, 1),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ThemeTag = {
						ImageColor3 = 'White'
					},
					ImageTransparency = 0.75
				}),
				ac('Frame', {
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = 'X',
					Name = 'Content',
					BackgroundTransparency = 1
				}, {
					ai,
					aj,
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, ah.Padding),
						PaddingRight = UDim.new(0, ah.Padding)
					}),
					ac('UIListLayout', {
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						Padding = UDim.new(0, ah.Padding / 1.5)
					})
				})
			})
			function ah.SetTitle(am, an)
				ah.Title = an
				aj.Text = an
				return ah
			end
			function ah.SetColor(am, an)
				ah.Color = an
				if typeof(an) == 'table' then
					local ao = ab.GetAverageColor(an)
					ad(aj, 0.06, {
						TextColor3 = ab.GetTextColorForHSB(ao)
					}):Play()
					local ap = al:FindFirstChildOfClass'UIGradient' or ac('UIGradient', {
						Parent = al
					})
					for aq, ar in next, an do
						ap[aq] = ar
					end
					ad(al, 0.06, {
						ImageColor3 = Color3.new(1, 1, 1)
					}):Play()
				else
					if ak then
						ak:Destroy()
					end
					ad(aj, 0.06, {
						TextColor3 = ab.GetTextColorForHSB(an)
					}):Play()
					if ai then
						ad(ai.ImageLabel, 0.06, {
							ImageColor3 = ab.GetTextColorForHSB(an)
						}):Play()
					end
					ad(al, 0.06, {
						ImageColor3 = an
					}):Play()
				end
				return ah
			end
			function ah.SetIcon(am, an)
				ah.Icon = an
				if an then
					ai = ab.Image(an, an, 0, af.Window, 'Tag', false)
					ai.Size = UDim2.new(0, ah.IconSize, 0, ah.IconSize)
					ai.Parent = al
					if typeof(ah.Color) == 'Color3' then
						ai.ImageLabel.ImageColor3 = ab.GetTextColorForHSB(ah.Color)
					elseif typeof(ah.Color) == 'table' then
						ai.ImageLabel.ImageColor3 = ab.GetTextColorForHSB(ab.GetAverageColor(ak))
					end
				else
					if ai then
						ai:Destroy()
						ai = nil
					end
				end
				return ah
			end
			function ah.Destroy(am)
				al:Destroy()
				return ah
			end
			ab:OnThemeChange(function(am, an)
				aj.TextColor3 = ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color, ab.Theme))
				ai.ImageLabel.ImageColor3 = ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color, ab.Theme))
			end)
			return ah
		end
		return aa
	end
	function a.B()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local ab, ac, ad, ae = aa(game:GetService'RunService'), (aa(game:GetService'HttpService'))
		ae = {
			Folder = nil,
			Path = nil,
			Configs = {},
			Parser = {
				Colorpicker = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Default:ToHex(),
							transparency = af.Transparency or nil
						}
					end,
					Load = function(af, ag)
						if af and af.Update then
							af:Update(Color3.fromHex(ag.value), ag.transparency or nil)
						end
					end
				},
				Dropdown = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Value
						}
					end,
					Load = function(af, ag)
						if af and af.Select then
							af:Select(ag.value)
						end
					end
				},
				Input = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Value
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(ag.value)
						end
					end
				},
				Keybind = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Value
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(ag.value)
						end
					end
				},
				RadioGroup = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Get and af:Get() or af.Value
						}
					end,
					Load = function(af, ag)
						if af and af.Select then
							af:Select(ag.value, false)
						end
					end
				},
				CheckboxGroup = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Get and af:Get() or af.Values
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(ag.value or {}, false)
						end
					end
				},
				SegmentedControl = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Get and af:Get() or af.Value
						}
					end,
					Load = function(af, ag)
						if af and af.Select then
							af:Select(ag.value, false)
						end
					end
				},
				TextArea = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Get and af:Get() or af.Value
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(ag.value or '', false)
						end
					end
				},
				Slider = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Value.Default
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(tonumber(ag.value))
						end
					end
				},
				Stepper = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Get and af:Get() or af.Value.Default
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(tonumber(ag.value), false)
						end
					end
				},
				TabBox = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Get and af:Get() or af.SelectedValue
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(ag.value)
						end
					end
				},
				ChipList = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Get and af:Get() or af.Values
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(ag.value, false)
						end
					end
				},
				Toggle = {
					Save = function(af)
						return {
							__type = af.__type,
							value = af.Value
						}
					end,
					Load = function(af, ag)
						if af and af.Set then
							af:Set(ag.value)
						end
					end
				}
			}
		}
		function ae.Init(af, ag)
			if not ag.Folder then
				warn'[ WindUI.ConfigManager ] Window.Folder is not specified.'
				return false
			end
			if ab:IsStudio() or not writefile then
				warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
				return false
			end
			ad = ag
			ae.Folder = ad.Folder
			ae.Path = 'WindUI/' .. tostring(ae.Folder) .. '/config/'
			if not isfolder(ae.Path) then
				makefolder(ae.Path)
			end
			local ah = ae:AllConfigs()
			for ai, aj in next, ah do
				local ak = ae.Path .. tostring(aj) .. '.json'
				if isfile and readfile and isfile(ak) then
					local al, am = pcall(function()
						return readfile(ak)
					end)
					if al then
						ae.Configs[aj] = am
					end
				end
			end
			return ae
		end
		function ae.SetPath(af, ag)
			if not ag then
				warn'[ WindUI.ConfigManager ] Custom path is not specified.'
				return false
			end
			ae.Path = ag
			if not ag:match'/$' then
				ae.Path = ag .. '/'
			end
			if not isfolder(ae.Path) then
				makefolder(ae.Path)
			end
			return true
		end
		function ae.CreateConfig(af, ag, ah)
			local ai = {
				Path = ae.Path .. ag .. '.json',
				Elements = {},
				CustomData = {},
				AutoLoad = ah or false,
				Version = 1.2
			}
			if not ag then
				return false, 'No config file is selected'
			end
			function ai.SetAsCurrent(aj)
				ad:SetCurrentConfig(ai)
			end
			function ai.Register(aj, ak, al)
				ai.Elements[ak] = al
			end
			function ai.Set(aj, ak, al)
				ai.CustomData[ak] = al
			end
			function ai.Get(aj, ak)
				return ai.CustomData[ak]
			end
			function ai.SetAutoLoad(aj, ak)
				ai.AutoLoad = ak
			end
			function ai.Save(aj)
				if ad.PendingFlags then
					for ak, al in next, ad.PendingFlags do
						ai:Register(ak, al)
					end
				end
				local ak = {
					__version = ai.Version,
					__elements = {},
					__autoload = ai.AutoLoad,
					__custom = ai.CustomData
				}
				for al, am in next, ai.Elements do
					if ae.Parser[am.__type] then
						ak.__elements[tostring(al)] = ae.Parser[am.__type].Save(am)
					end
				end
				local al = ac:JSONEncode(ak)
				if writefile then
					local am, an = pcall(function()
						writefile(ai.Path, al)
					end)
					if not am then
						return false, 'Failed to save config: ' .. tostring(an)
					end
				else
					return false, 'writefile function is not available'
				end
				return ak
			end
			function ai.Load(aj)
				if isfile and not isfile(ai.Path) then
					return false, 'Config file does not exist'
				end
				local ak, al = pcall(function()
					local ak = readfile or function()
						warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
						return nil
					end
					return ac:JSONDecode(ak(ai.Path))
				end)
				if not ak then
					return false, 'Failed to parse config file'
				end
				if not al.__version then
					local am = {
						__version = ai.Version,
						__elements = al,
						__custom = {}
					}
					al = am
				end
				if ad.PendingFlags then
					for am, an in next, ad.PendingFlags do
						ai:Register(am, an)
					end
				end
				ad.PendingConfigData = al.__elements or {}
				for am, an in next, (al.__elements or {}) do
					if typeof(an) == 'table' and ai.Elements[am] and ae.Parser[an.__type] then
						task.spawn(function()
							local ao, ap = pcall(function()
								ae.Parser[an.__type].Load(ai.Elements[am], an)
							end)
							if not ao then
								warn("[ WindUI.ConfigManager ] Failed to load element '" .. tostring(am) .. "': " .. tostring(ap))
							end
						end)
					end
				end
				ai.CustomData = al.__custom or {}
				return ai.CustomData
			end
			function ai.Delete(aj)
				if not delfile then
					return false, 'delfile function is not available'
				end
				if not isfile(ai.Path) then
					return false, 'Config file does not exist'
				end
				local ak, al = pcall(function()
					delfile(ai.Path)
				end)
				if not ak then
					return false, 'Failed to delete config file: ' .. tostring(al)
				end
				ae.Configs[ag] = nil
				if ad.CurrentConfig == ai then
					ad.CurrentConfig = nil
				end
				return true, 'Config deleted successfully'
			end
			function ai.GetData(aj)
				return {
					elements = ai.Elements,
					custom = ai.CustomData,
					autoload = ai.AutoLoad
				}
			end
			if isfile(ai.Path) then
				local aj, ak = pcall(function()
					return ac:JSONDecode(readfile(ai.Path))
				end)
				if aj and ak and ak.__autoload then
					ai.AutoLoad = true
					task.spawn(function()
						task.wait(0.5)
						local al, am = pcall(function()
							return ai:Load()
						end)
						if al then
							if ad.Debug then
								print('[ WindUI.ConfigManager ] AutoLoaded config: ' .. ag)
							end
						else
							warn('[ WindUI.ConfigManager ] Failed to AutoLoad config: ' .. ag .. ' - ' .. tostring(am))
						end
					end)
				end
			end
			ai:SetAsCurrent()
			ae.Configs[ag] = ai
			return ai
		end
		function ae.Config(af, ag, ah)
			return ae:CreateConfig(ag, ah)
		end
		function ae.GetAutoLoadConfigs(af)
			local ag = {}
			for ah, ai in pairs(ae.Configs) do
				if ai.AutoLoad then
					table.insert(ag, ah)
				end
			end
			return ag
		end
		function ae.DeleteConfig(af, ag)
			if not delfile then
				return false, 'delfile function is not available'
			end
			local ah = ae.Path .. ag .. '.json'
			if not isfile(ah) then
				return false, 'Config file does not exist'
			end
			local ai, aj = pcall(function()
				delfile(ah)
			end)
			if not ai then
				return false, 'Failed to delete config file: ' .. tostring(aj)
			end
			ae.Configs[ag] = nil
			if ad.CurrentConfig and ad.CurrentConfig.Path == ah then
				ad.CurrentConfig = nil
			end
			return true, 'Config deleted successfully'
		end
		function ae.AllConfigs(af)
			if not listfiles then
				return {}
			end
			local ag = {}
			if not isfolder(ae.Path) then
				makefolder(ae.Path)
				return ag
			end
			for ah, ai in next, listfiles(ae.Path) do
				local aj = ai:match'([^\\/]+)%.json$'
				if aj then
					table.insert(ag, aj)
				end
			end
			return ag
		end
		function ae.GetConfig(af, ag)
			return ae.Configs[ag]
		end
		return ae
	end
	function a.C()
		local aa, ab = {}, a.load'd'
		local ac, ad, ae = ab.New, ab.Tween, (cloneref or clonereference or function(ac)
			return ac
		end)
		local af, ag, ah = ae(game:GetService'TextService'), {
			TopCenter = {
				Position = UDim2.new(0.5, 0, 0, 8),
				AnchorPoint = Vector2.new(0.5, 0)
			},
			TopLeft = {
				Position = UDim2.new(0, 14, 0, 8),
				AnchorPoint = Vector2.new(0, 0)
			},
			TopRight = {
				Position = UDim2.new(1, - 14, 0, 8),
				AnchorPoint = Vector2.new(1, 0)
			},
			BottomCenter = {
				Position = UDim2.new(0.5, 0, 1, - 14),
				AnchorPoint = Vector2.new(0.5, 1)
			},
			BottomLeft = {
				Position = UDim2.new(0, 14, 1, - 14),
				AnchorPoint = Vector2.new(0, 1)
			},
			BottomRight = {
				Position = UDim2.new(1, - 14, 1, - 14),
				AnchorPoint = Vector2.new(1, 1)
			}
		}, {
			hidden = 'Idle',
			hide = 'Idle',
			idle = 'Idle',
			island = 'Idle',
			closed = 'Collapsed',
			circle = 'Collapsed',
			icon = 'Collapsed',
			mini = 'Collapsed',
			collapsed = 'Collapsed',
			compact = 'Compact',
			default = 'Compact',
			pill = 'Compact',
			open = 'Expanded',
			expanded = 'Expanded',
			dynamic = 'Expanded'
		}
		local function Pick(ai, aj)
			if ai ~= nil then
				return ai
			end
			return aj
		end
		local function NormalizeState(ai)
			return ah[tostring(ai or 'Compact'):lower()] or 'Compact'
		end
		local function NormalizeColorSequence(ai, aj)
			if typeof(ai) == 'ColorSequence' then
				return ai
			end
			if typeof(ai) == 'Color3' then
				return ColorSequence.new(ai)
			end
			return aj
		end
		local function GetInnerCornerRadius(ai, aj)
			if typeof(ai) ~= 'UDim' then
				return UDim.new(1, 0)
			end
			if ai.Scale ~= 0 then
				return UDim.new(ai.Scale, math.max(ai.Offset, 0))
			end
			return UDim.new(0, math.max(ai.Offset - aj, 0))
		end
		local function MeasureText(ai, aj, ak)
			local al = af:GetTextSize(tostring(ai or ''), aj, Enum.Font.GothamMedium, Vector2.new(ak, 1000))
			return math.ceil(al.X), math.ceil(al.Y)
		end
		function aa.New(ai)
			local aj = ColorSequence.new(Color3.fromHex'#40C9FF', Color3.fromHex'#E81CFF')
			local ak = {
				Title = ai.Title or 'Open',
				Content = nil,
				Icon = ai.Icon,
				Enabled = true,
				Visible = false,
				OnlyMobile = true,
				Draggable = true,
				Position = 'TopCenter',
				State = 'Compact',
				Height = 44,
				IdleWidth = 78,
				IdleHeight = 28,
				ExpandedHeight = 68,
				ExpandedWidth = 220,
				MaxWidth = 380,
				IconSize = 22,
				Padding = 12,
				Gap = 9,
				Scale = 1,
				CornerRadius = UDim.new(1, 0),
				StrokeThickness = 1,
				StrokeTransparency = 0.7,
				Color = aj,
				BackgroundColor = Color3.fromRGB(7, 8, 11),
				BackgroundTransparency = 0.08,
				TextColor = nil,
				TextTransparency = nil,
				AutoCollapse = nil,
				AutoHide = 4,
				WakeOnShow = true,
				Shadow = true,
				ShadowBlur = UDim.new(0, 18),
				ShadowColor = Color3.new(0, 0, 0),
				ShadowOffset = UDim2.fromOffset(0, 5),
				ShadowSpread = UDim2.fromOffset(2, 2),
				ShadowTransparency = 0.5,
				FallbackShadow = false,
				MorphWindow = true,
				MorphDuration = 0.42,
				OnStateChange = nil
			}
			local al, am, an, ao, ap, aq, ar = {
				Button = nil,
				Container = nil,
				IconSize = ak.IconSize,
				Scale = ak.Scale,
				State = ak.State,
				Config = ak,
				UIElements = {}
			}, 0, 0, {}, (ac('Frame', {
				Name = 'OpenButtonContainer',
				Size = UDim2.fromOffset(ak.Height, ak.Height),
				Position = ag.TopCenter.Position,
				AnchorPoint = ag.TopCenter.AnchorPoint,
				Parent = ai.Parent,
				BackgroundTransparency = 1,
				Active = true,
				Visible = false,
				ZIndex = 98
			}))
			local as, at, au = ac('UIScale', {
				Name = 'Scale',
				Scale = ak.Scale,
				Parent = ap
			}), ac('Frame', {
				Name = 'Shadow',
				Size = UDim2.new(1, 4, 1, 4),
				Position = UDim2.fromOffset(- 2, 3),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.58,
				BorderSizePixel = 0,
				ZIndex = 98,
				Parent = ap
			}, {
				ac('UICorner', {
					CornerRadius = ak.CornerRadius
				})
			}), ac('UIGradient', {
				Name = 'UIGradient',
				Color = ak.Color,
				Transparency = NumberSequence.new{
					NumberSequenceKeypoint.new(0, 0.12),
					NumberSequenceKeypoint.new(0.5, 0.52),
					NumberSequenceKeypoint.new(1, 0.18)
				}
			})
			local av = ac('UIStroke', {
				Name = 'UIStroke',
				Thickness = ak.StrokeThickness,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.new(1, 1, 1),
				Transparency = ak.StrokeTransparency
			}, {
				au
			})
			local aw = ac('Frame', {
				Name = 'OpenButton',
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = ak.BackgroundColor,
				BackgroundTransparency = ak.BackgroundTransparency,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Active = true,
				ZIndex = 99,
				Parent = ap
			}, {
				ac('UICorner', {
					CornerRadius = ak.CornerRadius
				}),
				av,
				ac('Frame', {
					Name = 'Surface',
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = 0.965,
					BorderSizePixel = 0,
					ZIndex = 99
				}, {
					ac('UICorner', {
						CornerRadius = ak.CornerRadius
					}),
					ac('UIGradient', {
						Rotation = 90,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.48),
							NumberSequenceKeypoint.new(0.45, 0.9),
							NumberSequenceKeypoint.new(1, 1)
						}
					})
				})
			})
			local ax = ab.CreateUIShadow(aw, {
				Name = 'NativeShadow',
				Enabled = ak.Shadow,
				BlurRadius = ak.ShadowBlur,
				Color = ak.ShadowColor,
				Offset = ak.ShadowOffset,
				Spread = ak.ShadowSpread,
				Transparency = ak.ShadowTransparency,
				ZIndex = 0
			})
			at.Visible = ak.Shadow and ax == nil and ak.FallbackShadow
			local ay, az = ac('Frame', {
				Name = 'Drag',
				Size = UDim2.fromOffset(36, 36),
				Position = UDim2.fromOffset(4, 4),
				BackgroundTransparency = 1,
				ZIndex = 102,
				Parent = aw
			}), ab.Image('move', 'OpenButtonDrag', 0, ai.Folder, 'OpenButton', true, true)
			az.Name = 'Icon'
			az.Size = UDim2.fromOffset(17, 17)
			az.Position = UDim2.fromScale(0.5, 0.5)
			az.AnchorPoint = Vector2.new(0.5, 0.5)
			az.Parent = ay
			local aA = az:FindFirstChildWhichIsA'ImageLabel'
			if aA then
				aA.ImageTransparency = 0.42
			end
			local aB, aC = ac('Frame', {
				Name = 'Divider',
				Size = UDim2.new(0, 1, 1, - 18),
				Position = UDim2.new(0, 44, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 0.88,
				BorderSizePixel = 0,
				ZIndex = 102,
				Parent = aw
			}), ac('TextButton', {
				Name = 'TextButton',
				Text = '',
				AutoButtonColor = false,
				Size = UDim2.new(1, - 45, 1, 0),
				Position = UDim2.fromOffset(45, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				ZIndex = 101,
				Parent = aw
			}, {
				ac('UICorner', {
					CornerRadius = GetInnerCornerRadius(ak.CornerRadius, 4)
				})
			})
			local aD, aE = ac('Frame', {
				Name = 'HoverSurface',
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 101,
				Parent = aC
			}, {
				ac('UICorner', {
					CornerRadius = GetInnerCornerRadius(ak.CornerRadius, 4)
				})
			}), ac('CanvasGroup', {
				Name = 'TextStack',
				Size = UDim2.new(1, - 58, 1, 0),
				Position = UDim2.fromOffset(46, 0),
				BackgroundTransparency = 1,
				GroupTransparency = 0,
				ZIndex = 103,
				Parent = aC
			})
			local aF, aG, aH = ac('TextLabel', {
				Name = 'Title',
				Text = ak.Title,
				TextSize = 15,
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				ZIndex = 103,
				ThemeTag = {
					TextColor3 = 'Text'
				},
				Parent = aE
			}), ac('TextLabel', {
				Name = 'Content',
				Text = '',
				TextSize = 12,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Regular),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Size = UDim2.new(1, 0, 0, 18),
				Position = UDim2.fromOffset(0, 35),
				BackgroundTransparency = 1,
				TextTransparency = 0.38,
				Visible = false,
				ZIndex = 103,
				ThemeTag = {
					TextColor3 = 'Text'
				},
				Parent = aE
			}), ab.Image('chevron-up', 'OpenButtonExpand', 0, ai.Folder, 'OpenButton', true, true)
			aH.Name = 'TrailingIcon'
			aH.Size = UDim2.fromOffset(15, 15)
			aH.Position = UDim2.new(1, - 17, 0.5, 0)
			aH.AnchorPoint = Vector2.new(0.5, 0.5)
			aH.Visible = false
			aH.ZIndex = 103
			aH.Parent = aC
			local aI = aH:FindFirstChildWhichIsA'ImageLabel'
			if aI then
				aI.ImageTransparency = 0.48
			end
			local function StopTween(aJ)
				local aK = ao[aJ]
				if aK then
					aK:Cancel()
					ao[aJ] = nil
				end
			end
			local function Animate(aJ, aK, aL)
				StopTween(aJ)
				if aK <= 0 then
					for aM, aN in aL do
						aJ[aM] = aN
					end
					return nil
				end
				local aM = ad(aJ, aK, aL, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
				ao[aJ] = aM
				aM:Play()
				return aM
			end
			local function ApplyPosition(aJ)
				if typeof(aJ) == 'UDim2' then
					ap.Position = aJ
					ap.AnchorPoint = Vector2.new(0.5, 0.5)
					return
				end
				local aK = ag[tostring(aJ or 'TopCenter')] or ag.TopCenter
				ap.Position = aK.Position
				ap.AnchorPoint = aK.AnchorPoint
			end
			local function GetDragWidth(aJ, aK)
				if not ak.Draggable or aJ == 'Collapsed' or aJ == 'Idle' then
					return 0
				end
				return aK
			end
			local function GetTargetSize(aJ)
				if aJ == 'Idle' then
					return Vector2.new(ak.IdleWidth, ak.IdleHeight)
				end
				local aK = if aJ == 'Expanded' then ak.ExpandedHeight else ak.Height
				if aJ == 'Collapsed' then
					return Vector2.new(ak.Height, ak.Height)
				end
				local aL = math.max(ak.MaxWidth - 120, 80)
				local aM, aN = MeasureText(ak.Title, 15, aL), if aJ == 'Expanded' and ak.Content then MeasureText(ak.Content, 12, aL) else 0
				local aO, aP, aQ, aR = math.max(aM, aN), GetDragWidth(aJ, aK), if aq then ak.IconSize + ak.Gap else 0, if aJ == 'Expanded' then 24 else 0
				local aS = aP + (ak.Padding * 2) + aQ + aO + aR
				if aJ == 'Expanded' then
					aS = math.max(aS, ak.ExpandedWidth)
				end
				return Vector2.new(math.clamp(aS, aK, ak.MaxWidth), aK)
			end
			local function ApplyState(aJ, aK)
				aJ = NormalizeState(aJ)
				local aL, aM = if aK == false then 0 else 0.28, GetTargetSize(aJ)
				local aN, aO, aP = GetDragWidth(aJ, aM.Y), ak.Padding, aq ~= nil
				local aQ, aR = if aP then ak.IconSize + ak.Gap else 0, if aJ == 'Expanded' then 24 else 0
				al.State = aJ
				ak.State = aJ
				ay.Visible = aN > 0
				aB.Visible = aN > 0
				aF.Visible = aJ ~= 'Collapsed' and aJ ~= 'Idle'
				aG.Visible = aJ == 'Expanded' and ak.Content ~= nil and ak.Content ~= ''
				aH.Visible = aJ == 'Expanded'
				Animate(ap, aL, {
					Size = UDim2.fromOffset(aM.X, aM.Y)
				})
				Animate(aC, aL, {
					Size = UDim2.new(1, - aN, 1, 0),
					Position = UDim2.fromOffset(aN, 0)
				})
				ay.Size = UDim2.fromOffset(math.max(aM.Y - 8, 0), math.max(aM.Y - 8, 0))
				ay.Position = UDim2.fromOffset(4, 4)
				aB.Position = UDim2.new(0, aN, 0.5, 0)
				if aq then
					local aS = if aJ == 'Collapsed' or aJ == 'Idle' then aM.X / 2 else aO + ak.IconSize / 2
					Animate(aq, aL, {
						Position = UDim2.fromOffset(aS, aM.Y / 2),
						Size = UDim2.fromOffset(if aJ == 'Idle' then 0 else ak.IconSize, if aJ == 'Idle' then 0 else ak.IconSize)
					})
				end
				local aS = aO + aQ
				aE.Position = UDim2.fromOffset(aS, 0)
				aE.Size = UDim2.new(1, - (aS + aO + aR), 1, 0)
				aF.Size = if aG.Visible then UDim2.new(1, 0, 0, 22) else UDim2.fromScale(1, 1)
				aF.Position = if aG.Visible then UDim2.fromOffset(0, 13) else UDim2.fromOffset(0, 0)
				aG.Text = tostring(ak.Content or '')
				ab.SafeCallback(ak.OnStateChange, aJ, al)
			end
			local function CancelAutoHide()
				an = an + 1
			end
			local function ScheduleAutoHide(aJ)
				CancelAutoHide()
				if ak.AutoHide == false or al.State == 'Idle' or not ap.Visible then
					return
				end
				local aK = tonumber(aJ)
				if aK == nil then
					aK = tonumber(ak.AutoHide)
				end
				if aK == nil or aK <= 0 then
					return
				end
				local aL = an
				task.delay(aK, function()
					if aL == an and ap.Parent and ap.Visible then
						al:SetState'Idle'
					end
				end)
			end
			function al.SetIcon(aJ, aK, aL)
				if aq then
					aq:Destroy()
					aq = nil
				end
				ak.Icon = aK
				if aK ~= nil and aK ~= false and aK ~= '' then
					aq = ab.Image(aK, ak.Title .. ':OpenButton', 0, ai.Folder, 'OpenButton', true, ai.IconThemed)
					aq.Name = 'Icon'
					aq.AnchorPoint = Vector2.new(0.5, 0.5)
					aq.ZIndex = 103
					aq.Parent = aC
				end
				if not aL then
					ApplyState(al.State, false)
				end
				return al
			end
			function al.SetTitle(aJ, aK)
				ak.Title = tostring(aK or '')
				aF.Text = ak.Title
				ab:ChangeTranslationKey(aF, ak.Title)
				ApplyState(al.State, true)
				return al
			end
			function al.SetContent(aJ, aK)
				ak.Content = if aK == nil or aK == false then nil else tostring(aK)
				aG.Text = ak.Content or ''
				ApplyState(al.State, true)
				return al
			end
			function al.SetState(aJ, aK, aL, aM)
				am = am + 1
				CancelAutoHide()
				if typeof(aL) == 'table' then
					if aL.Title ~= nil then
						ak.Title = tostring(aL.Title)
						aF.Text = ak.Title
					end
					if aL.Content ~= nil or aL.Description ~= nil then
						local aN = if aL.Content ~= nil then aL.Content else aL.Description
						ak.Content = if aN == false then nil else tostring(aN or '')
					end
					if aL.Icon ~= nil then
						al:SetIcon(aL.Icon, true)
					end
				end
				ApplyState(aK, aM)
				ScheduleAutoHide()
				return al
			end
			function al.GetState(aJ)
				return al.State
			end
			function al.GetMorphTarget(aJ)
				local aK = aw or ap
				local aL = aK.AbsoluteSize
				local aM = aK.AbsolutePosition + (aL / 2)
				return {
					Position = aM,
					Size = aL,
					Duration = math.max(tonumber(ak.MorphDuration) or 0.42, 0),
					Enabled = ak.MorphWindow ~= false and ak.Enabled ~= false
				}
			end
			function al.Expand(aJ, aK, aL)
				al:SetState('Expanded', aK)
				local aM, aN = am, tonumber(aL) or tonumber(ak.AutoCollapse)
				if aN and aN > 0 then
					CancelAutoHide()
					task.delay(aN, function()
						if aM == am and ap.Parent then
							al:Compact()
						end
					end)
				end
				return al
			end
			function al.Collapse(aJ, aK)
				return al:SetState('Collapsed', aK)
			end
			function al.Compact(aJ, aK)
				return al:SetState('Compact', aK)
			end
			function al.Idle(aJ, aK)
				return al:SetState('Idle', aK)
			end
			al.Hide = al.Idle
			function al.Wake(aJ, aK)
				return al:Compact(aK)
			end
			function al.ToggleExpanded(aJ, aK)
				if al.State == 'Expanded' then
					return al:Compact(aK)
				end
				return al:Expand(aK)
			end
			function al.Push(aJ, aK, aL)
				local aM = al.State
				al:SetState('Expanded', aK)
				CancelAutoHide()
				local aN, aO = am, math.max(tonumber(aL) or 3, 0)
				task.delay(aO, function()
					if aN == am and ap.Parent then
						al:SetState(aM)
					end
				end)
				return al
			end
			al.Notify = al.Push
			function al.Visible(aJ, aK)
				ap.Visible = aK == true
				if ap.Visible then
					if ak.WakeOnShow and al.State == 'Idle' then
						al:SetState'Compact'
					else
						ScheduleAutoHide()
					end
				else
					CancelAutoHide()
				end
				return al
			end
			function al.SetScale(aJ, aK)
				ak.Scale = math.max(tonumber(aK) or 1, 0.1)
				al.Scale = ak.Scale
				StopTween(as)
				as.Scale = ak.Scale
				return al
			end
			function al.Pulse(aJ)
				local aK = ak.Scale
				Animate(as, 0.08, {
					Scale = aK * 0.94
				})
				task.delay(0.08, function()
					if as.Parent then
						Animate(as, 0.16, {
							Scale = aK
						})
					end
				end)
				return al
			end
			function al.Edit(aJ, aK)
				aK = if typeof(aK) == 'table' then aK else {}
				ak.Title = tostring(Pick(aK.Title, ak.Title))
				local aL = Pick(aK.Content, Pick(aK.Description, ak.Content))
				ak.Content = if aL == false or aL == nil then nil else tostring(aL)
				ak.Enabled = Pick(aK.Enabled, ak.Enabled)
				ak.OnlyMobile = Pick(aK.OnlyMobile, ak.OnlyMobile)
				ak.Draggable = Pick(aK.Draggable, ak.Draggable)
				ak.Position = Pick(aK.Position, Pick(aK.Preset, ak.Position))
				ak.Height = math.max(tonumber(Pick(aK.Height, ak.Height)) or 44, 34)
				ak.IdleWidth = math.max(tonumber(Pick(aK.IdleWidth, ak.IdleWidth)) or 78, 44)
				ak.IdleHeight = math.max(tonumber(Pick(aK.IdleHeight, ak.IdleHeight)) or 28, 20)
				ak.ExpandedHeight = math.max(tonumber(Pick(aK.ExpandedHeight, ak.ExpandedHeight)) or 68, ak.Height)
				ak.ExpandedWidth = math.max(tonumber(Pick(aK.ExpandedWidth, ak.ExpandedWidth)) or 220, 120)
				ak.MaxWidth = math.max(tonumber(Pick(aK.MaxWidth, ak.MaxWidth)) or 380, ak.ExpandedWidth)
				ak.IconSize = math.max(tonumber(Pick(aK.IconSize, ak.IconSize)) or 22, 12)
				ak.Padding = math.max(tonumber(Pick(aK.Padding, ak.Padding)) or 12, 4)
				ak.Gap = math.max(tonumber(Pick(aK.Gap, ak.Gap)) or 9, 0)
				ak.CornerRadius = Pick(aK.CornerRadius, ak.CornerRadius)
				ak.StrokeThickness = math.max(tonumber(Pick(aK.StrokeThickness, ak.StrokeThickness)) or 1, 0)
				ak.StrokeTransparency = ab.ClampTransparency(Pick(aK.StrokeTransparency, ak.StrokeTransparency), 0.7)
				ak.Scale = math.max(tonumber(Pick(aK.Scale, ak.Scale)) or 1, 0.1)
				ak.Color = NormalizeColorSequence(aK.Color, ak.Color)
				ak.BackgroundColor = Pick(aK.BackgroundColor, ak.BackgroundColor)
				ak.BackgroundTransparency = ab.ClampTransparency(Pick(aK.BackgroundTransparency, Pick(aK.Transparency, ak.BackgroundTransparency)), 0.08)
				ak.TextColor = Pick(aK.TextColor, ak.TextColor)
				ak.TextTransparency = ab.ClampTransparency(Pick(aK.TextTransparency, ak.TextTransparency), ak.TextTransparency)
				ak.AutoCollapse = Pick(aK.AutoCollapse, ak.AutoCollapse)
				ak.AutoHide = Pick(aK.AutoHide, ak.AutoHide)
				ak.WakeOnShow = Pick(aK.WakeOnShow, ak.WakeOnShow)
				ak.Shadow = Pick(aK.Shadow, ak.Shadow)
				ak.ShadowBlur = ab.ToUDimRadius(aK.ShadowBlur, ak.ShadowBlur)
				ak.ShadowColor = if typeof(aK.ShadowColor) == 'Color3' then aK.ShadowColor else ak.ShadowColor
				ak.ShadowOffset = if typeof(aK.ShadowOffset) == 'UDim2' then aK.ShadowOffset else ak.ShadowOffset
				ak.ShadowSpread = if typeof(aK.ShadowSpread) == 'UDim2' then aK.ShadowSpread else ak.ShadowSpread
				ak.ShadowTransparency = ab.ClampTransparency(Pick(aK.ShadowTransparency, ak.ShadowTransparency), 0.5)
				ak.FallbackShadow = Pick(aK.FallbackShadow, ak.FallbackShadow)
				ak.MorphWindow = Pick(aK.MorphWindow, Pick(aK.WindowMorph, ak.MorphWindow))
				ak.MorphDuration = math.max(tonumber(Pick(aK.MorphDuration, Pick(aK.WindowMorphDuration, ak.MorphDuration))) or 0.42, 0)
				ak.OnStateChange = Pick(aK.OnStateChange, ak.OnStateChange)
				local aM = aK.State or aK.Mode
				if aK.OnlyIcon == true or aK.Style == 'Circle' then
					aM = aM or 'Collapsed'
				elseif aK.OnlyIcon == false and aM == nil then
					aM = 'Compact'
				end
				ai.IsOpenButtonEnabled = ak.Enabled ~= false
				if ak.OnlyMobile == false then
					ai.IsPC = false
				end
				if ar then
					ar:Set(ak.Draggable)
				end
				ApplyPosition(ak.Position)
				al:SetScale(ak.Scale)
				aw.BackgroundColor3 = ak.BackgroundColor
				aw.BackgroundTransparency = ak.BackgroundTransparency
				aw.UICorner.CornerRadius = ak.CornerRadius
				aC.UICorner.CornerRadius = GetInnerCornerRadius(ak.CornerRadius, 4)
				aD.UICorner.CornerRadius = GetInnerCornerRadius(ak.CornerRadius, 4)
				at.UICorner.CornerRadius = ak.CornerRadius
				at.Visible = ak.Shadow and ax == nil and ak.FallbackShadow
				if ax then
					ax.Enabled = ak.Shadow
					ax.BlurRadius = ak.ShadowBlur
					ax.Color = ak.ShadowColor
					ax.Offset = ak.ShadowOffset
					ax.Spread = ak.ShadowSpread
					ax.Transparency = ak.ShadowTransparency
				end
				av.Thickness = ak.StrokeThickness
				av.Transparency = ak.StrokeTransparency
				au.Color = ak.Color
				aF.Text = ak.Title
				aG.Text = tostring(ak.Content or '')
				if ak.TextColor then
					aF.TextColor3 = ak.TextColor
					aG.TextColor3 = ak.TextColor
				end
				if ak.TextTransparency ~= nil then
					aF.TextTransparency = ak.TextTransparency
				end
				if aK.Icon ~= nil then
					al:SetIcon(aK.Icon, true)
				elseif not aq and ak.Icon then
					al:SetIcon(ak.Icon, true)
				end
				ApplyState(aM or al.State, aK.Animate ~= false)
				if aK.Visible ~= nil then
					al:Visible(aK.Visible)
				elseif ap.Visible then
					ScheduleAutoHide()
				end
				return al
			end
			function al.Destroy(aJ)
				am = am + 1
				CancelAutoHide()
				local aK = {}
				for aL in ao do
					table.insert(aK, aL)
				end
				for aL, aM in aK do
					StopTween(aM)
				end
				ap:Destroy()
			end
			ab.AddSignal(aC.MouseEnter, function()
				Animate(aD, 0.12, {
					BackgroundTransparency = 0.94
				})
			end)
			ab.AddSignal(aC.MouseLeave, function()
				Animate(aD, 0.16, {
					BackgroundTransparency = 1
				})
			end)
			ab.AddSignal(aC.InputBegan, function(aJ)
				if aJ.UserInputType == Enum.UserInputType.MouseButton1 or aJ.UserInputType == Enum.UserInputType.Touch then
					al:Pulse()
				end
			end)
			ar = ab.Drag(ap)
			al.Button = aw
			al.Container = ap
			al.UIElements = {
				Container = ap,
				Button = aw,
				MainAction = aC,
				Drag = ay,
				Divider = aB,
				Title = aF,
				Content = aG,
				TextStack = aE,
				HoverSurface = aD,
				TrailingIcon = aH,
				Stroke = av,
				Shadow = at,
				NativeShadow = ax,
				Scale = as
			}
			if ak.Icon then
				al:SetIcon(ak.Icon)
			else
				ApplyState(ak.State, false)
			end
			return al
		end
		return aa
	end
	function a.D()
		local aa, ab, ac = {}, a.load'd', a.load'e'
		local ad, ae = ab.New, {
			TopLeft = {
				UDim2.new(0, 14, 0, 14),
				Vector2.new(0, 0)
			},
			TopRight = {
				UDim2.new(1, - 14, 0, 14),
				Vector2.new(1, 0)
			},
			BottomLeft = {
				UDim2.new(0, 14, 1, - 14),
				Vector2.new(0, 1)
			},
			BottomRight = {
				UDim2.new(1, - 14, 1, - 14),
				Vector2.new(1, 1)
			},
			TopCenter = {
				UDim2.new(0.5, 0, 0, 14),
				Vector2.new(0.5, 0)
			},
			BottomCenter = {
				UDim2.new(0.5, 0, 1, - 14),
				Vector2.new(0.5, 1)
			}
		}
		local function NormalizeConfig(af)
			if af == false then
				return {
					Visible = false
				}
			end
			if typeof(af) == 'string' then
				return {
					Title = af
				}
			end
			if typeof(af) ~= 'table' then
				return {}
			end
			return af or {}
		end
		function aa.New(af, ag)
			local ah, ai, aj, ak, al, am = {}, ad('TextLabel', {
				BackgroundTransparency = 1,
				Text = af.Title or 'WindUI',
				TextSize = 13,
				TextXAlignment = 'Left',
				AutomaticSize = 'XY',
				FontFace = Font.new(ab.Font, Enum.FontWeight.Bold),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), ad('TextLabel', {
				BackgroundTransparency = 1,
				Text = 'v' .. tostring(ag and ag.Version or ''),
				TextSize = 11,
				TextTransparency = 0.42,
				TextXAlignment = 'Left',
				AutomaticSize = 'XY',
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), (ad('Frame', {
				Size = UDim2.new(0, 0, 0, 0),
				Position = ae.BottomRight[1],
				AnchorPoint = ae.BottomRight[2],
				BackgroundTransparency = 1,
				Parent = af.Parent,
				Active = true,
				Visible = false,
				ZIndex = 120
			}))
			local an = ab.NewRoundFrame(14, 'Squircle', {
				Name = 'Watermark',
				Size = UDim2.new(0, 0, 0, 36),
				AutomaticSize = 'XY',
				ImageTransparency = 0.18,
				Parent = ak,
				ZIndex = 120,
				ThemeTag = {
					ImageColor3 = 'Background'
				}
			}, {
				ad('UIStroke', {
					ApplyStrokeMode = 'Border',
					Color = Color3.new(1, 1, 1),
					Transparency = 0.82,
					Thickness = 1
				}),
				ad('UIGradient', {
					Rotation = 24,
					Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(210, 235, 255)),
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.96),
						NumberSequenceKeypoint.new(0.48, 0.76),
						NumberSequenceKeypoint.new(1, 0.96)
					}
				}),
				ad('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				}),
				ad('Frame', {
					Name = 'Text',
					AutomaticSize = 'XY',
					BackgroundTransparency = 1
				}, {
					ad('UIListLayout', {
						FillDirection = 'Vertical',
						Padding = UDim.new(0, 1)
					}),
					ai,
					aj
				}),
				ad('UIPadding', {
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10),
					PaddingTop = UDim.new(0, 7),
					PaddingBottom = UDim.new(0, 7)
				})
			})
			ab.AddSignal(an:GetPropertyChangedSignal'AbsoluteSize', function()
				ak.Size = UDim2.fromOffset(an.AbsoluteSize.X, an.AbsoluteSize.Y)
			end)
			am = ab.Drag(ak)
			local function SetIcon(ao)
				if al then
					al:Destroy()
					al = nil
				end
				if not ao or ao == '' then
					return
				end
				al = ab.Image(ao, ao, 0, af.Folder, 'Watermark', true, true, 'Icon')
				al.Size = UDim2.new(0, 16, 0, 16)
				al.LayoutOrder = - 1
				al.Parent = an
			end
			function ah.Visible(ao, ap)
				ak.Visible = ap ~= false
			end
			function ah.Edit(ao, ap)
				ap = NormalizeConfig(ap)
				if ap.Visible == false or ap.Enabled == false then
					ah:Visible(false)
					return ah
				end
				if ap.Title ~= nil then
					ai.Text = tostring(ap.Title)
					ab:ChangeTranslationKey(ai, ai.Text)
				end
				if ap.Desc ~= nil or ap.Subtitle ~= nil then
					aj.Text = tostring(ap.Desc or ap.Subtitle or '')
					aj.Visible = aj.Text ~= ''
					ab:ChangeTranslationKey(aj, aj.Text)
				end
				if ap.Icon ~= nil then
					SetIcon(ap.Icon)
				end
				if ap.Position and ae[ap.Position] then
					ak.Position = ae[ap.Position][1]
					ak.AnchorPoint = ae[ap.Position][2]
				elseif typeof(ap.Position) == 'UDim2' then
					ak.Position = ap.Position
				end
				if typeof(ap.AnchorPoint) == 'Vector2' then
					ak.AnchorPoint = ap.AnchorPoint
				end
				if ap.Transparency ~= nil then
					an.ImageTransparency = ab.ClampTransparency(ap.Transparency, an.ImageTransparency)
				end
				if ap.Scale then
					local aq = an:FindFirstChildOfClass'UIScale' or ad('UIScale', {
						Parent = an
					})
					aq.Scale = tonumber(ap.Scale) or 1
				end
				if am then
					am:Set(ap.Draggable ~= false)
				end
				ah:Visible(true)
				ac.Play(an, 'Reveal', {
					ImageTransparency = an.ImageTransparency
				}, nil, nil, 'Watermark')
				return ah
			end
			function ah.SetTitle(ao, ap)
				ai.Text = tostring(ap or '')
			end
			function ah.SetDesc(ao, ap)
				aj.Text = tostring(ap or '')
				aj.Visible = aj.Text ~= ''
			end
			function ah.Destroy(ao)
				ak:Destroy()
			end
			ah.Container = ak
			ah.Main = an
			return ah
		end
		return aa
	end
	function a.E()
		local aa, ab, ac, ad = game:GetService'UserInputService', game:GetService'Workspace', a.load'd', a.load'e'
		local ae, af = ac.New, {}
		local function GetImageTarget(ag)
			if typeof(ag) ~= 'Instance' then
				return nil
			end
			if ag:IsA'ImageLabel' or ag:IsA'ImageButton' then
				return ag
			end
			return ag:FindFirstChildWhichIsA'ImageLabel' or ag:FindFirstChildWhichIsA'ImageButton'
		end
		local function ContainsPoint(ag, ah)
			if typeof(ag) ~= 'Instance' or not ag.Visible then
				return false
			end
			local ai, aj = ag.AbsolutePosition, ag.AbsoluteSize
			return ah.X >= ai.X and ah.X <= ai.X + aj.X and ah.Y >= ai.Y and ah.Y <= ai.Y + aj.Y
		end
		local function Trim(ag)
			ag = tostring(ag or '')
			ag = string.gsub(ag, '^%s+', '')
			ag = string.gsub(ag, '%s+$', '')
			return ag
		end
		local function GetThemeList(ag)
			local ah = {}
			for ai, aj in next, ag:GetThemes() or {} do
				table.insert(ah, {
					Key = ai,
					Name = aj.Name or ai
				})
			end
			table.sort(ah, function(ai, aj)
				return ai.Name < aj.Name
			end)
			return ah
		end
		function af.New(ag, ah, ai)
			local aj = typeof(ag.Settings) == 'table' and ag.Settings or {}
			local ak, al, am = aj.DefaultConfig or 'default', aj.Width or 360, aj.Height or 410
			local an, ao = aj.PageHeight or (am - 142), {
				Open = false,
				Button = nil,
				Token = 0,
				SelectedTab = 'config',
				UIElements = {},
				ThemeButtons = {},
				TabButtons = {},
				Pages = {}
			}
			local function GetViewportSize()
				local ap = ab.CurrentCamera
				return ap and ap.ViewportSize or Vector2.new(1280, 720)
			end
			local function Notify(ap, aq, ar, as)
				if ah.Notify then
					ah:Notify{
						Title = ap,
						Content = aq,
						Icon = ar,
						Style = as
					}
				end
			end
			local function CreateIcon(ap, aq, ar)
				local as = ac.Image(ap, ap, 0, ag.Folder, 'SettingsMenu', true, true, 'Icon')
				as.Size = UDim2.new(0, ar or 16, 0, ar or 16)
				as.Parent = aq
				return as
			end
			local function CreateText(ap, aq, ar, as, at)
				return ae('TextLabel', {
					BackgroundTransparency = 1,
					Text = aq or '',
					TextSize = ar or 14,
					TextTransparency = at or 0,
					TextWrapped = true,
					TextXAlignment = 'Left',
					AutomaticSize = 'Y',
					Size = UDim2.new(1, 0, 0, 0),
					Parent = ap,
					FontFace = Font.new(ac.Font, as or Enum.FontWeight.Medium),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
			end
			local function CreatePanel(ap)
				return ac.NewRoundFrame(ag.ElementConfig.UICorner, 'Squircle', {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					ImageTransparency = 0.9,
					Parent = ap,
					ThemeTag = {
						ImageColor3 = 'ElementBackground'
					}
				}, {
					ae('UIGradient', {
						Rotation = 35,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.05),
							NumberSequenceKeypoint.new(1, 0.2)
						}
					}),
					ae('UIPadding', {
						PaddingTop = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10),
						PaddingBottom = UDim.new(0, 10)
					}),
					ae('UIListLayout', {
						Padding = UDim.new(0, 8),
						FillDirection = 'Vertical',
						HorizontalAlignment = 'Left'
					})
				})
			end
			local function CreateActionButton(ap, aq, ar, as, at)
				local au = ac.NewRoundFrame(14, 'Squircle', {
					Size = UDim2.new(1, 0, 0, 34),
					ImageTransparency = as == 'Primary' and 0 or 0.9,
					ThemeTag = {
						ImageColor3 = as == 'Primary' and 'Primary' or 'ElementBackground'
					},
					Parent = ap
				}, {
					ae('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					ae('UIListLayout', {
						Padding = UDim.new(0, 7),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Center'
					}),
					ar and CreateIcon(ar, nil, 15) or nil,
					ae('TextLabel', {
						Size = UDim2.new(0, 0, 1, 0),
						AutomaticSize = 'X',
						BackgroundTransparency = 1,
						Text = aq,
						TextSize = 13,
						FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
						TextColor3 = as == 'Primary' and Color3.new(1, 1, 1) or nil,
						ThemeTag = {
							TextColor3 = as ~= 'Primary' and 'Text' or nil
						}
					})
				}, true)
				ad.AttachPress(au, ac, {
					Amount = 0.97
				})
				ac.AddSignal(au.MouseButton1Click, function()
					ac.SafeCallback(at)
				end)
				return au
			end
			local ap, aq = ac.NewRoundFrame(ag.ElementConfig.UICorner, 'Squircle', {
				Name = 'SettingsDropdown',
				Size = UDim2.new(0, al, 0, am),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromOffset(0, 0),
				ImageTransparency = 1,
				Visible = false,
				Active = false,
				ZIndex = 10000,
				Parent = ah.ScreenGui,
				ThemeTag = {
					ImageColor3 = 'Background'
				}
			}, {
				ae('UIScale', {
					Name = 'Scale',
					Scale = 0.98
				}),
				ac.NewRoundFrame(ag.ElementConfig.UICorner, 'SquircleGlass', {
					Name = 'GlassLayer',
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.72,
					ZIndex = 10000,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				}),
				ac.NewRoundFrame(ag.ElementConfig.UICorner, 'SquircleOutline', {
					Name = 'Outline',
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.72,
					ZIndex = 10001,
					ThemeTag = {
						ImageColor3 = 'Outline'
					}
				})
			}), ae('Frame', {
				Name = 'SettingsScrim',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Active = false,
				ZIndex = 9998,
				Parent = ah.ScreenGui
			})
			local ar = ae('CanvasGroup', {
				Name = 'Content',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				GroupTransparency = 1,
				ZIndex = 10002,
				Parent = ap
			}, {
				ae('UIPadding', {
					PaddingTop = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12)
				}),
				ae('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left',
					SortOrder = 'LayoutOrder'
				})
			})
			ao.UIElements.Root = ap
			ao.UIElements.Scale = ap.Scale
			ao.UIElements.Scrim = aq
			ao.UIElements.Content = ar
			ao.UIElements.GlassLayer = ap.GlassLayer
			ao.UIElements.Outline = ap.Outline
			local as, at
			local function UpdateRootPosition()
				local au, av = GetViewportSize(), 12
				local aw, ax, ay, az, aA = math.floor(math.min(al, math.max(280, au.X - (av * 2)))), math.floor(math.min(am, math.max(300, au.Y - (av * 2)))), Vector2.new(1, 0), au.X - av, av + ag.Topbar.Height
				ap.Size = UDim2.fromOffset(aw, ax)
				if as then
					as.Size = UDim2.new(1, 0, 0, math.max(154, ax - 142))
				end
				if at then
					at.Size = UDim2.new(1, 0, 0, math.max(116, ax - 238))
				end
				if ao.Button and ao.Button.AbsoluteSize.X > 0 then
					local aB, aC = ao.Button.AbsolutePosition, ao.Button.AbsoluteSize
					az = aB.X + aC.X
					aA = aB.Y + aC.Y + 10
				end
				if az - aw < av then
					az = math.min(au.X - av, av + aw)
				end
				if aA + ax > au.Y - av then
					aA = math.max(av, au.Y - ax - av)
				end
				ap.AnchorPoint = ay
				ap.Position = UDim2.fromOffset(az, aA)
				aq.Size = UDim2.fromOffset(au.X, au.Y)
			end
			local au, av = ae('Frame', {
				Name = 'Header',
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 40),
				BackgroundTransparency = 1,
				Parent = ar
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				})
			}), CreateIcon('settings', nil, 17)
			ac.NewRoundFrame(999, 'Squircle', {
				Size = UDim2.new(0, 36, 0, 36),
				ImageTransparency = 0.86,
				ThemeTag = {
					ImageColor3 = 'Primary'
				},
				Parent = au
			}, {
				av,
				ac.NewRoundFrame(999, 'SquircleGlass', {
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.8,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				})
			})
			av.Position = UDim2.new(0.5, 0, 0.5, 0)
			av.AnchorPoint = Vector2.new(0.5, 0.5)
			av.ZIndex = 10002
			local aw = ae('Frame', {
				Size = UDim2.new(1, - 46, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = au
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 2),
					FillDirection = 'Vertical'
				})
			})
			CreateText(aw, 'Settings', 16, Enum.FontWeight.Bold, 0)
			CreateText(aw, 'Config, theme and runtime controls', 12, Enum.FontWeight.Medium, 0.42)
			local ax = ac.NewRoundFrame(16, 'Squircle', {
				Name = 'SettingsTabs',
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 38),
				ImageTransparency = 0.9,
				Parent = ar,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ae('UIPadding', {
					PaddingTop = UDim.new(0, 4),
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingBottom = UDim.new(0, 4)
				}),
				ae('UIListLayout', {
					Padding = UDim.new(0, 4),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center',
					SortOrder = 'LayoutOrder'
				})
			})
			as = ae('Frame', {
				Name = 'Pages',
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, an),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Parent = ar
			})
			local function CreateTabButton(ay, az, aA, aB)
				local aC, aD = CreateIcon(aA, nil, 14), ae('TextLabel', {
					Name = 'Title',
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = 'X',
					BackgroundTransparency = 1,
					Text = az,
					TextSize = 12,
					TextTruncate = 'AtEnd',
					FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				local aE, aF = ac.NewRoundFrame(12, 'Squircle', {
					Name = ay,
					LayoutOrder = aB,
					Size = UDim2.new(0.3333333333333333, - 3, 1, 0),
					ImageTransparency = 1,
					Parent = ax,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				}, {
					ae('UIPadding', {
						PaddingLeft = UDim.new(0, 8),
						PaddingRight = UDim.new(0, 8)
					}),
					ae('UIListLayout', {
						Padding = UDim.new(0, 5),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Center'
					}),
					aC,
					aD
				}, true), GetImageTarget(aC)
				ao.TabButtons[ay] = {
					Button = aE,
					Label = aD,
					Icon = aF
				}
				ad.AttachPress(aE, ac, {
					Amount = 0.98
				})
				ac.AddSignal(aE.MouseButton1Click, function()
					ao:SelectTab(ay)
				end)
				return aE
			end
			local function CreatePage(ay)
				local az = ae('CanvasGroup', {
					Name = ay,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					GroupTransparency = 1,
					Visible = false,
					Active = false,
					Parent = as
				}, {
					ae('UIListLayout', {
						Padding = UDim.new(0, 10),
						FillDirection = 'Vertical',
						HorizontalAlignment = 'Left',
						SortOrder = 'LayoutOrder'
					})
				})
				ao.Pages[ay] = az
				return az
			end
			local ay, az, aA = CreatePage'config', CreatePage'theme', CreatePage'about'
			CreateTabButton('config', 'Config', 'save', 1)
			CreateTabButton('theme', 'Theme', 'palette', 2)
			CreateTabButton('about', 'Info', 'badge-info', 3)
			local aB = CreatePanel(ay)
			CreateText(aB, 'Config Profile', 13, Enum.FontWeight.Bold, 0.05)
			local aC = ac.NewRoundFrame(12, 'Squircle', {
				Size = UDim2.new(1, 0, 0, 36),
				ImageTransparency = 0.9,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				},
				Parent = aB
			}, {
				ae('UIPadding', {
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				})
			})
			local aD, aE, aF, aG = ae('TextBox', {
				Name = 'ConfigName',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Text = ak,
				PlaceholderText = 'default',
				TextSize = 13,
				TextXAlignment = 'Left',
				FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
				Parent = aC,
				ThemeTag = {
					TextColor3 = 'Text',
					PlaceholderColor3 = 'Placeholder'
				}
			}), CreateText(aB, 'No saved configs', 12, Enum.FontWeight.Medium, 0.45), ae('Frame', {
				Name = 'HStack',
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundTransparency = 1,
				Parent = aB
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Center',
					VerticalAlignment = 'Center'
				})
			}), CreatePanel(ay)
			CreateText(aG, 'Runtime', 13, Enum.FontWeight.Bold, 0.05)
			local aH = CreateText(aG, 'Theme: ' .. tostring(ah:GetCurrentTheme()), 12, Enum.FontWeight.Medium, 0.28)
			CreateText(aG, 'Settings use glass morph layers and tabbed pages.', 12, Enum.FontWeight.Medium, 0.45)
			local function GetConfigName()
				local aI = Trim(aD.Text)
				return aI ~= '' and aI or ak
			end
			local function RefreshConfigMeta()
				local aI = ag.ConfigManager
				if not aI or typeof(aI) ~= 'table' then
					aE.Text = 'Config is unavailable in this environment'
					return
				end
				local aJ, aK = pcall(function()
					return aI:AllConfigs()
				end)
				local aL = aJ and # aK or 0
				aE.Text = aL == 1 and '1 saved config' or tostring(aL) .. ' saved configs'
			end
			local aI = CreateActionButton(aF, 'Save', 'save', 'Primary', function()
				local aI = ag.ConfigManager
				if not aI or typeof(aI) ~= 'table' then
					Notify('Config unavailable', 'Config save needs file access.', 'triangle-alert', 'Warning')
					return
				end
				local aJ = GetConfigName()
				local aK, aL, aM = pcall(function()
					local aK = aI:Config(aJ)
					aK:Set('theme', ah:GetCurrentTheme())
					return aK:Save()
				end)
				if aK and aL then
					RefreshConfigMeta()
					Notify('Config saved', "Saved '" .. aJ .. "'.", 'check', 'Success')
				else
					Notify('Config save failed', tostring(aM or aL), 'triangle-alert', 'Error')
				end
			end)
			aI.Size = UDim2.new(0.5, - 4, 1, 0)
			local aJ = CreateActionButton(aF, 'Load', 'download', 'Secondary', function()
				local aJ = ag.ConfigManager
				if not aJ or typeof(aJ) ~= 'table' then
					Notify('Config unavailable', 'Config load needs file access.', 'triangle-alert', 'Warning')
					return
				end
				local aK = GetConfigName()
				local aL, aM, aN = pcall(function()
					local aL = aJ:Config(aK)
					local aM = aL:Load()
					if aM and aM.theme then
						ah:SetTheme(aM.theme)
					end
					return aM
				end)
				if aL and aM then
					aH.Text = 'Theme: ' .. tostring(ah:GetCurrentTheme())
					Notify('Config loaded', "Loaded '" .. aK .. "'.", 'refresh-cw', 'Success')
				else
					Notify('Config load failed', tostring(aN or aM), 'triangle-alert', 'Error')
				end
			end)
			aJ.Size = UDim2.new(0.5, - 4, 1, 0)
			local aK = CreatePanel(az)
			CreateText(aK, 'Theme Picker', 13, Enum.FontWeight.Bold, 0.05)
			CreateText(aK, 'Tap a theme to apply it instantly.', 12, Enum.FontWeight.Medium, 0.45)
			at = ae('ScrollingFrame', {
				Name = 'ThemeList',
				Size = UDim2.new(1, 0, 0, aj.ThemeListHeight or 214),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				AutomaticCanvasSize = 'Y',
				CanvasSize = UDim2.new(0, 0, 0, 0),
				Parent = aK
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left'
				})
			})
			local function UpdateThemeButtons()
				local aL = ah:GetCurrentTheme()
				aH.Text = 'Theme: ' .. tostring(aL)
				for aM, aN in next, ao.ThemeButtons do
					local aO = aM == aL
					ad.Play(aN.Button, 'Switch', {
						ImageTransparency = aO and 0.82 or 0.94
					}, nil, nil, 'Theme')
					ad.Play(aN.Label, 'Switch', {
						TextTransparency = aO and 0 or 0.24
					}, nil, nil, 'Theme')
					if aN.Check then
						ad.Play(aN.Check, 'Switch', {
							ImageTransparency = aO and 0 or 1
						}, nil, nil, 'Theme')
					end
				end
			end
			for aL, aM in next, GetThemeList(ah) do
				local aN = CreateIcon('check', nil, 14)
				local aO, aP = ac.NewRoundFrame(12, 'Squircle', {
					Size = UDim2.new(1, 0, 0, 32),
					ImageTransparency = 0.94,
					ThemeTag = {
						ImageColor3 = 'Primary'
					},
					Parent = at
				}, {
					ae('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					ae('UIListLayout', {
						FillDirection = 'Horizontal',
						Padding = UDim.new(0, 8),
						VerticalAlignment = 'Center'
					}),
					ae('TextLabel', {
						Name = 'Title',
						Size = UDim2.new(1, - 22, 1, 0),
						BackgroundTransparency = 1,
						Text = aM.Name,
						TextSize = 13,
						TextXAlignment = 'Left',
						TextTruncate = 'AtEnd',
						FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					}),
					aN
				}, true), GetImageTarget(aN)
				if aP then
					aP.ImageTransparency = 1
				end
				ao.ThemeButtons[aM.Key] = {
					Button = aO,
					Label = aO.Title,
					Check = aP
				}
				ad.AttachPress(aO, ac, {
					Amount = 0.985
				})
				ac.AddSignal(aO.MouseButton1Click, function()
					ah:SetTheme(aM.Key)
					UpdateThemeButtons()
				end)
			end
			local aL = CreatePanel(aA)
			CreateText(aL, 'WindUI Settings', 13, Enum.FontWeight.Bold, 0.05)
			CreateText(aL, 'Use Config for save/load and Theme for quick visual switching.', 12, Enum.FontWeight.Medium, 0.36)
			local aM = ae('Frame', {
				Name = 'VStack',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = aL
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left'
				})
			})
			local function CreateInfoRow(aN, aO)
				return ac.NewRoundFrame(12, 'Squircle', {
					Size = UDim2.new(1, 0, 0, 34),
					ImageTransparency = 0.94,
					ThemeTag = {
						ImageColor3 = 'ElementBackground'
					},
					Parent = aM
				}, {
					ae('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					ae('UIListLayout', {
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center'
					}),
					ae('TextLabel', {
						Size = UDim2.new(0.44, 0, 1, 0),
						BackgroundTransparency = 1,
						Text = aN,
						TextSize = 12,
						TextXAlignment = 'Left',
						TextTransparency = 0.38,
						FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					}),
					ae('TextLabel', {
						Size = UDim2.new(0.56, 0, 1, 0),
						BackgroundTransparency = 1,
						Text = aO,
						TextSize = 12,
						TextXAlignment = 'Right',
						TextTruncate = 'AtEnd',
						FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
				})
			end
			CreateInfoRow('Folder', tostring(ag.Folder or 'WindUI'))
			CreateInfoRow('Topbar', tostring(ag.Topbar.ButtonsType or 'Default'))
			CreateInfoRow('Motion', tostring(ad:GetConfig().Preset))
			function ao.SetButton(aN, aO)
				ao.Button = aO
			end
			function ao.SelectTab(aN, aO)
				if not ao.Pages[aO] then
					return
				end
				ao.SelectedTab = aO
				for aP, aQ in next, ao.TabButtons do
					local aR = aP == aO
					ad.Play(aQ.Button, 'Switch', {
						ImageTransparency = aR and 0.82 or 1
					}, nil, nil, 'SettingsTab')
					ad.Play(aQ.Label, 'Switch', {
						TextTransparency = aR and 0 or 0.3
					}, nil, nil, 'SettingsTab')
					if aQ.Icon then
						ad.Play(aQ.Icon, 'Switch', {
							ImageTransparency = aR and 0 or 0.35
						}, nil, nil, 'SettingsTab')
					end
				end
				for aP, aQ in next, ao.Pages do
					local aR = aP == aO
					aQ.Active = aR
					if aR then
						aQ.Visible = true
						aQ.GroupTransparency = 1
						ad.Play(aQ, 'Reveal', {
							GroupTransparency = 0
						}, nil, nil, 'SettingsPage')
					else
						aQ.Visible = false
						aQ.GroupTransparency = 1
					end
				end
			end
			function ao.OpenMenu(aN)
				if ao.Open then
					return
				end
				ao.Open = true
				ao.Token = ao.Token + 1
				RefreshConfigMeta()
				UpdateThemeButtons()
				ao:SelectTab(ao.SelectedTab)
				UpdateRootPosition()
				ap.Visible = true
				ap.Active = true
				ao.UIElements.Scrim.Visible = true
				ap.ImageTransparency = 1
				ao.UIElements.Scrim.BackgroundTransparency = 1
				ao.UIElements.Content.GroupTransparency = 1
				ao.UIElements.GlassLayer.ImageTransparency = 1
				ao.UIElements.Outline.ImageTransparency = 1
				ao.UIElements.Scale.Scale = 0.98
				ad.Play(ap, 'DropdownOpen', {
					ImageTransparency = 0.18
				}, nil, nil, 'Settings')
				ad.Play(ao.UIElements.Scrim, 'DropdownOpen', {
					BackgroundTransparency = aj.ScrimTransparency or 0.72
				}, nil, nil, 'SettingsScrim')
				ad.Play(ao.UIElements.Content, 'DropdownOpen', {
					GroupTransparency = 0
				}, nil, nil, 'SettingsContent')
				ad.Play(ao.UIElements.GlassLayer, 'DropdownOpen', {
					ImageTransparency = 0.78
				}, nil, nil, 'SettingsGlass')
				ad.Play(ao.UIElements.Outline, 'DropdownOpen', {
					ImageTransparency = 0.72
				}, nil, nil, 'SettingsOutline')
				ad.Play(ao.UIElements.Scale, 'DropdownOpen', {
					Scale = 1
				}, nil, nil, 'SettingsScale')
			end
			function ao.CloseMenu(aN)
				if not ao.Open then
					return
				end
				ao.Open = false
				ao.Token = ao.Token + 1
				local aO = ao.Token
				ap.Active = false
				ad.Play(ap, 'DropdownClose', {
					ImageTransparency = 1
				}, nil, nil, 'Settings')
				ad.Play(ao.UIElements.Scrim, 'DropdownClose', {
					BackgroundTransparency = 1
				}, nil, nil, 'SettingsScrim')
				ad.Play(ao.UIElements.Content, 'DropdownClose', {
					GroupTransparency = 1
				}, nil, nil, 'SettingsContent')
				ad.Play(ao.UIElements.GlassLayer, 'DropdownClose', {
					ImageTransparency = 1
				}, nil, nil, 'SettingsGlass')
				ad.Play(ao.UIElements.Outline, 'DropdownClose', {
					ImageTransparency = 1
				}, nil, nil, 'SettingsOutline')
				ad.Play(ao.UIElements.Scale, 'DropdownClose', {
					Scale = 0.98
				}, nil, nil, 'SettingsScale')
				task.delay(ad.GetDuration'DropdownClose', function()
					if aO == ao.Token then
						ap.Visible = false
						ao.UIElements.Scrim.Visible = false
					end
				end)
			end
			function ao.Toggle(aN)
				if ao.Open then
					ao:CloseMenu()
				else
					ao:OpenMenu()
				end
			end
			ac.AddSignal(aa.InputBegan, function(aN)
				if not ao.Open then
					return
				end
				if aN.UserInputType ~= Enum.UserInputType.MouseButton1 and aN.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if ContainsPoint(ap, aN.Position) or ContainsPoint(ao.Button, aN.Position) then
					return
				end
				ao:CloseMenu()
			end)
			RefreshConfigMeta()
			UpdateThemeButtons()
			ao:SelectTab'config'
			return ao
		end
		return af
	end
	function a.F()
		local aa, ab, ac, ad = game:GetService'UserInputService', game:GetService'Workspace', a.load'd', a.load'e'
		local ae, af = ac.New, {}
		local function ContainsPoint(ag, ah)
			if typeof(ag) ~= 'Instance' or not ag.Visible then
				return false
			end
			local ai, aj = ag.AbsolutePosition, ag.AbsoluteSize
			return ah.X >= ai.X and ah.X <= ai.X + aj.X and ah.Y >= ai.Y and ah.Y <= ai.Y + aj.Y
		end
		local function NormalizeKey(ag)
			if typeof(ag) == 'EnumItem' then
				return ag.Name, ag
			end
			if typeof(ag) == 'string' and Enum.KeyCode[ag] then
				return ag, Enum.KeyCode[ag]
			end
			return 'None', nil
		end
		function af.New(ag, ah, ai)
			local aj, ak = typeof(ag.KeyBindMenu) == 'table' and ag.KeyBindMenu or {}, (aa.TouchEnabled and not aa.KeyboardEnabled) or ag.IsPC == false
			local al = aj.Compact == true or (aj.Compact ~= false and ak)
			local am, an, ao, ap, aq, ar = aj.Width or (al and 330 or 326), aj.Height or (al and 300 or 354), al and 10 or 14, al and 6 or 10, aj.QuickKeys or {
				'RightShift',
				'F',
				'LeftControl'
			}, {
				Open = false,
				Button = nil,
				Token = 0,
				Capturing = false,
				UserMoved = false,
				StoredPosition = nil,
				TargetPosition = nil,
				UIElements = {}
			}
			local function Notify(as, at, au, av)
				if ah.Notify then
					ah:Notify{
						Title = as,
						Content = at,
						Icon = au,
						Style = av
					}
				end
			end
			local function GetViewportSize()
				local as = ab.CurrentCamera
				return as and as.ViewportSize or Vector2.new(1280, 720)
			end
			local function GetScrimTransparency()
				if aj.Scrim == false or aj.ShowScrim == false then
					return 1
				end
				if aj.ScrimTransparency ~= nil then
					return aj.ScrimTransparency
				end
				return al and 1 or 0.78
			end
			local function CreateIcon(as, at, au)
				local av = ac.Image(as, as, 0, ag.Folder, 'KeyBindMenu', true, true, 'Icon')
				av.Size = UDim2.new(0, au or 16, 0, au or 16)
				av.Parent = at
				return av
			end
			local function CreateText(as, at, au, av, aw)
				return ae('TextLabel', {
					BackgroundTransparency = 1,
					Text = at or '',
					TextSize = au or 14,
					TextTransparency = aw or 0,
					TextXAlignment = 'Left',
					TextWrapped = true,
					AutomaticSize = 'Y',
					Size = UDim2.new(1, 0, 0, 0),
					Parent = as,
					FontFace = Font.new(ac.Font, av or Enum.FontWeight.Medium),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
			end
			local as, at = ac.NewRoundFrame(ag.ElementConfig.UICorner, 'Squircle', {
				Name = 'KeyBindMenu',
				Size = UDim2.new(0, am, 0, an),
				AnchorPoint = al and Vector2.new(0.5, 1) or Vector2.new(1, 0),
				Position = UDim2.fromOffset(0, 0),
				ImageTransparency = 1,
				Visible = false,
				Active = false,
				ClipsDescendants = true,
				ZIndex = 10020,
				Parent = ah.ScreenGui,
				ThemeTag = {
					ImageColor3 = 'Background'
				}
			}, {
				ae('UIScale', {
					Name = 'Scale',
					Scale = 0.98
				}),
				ac.NewRoundFrame(ag.ElementConfig.UICorner, 'SquircleGlass', {
					Name = 'GlassLayer',
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 1,
					ZIndex = 10020,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				}),
				ac.NewRoundFrame(ag.ElementConfig.UICorner, 'SquircleOutline', {
					Name = 'Outline',
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 1,
					ZIndex = 10021,
					ThemeTag = {
						ImageColor3 = 'Outline'
					}
				})
			}), ae('Frame', {
				Name = 'KeyBindScrim',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Active = false,
				ZIndex = 10018,
				Parent = ah.ScreenGui
			})
			local au = ae('CanvasGroup', {
				Name = 'Content',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				GroupTransparency = 1,
				ZIndex = 10022,
				Parent = as
			}, {
				ae('UIPadding', {
					PaddingTop = UDim.new(0, ao),
					PaddingLeft = UDim.new(0, ao),
					PaddingRight = UDim.new(0, ao),
					PaddingBottom = UDim.new(0, ao)
				}),
				ae('UIListLayout', {
					Padding = UDim.new(0, ap),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left',
					SortOrder = 'LayoutOrder'
				})
			})
			ar.UIElements.Root = as
			ar.UIElements.Scale = as.Scale
			ar.UIElements.Scrim = at
			ar.UIElements.Content = au
			ar.UIElements.GlassLayer = as.GlassLayer
			ar.UIElements.Outline = as.Outline
			local function IsImageBackground(av)
				if typeof(av) ~= 'string' then
					return false
				end
				if string.sub(av, 1, 1) == '#' then
					return false
				end
				if string.match(av, '^video:') then
					return false
				end
				return av ~= ''
			end
			local function GetBackgroundKind(av)
				if av == nil or av == false then
					return nil, nil, {}
				end
				if typeof(av) == 'table' then
					local aw = av.Type or av.Kind or av.Mode
					if av.Video or aw == 'Video' or aw == 'video' then
						return 'Video', av.Video or av.Url or av.URL or av.Source or av.Asset or av.Path, av
					end
					if av.Image or av.Url or av.URL or av.Asset or av.Path or aw == 'Image' or aw == 'image' then
						return 'Image', av.Image or av.Url or av.URL or av.Asset or av.Path or av.Source, av
					end
					if av.Gradient then
						return 'Gradient', av.Gradient, av
					end
					if aw == 'Gradient' or aw == 'gradient' or av.Rotation ~= nil or av.Offset ~= nil then
						return 'Gradient', av, av
					end
					if typeof(av.Color) == 'ColorSequence' or typeof(av.Transparency) == 'NumberSequence' then
						return 'Gradient', av, av
					end
					return nil, nil, av
				end
				if typeof(av) == 'string' then
					local aw, ax = string.match(av, '^video:(.+)'), av:match'^([^?#]+)' or av
					if aw or string.match(ax:lower(), '%.webm$') then
						return 'Video', aw or av, {}
					end
					if IsImageBackground(av) then
						return 'Image', av, {}
					end
				end
				return nil, nil, {}
			end
			local function FindWindowBackgroundVideo()
				local av = ag.UIElements and ag.UIElements.Main
				local aw = av and av:FindFirstChild'Background'
				local ax = aw and aw:FindFirstChild'BackgroundVideo'
				if ax and ax:IsA'VideoFrame' then
					return ax.Video
				end
				return nil
			end
			local function ApplyGradientProperty(av, aw, ax)
				if aw == 'Transparency' and typeof(ax) == 'number' then
					return
				end
				pcall(function()
					av[aw] = ax
				end)
			end
			local function ApplyBackgroundMedia()
				if aj.UseWindowBackground == false then
					return
				end
				local av, aw = GetBackgroundKind(aj.Background)
				local ax, ay = GetBackgroundKind(ag.Background)
				local az, aA, aB = aj.BackgroundGradient or (av == 'Gradient' and aw) or ag.BackgroundGradient or (ax == 'Gradient' and ay), aj.BackgroundImage or (av == 'Image' and aw) or (ax == 'Image' and ay), (av == 'Video' and aw) or (ax == 'Video' and (FindWindowBackgroundVideo() or ay))
				if aA then
					ar.UIElements.BackgroundImage = ae('ImageLabel', {
						Name = 'BackgroundImage',
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Image = tostring(aA),
						ImageTransparency = aj.BackgroundImageTransparency or ag.BackgroundImageTransparency or 0.46,
						ScaleType = aj.BackgroundScaleType or ag.BackgroundScaleType or 'Crop',
						ZIndex = 10019,
						Parent = as
					}, {
						ae('UICorner', {
							CornerRadius = UDim.new(0, ag.ElementConfig.UICorner)
						})
					})
				end
				if aB then
					ar.UIElements.BackgroundVideo = ae('VideoFrame', {
						Name = 'BackgroundVideo',
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Video = tostring(aB),
						Looped = true,
						Volume = 0,
						ZIndex = 10019,
						Parent = as
					}, {
						ae('UICorner', {
							CornerRadius = UDim.new(0, ag.ElementConfig.UICorner)
						})
					})
					ar.UIElements.BackgroundVideo:Play()
				end
				if az then
					local aC = ae'UIGradient'
					for aD, aE in next, az do
						ApplyGradientProperty(aC, aD, aE)
					end
					ar.UIElements.BackgroundGradient = ac.NewRoundFrame(ag.ElementConfig.UICorner, 'Squircle', {
						Name = 'BackgroundGradient',
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = aj.BackgroundGradientTransparency or aj.BackgroundOverlayTransparency or ag.BackgroundOverlayTransparency or 0.55,
						ZIndex = 10019,
						Parent = as
					}, {
						aC
					})
				end
			end
			ApplyBackgroundMedia()
			local av, aw, ax = ae('Frame', {
				Name = 'DragHandle',
				Size = UDim2.new(1, 0, 0, 8),
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Visible = al,
				Parent = au
			}, {
				ae('Frame', {
					Size = UDim2.new(0, 42, 0, 4),
					Position = UDim2.new(0.5, 0, 0, 1),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.72
				}, {
					ae('UICorner', {
						CornerRadius = UDim.new(1, 0)
					})
				})
			}), ae('Frame', {
				Name = 'Header',
				Size = UDim2.new(1, 0, 0, al and 34 or 42),
				BackgroundTransparency = 1,
				Active = true,
				LayoutOrder = 1,
				Parent = au
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, al and 8 or 10),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				})
			}), CreateIcon('keyboard', nil, al and 15 or 18)
			ac.NewRoundFrame(999, 'Squircle', {
				Size = UDim2.new(0, al and 32 or 38, 0, al and 32 or 38),
				ImageTransparency = 0.86,
				Parent = aw,
				ThemeTag = {
					ImageColor3 = 'Primary'
				}
			}, {
				ax
			})
			ax.Position = UDim2.new(0.5, 0, 0.5, 0)
			ax.AnchorPoint = Vector2.new(0.5, 0.5)
			local ay = ae('Frame', {
				Size = UDim2.new(1, al and - 78 or - 48, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = aw
			}, {
				ae('UIListLayout', {
					FillDirection = 'Vertical',
					Padding = UDim.new(0, 2)
				})
			})
			CreateText(ay, aj.Title or (al and 'Keybind' or 'KeyBind Menu'), al and 14 or 16, Enum.FontWeight.Bold, 0)
			local az = CreateText(ay, aj.Desc or (al and 'Mobile quick toggle controls.' or 'Set the window toggle shortcut.'), al and 11 or 12, Enum.FontWeight.Medium, 0.42)
			if aj.HideDesc ~= nil then
				az.Visible = not aj.HideDesc
			else
				az.Visible = not al
			end
			local aA = CreateIcon('x', nil, 13)
			local aB = ac.NewRoundFrame(999, 'Squircle', {
				Size = al and UDim2.new(0, 28, 0, 28) or UDim2.new(0, 0, 0, 0),
				ImageTransparency = 0.9,
				Visible = al,
				Parent = aw,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				aA
			}, true)
			aA.Position = UDim2.new(0.5, 0, 0.5, 0)
			aA.AnchorPoint = Vector2.new(0.5, 0.5)
			ac.AddSignal(aB.MouseButton1Click, function()
				ar:CloseMenu()
			end)
			local aC, aD = ac.NewRoundFrame(16, 'Squircle', {
				Size = UDim2.new(1, 0, 0, al and 48 or 58),
				ImageTransparency = al and 0.8 or 0.88,
				LayoutOrder = 2,
				Parent = au,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ae('UIStroke', {
					ApplyStrokeMode = 'Border',
					Color = Color3.new(1, 1, 1),
					Transparency = al and 0.8 or 0.88,
					Thickness = 1
				}),
				ae('UIPadding', {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				ae('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				})
			}), NormalizeKey(ag.ToggleKey or aj.DefaultKey or aj.Value)
			ae('TextLabel', {
				Size = UDim2.new(0.4, 0, 1, 0),
				BackgroundTransparency = 1,
				Text = 'Current',
				TextSize = al and 11 or 12,
				TextXAlignment = 'Left',
				TextTransparency = 0.44,
				FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
				Parent = aC,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			local aE, aF = ae('TextLabel', {
				Size = UDim2.new(0.6, 0, 1, 0),
				BackgroundTransparency = 1,
				Text = aD,
				TextSize = al and 16 or 18,
				TextXAlignment = 'Right',
				FontFace = Font.new(ac.Font, Enum.FontWeight.Bold),
				Parent = aC,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), ac.NewRoundFrame(16, 'Squircle', {
				Name = 'ElementBindings',
				Size = UDim2.new(1, 0, 0, al and 84 or 94),
				ImageTransparency = al and 0.86 or 0.9,
				LayoutOrder = 3,
				Parent = au,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ae('UIStroke', {
					ApplyStrokeMode = 'Border',
					Color = Color3.new(1, 1, 1),
					Transparency = al and 0.82 or 0.9,
					Thickness = 1
				}),
				ae('UIPadding', {
					PaddingTop = UDim.new(0, 8),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 8)
				}),
				ae('UIListLayout', {
					Padding = UDim.new(0, 5),
					FillDirection = 'Vertical',
					SortOrder = 'LayoutOrder'
				})
			})
			local aG, aH = ae('TextLabel', {
				Name = 'Header',
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundTransparency = 1,
				Text = 'Element keybinds',
				TextSize = al and 11 or 12,
				TextXAlignment = 'Left',
				TextTransparency = 0.3,
				LayoutOrder = 1,
				Parent = aF,
				FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), ae('ScrollingFrame', {
				Name = 'List',
				Size = UDim2.new(1, 0, 1, - 19),
				BackgroundTransparency = 1,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = 'Y',
				ScrollingDirection = 'Y',
				ScrollBarThickness = 0,
				LayoutOrder = 2,
				Parent = aF
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 5),
					FillDirection = 'Vertical',
					SortOrder = 'LayoutOrder'
				})
			})
			local aI, aJ = ae('TextLabel', {
				Name = 'Empty',
				Size = UDim2.new(1, 0, 0, 28),
				BackgroundTransparency = 1,
				Text = 'No element keybinds',
				TextSize = al and 11 or 12,
				TextTransparency = 0.48,
				FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
				Parent = aH,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			}), ae('Frame', {
				Size = UDim2.new(1, 0, 0, al and 38 or 38),
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Parent = au
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Center'
				})
			})
			local function CreateButton(aK, aL, aM, aN, aO)
				local aP = ac.NewRoundFrame(14, 'Squircle', {
					Size = UDim2.new(0.5, - 4, 1, 0),
					ImageTransparency = aN == 'Primary' and (al and 0.08 or 0.18) or (al and 0.84 or 0.9),
					Parent = aK,
					ThemeTag = {
						ImageColor3 = aN == 'Primary' and 'Primary' or 'ElementBackground'
					}
				}, {
					ae('UIPadding', {
						PaddingLeft = UDim.new(0, al and 8 or 10),
						PaddingRight = UDim.new(0, al and 8 or 10)
					}),
					ae('UIListLayout', {
						Padding = UDim.new(0, al and 5 or 7),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Center'
					}),
					aM and CreateIcon(aM, nil, al and 13 or 15) or nil,
					ae('TextLabel', {
						Name = 'Title',
						Size = UDim2.new(0, 0, 1, 0),
						AutomaticSize = 'X',
						BackgroundTransparency = 1,
						Text = aL,
						TextSize = al and 12 or 13,
						FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
				}, true)
				ad.AttachPress(aP, ac, {
					Amount = 0.97
				})
				ac.AddSignal(aP.MouseButton1Click, function()
					ac.SafeCallback(aO)
				end)
				return aP
			end
			local aK
			local function ApplyKey(aL, aM)
				local aN, aO = NormalizeKey(aL)
				ag:SetToggleKey(aO)
				aE.Text = aN
				if not aM then
					Notify('Keybind updated', aO and ('Toggle key: ' .. aN) or 'Toggle key cleared.', 'keyboard', 'Success')
				end
			end
			local function StopCapture()
				ar.Capturing = false
				if aK then
					ac.DisconnectSignal(aK)
					aK = nil
				end
			end
			function ar.Capture(aL)
				if ar.Capturing then
					return
				end
				ar.Capturing = true
				aE.Text = 'Press key...'
				aK = ac.AddSignal(aa.InputBegan, function(aM)
					if aM.UserInputType ~= Enum.UserInputType.Keyboard then
						return
					end
					if aM.KeyCode == Enum.KeyCode.Unknown then
						return
					end
					if aM.KeyCode == Enum.KeyCode.Escape then
						StopCapture()
						local aN = NormalizeKey(ag.ToggleKey)
						aE.Text = aN
						return
					end
					ApplyKey(aM.KeyCode)
					StopCapture()
				end)
			end
			local aL, aM, aN = CreateButton(aJ, al and 'Bind' or 'Set Key', 'scan-line', 'Primary', function()
				ar:Capture()
			end), CreateButton(aJ, 'Clear', 'x', 'Secondary', function()
				StopCapture()
				ApplyKey(nil)
			end), ae('Frame', {
				Name = 'QuickKeys',
				Size = UDim2.new(1, 0, 0, al and 34 or 32),
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Parent = au
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Center'
				})
			})
			local function ShortKeyName(aO)
				local aP = tostring(aO)
				if not al then
					return aP
				end
				aP = aP:gsub('Right', 'R')
				aP = aP:gsub('Left', 'L')
				aP = aP:gsub('Control', 'Ctrl')
				return aP
			end
			for aO, aP in next, aq do
				local aQ, aR = NormalizeKey(aP)
				if aR then
					CreateButton(aN, ShortKeyName(aP), nil, 'Secondary', function()
						StopCapture()
						ApplyKey(aR)
					end).Size = UDim2.new(1 / # aq, - 4, 1, 0)
				end
			end
			local aO, aP = {}, {}
			local function ClearElementRows()
				for aQ, aR in next, aP do
					if aR then
						aR:Disconnect()
					end
				end
				for aQ, aR in next, aO do
					if aR and aR.Destroy then
						aR:Destroy()
					end
				end
				for aQ in next, aP do
					aP[aQ] = nil
				end
				for aQ in next, aO do
					aO[aQ] = nil
				end
			end
			local function NormalizeElementKey(aQ)
				local aR, aS = NormalizeKey(aQ)
				if aS then
					return ShortKeyName(aR), aS
				end
				if typeof(aQ) == 'string' and aQ ~= '' then
					return ShortKeyName(aQ), nil
				end
				return nil, nil
			end
			local function GetElementKeybind(aQ)
				if typeof(aQ) ~= 'table' then
					return nil, nil
				end
				local aR = aQ.Keybind or aQ.KeyBind or aQ.Shortcut or aQ.Bind or aQ.Hotkey or (aQ.__type == 'Keybind' and aQ.Value)
				return NormalizeElementKey(aR)
			end
			local function GetElementIcon(aQ)
				if aQ.__type == 'Toggle' then
					return 'toggle-right'
				elseif aQ.__type == 'Button' then
					return 'mouse-pointer-click'
				end
				return 'keyboard'
			end
			local function ActivateElement(aQ, aR)
				if typeof(aQ) ~= 'table' then
					return
				end
				if aQ.Locked then
					return
				end
				if aQ.__type == 'Toggle' and aQ.Toggle then
					aQ:Toggle()
					return
				end
				if aQ.__type == 'Button' and aQ.Press then
					aQ:Press()
					return
				end
				if aQ.Callback then
					ac.SafeCallback(aQ.Callback, aR)
				end
			end
			local function CreateElementRow(aQ, aR, aS)
				local aT = ac.NewRoundFrame(12, 'Squircle', {
					Name = 'ElementBind',
					Size = UDim2.new(1, 0, 0, al and 28 or 32),
					ImageTransparency = al and 0.9 or 0.92,
					LayoutOrder = aS,
					Parent = aH,
					ThemeTag = {
						ImageColor3 = 'ElementBackground'
					}
				}, {
					ae('UIPadding', {
						PaddingLeft = UDim.new(0, 8),
						PaddingRight = UDim.new(0, 8)
					}),
					ae('UIListLayout', {
						Padding = UDim.new(0, 7),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center'
					}),
					CreateIcon(GetElementIcon(aQ), nil, al and 13 or 14),
					ae('TextLabel', {
						Name = 'Title',
						Size = UDim2.new(1, - 84, 1, 0),
						BackgroundTransparency = 1,
						Text = aQ.Title or aQ.__type or 'Element',
						TextSize = al and 11 or 12,
						TextXAlignment = 'Left',
						TextTruncate = 'AtEnd',
						FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					}),
					ae('TextLabel', {
						Name = 'Key',
						Size = UDim2.new(0, 56, 0, al and 20 or 22),
						BackgroundTransparency = 1,
						Text = aR,
						TextSize = al and 11 or 12,
						TextXAlignment = 'Right',
						TextTransparency = 0.14,
						FontFace = Font.new(ac.Font, Enum.FontWeight.Bold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
				}, true)
				ad.AttachPress(aT, ac, {
					Amount = 0.98
				})
				local aU = aT.MouseButton1Click:Connect(function()
					ActivateElement(aQ, aR)
				end)
				table.insert(aP, aU)
				table.insert(aO, aT)
			end
			local function RenderElementBindings()
				ClearElementRows()
				local aQ = 0
				for aR, aS in next, ag.AllElements or {} do
					local aT = GetElementKeybind(aS)
					if aT then
						aQ += 1
						CreateElementRow(aS, aT, aQ)
					end
				end
				aI.Visible = aQ == 0
				aG.Text = aQ > 0 and ('Element keybinds (' .. aQ .. ')') or 'Element keybinds'
			end
			if ag.ToggleKey == nil and aj.DefaultKey and aj.ApplyDefault ~= false then
				local aQ, aR = NormalizeKey(aj.DefaultKey)
				if aR then
					ApplyKey(aR, true)
				end
			end
			local function UpdateRootPosition()
				local aQ, aR = GetViewportSize(), 12
				if al then
					am = math.min(aj.Width or 330, math.max(240, aQ.X - (aR * 2)))
					an = aj.Height or 300
					as.Size = UDim2.fromOffset(am, an)
					as.AnchorPoint = Vector2.new(0.5, 1)
					ar.TargetPosition = UDim2.fromOffset(aQ.X / 2, aQ.Y - aR)
					as.Position = ar.TargetPosition
					at.Size = UDim2.fromOffset(aQ.X, aQ.Y)
					if ar.UserMoved and ar.StoredPosition then
						as.Position = ar.StoredPosition
						ar.TargetPosition = ar.StoredPosition
					end
					return
				end
				local aS, aT = aQ.X - aR, aR + ag.Topbar.Height
				if ar.Button and ar.Button.AbsoluteSize.X > 0 then
					local aU, aV = ar.Button.AbsolutePosition, ar.Button.AbsoluteSize
					aS = aU.X + aV.X
					aT = aU.Y + aV.Y + 10
				end
				if aS - am < aR then
					aS = math.min(aQ.X - aR, aR + am)
				end
				if aT + an > aQ.Y - aR then
					aT = math.max(aR, aQ.Y - an - aR)
				end
				as.Position = UDim2.fromOffset(aS, aT)
				ar.TargetPosition = as.Position
				at.Size = UDim2.fromOffset(aQ.X, aQ.Y)
				if ar.UserMoved and ar.StoredPosition then
					as.Position = ar.StoredPosition
				end
			end
			function ar.SetButton(aQ, aR)
				ar.Button = aR
			end
			local aQ = ac.Drag(as, {
				aw,
				av
			}, function(aQ)
				if not aQ then
					ar.UserMoved = true
					ar.StoredPosition = as.Position
				end
			end)
			ar.UIElements.Drag = aQ
			function ar.OpenMenu(aR)
				if ar.Open then
					return
				end
				ar.Open = true
				ar.Token += 1
				RenderElementBindings()
				UpdateRootPosition()
				local aS = ar.TargetPosition or as.Position
				as.Visible = true
				as.Active = true
				at.Visible = true
				if al then
					as.Position = UDim2.new(aS.X.Scale, aS.X.Offset, aS.Y.Scale, aS.Y.Offset + 18)
				end
				as.ImageTransparency = 1
				au.GroupTransparency = 1
				as.GlassLayer.ImageTransparency = 1
				as.Outline.ImageTransparency = 1
				as.Scale.Scale = 0.98
				at.BackgroundTransparency = 1
				ad.Play(as, 'DropdownOpen', {
					ImageTransparency = aj.BackgroundTransparency or (al and 0.48 or 0.18),
					Position = aS
				}, nil, nil, 'KeyBindMenu')
				ad.Play(au, 'DropdownOpen', {
					GroupTransparency = 0
				}, nil, nil, 'KeyBindContent')
				ad.Play(as.GlassLayer, 'DropdownOpen', {
					ImageTransparency = al and 0.92 or 0.78
				}, nil, nil, 'KeyBindGlass')
				ad.Play(as.Outline, 'DropdownOpen', {
					ImageTransparency = al and 0.48 or 0.72
				}, nil, nil, 'KeyBindOutline')
				ad.Play(as.Scale, 'DropdownOpen', {
					Scale = 1
				}, nil, nil, 'KeyBindScale')
				ad.Play(at, 'DropdownOpen', {
					BackgroundTransparency = GetScrimTransparency()
				}, nil, nil, 'KeyBindScrim')
			end
			function ar.CloseMenu(aR)
				if not ar.Open then
					return
				end
				ar.Open = false
				ar.Token += 1
				local aS = ar.Token
				StopCapture()
				as.Active = false
				local aT = as.Position
				if al then
					aT = UDim2.new(as.Position.X.Scale, as.Position.X.Offset, as.Position.Y.Scale, as.Position.Y.Offset + 18)
				end
				ad.Play(as, 'DropdownClose', {
					ImageTransparency = 1,
					Position = aT
				}, nil, nil, 'KeyBindMenu')
				ad.Play(au, 'DropdownClose', {
					GroupTransparency = 1
				}, nil, nil, 'KeyBindContent')
				ad.Play(as.GlassLayer, 'DropdownClose', {
					ImageTransparency = 1
				}, nil, nil, 'KeyBindGlass')
				ad.Play(as.Outline, 'DropdownClose', {
					ImageTransparency = 1
				}, nil, nil, 'KeyBindOutline')
				ad.Play(as.Scale, 'DropdownClose', {
					Scale = 0.98
				}, nil, nil, 'KeyBindScale')
				ad.Play(at, 'DropdownClose', {
					BackgroundTransparency = 1
				}, nil, nil, 'KeyBindScrim')
				task.delay(ad.GetDuration'DropdownClose', function()
					if aS == ar.Token then
						as.Visible = false
						at.Visible = false
					end
				end)
			end
			function ar.Toggle(aR)
				if ar.Open then
					ar:CloseMenu()
				else
					ar:OpenMenu()
				end
			end
			ac.AddSignal(aa.InputBegan, function(aR)
				if not ar.Open then
					return
				end
				if aR.UserInputType ~= Enum.UserInputType.MouseButton1 and aR.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if ContainsPoint(as, aR.Position) or ContainsPoint(ar.Button, aR.Position) then
					return
				end
				ar:CloseMenu()
			end)
			ar.UIElements.CurrentKey = aE
			ar.UIElements.SetButton = aL
			ar.UIElements.ClearButton = aM
			return ar
		end
		return af
	end
	function a.G()
		local aa, ab = {}, a.load'd'
		local ac, ad = ab.New, ab.Tween
		function aa.New(ae, af, ag, ah, ai, aj)
			local ak = {
				Container = nil,
				TooltipSize = 16,
				TooltipArrowSizeX = ai == 'Small' and 16 or 24,
				TooltipArrowSizeY = ai == 'Small' and 6 or 9,
				PaddingX = ai == 'Small' and 12 or 14,
				PaddingY = ai == 'Small' and 7 or 9,
				Radius = 999,
				TitleFrame = nil
			}
			ah = ah or ''
			aj = aj ~= false
			local al = ac('TextLabel', {
				AutomaticSize = 'XY',
				TextWrapped = aj,
				BackgroundTransparency = 1,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				Text = ae,
				TextSize = ai == 'Small' and 15 or 17,
				TextTransparency = 1,
				ThemeTag = {
					TextColor3 = 'Tooltip' .. ah .. 'Text'
				}
			})
			ak.TitleFrame = al
			local am = ac('UIScale', {
				Scale = 0.9
			})
			local an = ac('Frame', {
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = 'XY',
				BackgroundTransparency = 1,
				Parent = af,
				Visible = false
			}, {
				ac('UISizeConstraint', {
					MaxSize = Vector2.new(400, math.huge)
				}),
				ac('Frame', {
					AutomaticSize = 'XY',
					BackgroundTransparency = 1,
					LayoutOrder = 99,
					Visible = ag,
					Name = 'Arrow'
				}, {
					ac('ImageLabel', {
						Size = UDim2.new(0, ak.TooltipArrowSizeX, 0, ak.TooltipArrowSizeY),
						BackgroundTransparency = 1,
						Image = 'rbxassetid://105854070513330',
						ThemeTag = {
							ImageColor3 = 'Tooltip' .. ah
						}
					}, {})
				}),
				ab.NewRoundFrame(ak.Radius, 'Squircle', {
					AutomaticSize = 'XY',
					ThemeTag = {
						ImageColor3 = 'Tooltip' .. ah
					},
					ImageTransparency = 1,
					Name = 'Background'
				}, {
					ac('Frame', {
						AutomaticSize = 'XY',
						BackgroundTransparency = 1
					}, {
						ac('UICorner', {
							CornerRadius = UDim.new(0, 16)
						}),
						ac('UIListLayout', {
							Padding = UDim.new(0, 12),
							FillDirection = 'Horizontal',
							VerticalAlignment = 'Center'
						}),
						al,
						ac('UIPadding', {
							PaddingTop = UDim.new(0, ak.PaddingY),
							PaddingLeft = UDim.new(0, ak.PaddingX),
							PaddingRight = UDim.new(0, ak.PaddingX),
							PaddingBottom = UDim.new(0, ak.PaddingY)
						})
					})
				}),
				am,
				ac('UIListLayout', {
					Padding = UDim.new(0, 0),
					FillDirection = 'Vertical',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center'
				})
			})
			ak.Container = an
			function ak.Open(ao)
				an.Visible = true
				ad(an.Background, 0.2, {
					ImageTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(an.Arrow.ImageLabel, 0.2, {
					ImageTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(al, 0.2, {
					TextTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(am, 0.22, {
					Scale = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			end
			function ak.Close(ao, ap)
				ad(an.Background, 0.3, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(an.Arrow.ImageLabel, 0.2, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(al, 0.3, {
					TextTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(am, 0.35, {
					Scale = 0.9
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.In):Play()
				ap = ap ~= false
				if ap then
					task.wait(0.35)
					an.Visible = false
					an:Destroy()
				end
			end
			return ak
		end
		return aa
	end
	function a.H()
		local aa, ab, ac = game:GetService'TweenService', a.load'd', a.load'e'
		local ad, ae = ab.New, {}
		local function GetImageTarget(af)
			if typeof(af) ~= 'Instance' then
				return nil
			end
			if af:IsA'ImageLabel' or af:IsA'ImageButton' then
				return af
			end
			return af:FindFirstChildWhichIsA('ImageLabel', true) or af:FindFirstChildWhichIsA('ImageButton', true)
		end
		local function AsColor(af, ag)
			if typeof(af) == 'Color3' then
				return af
			end
			if typeof(af) == 'string' then
				local ah, ai = pcall(function()
					return Color3.fromHex(af)
				end)
				if ah then
					return ai
				end
			end
			return ag
		end
		local function NewGradient(af, ag, ah, ai)
			return ad('UIGradient', {
				Rotation = af or 0,
				Offset = ag or Vector2.new(0, 0),
				Color = ColorSequence.new(ah),
				Transparency = NumberSequence.new(ai)
			})
		end
		function ae.Apply(af, ag)
			if typeof(af) ~= 'Instance' then
				return nil
			end
			ag = typeof(ag) == 'table' and ag or {}
			local ah, ai, aj, ak, al, am, an, ao = ag.Corner or 16, ag.ZIndex or af.ZIndex or 1, ag.Compact == true, ag.Animated ~= false, AsColor(ag.EdgeColor, Color3.fromRGB(255, 215, 92)), AsColor(ag.DeepColor, Color3.fromRGB(84, 54, 10)), AsColor(ag.MidColor, Color3.fromRGB(206, 147, 39)), AsColor(ag.HotColor, Color3.fromRGB(255, 241, 166))
			pcall(function()
				af.ClipsDescendants = true
			end)
			local ap = ad('Frame', {
				Name = ag.Name or 'GoldenEffect',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Active = false,
				ZIndex = ai + 20,
				Parent = af
			})
			local aq, ar, as = ab.NewRoundFrame(ah, 'Squircle', {
				Name = 'GoldenFill',
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = am,
				ImageTransparency = ag.FillTransparency or 0.76,
				Active = false,
				ZIndex = ai + 20,
				Parent = ap
			}, {
				NewGradient(24, Vector2.new(- 0.1, 0), {
					ColorSequenceKeypoint.new(0, am),
					ColorSequenceKeypoint.new(0.42, an),
					ColorSequenceKeypoint.new(0.72, ao),
					ColorSequenceKeypoint.new(1, am)
				}, {
					NumberSequenceKeypoint.new(0, 0.18),
					NumberSequenceKeypoint.new(0.52, 0.04),
					NumberSequenceKeypoint.new(1, 0.22)
				})
			}), ab.NewRoundFrame(ah, 'SquircleOutline', {
				Name = 'GoldenOutline',
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = al,
				ImageTransparency = ag.OutlineTransparency or 0.22,
				Active = false,
				ZIndex = ai + 22,
				Parent = ap
			}, {
				NewGradient(35, Vector2.new(0, 0), {
					ColorSequenceKeypoint.new(0, al),
					ColorSequenceKeypoint.new(0.5, ao),
					ColorSequenceKeypoint.new(1, an)
				}, {
					NumberSequenceKeypoint.new(0, 0.04),
					NumberSequenceKeypoint.new(0.48, 0),
					NumberSequenceKeypoint.new(1, 0.12)
				})
			}), NewGradient(18, Vector2.new(- 1.15, 0), {
				ColorSequenceKeypoint.new(0, ao),
				ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
				ColorSequenceKeypoint.new(1, ao)
			}, {
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.42, 1),
				NumberSequenceKeypoint.new(0.5, 0.15),
				NumberSequenceKeypoint.new(0.58, 1),
				NumberSequenceKeypoint.new(1, 1)
			})
			local at, au, av, aw = ab.NewRoundFrame(ah, 'Squircle', {
				Name = 'GoldenSheen',
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = ao,
				ImageTransparency = ag.SheenTransparency or 0.74,
				Active = false,
				ZIndex = ai + 23,
				Parent = ap
			}, {
				as
			}), ad('Frame', {
				Name = 'Sparkles',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Active = false,
				ClipsDescendants = true,
				ZIndex = ai + 24,
				Parent = ap
			}), {}, ag.Points or {
				{
					0.16,
					0.28,
					0
				},
				{
					0.76,
					0.22,
					0.42
				},
				{
					0.34,
					0.72,
					0.82
				},
				{
					0.88,
					0.64,
					1.12
				}
			}
			for ax, ay in ipairs(aw) do
				local az, aA = aj and 9 or 12, ab.Image('sparkles', 'GoldenSparkle' .. ax, 0, 'Temp', 'GoldenEffect', false, true)
				aA.Name = 'Sparkle' .. ax
				aA.Size = UDim2.fromOffset(az, az)
				aA.AnchorPoint = Vector2.new(0.5, 0.5)
				aA.Position = UDim2.fromScale(ay[1], ay[2])
				aA.BackgroundTransparency = 1
				aA.ZIndex = ai + 24
				aA.Parent = au
				local aB = GetImageTarget(aA)
				if aB then
					aB.ImageColor3 = ao
					aB.ImageTransparency = 0.62
					aB.ZIndex = ai + 24
				end
				local aC = ad('UIScale', {
					Scale = 0.72,
					Parent = aA
				})
				table.insert(av, {
					Frame = aA,
					Image = aB,
					Scale = aC,
					Delay = ay[3] or 0
				})
			end
			local ax = {
				Root = ap,
				Fill = aq,
				Outline = ar,
				Sheen = at,
				Sparkles = av,
				Running = true
			}
			function ax.Destroy(ay)
				ay.Running = false
				if ay.Root then
					ay.Root:Destroy()
				end
			end
			if ac:IsEnabled() and not ac.Reduced and ak then
				task.spawn(function()
					while ax.Running and ap.Parent do
						as.Offset = Vector2.new(- 1.15, 0)
						local ay = aa:Create(as, TweenInfo.new(ag.SheenDuration or 1.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
							Offset = Vector2.new(1.15, 0)
						})
						ay:Play()
						ay.Completed:Wait()
						task.wait(ag.SheenPause or 0.42)
					end
				end)
				for ay, az in ipairs(av) do
					task.spawn(function()
						task.wait(az.Delay)
						while ax.Running and ap.Parent and az.Frame.Parent do
							az.Scale.Scale = 0.72
							az.Frame.Rotation = - 18
							if az.Image then
								az.Image.ImageTransparency = 0.68
							end
							local aA, aB, aC = aa:Create(az.Scale, TweenInfo.new(0.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
								Scale = 1.12
							}), az.Image and aa:Create(az.Image, TweenInfo.new(0.22, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								ImageTransparency = 0.12
							}), aa:Create(az.Frame, TweenInfo.new(0.58, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
								Rotation = 22
							})
							aA:Play()
							aC:Play()
							if aB then
								aB:Play()
							end
							aA.Completed:Wait()
							local aD, aE = aa:Create(az.Scale, TweenInfo.new(0.24, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
								Scale = 0.78
							}), az.Image and aa:Create(az.Image, TweenInfo.new(0.28, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
								ImageTransparency = 0.72
							})
							aD:Play()
							if aE then
								aE:Play()
							end
							aD.Completed:Wait()
							task.wait(ag.SparklePause or 1.2)
						end
					end)
				end
			end
			return ax
		end
		return ae
	end
	function a.I()
		game:GetService'ReplicatedStorage'
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae, af = aa.New, aa.NewRoundFrame, a.load'H', (cloneref or clonereference or function(ac)
			return ac
		end)
		af(game:GetService'UserInputService')
		local ag = a.load'A'
		local function Color3ToHSB(ah)
			local ai, aj, ak = ah.R, ah.G, ah.B
			local al, am = math.max(ai, aj, ak), math.min(ai, aj, ak)
			local an, ao = al - am, 0
			if an ~= 0 then
				if al == ai then
					ao = (aj - ak) / an % 6
				elseif al == aj then
					ao = (ak - ai) / an + 2
				else
					ao = (ai - aj) / an + 4
				end
				ao = ao * 60
			else
				ao = 0
			end
			local ap, aq = (al == 0) and 0 or (an / al), al
			return {
				h = math.floor(ao + 0.5),
				s = ap,
				b = aq
			}
		end
		local function GetPerceivedBrightness(ah)
			local ai, aj, ak = ah.R, ah.G, ah.B
			return 0.299 * ai + 0.587 * aj + 0.114 * ak
		end
		local function GetTextColorForHSB(ah)
			local ai = Color3ToHSB(ah)
			local aj, ak, al = ai.h, ai.s, ai.b
			if GetPerceivedBrightness(ah) > 0.5 then
				return Color3.fromHSV(aj / 360, 0, 0.05)
			else
				return Color3.fromHSV(aj / 360, 0, 0.98)
			end
		end
		local function Coalesce( ...)
			for ah = 1, select('#', ...) do
				local ai = select(ah, ...)
				if ai ~= nil then
					return ai
				end
			end
			return nil
		end
		return function(ah)
			local ai = {
				Title = ah.Title,
				Desc = ah.Desc or nil,
				Hover = ah.Hover,
				Thumbnail = ah.Thumbnail,
				ThumbnailSize = ah.ThumbnailSize or 80,
				Image = ah.Image,
				IconThemed = ah.IconThemed or false,
				ImageSize = ah.ImageSize or 30,
				Color = ah.Color,
				Scalable = ah.Scalable,
				Parent = ah.Parent,
				Justify = ah.Justify or 'Between',
				UIPadding = ah.Window.ElementConfig.UIPadding,
				UICorner = ah.Window.ElementConfig.UICorner,
				Transparency = Coalesce(ah.Transparency, ah.ParentConfig and ah.ParentConfig.Transparency, ah.ParentConfig and ah.ParentConfig.ElementTransparency, ah.Window.ElementConfig.Transparency),
				GlassTransparency = Coalesce(ah.GlassTransparency, ah.ParentConfig and ah.ParentConfig.GlassTransparency, ah.Window.ElementConfig.GlassTransparency),
				LiquidGlass = Coalesce(ah.LiquidGlass, ah.ParentConfig and ah.ParentConfig.LiquidGlass, ah.ParentConfig and ah.ParentConfig.GlassLiquid, ah.Window.ElementConfig.LiquidGlass),
				Golden = ah.Golden == true or ah.Premium == true or (ah.ParentConfig and (ah.ParentConfig.Golden == true or ah.ParentConfig.Premium == true)),
				CornerStyle = Coalesce(ah.CornerStyle, ah.ParentConfig and ah.ParentConfig.CornerStyle, ah.ParentConfig and ah.ParentConfig.ElementCornerStyle, ah.Window.ElementConfig.CornerStyle),
				Size = ah.Size or 'Default',
				Tags = ah.Tags or {},
				UIElements = {},
				Index = ah.Index,
				LinkCorners = ah.LinkCorners,
				CornerGroup = ah.CornerGroup or ah.LinkCornerGroup,
				CornerBreak = ah.CornerBreak,
				CornerBreakBefore = ah.CornerBreakBefore,
				CornerBreakAfter = ah.CornerBreakAfter
			}
			local aj, ak, al, am, an, ao, ap, aq, ar, as, at, au, av = ai.Size == 'Small' and - 4 or ai.Size == 'Large' and 4 or 0, ai.Size == 'Small' and - 4 or ai.Size == 'Large' and 4 or 0, ai.ImageSize, ai.ThumbnailSize, true, ai.CornerStyle == 'Native' or ai.CornerStyle == 'PerCorner', aa.ClampTransparency(ai.Transparency, nil), {}, {
				TopLeft = true,
				TopRight = true,
				BottomLeft = true,
				BottomRight = true
			}, 0
			local function NewLayerCorner()
				local aw = ac('UICorner', {
					CornerRadius = UDim.new(0, ai.UICorner)
				})
				table.insert(aq, aw)
				return aw
			end
			local aw, ax
			if ai.Thumbnail then
				aw = aa.Image(ai.Thumbnail, ai.Title, ah.Window.NewElements and ai.UICorner - 11 or (ai.UICorner - 4), ah.Window.Folder, 'Thumbnail', false, ai.IconThemed)
				aw.Size = UDim2.new(1, 0, 0, am)
			end
			if ai.Image then
				ax = aa.Image(ai.Image, ai.Title, ah.Window.NewElements and ai.UICorner - 11 or (ai.UICorner - 4), ah.Window.Folder, 'Image', ai.IconThemed, not ai.Color and true or false, 'ElementIcon')
				if typeof(ai.Color) == 'string' and not string.find(ai.Image, 'rbxthumb') then
					ax.ImageLabel.ImageColor3 = GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color]))
				elseif typeof(ai.Color) == 'Color3' and not string.find(ai.Image, 'rbxthumb') then
					ax.ImageLabel.ImageColor3 = GetTextColorForHSB(ai.Color)
				end
				ax.Size = UDim2.new(0, al, 0, al)
				as = al
			end
			local function CreateText(ay, az)
				local aA = typeof(ai.Color) == 'string' and GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color])) or typeof(ai.Color) == 'Color3' and GetTextColorForHSB(ai.Color)
				return ac('TextLabel', {
					BackgroundTransparency = 1,
					Text = ay or '',
					TextSize = az == 'Desc' and 15 or 17,
					TextXAlignment = 'Left',
					ThemeTag = {
						TextColor3 = not ai.Color and ('Element' .. az) or nil
					},
					TextColor3 = ai.Color and aA or nil,
					TextTransparency = az == 'Desc' and 0.3 or 0,
					TextWrapped = true,
					Size = UDim2.new(ai.Justify == 'Between' and 1 or 0, 0, 0, 0),
					AutomaticSize = ai.Justify == 'Between' and 'Y' or 'XY',
					FontFace = Font.new(aa.Font, az == 'Desc' and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold)
				})
			end
			local ay, az = CreateText(ai.Title, 'Title'), CreateText(ai.Desc, 'Desc')
			if not ai.Title or ai.Title == '' then
				az.Visible = false
			end
			if not ai.Desc or ai.Desc == '' then
				az.Visible = false
			end
			ai.UIElements.Title = ay
			ai.UIElements.Desc = az
			ai.UIElements.Container = ac('Frame', {
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, ai.UIPadding),
					FillDirection = 'Vertical',
					VerticalAlignment = 'Center',
					HorizontalAlignment = ai.Justify == 'Between' and 'Left' or 'Center'
				}),
				aw,
				ac('Frame', {
					Size = UDim2.new(ai.Justify == 'Between' and 1 or 0, ai.Justify == 'Between' and - ah.TextOffset or 0, 0, 0),
					AutomaticSize = ai.Justify == 'Between' and 'Y' or 'XY',
					BackgroundTransparency = 1,
					Name = 'TitleFrame'
				}, {
					ac('UIListLayout', {
						Padding = UDim.new(0, ai.UIPadding),
						FillDirection = 'Horizontal',
						VerticalAlignment = ah.Window.NewElements and (ai.Justify == 'Between' and 'Top' or 'Center') or 'Center',
						HorizontalAlignment = ai.Justify ~= 'Between' and ai.Justify or 'Center'
					}),
					ax,
					ac('Frame', {
						BackgroundTransparency = 1,
						AutomaticSize = ai.Justify == 'Between' and 'Y' or 'XY',
						Size = UDim2.new(ai.Justify == 'Between' and 1 or 0, ai.Justify == 'Between' and (ax and - as - ai.UIPadding or - as) or 0, 1, 0),
						Name = 'TitleFrame'
					}, {
						ac('UIPadding', {
							PaddingTop = UDim.new(0, (ah.Window.NewElements and ai.UIPadding / 2 or 0) + ak),
							PaddingLeft = UDim.new(0, (ah.Window.NewElements and ai.UIPadding / 2 or 0) + aj),
							PaddingRight = UDim.new(0, (ah.Window.NewElements and ai.UIPadding / 2 or 0) + aj),
							PaddingBottom = UDim.new(0, (ah.Window.NewElements and ai.UIPadding / 2 or 0) + ak)
						}),
						ac('UIListLayout', {
							Padding = UDim.new(0, 6),
							FillDirection = 'Vertical',
							VerticalAlignment = 'Center',
							HorizontalAlignment = 'Left'
						}),
						ac('ScrollingFrame', {
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = 'Y',
							LayoutOrder = - 99,
							BackgroundTransparency = 1,
							ScrollingDirection = 'X',
							CanvasSize = UDim2.new(0, 0, 0, 0),
							ScrollBarThickness = 0,
							Visible = false
						}, {
							ac('UIListLayout', {
								FillDirection = 'Horizontal',
								VerticalAlignment = 'Center',
								HorizontalAlignment = 'Left',
								Padding = UDim.new(0, ah.Window.UIPadding / 2)
							})
						}),
						ac('Frame', {
							Name = 'Space',
							Size = UDim2.new(1, 0, 0, 0),
							BackgroundTransparency = 1,
							Visible = false
						}),
						ay,
						az
					})
				})
			})
			for aA, aB in next, ah.Tags or {} do
				if not ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible then
					ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible = true
					ai.UIElements.Container.TitleFrame.TitleFrame.Space.Visible = true
				end
				ag:New(aB, ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame)
			end
			aa.AddSignal(ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout:GetPropertyChangedSignal'AbsoluteContentSize', function()
				ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Size = UDim2.new(1, 0, 0, ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y / ah.ParentConfig.UIScale)
			end)
			local aA = aa.Image('lock', 'lock', 0, ah.Window.Folder, 'Lock', false)
			aA.Size = UDim2.new(0, 20, 0, 20)
			aA.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
			aA.ImageLabel.ImageTransparency = 0.4
			local aB, aC = ac('TextLabel', {
				Text = 'Locked',
				TextSize = 18,
				FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				AutomaticSize = 'XY',
				BackgroundTransparency = 1,
				TextColor3 = Color3.new(1, 1, 1),
				TextTransparency = 0.05
			}), ac('Frame', {
				Size = UDim2.new(1, ai.UIPadding * 2, 1, ai.UIPadding * 2),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ZIndex = 9999999
			})
			local aD, aE = ad(ai.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 0.25,
				ImageColor3 = Color3.new(0, 0, 0),
				Visible = false,
				Active = false,
				Parent = aC
			}, {
				NewLayerCorner(),
				ac('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, 8)
				}),
				aA,
				aB
			}, nil, true)
			local aF, aG, aH = ad(ai.UICorner, 'Squircle-Outline', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = 'Text'
				},
				Parent = aC
			}, {
				ac('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, 8)
				})
			}, nil, true), ad(ai.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = 'Text'
				},
				Parent = aC
			}, {
				NewLayerCorner(),
				ac('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, 8)
				})
			}, nil, true)
			local aI, aJ, aK = ad(ai.UICorner, 'Squircle-Outline', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Visible = false,
				Active = false,
				ThemeTag = {
					ImageColor3 = 'Text'
				},
				Parent = aC
			}, {
				ac('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, 8)
				}),
				ac('UIGradient', {
					Name = 'HoverGradient',
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.25, 0.9),
						NumberSequenceKeypoint.new(0.5, 0.3),
						NumberSequenceKeypoint.new(0.75, 0.9),
						NumberSequenceKeypoint.new(1, 1)
					}
				})
			}, nil, true), ad(ai.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = 'Text'
				},
				Parent = aC
			}, {
				NewLayerCorner(),
				ac('UIGradient', {
					Name = 'HoverGradient',
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.25, 0.9),
						NumberSequenceKeypoint.new(0.5, 0.3),
						NumberSequenceKeypoint.new(0.75, 0.9),
						NumberSequenceKeypoint.new(1, 1)
					}
				}),
				ac('UIListLayout', {
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, 8)
				})
			}, nil, true)
			local function GetElementColor()
				if typeof(ai.Color) == 'string' then
					return Color3.fromHex(aa.Colors[ai.Color])
				end
				if typeof(ai.Color) == 'Color3' then
					return ai.Color
				end
				return nil
			end
			local function GetBackgroundTransparency()
				if ap ~= nil then
					return ap
				end
				if ai.LiquidGlass then
					return aa.ClampTransparency(ai.GlassTransparency, 0.24)
				end
				if ai.Color then
					return 0.05
				end
				if not ah.Window.NewElements then
					return 0.93
				end
				return nil
			end
			local function ApplyNativeCorners(aL)
				ar = aL or ar
				if au then
					aa.ApplyCornerRadii(au, UDim.new(0, ai.UICorner), ar)
				end
				for aM, aN in aq do
					aa.ApplyCornerRadii(aN, UDim.new(0, ai.UICorner), ar)
				end
			end
			local function CreateLiquidGlassChildren()
				if not ai.LiquidGlass then
					return {}
				end
				av = ac('UIGradient', {
					Rotation = 25,
					Offset = Vector2.new(- 0.35, 0),
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.45, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.94),
						NumberSequenceKeypoint.new(0.45, 0.78),
						NumberSequenceKeypoint.new(1, 0.98)
					}
				})
				return {
					ac('UIStroke', {
						ApplyStrokeMode = 'Border',
						Thickness = 1,
						Color = Color3.new(1, 1, 1),
						Transparency = 0.88
					}),
					av
				}
			end
			local function CreateNativeBackground()
				au = ac('UICorner', {
					CornerRadius = UDim.new(0, ai.UICorner)
				})
				local aL = {
					au
				}
				for aM, aN in next, CreateLiquidGlassChildren() do
					table.insert(aL, aN)
				end
				return ac('Frame', {
					Name = 'NativeBackground',
					Size = UDim2.new(1, ai.UIPadding * 2, 1, ai.UIPadding * 2),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					BackgroundColor3 = GetElementColor() or nil,
					BackgroundTransparency = GetBackgroundTransparency() or 0,
					ThemeTag = not ai.Color and {
						BackgroundColor3 = 'ElementBackground',
						BackgroundTransparency = ap == nil and not ai.LiquidGlass and 'ElementBackgroundTransparency' or nil
					} or nil,
					ZIndex = 0,
					Active = false
				}, aL)
			end
			local aL = {}
			if ao then
				at = CreateNativeBackground()
				table.insert(aL, at)
			end
			table.insert(aL, ai.UIElements.Container)
			table.insert(aL, aC)
			table.insert(aL, ac('UIPadding', {
				PaddingTop = UDim.new(0, ai.UIPadding),
				PaddingLeft = UDim.new(0, ai.UIPadding),
				PaddingRight = UDim.new(0, ai.UIPadding),
				PaddingBottom = UDim.new(0, ai.UIPadding)
			}))
			local aM, aN = ad(ai.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				ImageTransparency = ao and 1 or GetBackgroundTransparency(),
				Parent = ah.Parent,
				ThemeTag = {
					ImageColor3 = not ao and not ai.Color and (ah.Window.NewElements and 'ElementBackground' or 'Text') or nil,
					ImageTransparency = not ao and not ai.Color and ap == nil and not ai.LiquidGlass and (ah.Window.NewElements and 'ElementBackgroundTransparency' or nil) or nil
				},
				ImageColor3 = not ao and GetElementColor() or nil
			}, aL, true, true)
			ai.UIElements.Main = aM
			ai.UIElements.Locked = aD
			ApplyNativeCorners(ar)
			if ai.Golden then
				ai.UIElements.GoldenEffect = ae.Apply(aC, {
					Corner = ai.UICorner,
					Compact = ai.Size == 'Small',
					FillTransparency = 0.8,
					OutlineTransparency = 0.18,
					SheenTransparency = 0.82
				})
				ay.TextColor3 = Color3.fromRGB(255, 232, 144)
				az.TextColor3 = Color3.fromRGB(255, 224, 138)
				az.TextTransparency = math.min(az.TextTransparency + 0.08, 0.72)
			end
			if ai.Hover then
				aa.AddSignal(aM.MouseMoved, function(aO, aP)
					if an and aM.AbsoluteSize.X > 0 then
						aJ.HoverGradient.Offset = Vector2.new(((aO - aM.AbsolutePosition.X) / aM.AbsoluteSize.X) - 0.5, 0)
						aI.HoverGradient.Offset = Vector2.new(((aO - aM.AbsolutePosition.X) / aM.AbsoluteSize.X) - 0.5, 0)
						if av then
							av.Offset = Vector2.new(((aO - aM.AbsolutePosition.X) / aM.AbsoluteSize.X) - 0.5, 0)
						end
					end
				end)
				aa.AddSignal(aM.MouseEnter, function()
					if an then
						aI.Visible = true
						ab.Play(aJ, 'Hover', {
							ImageTransparency = 0.9
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						ab.Play(aI, 'Hover', {
							ImageTransparency = 0.8
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						if at and ai.LiquidGlass then
							ab.Play(at, 'Hover', {
								BackgroundTransparency = math.max((ap or ai.GlassTransparency or 0.24) - 0.06, 0)
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						end
					end
				end)
				aa.AddSignal(aM.InputEnded, function()
					if an then
						ab.Play(aJ, 'Hover', {
							ImageTransparency = 1
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						ab.Play(aI, 'Hover', {
							ImageTransparency = 1
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						if at and ai.LiquidGlass then
							ab.Play(at, 'Hover', {
								BackgroundTransparency = GetBackgroundTransparency() or 0
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						end
					end
				end)
				aa.AddSignal(aM.MouseLeave, function()
					if an then
						ab.Play(aJ, 'Hover', {
							ImageTransparency = 1
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						ab.Play(aI, 'Hover', {
							ImageTransparency = 1
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						if at and ai.LiquidGlass then
							ab.Play(at, 'Hover', {
								BackgroundTransparency = GetBackgroundTransparency() or 0
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						end
					end
				end)
			end
			if ai.Scalable then
				ab.AttachPress(aM, aa, {
					Amount = 0.985,
					Enabled = function()
						return an
					end
				})
			end
			function ai.SetTitle(aO, aP)
				ai.Title = aP
				ay.Text = aP
			end
			function ai.SetDesc(aO, aP)
				ai.Desc = aP
				az.Text = aP or ''
				if not aP then
					az.Visible = false
				elseif not az.Visible then
					az.Visible = true
				end
			end
			function ai.SetTransparency(aO, aP)
				ap = aa.ClampTransparency(aP, ap or 0)
				ai.Transparency = ap
				if at then
					ab.Play(at, 'Focus', {
						BackgroundTransparency = ap
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'ElementTransparency')
				else
					ab.Play(aM, 'Focus', {
						ImageTransparency = ap
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'ElementTransparency')
				end
			end
			function ai.SetLiquidGlass(aO, aP)
				ai.LiquidGlass = aP == true
				if at then
					for aQ, aR in next, at:GetChildren() do
						if aR:IsA'UIStroke' or aR:IsA'UIGradient' then
							pcall(function()
								aR.Enabled = ai.LiquidGlass
							end)
						end
					end
					if ap == nil then
						at.BackgroundTransparency = GetBackgroundTransparency() or 0
					end
				end
			end
			function ai.Colorize(aO, aP, aQ)
				if ai.Color then
					aP[aQ] = typeof(ai.Color) == 'string' and GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color])) or typeof(ai.Color) == 'Color3' and GetTextColorForHSB(ai.Color) or nil
				end
			end
			if ah.ElementTable then
				aa.AddSignal(ay:GetPropertyChangedSignal'Text', function()
					if ai.Title ~= ay.Text then
						ai:SetTitle(ay.Text)
						ah.ElementTable.Title = ay.Text
					end
				end)
				aa.AddSignal(az:GetPropertyChangedSignal'Text', function()
					if ai.Desc ~= az.Text then
						ai:SetDesc(az.Text)
						ah.ElementTable.Desc = az.Text
					end
				end)
			end
			function ai.SetThumbnail(aO, aP, aQ)
				ai.Thumbnail = aP
				if aQ then
					ai.ThumbnailSize = aQ
					am = aQ
				end
				if aw then
					if aP then
						aw:Destroy()
						aw = aa.Image(aP, ai.Title, ai.UICorner - 3, ah.Window.Folder, 'Thumbnail', false, ai.IconThemed)
						if aw then
							aw.Size = UDim2.new(1, 0, 0, am)
							aw.Parent = ai.UIElements.Container
							local aR = ai.UIElements.Container:FindFirstChild'UIListLayout'
							if aR then
								aw.LayoutOrder = - 1
							end
						end
					else
						aw.Visible = false
					end
				else
					if aP then
						aw = aa.Image(aP, ai.Title, ai.UICorner - 3, ah.Window.Folder, 'Thumbnail', false, ai.IconThemed)
						if aw then
							aw.Size = UDim2.new(1, 0, 0, am)
							aw.Parent = ai.UIElements.Container
							local aR = ai.UIElements.Container:FindFirstChild'UIListLayout'
							if aR then
								aw.LayoutOrder = - 1
							end
						end
					end
				end
			end
			function ai.SetImage(aO, aP, aQ)
				ai.Image = aP
				if aQ then
					ai.ImageSize = aQ
					al = aQ
				end
				if aP then
					local aR = ax and ax.Parent or ai.UIElements.Container.TitleFrame
					if ax then
						ax:Destroy()
					end
					ax = aa.Image(aP, aP, ai.UICorner - 3, ah.Window.Folder, 'Image', not ai.Color and true or false)
					if ax then
						if typeof(ai.Color) == 'string' and not string.find(ai.Image, 'rbxthumb') then
							ax.ImageLabel.ImageColor3 = GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color]))
						elseif typeof(ai.Color) == 'Color3' and not string.find(ai.Image, 'rbxthumb') then
							ax.ImageLabel.ImageColor3 = GetTextColorForHSB(ai.Color)
						end
						ax.Visible = true
						ax.Parent = aR
						ax.LayoutOrder = - 99
						ax.Size = UDim2.new(0, al, 0, al)
						as = ai.ImageSize + ai.UIPadding
					end
				else
					if ax then
						ax.Visible = true
					end
					as = 0
				end
				ai.UIElements.Container.TitleFrame.TitleFrame.Size = UDim2.new(1, - as, 1, 0)
			end
			function ai.Destroy(aO)
				aM:Destroy()
			end
			function ai.Lock(aO, aP)
				an = false
				aD.Active = true
				aD.Visible = true
				aB.Text = aP or 'Locked'
			end
			function ai.Unlock(aO)
				an = true
				aD.Active = false
				aD.Visible = false
			end
			function ai.Highlight(aO)
				local aP, aQ = ac('UIGradient', {
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.1, 0.9),
						NumberSequenceKeypoint.new(0.5, 0.3),
						NumberSequenceKeypoint.new(0.9, 0.9),
						NumberSequenceKeypoint.new(1, 1)
					},
					Rotation = 0,
					Offset = Vector2.new(- 1, 0),
					Parent = aF
				}), ac('UIGradient', {
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.15, 0.8),
						NumberSequenceKeypoint.new(0.5, 0.1),
						NumberSequenceKeypoint.new(0.85, 0.8),
						NumberSequenceKeypoint.new(1, 1)
					},
					Rotation = 0,
					Offset = Vector2.new(- 1, 0),
					Parent = aG
				})
				aF.ImageTransparency = 0.65
				aG.ImageTransparency = 0.88
				ab.Play(aP, 'Highlight', {
					Offset = Vector2.new(1, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Highlight')
				ab.Play(aQ, 'Highlight', {
					Offset = Vector2.new(1, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Highlight')
				task.spawn(function()
					task.wait(ab.GetDuration'Highlight')
					aF.ImageTransparency = 1
					aG.ImageTransparency = 1
					aP:Destroy()
					aQ:Destroy()
				end)
			end
			function ai.UpdateShape(aO)
				if ah.Window.NewElements then
					local aP, aQ, aR, aS, aT = ah.ParentConfig and ah.ParentConfig.ParentTable and ah.ParentConfig.ParentTable.__type or ah.ParentType, ai.LinkCorners ~= false and (ai.LinkCorners == true or ah.Window.ElementConfig.LinkCorners or (ah.ParentConfig and ah.ParentConfig.LinkCorners == true)), 'Squircle', {
						Position = 'Single',
						Count = 1
					}, {
						TopLeft = true,
						TopRight = true,
						BottomLeft = true,
						BottomRight = true
					}
					if aQ then
						aR, aT, aS = aa.GetLinkedCornerShape(aO.Elements, ai.Index, aO, aP, ah.CornerLink or (ah.ParentConfig and ah.ParentConfig.CornerLink) or ah.Window.ElementConfig.CornerLink)
					end
					if aR and aM then
						local aU = ao and aS.Count > 1
						local aV = if aU then 'Square' else (aR == 'Squircle-TL-BL' or aR == 'Squircle-TR-BR') and 'Squircle' or aR
						aN:SetType(aV)
						aE:SetType(aV)
						aH:SetType(aV)
						aK:SetType(aV)
						ApplyNativeCorners(aT)
					end
				end
			end
			return ai
		end
	end
	function a.J()
		local aa = a.load'd'
		local ab, ac, ad = aa.New, {}, a.load'n'.New
		function ac.New(ae, af)
			af.Hover = false
			af.TextOffset = 0
			af.ParentConfig = af
			af.IsButtons = af.Buttons and # af.Buttons > 0 and true or false
			local ag, ah = {
				__type = 'Paragraph',
				Title = af.Title or 'Paragraph',
				Desc = af.Desc or nil,
				Locked = af.Locked or false
			}, a.load'I'(af)
			ag.ParagraphFrame = ah
			if af.Buttons and # af.Buttons > 0 then
				local ai = ab('Frame', {
					Size = UDim2.new(1, 0, 0, 38),
					BackgroundTransparency = 1,
					AutomaticSize = 'Y',
					Parent = ah.UIElements.Container
				}, {
					ab('UIListLayout', {
						Padding = UDim.new(0, 10),
						FillDirection = 'Vertical'
					})
				})
				for aj, ak in next, af.Buttons do
					local al = ad(ak.Title, ak.Icon, ak.Callback, ak.Variant or 'White', ai, nil, nil, af.Window.NewElements and 999 or 10)
					al.Size = UDim2.new(1, 0, 0, 38)
				end
			end
			return ag.__type, ag
		end
		return ac
	end
	function a.K()
		local aa = a.load'd'
		local ab, ac, ad = aa.New, game:GetService'UserInputService', {}
		local function NormalizeKey(ae)
			if typeof(ae) == 'EnumItem' then
				return ae.Name, ae
			end
			if typeof(ae) == 'string' and Enum.KeyCode[ae] then
				return ae, Enum.KeyCode[ae]
			end
			return nil, nil
		end
		local function GetImageTarget(ae)
			if typeof(ae) ~= 'Instance' then
				return nil
			end
			if ae:IsA'ImageLabel' or ae:IsA'ImageButton' then
				return ae
			end
			return ae:FindFirstChildWhichIsA('ImageLabel', true) or ae:FindFirstChildWhichIsA('ImageButton', true)
		end
		function ad.New(ae, af)
			local ag, ah = NormalizeKey(af.Keybind or af.KeyBind or af.Shortcut or af.Bind or af.Hotkey)
			local ai, aj = {
				__type = 'Button',
				Title = af.Title or 'Button',
				Desc = af.Desc or nil,
				Icon = af.Icon or 'mouse-pointer-click',
				IconThemed = af.IconThemed or false,
				IconColor = af.IconColor or nil,
				Color = af.Color,
				Justify = af.Justify or 'Between',
				IconAlign = af.IconAlign or 'Right',
				Locked = af.Locked or false,
				LockedTitle = af.LockedTitle,
				Golden = af.Golden == true or af.Premium == true,
				Premium = af.Premium == true or af.Golden == true,
				Keybind = ag,
				KeyCode = ah,
				Callback = af.Callback or function()
				end,
				UIElements = {}
			}, true
			ai.ButtonFrame = a.load'I'{
				Title = ai.Title,
				Desc = ai.Desc,
				Parent = af.Parent,
				Window = af.Window,
				Color = ai.Color,
				Justify = ai.Justify,
				TextOffset = 20,
				Hover = true,
				Scalable = true,
				Tab = af.Tab,
				Index = af.Index,
				ElementTable = ai,
				ParentConfig = af,
				Size = af.Size,
				Tags = af.Tags,
				Golden = ai.Golden,
				Premium = ai.Premium
			}
			ai.UIElements.ButtonIcon = aa.Image(ai.Icon, ai.Icon, 0, af.Window.Folder, 'Button', not (ai.Color or ai.IconColor) and true or nil, ai.IconThemed)
			ai.UIElements.ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
			ai.UIElements.ButtonIcon.Parent = ai.Justify == 'Between' and ai.ButtonFrame.UIElements.Main or ai.ButtonFrame.UIElements.Container.TitleFrame
			ai.UIElements.ButtonIcon.LayoutOrder = ai.IconAlign == 'Left' and - 99999 or 99999
			ai.UIElements.ButtonIcon.AnchorPoint = Vector2.new(1, 0.5)
			ai.UIElements.ButtonIcon.Position = UDim2.new(1, 0, 0.5, 0)
			local ak = GetImageTarget(ai.UIElements.ButtonIcon)
			if ak then
				if ai.IconColor then
					ak.ImageColor3 = ai.IconColor
				elseif ai.Golden then
					ak.ImageColor3 = Color3.fromRGB(255, 222, 105)
				end
				ai.ButtonFrame:Colorize(ak, 'ImageColor3')
			end
			function ai.Lock(al)
				ai.Locked = true
				aj = false
				return ai.ButtonFrame:Lock(ai.LockedTitle)
			end
			function ai.Unlock(al)
				ai.Locked = false
				aj = true
				return ai.ButtonFrame:Unlock()
			end
			if ai.Locked then
				ai:Lock()
			end
			function ai.Press(al)
				if aj then
					task.spawn(function()
						aa.SafeCallback(ai.Callback)
					end)
				end
			end
			aa.AddSignal(ai.ButtonFrame.UIElements.Main.MouseButton1Click, function()
				ai:Press()
			end)
			if ai.KeyCode then
				aa.AddSignal(ac.InputBegan, function(al, am)
					if am or ac:GetFocusedTextBox() then
						return
					end
					if al.UserInputType == Enum.UserInputType.Keyboard and al.KeyCode == ai.KeyCode then
						ai:Press()
					end
				end)
			end
			return ai.__type, ai
		end
		return ad
	end
	function a.L()
		local aa, ab, ac = {}, a.load'd', a.load'e'
		local ad, ae = ab.New, game:GetService'UserInputService'
		function aa.New(af, ag, ah, ai, aj, ak, al)
			al = if typeof(al) == 'table' then al else {}
			local am, an, ao = al.GlassSpritesheet == true or al.Spritesheet == true, al.Drag == true or al.Draggable == true or al.Swipe == true, al.HoldAnimation ~= false and al.Hold ~= false
			local ap = {
				UseGlassSpritesheet = am,
				UseDrag = an,
				UseHoldAnimation = ao,
				GlassSpritesheet = {
					Id = 'rbxassetid://77297718671545',
					MirroredId = 'rbxassetid://92258969882244',
					Size = Vector2.new(102, 128),
					Total = 80,
					Cols = 10
				}
			}
			function ap.GetGlassFrame(aq, ar)
				local as, at = (ap.GlassSpritesheet)
				if ar <= 0.4 then
					at = math.floor((ar / 0.4) * (as.Total - 1))
				elseif ar < 0.6 then
					at = as.Total - 1
				else
					at = math.floor(((ar - 0.6) / 0.4) * (as.Total - 1))
				end
				at = math.clamp(at, 0, as.Total - 1)
				local au = ar >= 0.6
				if au then
					at = (as.Total - 1) - at
				end
				local av = if au then as.MirroredId else as.Id
				return av, as.Size, Vector2.new((at % as.Cols) * as.Size.X, math.floor(at / as.Cols) * as.Size.Y)
			end
			local aq, ar, as = 12, if ag and ag ~= '' then ab.Icon(ag) else nil
			if ar then
				local at = math.clamp(tonumber(ah) or 13, 10, ak and 16 or 13)
				as = ad('ImageLabel', {
					Size = UDim2.fromOffset(at, at),
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = ar[1],
					ImageRectOffset = ar[2].ImageRectPosition,
					ImageRectSize = ar[2].ImageRectSize,
					ImageTransparency = 1,
					ImageColor3 = Color3.new(0, 0, 0)
				})
			end
			local at = ad('Frame', {
				Size = UDim2.new(0, 2, 0, 26),
				BackgroundTransparency = 1,
				Parent = ai
			})
			local au, av, aw, ax, ay = ab.NewRoundFrame(aq, 'Squircle', {
				ImageTransparency = 0.85,
				ThemeTag = {
					ImageColor3 = 'Text'
				},
				Parent = at,
				Size = UDim2.new(0, ak and 52 or 41, 0, 24),
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				Name = 'ToggleFrame'
			}, {
				ab.NewRoundFrame(aq, 'Squircle', {
					Size = UDim2.fromScale(1, 1),
					Name = 'Layer',
					ThemeTag = {
						ImageColor3 = 'Toggle'
					},
					ImageTransparency = 1
				}),
				ab.NewRoundFrame(aq, 'SquircleOutline', {
					Size = UDim2.fromScale(1, 1),
					Name = 'Stroke',
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 1
				}, {
					ad('UIGradient', {
						Rotation = 90,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1)
						}
					})
				}),
				ab.NewRoundFrame(aq, 'Squircle', {
					Size = UDim2.new(0, ak and 30 or 20, 0, 20),
					Position = UDim2.new(0, 2, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					ImageTransparency = 1,
					Name = 'Frame'
				}, {
					ab.NewRoundFrame(aq, 'Squircle', {
						Size = UDim2.fromScale(1, 1),
						ImageTransparency = 0,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Name = 'Bar'
					}, {
						ab.New('Frame', {
							Size = UDim2.fromScale(1, 1),
							BackgroundColor3 = Color3.new(1, 1, 1),
							Name = 'Highlight',
							BackgroundTransparency = 1
						}, {
							ab.NewRoundFrame(9999, 'SquircleGlass', {
								Size = UDim2.new(1, 1, 1, 1),
								ImageColor3 = Color3.new(1, 1, 1),
								Name = 'SquircleGlass',
								ImageTransparency = 0.5,
								AnchorPoint = Vector2.new(0.5, 0.5),
								Position = UDim2.fromScale(0.5, 0.5)
							}),
							ab.NewRoundFrame(aq, 'Squircle', {
								Size = UDim2.fromScale(1, 1),
								Name = 'GlassBackground',
								ImageTransparency = 0,
								ThemeTag = {
									ImageColor3 = 'ElementBackground'
								},
								ZIndex = - 1
							}),
							ad('ImageLabel', {
								Size = UDim2.fromScale(1, 1),
								BackgroundTransparency = 1,
								Name = 'Glass',
								ImageTransparency = if am then 0.85 else 1,
								Visible = am
							}, {
								ad('UICorner', {
									CornerRadius = UDim.new(1, 0)
								})
							}),
							ab.NewRoundFrame(aq, 'Squircle', {
								Size = UDim2.fromScale(1, 1),
								Name = 'BarOverlay',
								ThemeTag = {
									ImageColor3 = 'ToggleBar'
								},
								ZIndex = 999
							})
						}),
						as,
						ad('UIScale', {
							Scale = 1
						})
					})
				}),
				ad('TextButton', {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Name = 'Hitbox',
					Text = ''
				})
			}), if ak then 30 else 20
			local az, aA = (au.Size.X.Offset)
			local function SetGlassFrame(aB)
				if not am then
					return
				end
				local aC, aD, aE = ap:GetGlassFrame(aB)
				local aF = au.Frame.Bar.Highlight.Glass
				aF.Image = aC
				aF.ImageRectSize = aD
				aF.ImageRectOffset = aE
			end
			local function Render(aB, aC)
				local aD, aE, aF, aG = if aB then UDim2.new(0, az - av - 2, 0.5, 0) else UDim2.new(0, 2, 0.5, 0), if aB then 0 else 1, if aB then 0 else 0.85, if aB then 0 else 1
				if am then
					ab.SetThemeTag(au.Frame.Bar.Highlight.Glass, {
						ImageColor3 = if aB then 'Toggle' else 'Text'
					}, 0.1)
					SetGlassFrame(if aB then 1 else 0)
				end
				if aC then
					au.Frame.Position = aD
					au.Layer.ImageTransparency = aE
					au.Frame.Bar.Highlight.Glass.ImageTransparency = aF
					if as then
						as.ImageTransparency = aG
					end
					return
				end
				ac.Play(au.Frame, 'Select', {
					Position = aD
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Position')
				ac.Play(au.Layer, 'Select', {
					ImageTransparency = aE
				}, nil, nil, 'Layer')
				if am then
					ac.Play(au.Frame.Bar.Highlight.Glass, 'Select', {
						ImageTransparency = aF
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Glass')
				end
				if as then
					ac.Play(as, 'Select', {
						ImageTransparency = aG
					}, nil, nil, 'Icon')
				end
			end
			function ap.Set(aB, aC, aD, aE)
				aC = aC == true
				if aA ~= aC then
					aA = aC
					Render(aC, aE == true)
				end
				if aj and aD ~= false then
					task.defer(function()
						ab.SafeCallback(aj, aC)
					end)
				end
			end
			function ap.BeginHold(aB)
				if not ao then
					return
				end
				ac.Play(au.Frame.Bar.UIScale, 'Focus', {
					Scale = 1.22
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Press')
				ac.Play(au.Frame.Bar.Highlight.BarOverlay, 'Focus', {
					ImageTransparency = 0.84
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Press')
			end
			function ap.EndHold(aB)
				if not ao then
					return
				end
				ac.Play(au.Frame.Bar.UIScale, 'Focus', {
					Scale = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Press')
				ac.Play(au.Frame.Bar.Highlight.BarOverlay, 'Focus', {
					ImageTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Press')
			end
			local function DisconnectDrag()
				if aw then
					ab.DisconnectSignal(aw)
					aw = nil
				end
				if ax then
					ab.DisconnectSignal(ax)
					ax = nil
				end
			end
			local function ReleaseOwnedInput()
				if al.WindUI and ay and al.WindUI.CurrentInput == ay then
					al.WindUI.CurrentInput = nil
				end
				ay = nil
			end
			function ap.Animate(aB, aC, aD)
				if not an or not al.Window or al.Window.IsToggleDragging then
					return
				end
				al.Window.IsToggleDragging = true
				ay = al.WindUI and al.WindUI.CurrentInput or nil
				local aE, aF, aG, aH, aI = aC.Position.X, aC.Position.Y, au.Frame.Position.X.Offset, false, false
				ap:BeginHold()
				DisconnectDrag()
				aw = ab.AddSignal(ae.InputChanged, function(aJ)
					if not al.Window.IsToggleDragging then
						return
					end
					if aJ.UserInputType ~= Enum.UserInputType.MouseMovement and aJ.UserInputType ~= Enum.UserInputType.Touch then
						return
					end
					if aC.UserInputType == Enum.UserInputType.Touch and aJ ~= aC then
						return
					end
					local aK, aL = math.abs(aJ.Position.X - aE), math.abs(aJ.Position.Y - aF)
					if not aI and aL > 10 and aL > aK then
						aH = true
						return
					end
					if aH then
						return
					end
					if aK > 6 then
						aI = true
					end
					local aM = aJ.Position.X - aE
					local aN = math.clamp(aG + aM, 2, az - av - 2)
					local aO = math.clamp((aN - 2) / (az - av - 4), 0, 1)
					SetGlassFrame(aO)
					au.Frame.Position = UDim2.new(0, aN, 0.5, 0)
				end)
				ax = ab.AddSignal(ae.InputEnded, function(aJ)
					if not al.Window.IsToggleDragging then
						return
					end
					local aK, aL = aC.UserInputType == Enum.UserInputType.Touch and aJ == aC, aC.UserInputType == Enum.UserInputType.MouseButton1 and aJ.UserInputType == Enum.UserInputType.MouseButton1
					if not aK and not aL then
						return
					end
					al.Window.IsToggleDragging = false
					DisconnectDrag()
					ReleaseOwnedInput()
					aA = nil
					if aH then
						aD:Set(aD.Value, false, false)
					elseif not aI then
						aD:Set(not aD.Value, true, false)
					else
						local aM = au.Frame.Position.X.Offset
						local aN = aM + (av / 2) > az / 2
						aD:Set(aN, true, false)
					end
					ap:EndHold()
				end)
			end
			function ap.Destroy(aB)
				local aC = ay ~= nil or aw ~= nil or ax ~= nil
				DisconnectDrag()
				ap:EndHold()
				if aC and al.Window then
					al.Window.IsToggleDragging = false
				end
				ReleaseOwnedInput()
			end
			ap:Set(af, false, true)
			return at, ap
		end
		return aa
	end
	function a.M()
		local aa, ab, ac = {}, a.load'd', a.load'e'
		local ad = ab.New
		function aa.New(ae, af, ag, ah, ai, aj)
			local ak = {}
			af = af or 'sfsymbols:checkmark'
			local al, am = 9, ab.Image(af, af, 0, (aj and aj.Window.Folder or 'Temp'), 'Checkbox', true, false, 'CheckboxIcon')
			am.Size = UDim2.new(1, - 26 + ag, 1, - 26 + ag)
			am.AnchorPoint = Vector2.new(0.5, 0.5)
			am.Position = UDim2.new(0.5, 0, 0.5, 0)
			local an = ab.NewRoundFrame(al, 'Squircle', {
				ImageTransparency = 0.85,
				ThemeTag = {
					ImageColor3 = 'Text'
				},
				Parent = ah,
				Size = UDim2.new(0, 26, 0, 26)
			}, {
				ab.NewRoundFrame(al, 'Squircle', {
					Size = UDim2.new(1, 0, 1, 0),
					Name = 'Layer',
					ThemeTag = {
						ImageColor3 = 'Checkbox'
					},
					ImageTransparency = 1
				}),
				ab.NewRoundFrame(al, 'Glass-1.4', {
					Size = UDim2.new(1, 0, 1, 0),
					Name = 'Stroke',
					ThemeTag = {
						ImageColor3 = 'CheckboxBorder',
						ImageTransparency = 'CheckboxBorderTransparency'
					}
				}, {}),
				am
			}, true)
			function ak.Set(ao, ap)
				if ap then
					ac.Play(an.Layer, 'Fast', {
						ImageTransparency = 0
					}, nil, nil, 'State')
					ac.Play(am.ImageLabel, 'Fast', {
						ImageTransparency = 0
					}, nil, nil, 'State')
				else
					ac.Play(an.Layer, 'Fast', {
						ImageTransparency = 1
					}, nil, nil, 'State')
					ac.Play(am.ImageLabel, 'Fast', {
						ImageTransparency = 1
					}, nil, nil, 'State')
				end
				task.spawn(function()
					if ai then
						ab.SafeCallback(ai, ap)
					end
				end)
			end
			return an, ak
		end
		return aa
	end
	function a.N()
		local aa = a.load'd'
		local ab, ac, ad, ae, af, ag = aa.New, aa.Tween, game:GetService'UserInputService', a.load'L'.New, a.load'M'.New, {}
		local function NormalizeKey(ah)
			if typeof(ah) == 'EnumItem' then
				return ah.Name, ah
			end
			if typeof(ah) == 'string' and Enum.KeyCode[ah] then
				return ah, Enum.KeyCode[ah]
			end
			return nil, nil
		end
		function ag.New(ah, ai)
			local aj, ak = NormalizeKey(ai.Keybind or ai.KeyBind or ai.Shortcut or ai.Bind or ai.Hotkey)
			local al = {
				__type = 'Toggle',
				Title = ai.Title or 'Toggle',
				Desc = ai.Desc or nil,
				Locked = ai.Locked or false,
				LockedTitle = ai.LockedTitle,
				Value = ai.Value,
				Icon = ai.Icon or nil,
				IconSize = ai.IconSize or 23,
				Type = ai.Type or 'Toggle',
				Keybind = aj,
				KeyCode = ak,
				Callback = ai.Callback or function()
				end,
				UIElements = {}
			}
			al.ToggleFrame = a.load'I'{
				Title = al.Title,
				Desc = al.Desc,
				Window = ai.Window,
				Parent = ai.Parent,
				TextOffset = (52),
				Hover = false,
				Tab = ai.Tab,
				Index = ai.Index,
				ElementTable = al,
				ParentConfig = ai,
				Tags = ai.Tags
			}
			local am = true
			if al.Value == nil then
				al.Value = false
			end
			function al.Lock(an)
				al.Locked = true
				am = false
				return al.ToggleFrame:Lock(al.LockedTitle)
			end
			function al.Unlock(an)
				al.Locked = false
				am = true
				return al.ToggleFrame:Unlock()
			end
			if al.Locked then
				al:Lock()
			end
			local an, ao, ap = (al.Value)
			if al.Type == 'Toggle' then
				ao, ap = ae(an, al.Icon, al.IconSize, al.ToggleFrame.UIElements.Main, al.Callback, ai.Window.NewElements, ai)
			elseif al.Type == 'Checkbox' then
				ao, ap = af(an, al.Icon, al.IconSize, al.ToggleFrame.UIElements.Main, al.Callback, ai)
			else
				error('Unknown Toggle Type: ' .. tostring(al.Type))
			end
			ao.AnchorPoint = Vector2.new(1, ai.Window.NewElements and 0 or 0.5)
			ao.Position = UDim2.new(1, 0, ai.Window.NewElements and 0 or 0.5, 0)
			function al.Set(aq, ar, as, at)
				if am then
					ap:Set(ar, as, at or false)
					an = ar
					al.Value = ar
				end
			end
			function al.Toggle(aq, ar, as)
				al:Set(not al.Value, ar, as == true)
			end
			al:Set(an, false, true)
			local aq = if ap.UseDrag then ai.WindUI.GenerateGUID() else nil
			if ai.Window.NewElements and ap.Animate and ap.UseDrag then
				if al.Type == 'Toggle' then
					aa.AddSignal(ao.ToggleFrame.Hitbox.InputBegan, function(ar)
						if not al.Locked and not ai.Window.IsToggleDragging and (ar.UserInputType == Enum.UserInputType.MouseButton1 or ar.UserInputType == Enum.UserInputType.Touch) then
							if ai.WindUI.CurrentInput and ai.WindUI.CurrentInput ~= aq then
								return
							end
							ai.WindUI.CurrentInput = aq
							ap:Animate(ar, al)
						end
					end)
				end
			else
				if al.Type == 'Toggle' then
					aa.AddSignal(ao.ToggleFrame.Hitbox.InputBegan, function(ar)
						if not al.Locked and (ar.UserInputType == Enum.UserInputType.MouseButton1 or ar.UserInputType == Enum.UserInputType.Touch) then
							ap:BeginHold()
						end
					end)
					aa.AddSignal(ao.ToggleFrame.Hitbox.InputEnded, function(ar)
						if ar.UserInputType == Enum.UserInputType.MouseButton1 or ar.UserInputType == Enum.UserInputType.Touch then
							ap:EndHold()
						end
					end)
					aa.AddSignal(ao.ToggleFrame.Hitbox.MouseLeave, function()
						ap:EndHold()
					end)
					aa.AddSignal(ao.ToggleFrame.Hitbox.MouseButton1Click, function()
						if not al.Locked then
							al:Toggle(nil, false)
						end
					end)
				elseif al.Type == 'Checkbox' then
					aa.AddSignal(ao.MouseButton1Click, function()
						al:Toggle(nil, false)
					end)
				end
			end
			function al.Cleanup(ar)
				if ap.Destroy then
					ap:Destroy()
				end
			end
			if al.KeyCode then
				aa.AddSignal(ad.InputBegan, function(ar, as)
					if as or ad:GetFocusedTextBox() then
						return
					end
					if ar.UserInputType == Enum.UserInputType.Keyboard and ar.KeyCode == al.KeyCode then
						al:Toggle(nil, false)
					end
				end)
			end
			return al.__type, al
		end
		return ag
	end
	function a.O()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local ab, ac, ad, ae = aa(game:GetService'UserInputService'), aa(game:GetService'RunService'), a.load'd', a.load'e'
		local af, ag = ad.New, {}
		function ag.New(ah, ai)
			local aj = {
				__type = 'Slider',
				Title = ai.Title or nil,
				Desc = ai.Desc or nil,
				Locked = ai.Locked or nil,
				LockedTitle = ai.LockedTitle,
				Value = ai.Value or {},
				Icons = ai.Icons or nil,
				IsTooltip = ai.IsTooltip or false,
				IsTextbox = ai.IsTextbox,
				Step = ai.Step or 1,
				Callback = ai.Callback or function()
				end,
				UIElements = {},
				IsFocusing = false,
				Width = ai.Width or 130,
				TextBoxWidth = ai.Window.NewElements and 40 or 30,
				ThumbSize = 13,
				IconSize = 26
			}
			if typeof(aj.Icons) == 'table' and next(aj.Icons) == nil then
				aj.Icons = {
					From = 'sfsymbols:sunMinFill',
					To = 'sfsymbols:sunMaxFill'
				}
			end
			if aj.IsTextbox == nil and aj.Title == nil then
				aj.IsTextbox = false
			else
				aj.IsTextbox = aj.IsTextbox ~= false
			end
			local ak, al, am, an, ao = false, aj.Value.Default or aj.Value.Min or 0
			local ap, aq, ar, as = al, (al - (aj.Value.Min or 0)) / ((aj.Value.Max or 100) - (aj.Value.Min or 0)), true, aj.Step % 1 ~= 0
			local function FormatValue(at)
				if as then
					return tonumber(string.format('%.2f', at))
				end
				return math.floor(at + 0.5)
			end
			local function CalculateValue(at)
				if as then
					return math.floor(at / aj.Step + 0.5) * aj.Step
				else
					return math.floor(at / aj.Step + 0.5) * aj.Step
				end
			end
			local at, au, av = 32
			if aj.Icons then
				if aj.Icons.From then
					au = ad.Image(aj.Icons.From, aj.Icons.From, 0, ai.Window.Folder, 'SliderIconFrom', true, true, 'SliderIconFrom')
					au.Size = UDim2.new(0, aj.IconSize, 0, aj.IconSize)
					at = at + aj.IconSize - 2
				end
				if aj.Icons.To then
					av = ad.Image(aj.Icons.To, aj.Icons.To, 0, ai.Window.Folder, 'SliderIconTo', true, true, 'SliderIconTo')
					av.Size = UDim2.new(0, aj.IconSize, 0, aj.IconSize)
					at = at + aj.IconSize - 2
				end
			end
			aj.SliderFrame = a.load'I'{
				Title = aj.Title,
				Desc = aj.Desc,
				Parent = ai.Parent,
				TextOffset = aj.Width,
				Hover = false,
				Tab = ai.Tab,
				Index = ai.Index,
				Window = ai.Window,
				ElementTable = aj,
				ParentConfig = ai,
				Tags = ai.Tags
			}
			aj.UIElements.SliderIcon = ad.NewRoundFrame(99, 'Squircle', {
				ImageTransparency = 0.95,
				Size = UDim2.new(1, not aj.IsTextbox and - at or (- aj.TextBoxWidth - 8), 0, 4),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Name = 'Frame',
				ThemeTag = {
					ImageColor3 = 'Text'
				}
			}, {
				ad.NewRoundFrame(99, 'Squircle', {
					Name = 'Frame',
					Size = UDim2.new(aq, 0, 1, 0),
					ImageTransparency = 0.1,
					ThemeTag = {
						ImageColor3 = 'Slider'
					}
				}, {
					ad.NewRoundFrame(99, 'Squircle', {
						Size = UDim2.new(0, ai.Window.NewElements and (aj.ThumbSize * 2) or (aj.ThumbSize + 2), 0, ai.Window.NewElements and (aj.ThumbSize + 4) or (aj.ThumbSize + 2)),
						Position = UDim2.new(1, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ThemeTag = {
							ImageColor3 = 'SliderThumb'
						},
						Name = 'Thumb'
					}, {
						ad.NewRoundFrame(999, 'SquircleGlass', {
							Size = UDim2.new(1, 0, 1, 0),
							ImageColor3 = Color3.new(1, 1, 1),
							Name = 'Highlight',
							ImageTransparency = 0.5
						})
					})
				})
			})
			aj.UIElements.SliderContainer = af('Frame', {
				Size = UDim2.new(aj.Title == nil and 1 or 0, aj.Title == nil and 0 or aj.Width, 0, 0),
				AutomaticSize = 'Y',
				Position = UDim2.new(1, aj.IsTextbox and (ai.Window.NewElements and - 16 or 0) or 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Parent = aj.SliderFrame.UIElements.Main
			}, {
				af('UIListLayout', {
					Padding = UDim.new(0, aj.Title ~= nil and 8 or 12),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = aj.Icons and (aj.Icons.From and (aj.Icons.To and 'Center' or 'Left') or aj.Icons.To and 'Right') or 'Center'
				}),
				au,
				aj.UIElements.SliderIcon,
				av,
				af('TextBox', {
					Size = UDim2.new(0, aj.TextBoxWidth, 0, 0),
					TextXAlignment = 'Left',
					Text = FormatValue(al),
					ThemeTag = {
						TextColor3 = 'Text'
					},
					TextTransparency = 0.4,
					AutomaticSize = 'Y',
					TextSize = 15,
					FontFace = Font.new(ad.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					LayoutOrder = - 1,
					Visible = aj.IsTextbox
				})
			})
			local aw
			if aj.IsTooltip then
				aw = a.load'G'.New(al, aj.UIElements.SliderIcon.Frame.Thumb, true, 'Secondary', 'Small', false)
				aw.Container.AnchorPoint = Vector2.new(0.5, 1)
				aw.Container.Position = UDim2.new(0.5, 0, 0, - 8)
			end
			local function SetFillSize(ax, ay)
				local az = UDim2.new(ax, 0, 1, 0)
				if ay == 0 or not ae.ShouldAnimate(ai) then
					aj.UIElements.SliderIcon.Frame.Size = az
				else
					ae.Play(aj.UIElements.SliderIcon.Frame, ay or 'Fast', {
						Size = az
					}, nil, nil, 'Fill')
				end
			end
			function aj.Lock(ax)
				aj.Locked = true
				ar = false
				return aj.SliderFrame:Lock(aj.LockedTitle)
			end
			function aj.Unlock(ax)
				aj.Locked = false
				ar = true
				return aj.SliderFrame:Unlock()
			end
			if aj.Locked then
				aj:Lock()
			end
			local ax, ay = ai.Tab.UIElements.ContainerFrame, ai.WindUI.GenerateGUID()
			local function DisconnectSliderInput()
				local az = ak or an ~= nil or ao ~= nil or ai.WindUI.CurrentInput == ay
				if an then
					ad.DisconnectSignal(an)
					an = nil
				end
				if ao then
					ad.DisconnectSignal(ao)
					ao = nil
				end
				ak = false
				if az then
					ax.ScrollingEnabled = true
				end
				if ai.WindUI.CurrentInput == ay then
					ai.WindUI.CurrentInput = nil
				end
			end
			local function FinishSliderInput()
				local az = ak
				DisconnectSliderInput()
				if not az then
					return
				end
				if ai.Window.NewElements then
					ae.Play(aj.UIElements.SliderIcon.Frame.Thumb, 'Focus', {
						ImageTransparency = 0,
						Size = UDim2.new(0, ai.Window.NewElements and (aj.ThumbSize * 2) or (aj.ThumbSize + 2), 0, ai.Window.NewElements and (aj.ThumbSize + 4) or (aj.ThumbSize + 2))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Thumb')
				end
				if aw then
					aw:Close(false)
				end
			end
			function aj.Set(az, aA, aB)
				if ar then
					if not aj.IsFocusing and not ak and (not aB or (aB.UserInputType == Enum.UserInputType.MouseButton1 or aB.UserInputType == Enum.UserInputType.Touch)) then
						if aB then
							am = (aB.UserInputType == Enum.UserInputType.Touch)
							ax.ScrollingEnabled = false
							ak = true
							local aC = am and aB.Position.X or ab:GetMouseLocation().X
							local aD = math.clamp((aC - aj.UIElements.SliderIcon.AbsolutePosition.X) / aj.UIElements.SliderIcon.AbsoluteSize.X, 0, 1)
							aA = CalculateValue(aj.Value.Min + aD * (aj.Value.Max - aj.Value.Min))
							aA = math.clamp(aA, aj.Value.Min or 0, aj.Value.Max or 100)
							if aA ~= ap then
								SetFillSize(aD, 0)
								aj.UIElements.SliderContainer.TextBox.Text = FormatValue(aA)
								if aw then
									aw.TitleFrame.Text = FormatValue(aA)
								end
								aj.Value.Default = FormatValue(aA)
								ap = aA
								ad.SafeCallback(aj.Callback, FormatValue(aA))
							end
							an = ad.AddSignal(ac.RenderStepped, function()
								local aE = am and aB.Position.X or ab:GetMouseLocation().X
								local aF = math.clamp((aE - aj.UIElements.SliderIcon.AbsolutePosition.X) / aj.UIElements.SliderIcon.AbsoluteSize.X, 0, 1)
								aA = CalculateValue(aj.Value.Min + aF * (aj.Value.Max - aj.Value.Min))
								if aA ~= ap then
									SetFillSize(aF, 0)
									aj.UIElements.SliderContainer.TextBox.Text = FormatValue(aA)
									if aw then
										aw.TitleFrame.Text = FormatValue(aA)
									end
									aj.Value.Default = FormatValue(aA)
									ap = aA
									ad.SafeCallback(aj.Callback, FormatValue(aA))
								end
							end)
							ao = ad.AddSignal(ab.InputEnded, function(aE)
								local aF, aG = aB.UserInputType == Enum.UserInputType.Touch and aE == aB, aB.UserInputType == Enum.UserInputType.MouseButton1 and aE.UserInputType == Enum.UserInputType.MouseButton1
								if aF or aG then
									FinishSliderInput()
								end
							end)
						else
							aA = math.clamp(aA, aj.Value.Min or 0, aj.Value.Max or 100)
							local aC = math.clamp((aA - (aj.Value.Min or 0)) / ((aj.Value.Max or 100) - (aj.Value.Min or 0)), 0, 1)
							aA = CalculateValue(aj.Value.Min + aC * (aj.Value.Max - aj.Value.Min))
							if aA ~= ap then
								SetFillSize(aC, 'Fast')
								aj.UIElements.SliderContainer.TextBox.Text = FormatValue(aA)
								if aw then
									aw.TitleFrame.Text = FormatValue(aA)
								end
								aj.Value.Default = FormatValue(aA)
								ap = aA
								ad.SafeCallback(aj.Callback, FormatValue(aA))
							end
						end
					end
				end
			end
			function aj.SetMax(az, aA)
				aj.Value.Max = aA
				local aB = tonumber(aj.Value.Default) or ap
				if aB > aA then
					aj:Set(aA)
				else
					local aC = math.clamp((aB - (aj.Value.Min or 0)) / (aA - (aj.Value.Min or 0)), 0, 1)
					SetFillSize(aC, 'Fast')
				end
			end
			function aj.SetMin(az, aA)
				aj.Value.Min = aA
				local aB = tonumber(aj.Value.Default) or ap
				if aB < aA then
					aj:Set(aA)
				else
					local aC = math.clamp((aB - aA) / ((aj.Value.Max or 100) - aA), 0, 1)
					SetFillSize(aC, 'Fast')
				end
			end
			ad.AddSignal(aj.UIElements.SliderContainer.TextBox.FocusLost, function(az)
				local aA = tonumber(aj.UIElements.SliderContainer.TextBox.Text)
				if aA then
					aj:Set(aA)
				else
					aj.UIElements.SliderContainer.TextBox.Text = FormatValue(ap)
					if aw then
						aw.TitleFrame.Text = FormatValue(ap)
					end
				end
			end)
			ad.AddSignal(aj.UIElements.SliderContainer.InputBegan, function(az)
				if aj.Locked or ak then
					return
				end
				if az.UserInputType == Enum.UserInputType.MouseButton1 or az.UserInputType == Enum.UserInputType.Touch then
					if ai.WindUI.CurrentInput and ai.WindUI.CurrentInput ~= ay then
						return
					end
					ai.WindUI.CurrentInput = ay
					aj:Set(al, az)
					if ai.Window.NewElements then
						ae.Play(aj.UIElements.SliderIcon.Frame.Thumb, 'Focus', {
							ImageTransparency = 0.85,
							Size = UDim2.new(0, (ai.Window.NewElements and (aj.ThumbSize * 2) or aj.ThumbSize) + 8, 0, aj.ThumbSize + 8)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Thumb')
					end
					if aw then
						aw:Open()
					end
				end
			end)
			function aj.Cleanup(az)
				DisconnectSliderInput()
				if aw then
					aw:Close(false)
				end
			end
			return aj.__type, aj
		end
		return ag
	end
	function a.P()
		local aa = a.load'd'
		local ab, ac, ad = aa.New, aa.Tween, {}
		local function ToFiniteNumber(ae)
			local af = tonumber(ae)
			if af == nil or af ~= af or math.abs(af) == math.huge then
				return nil
			end
			return af
		end
		local function FormatNumber(ae)
			if ae % 1 == 0 then
				return tostring(ae)
			end
			return tostring(tonumber(string.format('%.2f', ae)))
		end
		function ad.New(ae, af)
			local ag = typeof(af.Value) == 'table' and af.Value or {}
			local ah, ai = ToFiniteNumber(ag.Min) or ToFiniteNumber(af.Min) or 0, ToFiniteNumber(ag.Max) or ToFiniteNumber(af.Max) or 100
			if ah > ai then
				ah, ai = ai, ah
			end
			local aj = typeof(af.Value) == 'number' and af.Value or ToFiniteNumber(ag.Default) or ToFiniteNumber(af.Default) or ah
			aj = ToFiniteNumber(aj) or ah
			local ak, al = af.Indeterminate == true, af.ShowValue
			if al == nil then
				al = not ak
			end
			local am = math.max(ToFiniteNumber(af.ValueWidth) or 44, 0)
			local an = {
				__type = 'ProgressBar',
				Title = af.Title or 'Progress',
				Desc = af.Desc or nil,
				Value = {
					Min = ah,
					Max = ai,
					Default = math.clamp(aj, ah, ai)
				},
				ShowValue = al,
				DisplayMode = af.DisplayMode or 'Percent',
				Format = af.Format,
				Animate = af.Animate ~= false,
				AnimationDuration = math.max(ToFiniteNumber(af.AnimationDuration) or 0.15, 0),
				Indeterminate = ak,
				IndeterminateText = af.IndeterminateText or '',
				Speed = math.max(ToFiniteNumber(af.Speed) or 1, 0.01),
				ControlGap = math.max(ToFiniteNumber(af.ControlGap) or 16, 0),
				UIElements = {},
				Width = math.max(ToFiniteNumber(af.Width) or 160, 0),
				ValueWidth = am
			}
			local function GetRatio(ao)
				if an.Value.Max == an.Value.Min then
					return ao >= an.Value.Max and 1 or 0
				end
				return math.clamp((ao - an.Value.Min) / (an.Value.Max - an.Value.Min), 0, 1)
			end
			local function GetValueText(ao, ap)
				if an.Indeterminate then
					return tostring(an.IndeterminateText)
				end
				local aq = ap * 100
				if typeof(an.Format) == 'function' then
					local ar, as = pcall(an.Format, ao, aq, an.Value.Min, an.Value.Max)
					if ar and as ~= nil then
						return tostring(as)
					end
				end
				if an.DisplayMode == 'Value' then
					return FormatNumber(ao)
				elseif an.DisplayMode == 'Fraction' then
					return FormatNumber(ao) .. '/' .. FormatNumber(an.Value.Max)
				end
				return tostring(math.floor(aq + 0.5)) .. '%'
			end
			an.ProgressBarFrame = a.load'I'{
				Title = an.Title,
				Desc = an.Desc,
				Parent = af.Parent,
				TextOffset = an.Width + an.ControlGap,
				Hover = false,
				Tab = af.Tab,
				Index = af.Index,
				Window = af.Window,
				ElementTable = an,
				ParentConfig = af,
				Tags = af.Tags
			}
			an.UIElements.Fill = aa.NewRoundFrame(99, 'Squircle', {
				Name = 'Fill',
				Size = an.Indeterminate and UDim2.new(0.3, 0, 1, 0) or UDim2.new(GetRatio(an.Value.Default), 0, 1, 0),
				Position = an.Indeterminate and UDim2.new(- 0.3, 0, 0, 0) or UDim2.new(0, 0, 0, 0),
				ThemeTag = {
					ImageColor3 = 'ProgressBar'
				}
			})
			an.UIElements.Bar = aa.NewRoundFrame(99, 'Squircle', {
				Name = 'Bar',
				Size = UDim2.new(1, an.ShowValue and - (an.ValueWidth + 8) or 0, 0, 6),
				ClipsDescendants = true,
				ImageTransparency = 0.9,
				ThemeTag = {
					ImageColor3 = 'ProgressBarTrack',
					ImageTransparency = 'ProgressBarTrackTransparency'
				}
			}, {
				an.UIElements.Fill
			})
			an.UIElements.Value = ab('TextLabel', {
				Name = 'Value',
				Size = UDim2.new(0, an.ValueWidth, 0, 20),
				BackgroundTransparency = 1,
				FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				Text = GetValueText(an.Value.Default, GetRatio(an.Value.Default)),
				TextSize = 14,
				TextTransparency = 0.25,
				TextTruncate = 'AtEnd',
				TextXAlignment = 'Right',
				Visible = an.ShowValue,
				ThemeTag = {
					TextColor3 = 'ProgressBarText'
				}
			})
			an.UIElements.Container = ab('Frame', {
				Name = 'ProgressBarContainer',
				Size = UDim2.new(0, an.Width, 0, 36),
				Position = UDim2.new(1, 0, af.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, af.Window.NewElements and 0 or 0.5),
				BackgroundTransparency = 1,
				Parent = an.ProgressBarFrame.UIElements.Main
			}, {
				ab('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Right',
					VerticalAlignment = 'Center'
				}),
				an.UIElements.Bar,
				an.UIElements.Value
			})
			if an.Indeterminate then
				local ao = ac(an.UIElements.Fill, 1 / an.Speed, {
					Position = UDim2.new(1, 0, 0, 0)
				}, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, - 1)
				aa.AddSignal(an.UIElements.Bar.Destroying, function()
					ao:Cancel()
				end)
				ao:Play()
			end
			local function Update(ao, ap)
				local aq = ToFiniteNumber(ao)
				if aq == nil then
					return an.Value.Default
				end
				aq = math.clamp(aq, an.Value.Min, an.Value.Max)
				an.Value.Default = aq
				local ar = GetRatio(aq)
				local as = UDim2.new(ar, 0, 1, 0)
				if an.UIElements.Fill and not an.Indeterminate then
					if ap or not an.Animate or an.AnimationDuration <= 0 then
						an.UIElements.Fill.Size = as
					else
						ac(an.UIElements.Fill, an.AnimationDuration, {
							Size = as
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
				end
				an.UIElements.Value.Text = GetValueText(aq, ar)
				return aq
			end
			function an.Set(ao, ap)
				return Update(ap, false)
			end
			function an.Get(ao)
				return an.Value.Default
			end
			function an.GetPercentage(ao)
				return GetRatio(an.Value.Default) * 100
			end
			function an.SetRange(ao, ap, aq)
				ap = ToFiniteNumber(ap)
				aq = ToFiniteNumber(aq)
				if ap == nil or aq == nil then
					return an.Value.Min, an.Value.Max
				end
				if ap > aq then
					ap, aq = aq, ap
				end
				an.Value.Min = ap
				an.Value.Max = aq
				Update(an.Value.Default, false)
				return ap, aq
			end
			function an.SetMin(ao, ap)
				ap = ToFiniteNumber(ap)
				if ap == nil then
					return an.Value.Min
				end
				an:SetRange(ap, math.max(ap, an.Value.Max))
				return an.Value.Min
			end
			function an.SetMax(ao, ap)
				ap = ToFiniteNumber(ap)
				if ap == nil then
					return an.Value.Max
				end
				an:SetRange(math.min(an.Value.Min, ap), ap)
				return an.Value.Max
			end
			Update(an.Value.Default, true)
			return an.__type, an
		end
		return ad
	end
	function a.Q()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local ab, ac = aa(game:GetService'UserInputService'), a.load'd'
		local ad, ae, af, ag, ah = ac.New, ac.Tween, {
			UICorner = 6,
			UIPadding = 8
		}, a.load'y'.New, {
			MouseButton1 = 'MouseLeft',
			MouseLeft = 'MouseLeft',
			MouseLeftButton = 'MouseLeft',
			MouseButton2 = 'MouseRight',
			MouseRight = 'MouseRight',
			MouseRightButton = 'MouseRight'
		}
		local function NormalizeKeyCode(ai)
			local aj
			if typeof(ai) == 'EnumItem' then
				aj = ai.Name
			elseif type(ai) == 'string' then
				aj = ai
			else
				return 'F'
			end
			return ah[aj] or aj
		end
		local function GetInputKey(ai)
			if ai.UserInputType == Enum.UserInputType.Keyboard and ai.KeyCode ~= Enum.KeyCode.Unknown then
				return ai.KeyCode.Name
			elseif ai.UserInputType == Enum.UserInputType.MouseButton1 then
				return 'MouseLeft'
			elseif ai.UserInputType == Enum.UserInputType.MouseButton2 then
				return 'MouseRight'
			end
			return nil
		end
		local function IsMatchingRelease(ai, aj)
			if aj == 'MouseLeft' then
				return ai.UserInputType == Enum.UserInputType.MouseButton1
			elseif aj == 'MouseRight' then
				return ai.UserInputType == Enum.UserInputType.MouseButton2
			end
			return ai.UserInputType == Enum.UserInputType.Keyboard and ai.KeyCode.Name == aj
		end
		function af.New(ai, aj)
			local ak, al = {
				__type = 'Keybind',
				Title = aj.Title or 'Keybind',
				Desc = aj.Desc or nil,
				Locked = aj.Locked or false,
				LockedTitle = aj.LockedTitle,
				Value = NormalizeKeyCode(aj.Value) or 'F',
				Callback = aj.Callback or function()
				end,
				CanChange = aj.CanChange ~= false,
				Blacklist = typeof(aj.Blacklist) == 'table' and aj.Blacklist or {},
				Picking = false,
				UIElements = {}
			}, {}
			for am, an in next, ak.Blacklist do
				al[NormalizeKeyCode(an)] = true
			end
			local am = true
			ak.KeybindFrame = a.load'I'{
				Title = ak.Title,
				Desc = ak.Desc,
				Parent = aj.Parent,
				TextOffset = 85,
				Hover = ak.CanChange,
				Tab = aj.Tab,
				Index = aj.Index,
				Window = aj.Window,
				ElementTable = ak,
				ParentConfig = aj,
				Tags = aj.Tags
			}
			ak.UIElements.Keybind = ag(ak.Value, nil, ak.KeybindFrame.UIElements.Main, nil, aj.Window.NewElements and 12 or 10)
			ak.UIElements.Keybind.Size = UDim2.new(0, 24 + ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X, 0, 42)
			ak.UIElements.Keybind.AnchorPoint = Vector2.new(1, 0.5)
			ak.UIElements.Keybind.Position = UDim2.new(1, 0, 0.5, 0)
			ak.UIElements.Keybind.Interactable = false
			ad('UIScale', {
				Parent = ak.UIElements.Keybind,
				Scale = 0.85
			})
			ac.AddSignal(ak.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal'TextBounds', function()
				ak.UIElements.Keybind.Size = UDim2.new(0, 24 + ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X, 0, 42)
			end)
			local an, ao
			local function DisconnectCaptureConnection(ap)
				if ap then
					ac.DisconnectSignal(ap)
				end
			end
			local function StopPicking(ap)
				DisconnectCaptureConnection(an)
				DisconnectCaptureConnection(ao)
				an = nil
				ao = nil
				ak.Picking = false
				if ap then
					ak.UIElements.Keybind.Frame.Frame.TextLabel.Text = ak.Value
				end
			end
			function ak.Lock(ap)
				StopPicking(true)
				ak.Locked = true
				am = false
				return ak.KeybindFrame:Lock(ak.LockedTitle)
			end
			function ak.Unlock(ap)
				ak.Locked = false
				am = true
				return ak.KeybindFrame:Unlock()
			end
			function ak.Set(ap, aq)
				local ar = NormalizeKeyCode(aq)
				StopPicking(false)
				ak.Value = ar
				ak.UIElements.Keybind.Frame.Frame.TextLabel.Text = ar
			end
			if ak.Locked then
				ak:Lock()
			end
			ac.AddSignal(ak.KeybindFrame.UIElements.Main.MouseButton1Click, function()
				if not am or not ak.CanChange then
					return
				end
				StopPicking(false)
				ak.Picking = true
				ak.UIElements.Keybind.Frame.Frame.TextLabel.Text = '...'
				an = ac.AddSignal(ab.InputBegan, function(ap)
					local aq = GetInputKey(ap)
					if not aq then
						return
					end
					if aq == 'Escape' then
						StopPicking(true)
						return
					end
					if al[aq] then
						return
					end
					DisconnectCaptureConnection(an)
					an = nil
					ao = ac.AddSignal(ab.InputEnded, function(ar)
						if not IsMatchingRelease(ar, aq) then
							return
						end
						ak.Value = aq
						ak.UIElements.Keybind.Frame.Frame.TextLabel.Text = aq
						StopPicking(false)
					end)
				end)
			end)
			ac.AddSignal(ab.InputBegan, function(ap, aq)
				if ab:GetFocusedTextBox() then
					return
				end
				if not am then
					return
				end
				if ak.Picking then
					return
				end
				if ap.UserInputType == Enum.UserInputType.Keyboard then
					if ap.KeyCode.Name == ak.Value then
						ac.SafeCallback(ak.Callback, ap.KeyCode.Name)
					end
				elseif ap.UserInputType == Enum.UserInputType.MouseButton1 and ak.Value == 'MouseLeft' then
					ac.SafeCallback(ak.Callback, 'MouseLeft')
				elseif ap.UserInputType == Enum.UserInputType.MouseButton2 and ak.Value == 'MouseRight' then
					ac.SafeCallback(ak.Callback, 'MouseRight')
				end
			end)
			return ak.__type, ak
		end
		return af
	end
	function a.R()
		local aa = a.load'd'
		local ab, ac, ad, ae, af = aa.New, aa.Tween, {
			UICorner = 8,
			UIPadding = 8
		}, a.load'n'.New, a.load'o'.New
		function ad.New(ag, ah)
			local ai, aj = {
				__type = 'Input',
				Title = ah.Title or 'Input',
				Desc = ah.Desc or nil,
				Type = ah.Type or 'Input',
				Locked = ah.Locked or false,
				LockedTitle = ah.LockedTitle,
				InputIcon = ah.InputIcon or false,
				Placeholder = ah.Placeholder or 'Enter Text...',
				Value = ah.Value or '',
				Callback = ah.Callback or function()
				end,
				ClearTextOnFocus = ah.ClearTextOnFocus or false,
				UIElements = {},
				Width = 150
			}, true
			ai.InputFrame = a.load'I'{
				Title = ai.Title,
				Desc = ai.Desc,
				Parent = ah.Parent,
				TextOffset = ai.Width,
				Hover = false,
				Tab = ah.Tab,
				Index = ah.Index,
				Window = ah.Window,
				ElementTable = ai,
				ParentConfig = ah,
				Tags = ah.Tags
			}
			local ak = af(ai.Placeholder, ai.InputIcon, ai.Type == 'Textarea' and ai.InputFrame.UIElements.Container or ai.InputFrame.UIElements.Main, ai.Type, function(ak)
				ai:Set(ak, true)
			end, nil, ah.Window.NewElements and 12 or 10, ai.ClearTextOnFocus)
			if ai.Type ~= 'Textarea' then
				ak.Size = UDim2.new(0, ai.Width, 0, 36)
				ak.Position = UDim2.new(1, 0, ah.Window.NewElements and 0 or 0.5, 0)
				ak.AnchorPoint = Vector2.new(1, ah.Window.NewElements and 0 or 0.5)
			else
				ak.Size = UDim2.new(1, 0, 0, 148)
			end
			function ai.Lock(al)
				ai.Locked = true
				aj = false
				return ai.InputFrame:Lock(ai.LockedTitle)
			end
			function ai.Unlock(al)
				ai.Locked = false
				aj = true
				return ai.InputFrame:Unlock()
			end
			function ai.Set(al, am, an)
				if aj then
					ai.Value = am
					aa.SafeCallback(ai.Callback, am)
					if not an then
						ak.Frame.Frame.TextBox.Text = am
					end
				end
			end
			function ai.SetPlaceholder(al, am)
				ak.Frame.Frame.TextBox.PlaceholderText = am
				ai.Placeholder = am
			end
			ai:Set(ai.Value)
			if ai.Locked then
				ai:Lock()
			end
			return ai.__type, ai
		end
		return ad
	end
	function a.S()
		local aa = a.load'd'
		local ab, ac = aa.New, {}
		function ac.New(ad, ae)
			local af = ab('Frame', {
				Size = ae.ParentType ~= 'Group' and UDim2.new(1, 0, 0, 1) or UDim2.new(0, 1, 1, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 0.9,
				ThemeTag = {
					BackgroundColor3 = 'Text'
				}
			})
			local ag = ab('Frame', {
				Parent = ae.Parent,
				Size = ae.ParentType ~= 'Group' and UDim2.new(1, - 7, 0, 7) or UDim2.new(0, 7, 1, - 7),
				BackgroundTransparency = 1
			}, {
				af
			})
			return 'Divider', {
				__type = 'Divider',
				ElementFrame = ag
			}
		end
		return ac
	end
	function a.T()
		local aa, ab = {}, (cloneref or clonereference or function(aa)
			return aa
		end)
		local ac, ad, ae = ab(game:GetService'UserInputService'), ab(game:GetService'Players').LocalPlayer:GetMouse(), ab(game:GetService'Workspace')
		local af, ag, ah, ai = ae.CurrentCamera, workspace.CurrentCamera, a.load'd', a.load'e'
		local aj, ak, al = ah.New, ah.Tween, 0.76
		function aa.New(am, an, ao, ap)
			local aq, ar, as = {}, string.lower(tostring(an.CenterTarget or 'Window')), am.Window and am.Window.UIElements and am.Window.UIElements.Main
			local at = if typeof(as) == 'Instance' then as:FindFirstChild'Main' or as else nil
			local au = an.Centered and ar ~= 'screen' and ar ~= 'viewport' and typeof(at) == 'Instance'
			local av, aw = if au then at else am.WindUI.DropdownGui, {}
			an.InternalCenter = au
			an.PopupParent = av
			if not an.Callback then
				ap = 'Menu'
			end
			an.UIElements.UIListLayout = aj('UIListLayout', {
				Padding = UDim.new(0, ao.MenuPadding / 1.5),
				FillDirection = 'Vertical',
				HorizontalAlignment = 'Center'
			})
			an.UIElements.Menu = ah.NewRoundFrame(ao.MenuCorner, an.Glass and 'SquircleGlass' or 'Squircle', {
				ThemeTag = {
					ImageColor3 = 'DropdownBackground'
				},
				ImageTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				ZIndex = 242
			}, {
				aj('UIPadding', {
					PaddingTop = UDim.new(0, ao.MenuPadding),
					PaddingLeft = UDim.new(0, ao.MenuPadding),
					PaddingRight = UDim.new(0, ao.MenuPadding),
					PaddingBottom = UDim.new(0, ao.MenuPadding)
				}),
				aj('UIListLayout', {
					FillDirection = 'Vertical',
					Padding = UDim.new(0, ao.MenuPadding)
				}),
				aj('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, an.SearchBarEnabled and - ao.MenuPadding - ao.SearchBarHeight),
					ClipsDescendants = true,
					LayoutOrder = 999,
					Name = 'Frame'
				}, {
					aj('UICorner', {
						CornerRadius = UDim.new(0, ao.MenuCorner - ao.MenuPadding)
					}),
					aj('ScrollingFrame', {
						Size = UDim2.new(1, 0, 1, 0),
						ScrollBarThickness = 0,
						ScrollingDirection = 'Y',
						AutomaticCanvasSize = 'Y',
						CanvasSize = UDim2.new(0, 0, 0, 0),
						BackgroundTransparency = 1,
						ScrollBarImageTransparency = 1
					}, {
						an.UIElements.UIListLayout
					})
				})
			})
			an.UIElements.MenuScale = aj('UIScale', {
				Name = 'MenuScale',
				Scale = 1,
				Parent = an.UIElements.Menu
			})
			if an.Centered and an.Backdrop then
				an.UIElements.Backdrop = aj('TextButton', {
					Name = 'DropdownBackdrop',
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = Color3.new(0, 0, 0),
					BackgroundTransparency = 1,
					Text = '',
					AutoButtonColor = false,
					Visible = false,
					Active = true,
					ZIndex = 240,
					Parent = av
				})
			end
			an.UIElements.MenuCanvas = aj('Frame', {
				Size = UDim2.new(0, an.MenuWidth, 0, 300),
				BackgroundTransparency = 1,
				Position = UDim2.new(- 10, 0, - 10, 0),
				Visible = false,
				Active = false,
				ZIndex = 241,
				Parent = av,
				AnchorPoint = Vector2.new(1, 0)
			}, {
				an.UIElements.Menu,
				aj('UISizeConstraint', {
					MinSize = Vector2.new(an.Compact and 148 or 170, 0),
					MaxSize = Vector2.new(an.MenuMaxWidth or 420, an.MenuMaxHeight or 340)
				})
			})
			local function GetLayoutScale()
				local ax = am.UIScale or ah.UIScale or 1
				return ax > 0 and ax or 1
			end
			local function GetVisibleContentHeight()
				local ax, ay, az, aA = 0, 0, GetLayoutScale(), an.UIElements.Menu.Frame.ScrollingFrame
				for aB, aC in next, aA:GetChildren() do
					if aC:IsA'GuiObject' and aC.Visible then
						local aD = aC.AbsoluteSize.Y / az
						if aD <= 0 then
							aD = aC.Size.Y.Offset > 0 and aC.Size.Y.Offset or an.ItemHeight
						end
						ax += aD
						ay += 1
					end
				end
				if ay > 1 then
					ax += an.UIElements.UIListLayout.Padding.Offset * (ay - 1)
				end
				return ax
			end
			local function RecalculateCanvasSize()
				an.UIElements.Menu.Frame.ScrollingFrame.CanvasSize = UDim2.fromOffset(0, GetVisibleContentHeight())
			end
			local function GetDropdownButton()
				return an.UIElements.Dropdown or an.DropdownFrame.UIElements.Main
			end
			local function GetViewportSize()
				if au and typeof(av) == 'Instance' and av:IsA'GuiObject' then
					return av.AbsoluteSize / GetLayoutScale()
				end
				if am.WindUI.DropdownGui and am.WindUI.DropdownGui.AbsoluteSize.X > 0 then
					return am.WindUI.DropdownGui.AbsoluteSize
				end
				local ax = ae.CurrentCamera or af
				return ax and ax.ViewportSize or Vector2.new(1280, 720)
			end
			local function GetInputPosition(ax)
				if ax and typeof(ax.Position) == 'Vector3' then
					return Vector2.new(ax.Position.X, ax.Position.Y)
				end
				return Vector2.new(ad.X, ad.Y)
			end
			local function ContainsPoint(ax, ay)
				if typeof(ax) ~= 'Instance' or not ax.Visible then
					return false
				end
				local az, aA = ax.AbsolutePosition, ax.AbsoluteSize
				return ay.X >= az.X and ay.X <= az.X + aA.X and ay.Y >= az.Y and ay.Y <= az.Y + aA.Y
			end
			local function NormalizeDirection(ax, ay)
				local az = tostring(ax or ay or 'Auto')
				az = az:sub(1, 1):upper() .. az:sub(2):lower()
				if az ~= 'Auto' and az ~= 'Down' and az ~= 'Up' and az ~= 'Left' and az ~= 'Right' then
					return ay or 'Auto'
				end
				return az
			end
			local function NormalizeSide(ax, ay)
				local az = tostring(ax or ay or 'Right')
				az = az:sub(1, 1):upper() .. az:sub(2):lower()
				if az ~= 'Left' and az ~= 'Center' and az ~= 'Right' then
					return ay or 'Right'
				end
				return az
			end
			local function IsMobileViewport()
				local ax = GetViewportSize()
				return am.Window.IsPC == false or (ac.TouchEnabled and not ac.KeyboardEnabled) or ax.X <= 640
			end
			local function GetCanvasWidth()
				local ax, ay, az = GetDropdownButton(), GetViewportSize(), math.max(ao.MenuPadding * 2, 8)
				local aA = math.max(120, math.min(an.MenuMaxWidth or (IsMobileViewport() and 320 or 420), ay.X - (az * 2)))
				local aB, aC = math.min(an.Compact and 148 or 170, aA), if ax.AbsoluteSize.X > 0 then ax.AbsoluteSize.X / (au and GetLayoutScale() or 1) else an.MenuWidth
				local aD = an.FullWidth and math.max(aC, an.MenuWidth) or an.MenuWidth
				return math.floor(math.clamp(aD, aB, aA) + 0.5)
			end
			local function ApplyCanvasWidth()
				local ax = GetCanvasWidth()
				an.UIElements.MenuCanvas.Size = UDim2.new(0, ax, an.UIElements.MenuCanvas.Size.Y.Scale, an.UIElements.MenuCanvas.Size.Y.Offset)
				return ax
			end
			local function RecalculateListSize()
				local ax, ay, az = ApplyCanvasWidth(), GetViewportSize(), an.SearchBarEnabled and (ao.SearchBarHeight + 44) or 44
				local aA, aB, aC = math.max(az, math.min(an.MenuMaxHeight or (IsMobileViewport() and 280 or 340), ay.Y - (ao.MenuPadding * 4))), GetVisibleContentHeight(), an.SearchBarEnabled and (ao.SearchBarHeight + (ao.MenuPadding * 3)) or (ao.MenuPadding * 2)
				local aD = aB + aC
				if aD > aA then
					an.UIElements.MenuCanvas.Size = UDim2.fromOffset(ax, aA)
				else
					an.UIElements.MenuCanvas.Size = UDim2.fromOffset(ax, aD)
				end
			end
			function UpdatePosition()
				local ax, ay, az, aA, aB = GetDropdownButton(), an.UIElements.MenuCanvas, GetViewportSize(), ao.MenuPadding * 2, IsMobileViewport()
				local aC, aD, aE, aF, aG = NormalizeDirection(aB and (an.MobileDirection or an.Direction) or an.Direction, 'Auto'), NormalizeSide(aB and (an.MobileSide or 'Center') or an.Side, aB and 'Center' or 'Right'), ax.AbsolutePosition, ax.AbsoluteSize, ay.AbsoluteSize / (au and GetLayoutScale() or 1)
				if aG.X <= 0 or aG.Y <= 0 then
					aG = Vector2.new(ay.Size.X.Offset, ay.Size.Y.Offset)
				end
				if an.Centered then
					if au then
						local aH, aI, aJ = an.CenterOffset or Vector2.new(0, 0), aG.X / 2, aG.Y / 2
						local aK, aL = math.clamp((az.X / 2) + aH.X, aA + aI, az.X - aA - aI), math.clamp((az.Y / 2) + aH.Y, aA + aJ, az.Y - aA - aJ)
						ay.AnchorPoint = Vector2.new(0.5, 0.5)
						ay.Position = UDim2.fromOffset(math.floor(aK + 0.5), math.floor(aL + 0.5))
						an.UIElements.Menu.AnchorPoint = Vector2.new(0.5, 0.5)
						an.UIElements.Menu.Position = UDim2.fromScale(0.5, 0.5)
						return 'Center'
					end
					local aH, aI, aJ, aK = Vector2.new(0, 0), az, string.lower(tostring(an.CenterTarget or 'Window')), am.Window and am.Window.UIElements and am.Window.UIElements.Main
					if aJ ~= 'screen' and aJ ~= 'viewport' and typeof(aK) == 'Instance' and aK.Visible and aK.AbsoluteSize.X > 0 then
						aH = aK.AbsolutePosition
						aI = aK.AbsoluteSize
					end
					local aL = an.CenterOffset or Vector2.new(0, 0)
					local aM, aN, aO, aP = aH.X + (aI.X / 2) + aL.X, aH.Y + (aI.Y / 2) + aL.Y, aG.X / 2, aG.Y / 2
					aM = math.clamp(aM, aA + aO, az.X - aA - aO)
					aN = math.clamp(aN, aA + aP, az.Y - aA - aP)
					ay.AnchorPoint = Vector2.new(0.5, 0.5)
					ay.Position = UDim2.fromOffset(math.floor(aM + 0.5), math.floor(aN + 0.5))
					an.UIElements.Menu.AnchorPoint = Vector2.new(0.5, 0.5)
					an.UIElements.Menu.Position = UDim2.fromScale(0.5, 0.5)
					return 'Center'
				end
				if aB and not an.MobileDirection and (aC == 'Left' or aC == 'Right') then
					aC = 'Auto'
				end
				if aC == 'Left' and aE.X - aA < aG.X then
					aC = 'Auto'
				elseif aC == 'Right' and az.X - (aE.X + aF.X) - aA < aG.X then
					aC = 'Auto'
				end
				if aC == 'Auto' then
					local aH, aI = az.Y - (aE.Y + aF.Y) - aA, aE.Y - aA
					if aH >= aG.Y or aH >= aI then
						aC = 'Down'
					else
						aC = 'Up'
					end
				end
				if aC ~= 'Up' and aC ~= 'Left' and aC ~= 'Right' then
					aC = 'Down'
				end
				local aH, aI, aJ = (Vector2.new(1, 0))
				if aC == 'Left' then
					aI = aE.X - aA
					aJ = aE.Y
					aH = Vector2.new(1, 0)
				elseif aC == 'Right' then
					aI = aE.X + aF.X + aA
					aJ = aE.Y
					aH = Vector2.new(0, 0)
				elseif aC == 'Up' then
					aJ = aE.Y - aA
					aH = Vector2.new(aD == 'Left' and 0 or aD == 'Center' and 0.5 or 1, 1)
					if aD == 'Left' then
						aI = aE.X
					elseif aD == 'Center' then
						aI = aE.X + (aF.X / 2)
					else
						aI = aE.X + aF.X
					end
				else
					aJ = aE.Y + aF.Y + aA
					aH = Vector2.new(aD == 'Left' and 0 or aD == 'Center' and 0.5 or 1, 0)
					if aD == 'Left' then
						aI = aE.X
					elseif aD == 'Center' then
						aI = aE.X + (aF.X / 2)
					else
						aI = aE.X + aF.X
					end
				end
				local aK, aL = aI - (aH.X * aG.X), aJ - (aH.Y * aG.Y)
				if aK < aA then
					aI += aA - aK
				elseif aK + aG.X > az.X - aA then
					aI -= (aK + aG.X) - (az.X - aA)
				end
				if aL < aA then
					aJ += aA - aL
				elseif aL + aG.Y > az.Y - aA then
					aJ -= (aL + aG.Y) - (az.Y - aA)
				end
				ay.AnchorPoint = aH
				ay.Position = UDim2.fromOffset(math.floor(aI + 0.5), math.floor(aJ + 0.5))
				an.UIElements.Menu.AnchorPoint = aC == 'Left' and Vector2.new(1, 0) or aC == 'Right' and Vector2.new(0, 0) or aC == 'Up' and Vector2.new(1, 1) or Vector2.new(1, 0)
				an.UIElements.Menu.Position = aC == 'Left' and UDim2.new(1, 0, 0, 0) or aC == 'Right' and UDim2.new(0, 0, 0, 0) or aC == 'Up' and UDim2.new(1, 0, 1, 0) or UDim2.new(1, 0, 0, 0)
				return aC
			end
			local ax, ay, az, aA = ''
			local function CreateSearchBar()
				local aB, aC = math.max(ao.MenuCorner - ao.MenuPadding, 6), ah.Icon'search'
				az = aj('TextBox', {
					Name = 'TextBox',
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					ClipsDescendants = true,
					FontFace = Font.new(ah.Font, Enum.FontWeight.Regular),
					PlaceholderText = an.SearchPlaceholder,
					Text = ax,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 16,
					TextScaled = false,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextWrapped = false,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					ThemeTag = {
						PlaceholderColor3 = 'PlaceholderText',
						TextColor3 = 'Text'
					},
					Size = UDim2.new(1, - 31, 1, 0)
				})
				local aD = ah.NewRoundFrame(aB, 'Squircle', {
					Name = 'SearchBar',
					LayoutOrder = 0,
					Parent = an.UIElements.Menu,
					Size = UDim2.new(1, 0, 0, ao.SearchBarHeight),
					ImageTransparency = 0,
					ThemeTag = {
						ImageColor3 = 'DropdownTabBackground'
					}
				}, {
					ah.NewRoundFrame(aB, 'Squircle', {
						Name = 'Outline',
						Size = UDim2.new(1, 1, 1, 1),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						ImageTransparency = 0.8,
						ThemeTag = {
							ImageColor3 = 'DropdownTabBorder'
						}
					}),
					aj('Frame', {
						Name = 'Content',
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0)
					}, {
						aj('UIPadding', {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						aj('UIListLayout', {
							FillDirection = 'Horizontal',
							HorizontalAlignment = 'Left',
							VerticalAlignment = 'Center',
							Padding = UDim.new(0, 8),
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						aj('ImageLabel', {
							Name = 'Icon',
							BackgroundTransparency = 1,
							Image = aC[1],
							ImageRectOffset = aC[2].ImageRectPosition,
							ImageRectSize = aC[2].ImageRectSize,
							ImageTransparency = 0.18,
							Size = UDim2.new(0, 19, 0, 19),
							ThemeTag = {
								ImageColor3 = 'Icon'
							}
						}),
						az
					})
				})
				ah.AddSignal(az:GetPropertyChangedSignal'Text', function()
					aA(az.Text)
				end)
				ah.AddSignal(az.Focused, function()
					ak(aD.Outline, 0.12, {
						ImageTransparency = 0.48
					}):Play()
				end)
				ah.AddSignal(az.FocusLost, function()
					ak(aD.Outline, 0.12, {
						ImageTransparency = 0.8
					}):Play()
				end)
				return aD
			end
			local function GetSearchText(aB)
				local aC = {
					aB.Name,
					aB.Desc
				}
				if typeof(aB.Original) == 'table' then
					table.insert(aC, aB.Original.Value)
					table.insert(aC, aB.Original.Id)
					table.insert(aC, aB.Original.Key)
				end
				local aD = {}
				for aE, aF in next, aC do
					if aF ~= nil then
						table.insert(aD, tostring(aF))
					end
				end
				return string.lower(table.concat(aD, ' '))
			end
			function aA(aB)
				ax = tostring(aB or '')
				local aC = string.lower(ax)
				for aD, aE in next, an.Tabs do
					if aE.UIElements and aE.UIElements.TabItem then
						local aF, aG = aE.UIElements.TabItem, aC == '' or string.find(GetSearchText(aE), aC, 1, true) ~= nil
						if aG then
							if not aF.Parent then
								aF.Parent = an.UIElements.Menu.Frame.ScrollingFrame
							end
							aF.Visible = true
							aF.Size = aE.Size
							aF.AutomaticSize = aE.AutomaticSize
						else
							aF.Visible = false
						end
					end
				end
				RecalculateCanvasSize()
				RecalculateListSize()
				if an.UIElements.MenuCanvas.Visible then
					UpdatePosition()
				end
				task.defer(function()
					if am.Window.Destroyed then
						return
					end
					RecalculateCanvasSize()
					RecalculateListSize()
					if an.UIElements.MenuCanvas.Visible then
						UpdatePosition()
					end
				end)
			end
			function aq.Display(aB)
				local aC, aD = an.Values, ''
				if an.Multi then
					local aE = {}
					if typeof(an.Value) == 'table' then
						for aF, aG in ipairs(an.Value) do
							local aH = typeof(aG) == 'table' and aG.Title or aG
							aE[aH] = true
						end
					end
					for aF, aG in ipairs(aC) do
						local aH = typeof(aG) == 'table' and aG.Title or aG
						if aE[aH] then
							aD = aD .. aH .. ', '
						end
					end
					if # aD > 0 then
						aD = aD:sub(1, # aD - 2)
					end
				else
					aD = typeof(an.Value) == 'table' and (an.Value.Title or an.Value[1]) or an.Value or ''
				end
				if an.UIElements.Dropdown then
					an.UIElements.Dropdown.Frame.Frame.TextLabel.Text = (aD == '' and '--' or aD)
				end
			end
			local function Callback(aB)
				aq:Display()
				if an.Locked then
					return
				end
				if an.Callback then
					task.spawn(function()
						if an.Locked then
							return
						end
						ah.SafeCallback(an.Callback, an.Value)
					end)
				else
					task.spawn(function()
						if an.Locked then
							return
						end
						ah.SafeCallback(aB)
					end)
				end
			end
			function aq.LockValues(aB, aC)
				if not aC then
					return
				end
				for aD, aE in next, an.Tabs do
					if aE and aE.UIElements and aE.UIElements.TabItem then
						local aF, aG = aE.Name, false
						for aH, aI in next, aC do
							if aF == aI then
								aG = true
								break
							end
						end
						if aG then
							ak(aE.UIElements.TabItem, 0.1, {
								ImageTransparency = 1
							}):Play()
							ak(aE.UIElements.TabItem.Frame.Title.TextLabel, 0.1, {
								TextTransparency = 0.6
							}):Play()
							if aE.UIElements.TabIcon then
								ak(aE.UIElements.TabIcon.ImageLabel, 0.1, {
									ImageTransparency = 0.6
								}):Play()
							end
							aE.UIElements.TabItem.Active = false
							aE.Locked = true
						else
							if aE.Selected then
								ak(aE.UIElements.TabItem, 0.1, {
									ImageTransparency = al
								}):Play()
								ak(aE.UIElements.TabItem.Frame.Title.TextLabel, 0.1, {
									TextTransparency = 0
								}):Play()
								if aE.UIElements.TabIcon then
									ak(aE.UIElements.TabIcon.ImageLabel, 0.1, {
										ImageTransparency = 0
									}):Play()
								end
							else
								ak(aE.UIElements.TabItem, 0.1, {
									ImageTransparency = 1
								}):Play()
								ak(aE.UIElements.TabItem.Frame.Title.TextLabel, 0.1, {
									TextTransparency = ap == 'Dropdown' and 0.4 or 0.05
								}):Play()
								if aE.UIElements.TabIcon then
									ak(aE.UIElements.TabIcon.ImageLabel, 0.1, {
										ImageTransparency = ap == 'Dropdown' and 0.2 or 0
									}):Play()
								end
							end
							aE.UIElements.TabItem.Active = true
							aE.Locked = false
						end
					end
				end
			end
			function aq.Refresh(aB, aC)
				if am.Window.Destroyed then
					return
				end
				for aD, aE in next, an.Tabs do
					if aE.UIElements and aE.UIElements.TabItem then
						aE.UIElements.TabItem:Destroy()
					end
				end
				for aD, aE in next, an.UIElements.Menu.Frame.ScrollingFrame:GetChildren() do
					if not aE:IsA'UIListLayout' then
						aE:Destroy()
					end
				end
				an.Tabs = {}
				if an.SearchBarEnabled then
					if not ay then
						ay = CreateSearchBar()
					elseif az then
						az.PlaceholderText = an.SearchPlaceholder
					end
				end
				for aD, aE in next, aC do
					if typeof(aE) ~= 'table' or aE.Type ~= 'Divider' then
						local aF, aG = {
							Name = typeof(aE) == 'table' and aE.Title or aE,
							Desc = typeof(aE) == 'table' and aE.Desc or nil,
							Icon = typeof(aE) == 'table' and aE.Icon or nil,
							IconSize = typeof(aE) == 'table' and aE.IconSize or nil,
							Original = aE,
							Selected = false,
							Locked = typeof(aE) == 'table' and aE.Locked or false,
							UIElements = {}
						}
						if aF.Icon then
							aG = ah.Image(aF.Icon, aF.Icon, 0, am.Window.Folder, 'Dropdown', true)
							aG.Size = UDim2.new(0, aF.IconSize or ao.TabIcon, 0, aF.IconSize or ao.TabIcon)
							aG.ImageLabel.ImageTransparency = ap == 'Dropdown' and 0.2 or 0
							aF.UIElements.TabIcon = aG
						end
						aF.UIElements.TabItem = ah.NewRoundFrame(ao.MenuCorner - ao.MenuPadding, 'Squircle', {
							Size = UDim2.new(1, 0, 0, an.ItemHeight),
							AutomaticSize = aF.Desc and 'Y',
							LayoutOrder = typeof(aD) == 'number' and aD or 0,
							ImageTransparency = 1,
							Parent = an.UIElements.Menu.Frame.ScrollingFrame,
							ThemeTag = {
								ImageColor3 = 'DropdownTabBackground'
							},
							Active = not aF.Locked
						}, {
							ah.NewRoundFrame(ao.MenuCorner - ao.MenuPadding, 'Glass-1.4', {
								Size = UDim2.new(1, 0, 1, 0),
								ThemeTag = {
									ImageColor3 = 'DropdownTabBorder'
								},
								ImageTransparency = 1,
								Name = 'Highlight'
							}, {}),
							aj('Frame', {
								Size = UDim2.new(1, 0, 1, 0),
								BackgroundTransparency = 1
							}, {
								aj('UIListLayout', {
									Padding = UDim.new(0, ao.TabPadding),
									FillDirection = 'Horizontal',
									VerticalAlignment = 'Center'
								}),
								aj('UIPadding', {
									PaddingTop = UDim.new(0, ao.TabPadding),
									PaddingLeft = UDim.new(0, ao.TabPadding),
									PaddingRight = UDim.new(0, ao.TabPadding),
									PaddingBottom = UDim.new(0, ao.TabPadding)
								}),
								aj('UICorner', {
									CornerRadius = UDim.new(0, ao.MenuCorner - ao.MenuPadding)
								}),
								aG,
								aj('Frame', {
									Size = UDim2.new(1, aG and - ao.TabPadding - ao.TabIcon or 0, 0, 0),
									BackgroundTransparency = 1,
									AutomaticSize = 'Y',
									Name = 'Title'
								}, {
									aj('TextLabel', {
										Text = aF.Name,
										TextXAlignment = 'Left',
										FontFace = Font.new(ah.Font, Enum.FontWeight.Medium),
										ThemeTag = {
											TextColor3 = 'Text',
											BackgroundColor3 = 'Text'
										},
										TextSize = 14,
										BackgroundTransparency = 1,
										TextTransparency = ap == 'Dropdown' and 0.4 or 0.05,
										LayoutOrder = 999,
										AutomaticSize = 'Y',
										TextTruncate = 'AtEnd',
										Size = UDim2.new(1, 0, 0, 0)
									}),
									aj('TextLabel', {
										Text = aF.Desc or '',
										TextXAlignment = 'Left',
										FontFace = Font.new(ah.Font, Enum.FontWeight.Regular),
										ThemeTag = {
											TextColor3 = 'Text',
											BackgroundColor3 = 'Text'
										},
										TextSize = 13,
										BackgroundTransparency = 1,
										TextTransparency = ap == 'Dropdown' and 0.6 or 0.35,
										LayoutOrder = 999,
										AutomaticSize = 'Y',
										TextWrapped = true,
										Size = UDim2.new(1, 0, 0, 0),
										Visible = aF.Desc and true or false,
										Name = 'Desc'
									}),
									aj('UIListLayout', {
										Padding = UDim.new(0, ao.TabPadding / 3),
										FillDirection = 'Vertical'
									})
								})
							})
						}, true)
						aF.Size = aF.UIElements.TabItem.Size
						aF.AutomaticSize = aF.UIElements.TabItem.AutomaticSize
						if aF.Locked then
							aF.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency = 0.6
							if aF.UIElements.TabIcon then
								aF.UIElements.TabIcon.ImageLabel.ImageTransparency = 0.6
							end
						end
						if an.Multi and typeof(an.Value) == 'string' then
							for aH, aI in next, an.Values do
								if typeof(aI) == 'table' then
									if aI.Title == an.Value then
										an.Value = {
											aI
										}
									end
								else
									if aI == an.Value then
										an.Value = {
											an.Value
										}
									end
								end
							end
						end
						if an.Multi then
							local aH = false
							if typeof(an.Value) == 'table' then
								for aI, aJ in ipairs(an.Value) do
									local aK = typeof(aJ) == 'table' and aJ.Title or aJ
									if aK == aF.Name then
										aH = true
										break
									end
								end
							end
							aF.Selected = aH
						else
							local aH = typeof(an.Value) == 'table' and an.Value.Title or an.Value
							aF.Selected = aH == aF.Name
						end
						if aF.Selected and not aF.Locked then
							aF.UIElements.TabItem.ImageTransparency = al
							aF.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency = 0
							if aF.UIElements.TabIcon then
								aF.UIElements.TabIcon.ImageLabel.ImageTransparency = 0
							end
						end
						an.Tabs[aD] = aF
						aq:Display()
						if ap == 'Dropdown' then
							ah.AddSignal(aF.UIElements.TabItem.MouseButton1Click, function()
								if an.Locked or aF.Locked then
									return
								end
								if an.Multi then
									if not aF.Selected then
										aF.Selected = true
										ak(aF.UIElements.TabItem, 0.1, {
											ImageTransparency = al
										}):Play()
										ak(aF.UIElements.TabItem.Frame.Title.TextLabel, 0.1, {
											TextTransparency = 0
										}):Play()
										if aF.UIElements.TabIcon then
											ak(aF.UIElements.TabIcon.ImageLabel, 0.1, {
												ImageTransparency = 0
											}):Play()
										end
										table.insert(an.Value, aF.Original)
									else
										if not an.AllowNone and # an.Value == 1 then
											return
										end
										aF.Selected = false
										ak(aF.UIElements.TabItem, 0.1, {
											ImageTransparency = 1
										}):Play()
										ak(aF.UIElements.TabItem.Frame.Title.TextLabel, 0.1, {
											TextTransparency = 0.4
										}):Play()
										if aF.UIElements.TabIcon then
											ak(aF.UIElements.TabIcon.ImageLabel, 0.1, {
												ImageTransparency = 0.2
											}):Play()
										end
										for aH, aI in next, an.Value do
											if typeof(aI) == 'table' and (aI.Title == aF.Name) or (aI == aF.Name) then
												table.remove(an.Value, aH)
												break
											end
										end
									end
								else
									for aH, aI in next, an.Tabs do
										ak(aI.UIElements.TabItem, 0.1, {
											ImageTransparency = 1
										}):Play()
										ak(aI.UIElements.TabItem.Frame.Title.TextLabel, 0.1, {
											TextTransparency = 0.4
										}):Play()
										if aI.UIElements.TabIcon then
											ak(aI.UIElements.TabIcon.ImageLabel, 0.1, {
												ImageTransparency = 0.2
											}):Play()
										end
										aI.Selected = false
									end
									aF.Selected = true
									ak(aF.UIElements.TabItem, 0.1, {
										ImageTransparency = al
									}):Play()
									ak(aF.UIElements.TabItem.Frame.Title.TextLabel, 0.1, {
										TextTransparency = 0
									}):Play()
									if aF.UIElements.TabIcon then
										ak(aF.UIElements.TabIcon.ImageLabel, 0.1, {
											ImageTransparency = 0
										}):Play()
									end
									an.Value = aF.Original
								end
								Callback()
								if not an.Multi then
									aq:Close()
								end
							end)
						elseif ap == 'Menu' then
							if not aF.Locked then
								ah.AddSignal(aF.UIElements.TabItem.MouseEnter, function()
									ak(aF.UIElements.TabItem, 0.08, {
										ImageTransparency = al
									}):Play()
								end)
								ah.AddSignal(aF.UIElements.TabItem.InputEnded, function()
									ak(aF.UIElements.TabItem, 0.08, {
										ImageTransparency = 1
									}):Play()
								end)
							end
							ah.AddSignal(aF.UIElements.TabItem.MouseButton1Click, function()
								if an.Locked or aF.Locked then
									return
								end
								Callback(aE.Callback or function()
								end)
								aq:Close()
							end)
						end
						RecalculateCanvasSize()
						RecalculateListSize()
					else
						a.load'S':New{
							Parent = an.UIElements.Menu.Frame.ScrollingFrame
						}
					end
				end
				ApplyCanvasWidth()
				aA(ax)
				Callback()
				an.Values = aC
			end
			aq:Refresh(an.Values)
			function aq.Select(aB, aC)
				if aC then
					an.Value = aC
				else
					if an.Multi then
						an.Value = {}
					else
						an.Value = nil
					end
				end
				aq:Refresh(an.Values)
			end
			RecalculateListSize()
			RecalculateCanvasSize()
			local aB, aC = 0, 'Down'
			function aq.Open(aD)
				if not an.Locked then
					aB += 1
					local aE = aB
					an.UIElements.Menu.Visible = true
					an.UIElements.MenuCanvas.Visible = true
					an.UIElements.MenuCanvas.Active = true
					RecalculateListSize()
					RecalculateCanvasSize()
					aC = UpdatePosition()
					local aF = aC == 'Left' or aC == 'Right'
					if an.Centered then
						an.UIElements.Menu.Size = UDim2.fromScale(1, 1)
						an.UIElements.MenuScale.Scale = 0.9
						ai.Play(an.UIElements.MenuScale, 'DropdownOpen', {
							Scale = 1
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'CenterScale')
						if an.UIElements.Backdrop then
							an.UIElements.Backdrop.Visible = true
							an.UIElements.Backdrop.BackgroundTransparency = 1
							ai.Play(an.UIElements.Backdrop, 'DropdownOpen', {
								BackgroundTransparency = an.BackdropTransparency
							}, nil, nil, 'Backdrop')
						end
					else
						an.UIElements.Menu.Size = aF and UDim2.new(0, 0, 1, 0) or UDim2.new(1, 0, 0, 0)
					end
					ai.Play(an.UIElements.Menu, 'DropdownOpen', {
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = an.Glass and an.GlassTransparency or 0
					}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 'OpenClose')
					task.spawn(function()
						task.wait(ai.GetDuration'DropdownOpen')
						if an.Locked or aB ~= aE then
							return
						end
						an.Opened = true
					end)
					UpdatePosition()
				end
			end
			function aq.Close(aD)
				aB += 1
				local aE = aB
				an.Opened = false
				local aF = aC == 'Left' or aC == 'Right'
				local aG = if an.Centered then UDim2.fromScale(1, 1) else aF and UDim2.new(0, 0, 1, 0) or UDim2.new(1, 0, 0, 0)
				ai.Play(an.UIElements.Menu, 'DropdownClose', {
					Size = aG,
					ImageTransparency = 1
				}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 'OpenClose')
				if an.Centered then
					ai.Play(an.UIElements.MenuScale, 'DropdownClose', {
						Scale = 0.92
					}, nil, nil, 'CenterScale')
					if an.UIElements.Backdrop then
						ai.Play(an.UIElements.Backdrop, 'DropdownClose', {
							BackgroundTransparency = 1
						}, nil, nil, 'Backdrop')
					end
				end
				task.spawn(function()
					task.wait(ai.GetDuration'DropdownClose')
					if aB ~= aE then
						return
					end
					an.UIElements.Menu.Visible = false
					an.UIElements.MenuCanvas.Visible = false
					an.UIElements.MenuCanvas.Active = false
					if an.UIElements.Backdrop then
						an.UIElements.Backdrop.Visible = false
					end
				end)
			end
			if an.UIElements.Backdrop then
				ah.AddSignal(an.UIElements.Backdrop.MouseButton1Click, function()
					aq:Close()
				end)
			end
			ah.AddSignal((an.UIElements.Dropdown and an.UIElements.Dropdown.MouseButton1Click or an.DropdownFrame.UIElements.Main.MouseButton1Click), function()
				if an.Opened or an.UIElements.MenuCanvas.Visible then
					aq:Close()
				else
					aq:Open()
				end
			end)
			table.insert(aw, ah.AddSignal(ac.InputBegan, function(aD)
				if aD.UserInputType == Enum.UserInputType.MouseButton1 or aD.UserInputType == Enum.UserInputType.Touch then
					local aE, aF, aG = an.UIElements.MenuCanvas, an.UIElements.Dropdown or an.DropdownFrame.UIElements.Main, GetInputPosition(aD)
					local aH, aI = ContainsPoint(aF, aG), ContainsPoint(aE, aG)
					if am.Window.CanDropdown and (an.Opened or aE.Visible) and not aH and not aI then
						aq:Close()
					end
				end
			end))
			table.insert(aw, ah.AddSignal(an.UIElements.Dropdown and an.UIElements.Dropdown:GetPropertyChangedSignal'AbsolutePosition' or an.DropdownFrame.UIElements.Main:GetPropertyChangedSignal'AbsolutePosition', UpdatePosition))
			if typeof(av) == 'Instance' and av:IsA'GuiObject' then
				table.insert(aw, ah.AddSignal(av:GetPropertyChangedSignal'AbsoluteSize', function()
					if an.UIElements.MenuCanvas.Visible then
						RecalculateListSize()
						UpdatePosition()
					end
				end))
			end
			function aq.Destroy(aD)
				aB += 1
				an.Opened = false
				for aE, aF in aw do
					aF:Disconnect()
				end
				table.clear(aw)
				if an.UIElements.Backdrop then
					an.UIElements.Backdrop:Destroy()
					an.UIElements.Backdrop = nil
				end
				if an.UIElements.MenuCanvas then
					an.UIElements.MenuCanvas:Destroy()
				end
			end
			return aq
		end
		return aa
	end
	function a.U()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		aa(game:GetService'UserInputService')
		aa(game:GetService'Players').LocalPlayer:GetMouse()
		local ab, ac = aa(game:GetService'Workspace').CurrentCamera, a.load'd'
		local ad, ae, af, ag, ah, ai, aj = ac.New, ac.Tween, a.load'y'.New, a.load'o'.New, a.load'T'.New, workspace.CurrentCamera, {
			UICorner = 10,
			UIPadding = 12,
			MenuCorner = 14,
			MenuPadding = 4,
			TabPadding = 8,
			SearchBarHeight = 36,
			TabIcon = 16,
			ItemHeight = 32
		}
		function aj.New(ak, al)
			local am, an = al.Values or {}, al.SearchBarEnabled
			if an == nil then
				if al.Search ~= nil then
					an = al.Search
				elseif al.EnableSearch ~= nil then
					an = al.EnableSearch
				else
					an = # am >= (al.SearchThreshold or 7)
				end
			end
			local ao, ap, aq = al.Compact ~= false, string.lower(tostring(al.Placement or al.MenuPlacement or al.Mode or '')), string.lower(tostring(al.Direction or al.OpenDirection or ''))
			local ar = al.Centered == true or al.Modal == true or ap == 'center' or ap == 'middle' or aq == 'center' or aq == 'middle'
			local as = {
				__type = 'Dropdown',
				Title = al.Title or 'Dropdown',
				Desc = al.Desc or nil,
				Locked = al.Locked or false,
				LockedTitle = al.LockedTitle,
				Values = am,
				MenuWidth = al.MenuWidth or (ar and 236 or (ao and 164 or 180)),
				MenuMaxWidth = al.MenuMaxWidth,
				MenuMaxHeight = al.MenuMaxHeight or (ar and 240 or nil),
				FullWidth = al.FullWidth or al.Full or al.Mode == 'Full' or al.MenuMode == 'Full',
				Direction = ar and 'Center' or (al.Direction or al.OpenDirection or 'Auto'),
				Side = al.Side or al.Align or al.Alignment or 'Right',
				MobileDirection = al.MobileDirection or al.MobileOpenDirection,
				MobileSide = al.MobileSide or al.MobileAlign,
				Centered = ar,
				CenterTarget = al.CenterTarget or al.CenterIn or 'Window',
				CenterOffset = typeof(al.CenterOffset) == 'Vector2' and al.CenterOffset or Vector2.new(0, 0),
				Backdrop = ar and al.Backdrop ~= false,
				BackdropTransparency = ac.ClampTransparency(al.BackdropTransparency, 0.84),
				Value = al.Value,
				AllowNone = al.AllowNone,
				SearchBarEnabled = an == true,
				SearchPlaceholder = al.SearchPlaceholder or 'Search...',
				Compact = ao,
				Glass = al.Glass == true,
				GlassTransparency = al.GlassTransparency or al.MenuTransparency or 0,
				ItemHeight = al.ItemHeight or (ao and aj.ItemHeight or 36),
				Multi = al.Multi,
				Callback = al.Callback or nil,
				UIElements = {},
				Opened = false,
				Tabs = {},
				Width = al.Width or (ao and 136 or 150)
			}
			if as.Multi and not as.Value then
				as.Value = {}
			end
			if as.Values and typeof(as.Value) == 'number' then
				as.Value = as.Values[as.Value]
			end
			as.DropdownFrame = a.load'I'{
				Title = as.Title,
				Desc = as.Desc,
				Parent = al.Parent,
				TextOffset = as.Callback and as.Width or 20,
				Hover = not as.Callback and true or false,
				Tab = al.Tab,
				Index = al.Index,
				Window = al.Window,
				ElementTable = as,
				ParentConfig = al,
				Tags = al.Tags
			}
			if as.Callback then
				as.UIElements.Dropdown = af('', nil, as.DropdownFrame.UIElements.Main, nil, al.Window.NewElements and 12 or 10)
				as.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate = 'AtEnd'
				as.UIElements.Dropdown.Frame.Frame.TextLabel.Size = UDim2.new(1, as.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset - 18 - 12 - 12, 0, 0)
				as.UIElements.Dropdown.Size = UDim2.new(0, as.Width, 0, ao and 32 or 36)
				as.UIElements.Dropdown.Position = UDim2.new(1, 0, al.Window.NewElements and 0 or 0.5, 0)
				as.UIElements.Dropdown.AnchorPoint = Vector2.new(1, al.Window.NewElements and 0 or 0.5)
			end
			as.DropdownMenu = ah(al, as, aj, 'Dropdown')
			as.Display = as.DropdownMenu.Display
			as.Refresh = as.DropdownMenu.Refresh
			as.Select = as.DropdownMenu.Select
			as.Open = as.DropdownMenu.Open
			as.Close = as.DropdownMenu.Close
			function as.Cleanup(at)
				as.DropdownMenu:Destroy()
			end
			ad('ImageLabel', {
				Image = ac.Icon'chevrons-up-down'[1],
				ImageRectOffset = ac.Icon'chevrons-up-down'[2].ImageRectPosition,
				ImageRectSize = ac.Icon'chevrons-up-down'[2].ImageRectSize,
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(1, as.UIElements.Dropdown and - 12 or 0, 0.5, 0),
				ThemeTag = {
					ImageColor3 = 'Icon'
				},
				AnchorPoint = Vector2.new(1, 0.5),
				Parent = as.UIElements.Dropdown and as.UIElements.Dropdown.Frame or as.DropdownFrame.UIElements.Main
			})
			function as.Lock(at)
				as.Locked = true
				if as.Opened or as.UIElements.MenuCanvas.Visible then
					as:Close()
				end
				return as.DropdownFrame:Lock(as.LockedTitle)
			end
			function as.Unlock(at)
				as.Locked = false
				return as.DropdownFrame:Unlock()
			end
			if as.Locked then
				as:Lock()
			end
			return as.__type, as
		end
		return aj
	end
	function a.V()
		local aa, ab, ac = {}, {
			lua = {
				'and',
				'break',
				'or',
				'else',
				'elseif',
				'if',
				'then',
				'until',
				'repeat',
				'while',
				'do',
				'for',
				'in',
				'end',
				'local',
				'return',
				'function',
				'export'
			},
			rbx = {
				'game',
				'workspace',
				'script',
				'math',
				'string',
				'table',
				'task',
				'wait',
				'select',
				'next',
				'Enum',
				'tick',
				'assert',
				'shared',
				'loadstring',
				'tonumber',
				'tostring',
				'type',
				'typeof',
				'unpack',
				'Instance',
				'CFrame',
				'Vector3',
				'Vector2',
				'Color3',
				'UDim',
				'UDim2',
				'Ray',
				'BrickColor',
				'OverlapParams',
				'RaycastParams',
				'Axes',
				'Random',
				'Region3',
				'Rect',
				'TweenInfo',
				'collectgarbage',
				'not',
				'utf8',
				'pcall',
				'xpcall',
				'_G',
				'setmetatable',
				'getmetatable',
				'os',
				'pairs',
				'ipairs'
			},
			operators = {
				'#',
				'+',
				'-',
				'*',
				'%',
				'/',
				'^',
				'=',
				'~',
				'=',
				'<',
				'>'
			}
		}, {
			numbers = Color3.fromHex'#FAB387',
			boolean = Color3.fromHex'#FAB387',
			operator = Color3.fromHex'#94E2D5',
			lua = Color3.fromHex'#CBA6F7',
			rbx = Color3.fromHex'#F38BA8',
			str = Color3.fromHex'#A6E3A1',
			comment = Color3.fromHex'#9399B2',
			null = Color3.fromHex'#F38BA8',
			call = Color3.fromHex'#89B4FA',
			self_call = Color3.fromHex'#89B4FA',
			local_property = Color3.fromHex'#CBA6F7'
		}
		local function createKeywordSet(ad)
			local ae = {}
			for af, ag in ipairs(ad) do
				ae[ag] = true
			end
			return ae
		end
		local ad, ae, af = createKeywordSet(ab.lua), createKeywordSet(ab.rbx), createKeywordSet(ab.operators)
		local function getHighlight(ag, ah)
			local ai = ag[ah]
			if ac[ai .. '_color'] then
				return ac[ai .. '_color']
			end
			if tonumber(ai) then
				return ac.numbers
			elseif ai == 'nil' then
				return ac.null
			elseif ai:sub(1, 2) == '--' then
				return ac.comment
			elseif af[ai] then
				return ac.operator
			elseif ad[ai] then
				return ac.lua
			elseif ae[ai] then
				return ac.rbx
			elseif ai:sub(1, 1) == '"' or ai:sub(1, 1) == "'" then
				return ac.str
			elseif ai == 'true' or ai == 'false' then
				return ac.boolean
			end
			if ag[ah + 1] == '(' then
				if ag[ah - 1] == ':' then
					return ac.self_call
				end
				return ac.call
			end
			if ag[ah - 1] == '.' then
				if ag[ah - 2] == 'Enum' then
					return ac.rbx
				end
				return ac.local_property
			end
		end
		function aa.run(ag, ah)
			if ah ~= nil then
				for ai, aj in next, ah do
					ac[ai] = aj
				end
			end
			local ai, aj, ak, al, am = {}, '', false, false, false
			for an = 1, # ag do
				local ao = ag:sub(an, an)
				if al then
					if ao == '\n' and not am then
						table.insert(ai, aj)
						table.insert(ai, ao)
						aj = ''
						al = false
					elseif ag:sub(an - 1, an) == ']]' and am then
						aj = aj .. ']'
						table.insert(ai, aj)
						aj = ''
						al = false
						am = false
					else
						aj = aj .. ao
					end
				elseif ak then
					if ao == ak and ag:sub(an - 1, an - 1) ~= '\\' or ao == '\n' then
						aj = aj .. ao
						ak = false
					else
						aj = aj .. ao
					end
				else
					if ag:sub(an, an + 1) == '--' then
						table.insert(ai, aj)
						aj = '-'
						al = true
						am = ag:sub(an + 2, an + 3) == '[['
					elseif ao == '"' or ao == "'" then
						table.insert(ai, aj)
						aj = ao
						ak = ao
					elseif af[ao] then
						table.insert(ai, aj)
						table.insert(ai, ao)
						aj = ''
					elseif ao:match'[%w_]' then
						aj = aj .. ao
					else
						table.insert(ai, aj)
						table.insert(ai, ao)
						aj = ''
					end
				end
			end
			table.insert(ai, aj)
			local an = {}
			for ao, ap in ipairs(ai) do
				local aq = getHighlight(ai, ao)
				if aq then
					local ar = string.format('<font color = "#%s">%s</font>', aq:ToHex(), ap:gsub('<', '&lt;'):gsub('>', '&gt;'))
					table.insert(an, ar)
				else
					table.insert(an, ap)
				end
			end
			return table.concat(an)
		end
		return aa
	end
	function a.W()
		local aa, ab = {}, a.load'd'
		local ac, ad, ae = ab.New, ab.Tween, a.load'V'
		function aa.New(af, ag, ah, ai, aj)
			local ak = {
				Radius = ag.ElementConfig.UICorner,
				Padding = ag.NewElements and ag.ElementConfig.UIPadding + 4 or ag.ElementConfig.UIPadding,
				CodeFrame = nil
			}
			local al = ac('TextLabel', {
				Text = '',
				TextColor3 = Color3.fromHex'#CDD6F4',
				TextTransparency = 0,
				TextSize = af.CodeSize,
				TextWrapped = false,
				LineHeight = 1.15,
				RichText = true,
				TextXAlignment = 'Left',
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = 'XY'
			}, {
				ac('UIPadding', {
					PaddingTop = UDim.new(0, ak.Padding + 3),
					PaddingLeft = UDim.new(0, ak.Padding + 3),
					PaddingRight = UDim.new(0, ak.Padding + 3),
					PaddingBottom = UDim.new(0, ak.Padding + 3)
				})
			})
			al.Font = 'Code'
			local am, an, ao, ap = ac('ScrollingFrame', {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticCanvasSize = af.Height ~= nil and 'XY' or 'X',
				ScrollingDirection = af.Height ~= nil and 'XY' or 'X',
				ElasticBehavior = 'Never',
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollBarThickness = 0
			}, {
				al
			}), af.CanCopied and ac('TextButton', {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 35, 0, 35),
				Position = UDim2.new(1, - ak.Padding / 2, 0, ak.Padding / 2),
				AnchorPoint = Vector2.new(1, 0),
				Visible = ai and true or false
			}, {
				ab.NewRoundFrame(ak.Radius - 4, 'Squircle', {
					ImageColor3 = Color3.fromHex'#ffffff',
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = 'Button'
				}, {
					ac('UIScale', {
						Scale = 1
					}),
					ac('ImageLabel', {
						Image = ab.Icon'copy'[1],
						ImageRectSize = ab.Icon'copy'[2].ImageRectSize,
						ImageRectOffset = ab.Icon'copy'[2].ImageRectPosition,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 12, 0, 12),
						ImageColor3 = Color3.fromHex'#ffffff',
						ImageTransparency = 0.1
					})
				})
			}) or nil, ab.NewRoundFrame(ak.Radius, 'SquircleOutline', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = Color3.fromHex'#ffffff',
				ImageTransparency = 0.955,
				Visible = false
			})
			local aq, ar = ab.NewRoundFrame(ak.Radius, 'Squircle-TL-TR', {
				ImageColor3 = Color3.fromHex'#ffffff',
				ImageTransparency = 0.96,
				Size = UDim2.new(1, 0, 0, 20 + (ak.Padding * 2)),
				Visible = af.Title and true or false
			}, {
				ac('TextLabel', {
					Text = af.Title,
					TextColor3 = Color3.fromHex'#ffffff',
					TextTransparency = 0.2,
					TextSize = 18,
					AutomaticSize = 'Y',
					FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
					TextXAlignment = 'Left',
					BackgroundTransparency = 1,
					TextTruncate = 'AtEnd',
					Size = UDim2.new(1, an and - 20 - (ak.Padding * 2), 0, 0)
				}),
				ac('UIPadding', {
					PaddingLeft = UDim.new(0, ak.Padding + 3),
					PaddingRight = UDim.new(0, ak.Padding + 3)
				}),
				ac('UIListLayout', {
					Padding = UDim.new(0, ak.Padding),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				})
			})
			local as, at = ab.NewRoundFrame(ak.Radius, 'Squircle', {
				ImageColor3 = Color3.fromHex'#212121',
				ImageTransparency = 0.035,
				Size = af.Height ~= nil and UDim2.new(1, 0, af.Height.Scale, af.Height.Offset == 0 and - 40 or af.Height.Offset) or UDim2.new(1, 0, 0, 20 + (ak.Padding * 2)),
				AutomaticSize = af.Height ~= nil and 'None' or 'Y',
				Parent = ah
			}, {
				ao,
				ac('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, af.Height ~= nil and 1 or 0, 0),
					AutomaticSize = af.Height ~= nil and 'None' or 'Y'
				}, {
					aq,
					am,
					ac('UIListLayout', {
						Padding = UDim.new(0, 0),
						FillDirection = 'Vertical'
					})
				}),
				an
			}, nil, true)
			ak.CodeFrame = as
			ak.CodeFrameModule = at
			ak.OutlineFrame = ao
			ak.OutlineFrameModule = ap
			ak.TopbarFrame = aq
			ak.TopbarFrameModule = ar
			ab.AddSignal(al:GetPropertyChangedSignal'TextBounds', function()
				if af.Height ~= nil then
					am.Size = UDim2.new(1, 0, 1, af.Title ~= nil and - (20 + (ak.Padding * 2)) or nil)
				else
					am.Size = UDim2.new(1, 0, 0, (al.TextBounds.Y / (aj or 1)) + ((ak.Padding + 3) * 2))
				end
			end)
			function ak.Set(au)
				al.Text = ae.run(au, af.CodeTheme)
			end
			function ak.Destroy()
				as:Destroy()
				ak = nil
			end
			ak.Set(af.Code)
			if an then
				ab.AddSignal(an.InputBegan, function(au)
					if au.UserInputType == Enum.UserInputType.MouseButton1 or au.UserInputType == Enum.UserInputType.Touch then
						ad(an.Button, 0.05, {
							ImageTransparency = 0.95
						}):Play()
						ad(an.Button.UIScale, 0.05, {
							Scale = 0.9
						}):Play()
					end
				end)
				ab.AddSignal(an.InputEnded, function()
					ad(an.Button, 0.08, {
						ImageTransparency = 1
					}):Play()
					ad(an.Button.UIScale, 0.08, {
						Scale = 1
					}):Play()
				end)
				ab.AddSignal(an.MouseButton1Click, function()
					if ai then
						ai()
						local au = ab.Icon'check'
						an.Button.ImageLabel.Image = au[1]
						an.Button.ImageLabel.ImageRectSize = au[2].ImageRectSize
						an.Button.ImageLabel.ImageRectOffset = au[2].ImageRectPosition
						task.delay(1, function()
							local av = ab.Icon'copy'
							an.Button.ImageLabel.Image = av[1]
							an.Button.ImageLabel.ImageRectSize = av[2].ImageRectSize
							an.Button.ImageLabel.ImageRectOffset = av[2].ImageRectPosition
						end)
					end
				end)
			end
			return ak
		end
		return aa
	end
	function a.X()
		local aa = a.load'd'
		local ab, ac, ad = aa.New, a.load'W', {}
		function ad.New(ae, af)
			local ag = {
				__type = 'Code',
				Title = af.Title,
				Code = af.Code,
				CodeSize = af.CodeSize or 18,
				Height = af.Height,
				CodeTheme = af.CodeTheme,
				Locked = false,
				CanCopied = af.CanCopied ~= false,
				OnCopy = af.OnCopy,
				LinkCorners = af.LinkCorners,
				CornerGroup = af.CornerGroup or af.LinkCornerGroup,
				CornerBreak = af.CornerBreak,
				CornerBreakBefore = af.CornerBreakBefore,
				CornerBreakAfter = af.CornerBreakAfter,
				Index = af.Index
			}
			local ah = not ag.Locked
			local ai = ac.New(ag, af.Window, af.Parent, function()
				if ah then
					local ai, aj, ak = ag.Title or 'code', pcall(function()
						if toclipboard then
							toclipboard(ag.Code)
						end
						if setclipboard then
							setclipboard(ag.Code)
						end
						if ag.OnCopy then
							ag.OnCopy()
						end
					end)
					if not aj then
						af.WindUI:Notify{
							Title = 'Error',
							Content = 'The ' .. ai .. ' is not copied. Error: ' .. ak,
							Icon = 'x',
							Style = 'Error',
							Duration = 5
						}
					end
				end
			end, af.WindUI.UIScale)
			function ag.SetCode(aj, ak)
				ai.Set(ak)
				ag.Code = ak
			end
			function ag.Set(aj, ak)
				return ag.SetCode(ak)
			end
			function ag.Destroy(aj)
				ai.Destroy()
				ag = nil
			end
			function ag.UpdateShape(aj)
				if af.Window.NewElements then
					local ak, al = af.Window.ElementConfig.LinkCorners or af.LinkCorners == true, 'Squircle'
					if ak then
						al = aa.GetLinkedCornerShape(aj.Elements, ag.Index, aj, af.ParentType, af.CornerLink or (af.ParentConfig and af.ParentConfig.CornerLink) or af.Window.ElementConfig.CornerLink)
					end
					if al and ai.CodeFrameModule then
						local am = (al == 'Squircle-TL-BL' or al == 'Squircle-TR-BR') and 'Squircle' or al
						ai.CodeFrameModule:SetType(am)
						ai.TopbarFrameModule:SetType(table.find({
							'Squircle-BL-BR',
							'SquircleH-BL-BR',
							'Squircle-TR-BR'
						}, al) ~= nil and 'Square' or am)
					end
				end
			end
			ag.UIElements = {
				Main = ai.CodeFrame
			}
			ag.ElementFrame = ai.CodeFrame
			return ag.__type, ag
		end
		return ad
	end
	function a.Y()
		local aa = a.load'd'
		local ab, ac, ad = aa.New, aa.Tween, (cloneref or clonereference or function(ab)
			return ab
		end)
		local ae = ad(game:GetService'UserInputService')
		ad(game:GetService'TouchInputService')
		local af, ag = ad(game:GetService'RunService'), ad(game:GetService'Players')
		local ah, ai = af.RenderStepped, ag.LocalPlayer
		local aj, ak, al, am = ai:GetMouse(), a.load'n'.New, a.load'o'.New, {
			UICorner = 9
		}
		function am.Colorpicker(an, ao, ap, aq, ar)
			local as, at, au, av, aw = {
				__type = 'Colorpicker',
				Title = ao.Title,
				Desc = ao.Desc,
				Default = ao.Value or ao.Default,
				Callback = ao.Callback,
				Transparency = ao.Transparency,
				UIElements = ao.UIElements,
				TextPadding = 10
			}, {}, (aq.GenerateGUID())
			local ax = as.Transparency ~= nil
			local function TrackConnection(ay, az)
				local aA = aa.AddSignal(ay, az)
				table.insert(at, aA)
				return aA
			end
			local function DisconnectConnections()
				for ay = # at, 1, - 1 do
					aa.DisconnectSignal(at[ay])
					at[ay] = nil
				end
				table.clear(at)
				av = nil
				aw = nil
				if aq.CurrentInput == au then
					aq.CurrentInput = nil
				end
			end
			function as.SetHSVFromRGB(ay, az)
				local aA, aB, aC = Color3.toHSV(az)
				as.Hue = aA
				as.Sat = aB
				as.Vib = aC
			end
			as:SetHSVFromRGB(as.Default)
			local ay = a.load'p'
			local az = ay.Create(nil, 'Dialog', ap, aq, ap.UIElements.Main.Main)
			as.ColorpickerFrame = az
			az.UIElements.Main.Size = UDim2.new(1, 0, 0, 0)
			local aA, aB, aC = as.Hue, as.Sat, as.Vib
			as.UIElements.Title = ab('TextLabel', {
				Text = as.Title,
				TextSize = 20,
				FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
				TextXAlignment = 'Left',
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = 'Y',
				ThemeTag = {
					TextColor3 = 'Text'
				},
				BackgroundTransparency = 1,
				Parent = az.UIElements.Main
			}, {
				ab('UIPadding', {
					PaddingTop = UDim.new(0, as.TextPadding / 2),
					PaddingLeft = UDim.new(0, as.TextPadding / 2),
					PaddingRight = UDim.new(0, as.TextPadding / 2),
					PaddingBottom = UDim.new(0, as.TextPadding / 2)
				})
			})
			local aD = ab('Frame', {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1
			})
			local aE = ab('Frame', {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = aD,
				BackgroundColor3 = as.Default
			}, {
				ab('UIStroke', {
					Thickness = 2,
					Transparency = 0.1,
					ThemeTag = {
						Color = 'Text'
					}
				}),
				ab('UICorner', {
					CornerRadius = UDim.new(1, 0)
				})
			})
			as.UIElements.SatVibMap = ab('ImageLabel', {
				Size = UDim2.fromOffset(160, 158),
				Position = UDim2.fromOffset(0, 40 + as.TextPadding),
				Image = 'rbxassetid://4155801252',
				BackgroundColor3 = Color3.fromHSV(aA, 1, 1),
				BackgroundTransparency = 0,
				Parent = az.UIElements.Main
			}, {
				ab('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				aa.NewRoundFrame(8, 'SquircleOutline', {
					ThemeTag = {
						ImageColor3 = 'Outline'
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.85,
					ZIndex = 99999
				}, {
					ab('UIGradient', {
						Rotation = 45,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1, 0.1)
						}
					})
				}),
				aE
			})
			as.UIElements.Inputs = ab('Frame', {
				AutomaticSize = 'XY',
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.fromOffset(ax and 240 or 210, 40 + as.TextPadding),
				BackgroundTransparency = 1,
				Parent = az.UIElements.Main
			}, {
				ab('UIListLayout', {
					Padding = UDim.new(0, 4),
					FillDirection = 'Vertical'
				})
			})
			local aF = ab('Frame', {
				BackgroundColor3 = as.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = as.Transparency
			}, {
				ab('UICorner', {
					CornerRadius = UDim.new(0, 8)
				})
			})
			ab('ImageLabel', {
				Image = 'http://www.roblox.com/asset/?id=14204231522',
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(85, 208 + as.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = az.UIElements.Main
			}, {
				ab('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				aa.NewRoundFrame(8, 'SquircleOutline', {
					ThemeTag = {
						ImageColor3 = 'Outline'
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.85,
					ZIndex = 99999
				}, {
					ab('UIGradient', {
						Rotation = 60,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1, 0.1)
						}
					})
				}),
				aF
			})
			local aG = ab('Frame', {
				BackgroundColor3 = as.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
				ZIndex = 9
			}, {
				ab('UICorner', {
					CornerRadius = UDim.new(0, 8)
				})
			})
			ab('ImageLabel', {
				Image = 'http://www.roblox.com/asset/?id=14204231522',
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 208 + as.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = az.UIElements.Main
			}, {
				ab('UICorner', {
					CornerRadius = UDim.new(0, 8)
				}),
				aa.NewRoundFrame(8, 'SquircleOutline', {
					ThemeTag = {
						ImageColor3 = 'Outline'
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.85,
					ZIndex = 99999
				}, {
					ab('UIGradient', {
						Rotation = 60,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1, 0.1)
						}
					})
				}),
				aG
			})
			local aH = {}
			for aI = 0, 1, 0.1 do
				table.insert(aH, ColorSequenceKeypoint.new(aI, Color3.fromHSV(aI, 1, 1)))
			end
			local aI, aJ = ab('UIGradient', {
				Color = ColorSequence.new(aH),
				Rotation = 90
			}), ab('Frame', {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = aD,
				BackgroundColor3 = as.Default
			}, {
				ab('UIStroke', {
					Thickness = 2,
					Transparency = 0.1,
					ThemeTag = {
						Color = 'Text'
					}
				}),
				ab('UICorner', {
					CornerRadius = UDim.new(1, 0)
				})
			})
			local aK = ab('Frame', {
				Size = UDim2.fromOffset(6, 192),
				Position = UDim2.fromOffset(180, 40 + as.TextPadding),
				Parent = az.UIElements.Main
			}, {
				ab('UICorner', {
					CornerRadius = UDim.new(1, 0)
				}),
				aI,
				aD
			})
			local function CreateNewInput(aL, aM)
				local aN = al(aL, nil, as.UIElements.Inputs, nil, nil, nil, nil, nil, true)
				ab('TextLabel', {
					BackgroundTransparency = 1,
					TextTransparency = 0.4,
					TextSize = 17,
					FontFace = Font.new(aa.Font, Enum.FontWeight.Regular),
					AutomaticSize = 'XY',
					ThemeTag = {
						TextColor3 = 'Placeholder'
					},
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, - 12, 0.5, 0),
					Parent = aN.Frame,
					Text = aL
				})
				ab('UIScale', {
					Parent = aN,
					Scale = 0.85
				})
				aN.Frame.Frame.TextBox.Text = aM
				aN.Size = UDim2.new(0, 150, 0, 42)
				return aN
			end
			local function ToRGB(aL)
				return {
					R = math.floor(aL.R * 255),
					G = math.floor(aL.G * 255),
					B = math.floor(aL.B * 255)
				}
			end
			local aL, aM, aN, aO, aP = CreateNewInput('Hex', '#' .. as.Default:ToHex()), CreateNewInput('Red', ToRGB(as.Default).R), CreateNewInput('Green', ToRGB(as.Default).G), (CreateNewInput('Blue', ToRGB(as.Default).B))
			if ax then
				aP = CreateNewInput('Alpha', ((1 - as.Transparency) * 100) .. '%')
			end
			local aQ = ab('Frame', {
				Size = UDim2.new(0, 0, 0, 40),
				AutomaticSize = 'Y',
				Position = UDim2.new(0, 0, 0, 254 + as.TextPadding),
				BackgroundTransparency = 1,
				Parent = az.UIElements.Main,
				LayoutOrder = 4
			}, {
				ab('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Right'
				})
			})
			TrackConnection(az.UIElements.Main:GetPropertyChangedSignal'AbsoluteSize', function()
				as.UIElements.Title.Size = UDim2.new(0, az.UIElements.Main.AbsoluteSize.X / ao.UIScale - (az.UIPadding * 2), 0, 0)
				aQ.Size = UDim2.new(0, az.UIElements.Main.AbsoluteSize.X / ao.UIScale - az.UIPadding * 2, 0, 40)
			end)
			local aR = {
				{
					Title = 'Cancel',
					Variant = 'Secondary',
					Callback = function()
						ao.IsShowed = false
						DisconnectConnections()
					end
				},
				{
					Title = 'Apply',
					Variant = 'Primary',
					Callback = function()
						ao.IsShowed = false
						DisconnectConnections()
						ar(Color3.fromHSV(as.Hue, as.Sat, as.Vib), as.Transparency)
					end
				}
			}
			for aS, aT in next, aR do
				local aU = ak(aT.Title, aT.Icon, aT.Callback, aT.Variant, aQ, az, true)
				aU.Size = UDim2.new(0.5, - 3, 0, 40)
				aU.AutomaticSize = 'None'
			end
			local aS, aT, aU
			if ax then
				local aV = ab('Frame', {
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1
				})
				aT = ab('ImageLabel', {
					Size = UDim2.new(0, 14, 0, 14),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0, 0),
					ThemeTag = {
						BackgroundColor3 = 'Text'
					},
					Parent = aV
				}, {
					ab('UIStroke', {
						Thickness = 2,
						Transparency = 0.1,
						ThemeTag = {
							Color = 'Text'
						}
					}),
					ab('UICorner', {
						CornerRadius = UDim.new(1, 0)
					})
				})
				aU = ab('Frame', {
					Size = UDim2.fromScale(1, 1)
				}, {
					ab('UIGradient', {
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1)
						},
						Rotation = 270
					}),
					ab('UICorner', {
						CornerRadius = UDim.new(0, 6)
					})
				})
				aS = ab('Frame', {
					Size = UDim2.fromOffset(6, 192),
					Position = UDim2.fromOffset(210, 40 + as.TextPadding),
					Parent = az.UIElements.Main,
					BackgroundTransparency = 1
				}, {
					ab('UICorner', {
						CornerRadius = UDim.new(1, 0)
					}),
					ab('ImageLabel', {
						Image = 'rbxassetid://14204231522',
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1)
					}, {
						ab('UICorner', {
							CornerRadius = UDim.new(1, 0)
						})
					}),
					aU,
					aV
				})
			end
			function as.Round(aV, aW, aX)
				if aX == 0 then
					return math.floor(aW)
				end
				aW = tostring(aW)
				return aW:find'%.' and tonumber(aW:sub(1, aW:find'%.' + aX)) or aW
			end
			function as.Update(aV, aW, aX)
				if aW then
					aA, aB, aC = Color3.toHSV(aW)
				else
					aA, aB, aC = as.Hue, as.Sat, as.Vib
				end
				as.UIElements.SatVibMap.BackgroundColor3 = Color3.fromHSV(aA, 1, 1)
				aE.Position = UDim2.new(aB, 0, 1 - aC, 0)
				aE.BackgroundColor3 = Color3.fromHSV(aA, aB, aC)
				aG.BackgroundColor3 = Color3.fromHSV(aA, aB, aC)
				aJ.BackgroundColor3 = Color3.fromHSV(aA, 1, 1)
				aJ.Position = UDim2.new(0.5, 0, aA, 0)
				aL.Frame.Frame.TextBox.Text = '#' .. Color3.fromHSV(aA, aB, aC):ToHex()
				aM.Frame.Frame.TextBox.Text = ToRGB(Color3.fromHSV(aA, aB, aC)).R
				aN.Frame.Frame.TextBox.Text = ToRGB(Color3.fromHSV(aA, aB, aC)).G
				aO.Frame.Frame.TextBox.Text = ToRGB(Color3.fromHSV(aA, aB, aC)).B
				if aX or ax then
					aG.BackgroundTransparency = as.Transparency or aX
					aU.BackgroundColor3 = Color3.fromHSV(aA, aB, aC)
					aT.BackgroundColor3 = Color3.fromHSV(aA, aB, aC)
					aT.BackgroundTransparency = as.Transparency or aX
					aT.Position = UDim2.new(0.5, 0, 1 - as.Transparency or aX, 0)
					aP.Frame.Frame.TextBox.Text = as:Round((1 - as.Transparency or aX) * 100, 0) .. '%'
				end
			end
			as:Update(as.Default, as.Transparency)
			local function GetRGB()
				local aV = Color3.fromHSV(as.Hue, as.Sat, as.Vib)
				return {
					R = math.floor(aV.r * 255),
					G = math.floor(aV.g * 255),
					B = math.floor(aV.b * 255)
				}
			end
			local function clamp(aV, aW, aX)
				return math.clamp(tonumber(aV) or 0, aW, aX)
			end
			TrackConnection(aL.Frame.Frame.TextBox.FocusLost, function(aV)
				if aV then
					local aW = aL.Frame.Frame.TextBox.Text:gsub('#', '')
					local aX, aY = pcall(Color3.fromHex, aW)
					if aX and typeof(aY) == 'Color3' then
						as.Hue, as.Sat, as.Vib = Color3.toHSV(aY)
						as:Update()
						as.Default = aY
					end
				end
			end)
			local function updateColorFromInput(aV, aW)
				TrackConnection(aV.Frame.Frame.TextBox.FocusLost, function(aX)
					if aX then
						local aY, aZ = aV.Frame.Frame.TextBox, GetRGB()
						local a_ = clamp(aY.Text, 0, 255)
						aY.Text = tostring(a_)
						aZ[aW] = a_
						local a0 = Color3.fromRGB(aZ.R, aZ.G, aZ.B)
						as.Hue, as.Sat, as.Vib = Color3.toHSV(a0)
						as:Update()
					end
				end)
			end
			updateColorFromInput(aM, 'R')
			updateColorFromInput(aN, 'G')
			updateColorFromInput(aO, 'B')
			if ax then
				TrackConnection(aP.Frame.Frame.TextBox.FocusLost, function(aV)
					if aV then
						local aW = aP.Frame.Frame.TextBox
						local aX = clamp(aW.Text, 0, 100)
						aW.Text = tostring(aX)
						as.Transparency = 1 - aX * 0.01
						as:Update(nil, as.Transparency)
					end
				end)
			end
			local function GetPointerPosition(aV)
				if aV and aV.UserInputType == Enum.UserInputType.Touch then
					return aV.Position.X, aV.Position.Y
				end
				return aj.X, aj.Y
			end
			local function UpdateSatVib(aV, aW, aX)
				local aY = aV.AbsolutePosition.X
				local aZ, a_ = aY + aV.AbsoluteSize.X, aV.AbsolutePosition.Y
				local a0, a1, a2 = a_ + aV.AbsoluteSize.Y, GetPointerPosition(aX)
				local a3, a4 = aZ - aY, a0 - a_
				if a3 <= 0 or a4 <= 0 then
					return
				end
				local a5, a6 = math.clamp(a1, aY, aZ), math.clamp(a2, a_, a0)
				aW.Sat = (a5 - aY) / a3
				aW.Vib = 1 - ((a6 - a_) / a4)
				aW:Update()
			end
			local function UpdateHue(aV, aW, aX)
				local aY = aV.AbsolutePosition.Y
				local aZ, a_, a0 = aY + aV.AbsoluteSize.Y, GetPointerPosition(aX)
				local a1 = aZ - aY
				if a1 <= 0 then
					return
				end
				local a2 = math.clamp(a0, aY, aZ)
				aW.Hue = (a2 - aY) / a1
				aW:Update()
			end
			local function UpdateTransparency(aV, aW, aX)
				local aY = aV.AbsolutePosition.Y
				local aZ, a_, a0 = aY + aV.AbsoluteSize.Y, GetPointerPosition(aX)
				local a1 = aZ - aY
				if a1 <= 0 then
					return
				end
				local a2 = math.clamp(a0, aY, aZ)
				aW.Transparency = 1 - ((a2 - aY) / a1)
				aW:Update()
			end
			TrackConnection(ae.InputChanged, function(aV)
				if aV.UserInputType ~= Enum.UserInputType.MouseMovement and aV.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if aw and aw.UserInputType == Enum.UserInputType.Touch and aV ~= aw then
					return
				end
				if av == 'SatVib' then
					UpdateSatVib(as.UIElements.SatVibMap, as, aV)
				elseif av == 'Hue' then
					UpdateHue(aK, as, aV)
				elseif av == 'Transparency' then
					UpdateTransparency(aS, as, aV)
				end
			end)
			TrackConnection(as.UIElements.SatVibMap.InputBegan, function(aV)
				if aV.UserInputType ~= Enum.UserInputType.MouseButton1 and aV.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if aq.CurrentInput and aq.CurrentInput ~= au then
					return
				end
				if av then
					return
				end
				aq.CurrentInput = au
				av = 'SatVib'
				aw = aV
				UpdateSatVib(as.UIElements.SatVibMap, as, aV)
			end)
			TrackConnection(aK.InputBegan, function(aV)
				if aV.UserInputType ~= Enum.UserInputType.MouseButton1 and aV.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if aq.CurrentInput and aq.CurrentInput ~= au then
					return
				end
				if av then
					return
				end
				aq.CurrentInput = au
				av = 'Hue'
				aw = aV
				UpdateHue(aK, as, aV)
			end)
			if aS then
				TrackConnection(aS.InputBegan, function(aV)
					if aV.UserInputType ~= Enum.UserInputType.MouseButton1 and aV.UserInputType ~= Enum.UserInputType.Touch then
						return
					end
					if aq.CurrentInput and aq.CurrentInput ~= au then
						return
					end
					if av then
						return
					end
					aq.CurrentInput = au
					av = 'Transparency'
					aw = aV
					UpdateTransparency(aS, as, aV)
				end)
			end
			TrackConnection(ae.InputEnded, function(aV)
				if not aw then
					return
				end
				local aW, aX = aw.UserInputType == Enum.UserInputType.Touch and aV == aw, aw.UserInputType == Enum.UserInputType.MouseButton1 and aV.UserInputType == Enum.UserInputType.MouseButton1
				if not aW and not aX then
					return
				end
				av = nil
				aw = nil
				if aq.CurrentInput == au then
					aq.CurrentInput = nil
				end
			end)
			return as
		end
		function am.New(an, ao)
			local ap, aq = {
				__type = 'Colorpicker',
				Title = ao.Title or 'Colorpicker',
				Desc = ao.Desc or nil,
				Locked = ao.Locked or false,
				LockedTitle = ao.LockedTitle,
				Default = ao.Default or Color3.new(1, 1, 1),
				Callback = ao.Callback or function()
				end,
				UIScale = ao.UIScale,
				Transparency = ao.Transparency,
				UIElements = {},
				IsShowed = false
			}, true
			ap.ColorpickerFrame = a.load'I'{
				Title = ap.Title,
				Desc = ap.Desc,
				Parent = ao.Parent,
				TextOffset = 40,
				Hover = false,
				Tab = ao.Tab,
				Index = ao.Index,
				Window = ao.Window,
				ElementTable = ap,
				ParentConfig = ao,
				Tags = ao.Tags
			}
			ap.UIElements.Colorpicker = aa.NewRoundFrame(am.UICorner, 'Squircle', {
				ImageTransparency = 0,
				Active = true,
				ImageColor3 = ap.Default,
				Parent = ap.ColorpickerFrame.UIElements.Main,
				Size = UDim2.new(0, 26, 0, 26),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				ZIndex = 2
			}, {
				aa.NewRoundFrame(am.UICorner, 'SquircleGlass', {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = 'Outline'
					},
					ImageTransparency = 0.55
				})
			}, true)
			function ap.Lock(ar)
				ap.Locked = true
				aq = false
				return ap.ColorpickerFrame:Lock(ap.LockedTitle)
			end
			function ap.Unlock(ar)
				ap.Locked = false
				aq = true
				return ap.ColorpickerFrame:Unlock()
			end
			if ap.Locked then
				ap:Lock()
			end
			function ap.Update(ar, as, at)
				ap.UIElements.Colorpicker.ImageTransparency = at or 0
				ap.UIElements.Colorpicker.ImageColor3 = as
				ap.Default = as
				if at then
					ap.Transparency = at
				end
			end
			function ap.Set(ar, as, at)
				return ap:Update(as, at)
			end
			aa.AddSignal(ap.UIElements.Colorpicker.MouseButton1Click, function()
				if aq and not ap.IsShowed then
					ap.IsShowed = true
					am:Colorpicker(ap, ao.Window, ao.WindUI, function(ar, as)
						ap:Update(ar, as)
						ap.Default = ar
						ap.Transparency = as
						aa.SafeCallback(ap.Callback, ar, as)
					end).ColorpickerFrame:Open()
				end
			end)
			return ap.__type, ap
		end
		return am
	end
	function a.Z()
		local aa = {}
		function aa.ToFiniteNumber(ab)
			local ac = tonumber(ab)
			if ac == nil or ac ~= ac or math.abs(ac) == math.huge then
				return nil
			end
			return ac
		end
		function aa.FormatNumber(ab)
			if ab % 1 == 0 then
				return tostring(ab)
			end
			return tostring(tonumber(string.format('%.2f', ab)))
		end
		function aa.NormalizeOptions(ab)
			local ac = {}
			for ad, ae in next, ab or {} do
				local af
				if typeof(ae) == 'table' then
					local ag = ae.Value
					if ag == nil then
						ag = ae.Id or ae.Key or ae.Title or ae.Name or ad
					end
					af = {
						Title = tostring(ae.Title or ae.Name or ag),
						Desc = ae.Desc,
						Value = ag,
						Icon = ae.Icon,
						Disabled = ae.Disabled == true
					}
				else
					af = {
						Title = tostring(ae),
						Value = ae,
						Disabled = false
					}
				end
				table.insert(ac, af)
			end
			return ac
		end
		function aa.FindOption(ab, ac)
			for ad, ae in next, ab or {} do
				if ae.Value == ac then
					return ae, ad
				end
			end
			return nil, nil
		end
		function aa.ContainsValue(ab, ac)
			for ad, ae in next, ab or {} do
				if ae == ac then
					return true
				end
			end
			return false
		end
		function aa.CloneArray(ab)
			local ac = {}
			for ad, ae in next, ab or {} do
				table.insert(ac, ae)
			end
			return ac
		end
		function aa.NormalizeValues(ab)
			if ab == nil then
				return {}
			end
			if typeof(ab) ~= 'table' then
				return {
					ab
				}
			end
			return aa.CloneArray(ab)
		end
		function aa.ToggleValue(ab, ac)
			local ad = aa.CloneArray(ab)
			for ae, af in next, ad do
				if af == ac then
					table.remove(ad, ae)
					return ad, false
				end
			end
			table.insert(ad, ac)
			return ad, true
		end
		return aa
	end
	function a._()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'Z', {}
		local function GetControlWidth(af)
			return math.max(ad.ToFiniteNumber(af.Width) or ad.ToFiniteNumber(af.ControlWidth) or 220, 120)
		end
		function ae.New(af, ag)
			local ah = {
				__type = 'RadioGroup',
				Title = ag.Title or 'Radio Group',
				Desc = ag.Desc or nil,
				Locked = ag.Locked or false,
				LockedTitle = ag.LockedTitle,
				Options = ad.NormalizeOptions(ag.Options or ag.Values or {}),
				Value = ag.Value,
				AllowNone = ag.AllowNone == true,
				Callback = ag.Callback or function()
				end,
				UIElements = {},
				OptionFrames = {},
				Animation = ag.Animation ~= false,
				Width = GetControlWidth(ag)
			}
			if ah.Value == nil then
				ah.Value = ag.Default
			end
			if typeof(ah.Value) == 'number' and ah.Options[ah.Value] then
				ah.Value = ah.Options[ah.Value].Value
			end
			if ah.Value == nil and not ah.AllowNone and ah.Options[1] then
				ah.Value = ah.Options[1].Value
			end
			local ai = true
			ah.RadioGroupFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = ah.Width + 14,
				Hover = false,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.Options = ac('Frame', {
				Name = 'RadioGroupOptions',
				Size = UDim2.new(0, ah.Width, 0, 0),
				AutomaticSize = 'Y',
				Position = UDim2.new(1, 0, ag.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, ag.Window.NewElements and 0 or 0.5),
				BackgroundTransparency = 1,
				Parent = ah.RadioGroupFrame.UIElements.Main
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Right',
					SortOrder = 'LayoutOrder'
				})
			})
			local function UpdateOptionVisuals(aj)
				for ak, al in next, ah.OptionFrames do
					local am = al.Option.Value == ah.Value
					local an, ao, ap = am and 0.84 or 0.94, am and 0 or 1, al.Option.Disabled and 0.55 or (am and 0 or 0.18)
					if aj and ah.Animation then
						ab.Play(al.Row, 'Select', {
							ImageTransparency = an
						}, nil, nil, 'Select')
						ab.Play(al.Dot, 'Select', {
							ImageTransparency = ao
						}, nil, nil, 'Select')
						ab.Play(al.Title, 'Select', {
							TextTransparency = ap
						}, nil, nil, 'Select')
					else
						al.Row.ImageTransparency = an
						al.Dot.ImageTransparency = ao
						al.Title.TextTransparency = ap
					end
				end
			end
			local function CreateOption(aj, ak)
				local al = aa.NewRoundFrame(99, 'Circle', {
					Name = 'Dot',
					Size = UDim2.new(0, 8, 0, 8),
					ImageTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'RadioGroupActive'
					}
				})
				local am = aa.NewRoundFrame(99, 'CircleOutline', {
					Name = 'Ring',
					Size = UDim2.new(0, 18, 0, 18),
					ImageTransparency = aj.Disabled and 0.75 or 0.45,
					ThemeTag = {
						ImageColor3 = 'RadioGroupBorder'
					}
				}, {
					al
				})
				al.Position = UDim2.new(0.5, 0, 0.5, 0)
				al.AnchorPoint = Vector2.new(0.5, 0.5)
				local an = ac('TextLabel', {
					Name = 'Title',
					Size = UDim2.new(1, - 28, 0, 0),
					AutomaticSize = 'Y',
					BackgroundTransparency = 1,
					Text = aj.Title,
					TextSize = 14,
					TextWrapped = true,
					TextXAlignment = 'Left',
					FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
					ThemeTag = {
						TextColor3 = 'RadioGroupText'
					}
				})
				local ao = aa.NewRoundFrame(12, 'Squircle', {
					Name = 'Option',
					Size = UDim2.new(1, 0, 0, 36),
					LayoutOrder = ak,
					ImageTransparency = 0.94,
					Active = not aj.Disabled,
					ThemeTag = {
						ImageColor3 = 'RadioGroupBackground'
					}
				}, {
					ac('UIListLayout', {
						Padding = UDim.new(0, 10),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Left'
					}),
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					am,
					an
				}, true)
				ao.Parent = ah.UIElements.Options
				local ap = {
					Row = ao,
					Ring = am,
					Dot = al,
					Title = an,
					Option = aj
				}
				ah.OptionFrames[ak] = ap
				ab.AttachPress(ao, aa, {
					Enabled = function()
						return ah.Animation and not ah.Locked and not aj.Disabled
					end
				})
				aa.AddSignal(ao.MouseButton1Click, function()
					if not aj.Disabled then
						ah:Select(aj.Value)
					end
				end)
			end
			local function RenderOptions()
				for aj, ak in next, ah.OptionFrames do
					if ak.Row then
						ak.Row:Destroy()
					end
				end
				ah.OptionFrames = {}
				for aj, ak in next, ah.Options do
					CreateOption(ak, aj)
				end
				UpdateOptionVisuals(false)
			end
			function ah.Lock(aj)
				ah.Locked = true
				ai = false
				return ah.RadioGroupFrame:Lock(ah.LockedTitle)
			end
			function ah.Unlock(aj)
				ah.Locked = false
				ai = true
				return ah.RadioGroupFrame:Unlock()
			end
			function ah.Get(aj)
				return ah.Value
			end
			function ah.Select(aj, ak, al)
				local am = ad.FindOption(ah.Options, ak)
				if not am and not ah.AllowNone then
					return ah.Value
				end
				if am and am.Disabled then
					return ah.Value
				end
				ah.Value = ak
				UpdateOptionVisuals(true)
				if ai and al ~= false then
					aa.SafeCallback(ah.Callback, ak, am)
				end
				return ah.Value
			end
			function ah.SetOptions(aj, ak)
				ah.Options = ad.NormalizeOptions(ak)
				if not ad.FindOption(ah.Options, ah.Value) then
					ah.Value = ah.AllowNone and nil or (ah.Options[1] and ah.Options[1].Value)
				end
				RenderOptions()
				return ah.Options
			end
			RenderOptions()
			if ah.Locked then
				ah:Lock()
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.aa()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'Z', {}
		local function GetControlWidth(af)
			return math.max(ad.ToFiniteNumber(af.Width) or ad.ToFiniteNumber(af.ControlWidth) or 220, 120)
		end
		function ae.New(af, ag)
			local ah, ai = {
				__type = 'CheckboxGroup',
				Title = ag.Title or 'Checkbox Group',
				Desc = ag.Desc or nil,
				Locked = ag.Locked or false,
				LockedTitle = ag.LockedTitle,
				Options = ad.NormalizeOptions(ag.Options or ag.Values or {}),
				Values = ad.NormalizeValues(ag.ValuesSelected or ag.SelectedValues or ag.Value or ag.ValuesDefault),
				Callback = ag.Callback or function()
				end,
				UIElements = {},
				OptionFrames = {},
				Animation = ag.Animation ~= false,
				Width = GetControlWidth(ag)
			}, true
			ah.CheckboxGroupFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = ah.Width + 14,
				Hover = false,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.Options = ac('Frame', {
				Name = 'CheckboxGroupOptions',
				Size = UDim2.new(0, ah.Width, 0, 0),
				AutomaticSize = 'Y',
				Position = UDim2.new(1, 0, ag.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, ag.Window.NewElements and 0 or 0.5),
				BackgroundTransparency = 1,
				Parent = ah.CheckboxGroupFrame.UIElements.Main
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Right',
					SortOrder = 'LayoutOrder'
				})
			})
			local function SanitizeValues(aj)
				local ak = {}
				for al, am in next, aj or {} do
					local an = ad.FindOption(ah.Options, am)
					if an and not an.Disabled and not ad.ContainsValue(ak, am) then
						table.insert(ak, am)
					end
				end
				return ak
			end
			local function UpdateOptionVisuals(aj)
				for ak, al in next, ah.OptionFrames do
					local am = ad.ContainsValue(ah.Values, al.Option.Value)
					local an, ao, ap, aq = am and 0.84 or 0.94, am and 0 or 1, am and 0 or 1, al.Option.Disabled and 0.55 or (am and 0 or 0.18)
					if aj and ah.Animation then
						ab.Play(al.Row, 'Select', {
							ImageTransparency = an
						}, nil, nil, 'Select')
						ab.Play(al.Fill, 'Select', {
							ImageTransparency = ao
						}, nil, nil, 'Select')
						ab.Play(al.Icon, 'Select', {
							ImageTransparency = ap
						}, nil, nil, 'Select')
						ab.Play(al.Title, 'Select', {
							TextTransparency = aq
						}, nil, nil, 'Select')
					else
						al.Row.ImageTransparency = an
						al.Fill.ImageTransparency = ao
						al.Icon.ImageTransparency = ap
						al.Title.TextTransparency = aq
					end
				end
			end
			local function CreateOption(aj, ak)
				local al = aa.Icon'check'
				local am = ac('ImageLabel', {
					Name = 'Check',
					Size = UDim2.new(0, 12, 0, 12),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = al[1],
					ImageRectOffset = al[2].ImageRectPosition,
					ImageRectSize = al[2].ImageRectSize,
					ImageTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'CheckboxGroupIcon'
					}
				})
				local an = aa.NewRoundFrame(5, 'Squircle', {
					Name = 'Fill',
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'CheckboxGroupActive'
					}
				}, {
					am
				})
				local ao, ap = aa.NewRoundFrame(5, 'SquircleOutline', {
					Name = 'Box',
					Size = UDim2.new(0, 18, 0, 18),
					ImageTransparency = aj.Disabled and 0.75 or 0.45,
					ThemeTag = {
						ImageColor3 = 'CheckboxGroupBorder'
					}
				}, {
					an
				}), ac('TextLabel', {
					Name = 'Title',
					Size = UDim2.new(1, - 28, 0, 0),
					AutomaticSize = 'Y',
					BackgroundTransparency = 1,
					Text = aj.Title,
					TextSize = 14,
					TextWrapped = true,
					TextXAlignment = 'Left',
					FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
					ThemeTag = {
						TextColor3 = 'CheckboxGroupText'
					}
				})
				local aq = aa.NewRoundFrame(12, 'Squircle', {
					Name = 'Option',
					Size = UDim2.new(1, 0, 0, 36),
					LayoutOrder = ak,
					ImageTransparency = 0.94,
					Active = not aj.Disabled,
					ThemeTag = {
						ImageColor3 = 'CheckboxGroupBackground'
					}
				}, {
					ac('UIListLayout', {
						Padding = UDim.new(0, 10),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Left'
					}),
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					ao,
					ap
				}, true)
				aq.Parent = ah.UIElements.Options
				local ar = {
					Row = aq,
					Fill = an,
					Icon = am,
					Title = ap,
					Option = aj
				}
				ah.OptionFrames[ak] = ar
				ab.AttachPress(aq, aa, {
					Enabled = function()
						return ah.Animation and not ah.Locked and not aj.Disabled
					end
				})
				aa.AddSignal(aq.MouseButton1Click, function()
					if not aj.Disabled then
						ah:Toggle(aj.Value)
					end
				end)
			end
			local function RenderOptions()
				for aj, ak in next, ah.OptionFrames do
					if ak.Row then
						ak.Row:Destroy()
					end
				end
				ah.OptionFrames = {}
				for aj, ak in next, ah.Options do
					CreateOption(ak, aj)
				end
				ah.Values = SanitizeValues(ah.Values)
				UpdateOptionVisuals(false)
			end
			function ah.Lock(aj)
				ah.Locked = true
				ai = false
				return ah.CheckboxGroupFrame:Lock(ah.LockedTitle)
			end
			function ah.Unlock(aj)
				ah.Locked = false
				ai = true
				return ah.CheckboxGroupFrame:Unlock()
			end
			function ah.Get(aj)
				return ad.CloneArray(ah.Values)
			end
			function ah.Set(aj, ak, al)
				ah.Values = SanitizeValues(ad.NormalizeValues(ak))
				UpdateOptionVisuals(true)
				if ai and al ~= false then
					aa.SafeCallback(ah.Callback, ah:Get())
				end
				return ah:Get()
			end
			function ah.Toggle(aj, ak, al)
				local am = ad.FindOption(ah.Options, ak)
				if not am or am.Disabled then
					return ah:Get()
				end
				ah.Values = ad.ToggleValue(ah.Values, ak)
				return ah:Set(ah.Values, al)
			end
			function ah.SetOptions(aj, ak)
				ah.Options = ad.NormalizeOptions(ak)
				RenderOptions()
				return ah.Options
			end
			RenderOptions()
			if ah.Locked then
				ah:Lock()
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.ab()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'Z', {}
		local function GetControlWidth(af)
			return math.max(ad.ToFiniteNumber(af.Width) or ad.ToFiniteNumber(af.ControlWidth) or 220, 120)
		end
		function ae.New(af, ag)
			local ah = {
				__type = 'SegmentedControl',
				Title = ag.Title or 'Segmented Control',
				Desc = ag.Desc or nil,
				Locked = ag.Locked or false,
				LockedTitle = ag.LockedTitle,
				Options = ad.NormalizeOptions(ag.Options or ag.Values or {}),
				Value = ag.Value or ag.Default,
				Callback = ag.Callback or function()
				end,
				UIElements = {},
				Segments = {},
				Animation = ag.Animation ~= false,
				Width = GetControlWidth(ag)
			}
			if typeof(ah.Value) == 'number' and ah.Options[ah.Value] then
				ah.Value = ah.Options[ah.Value].Value
			end
			if ah.Value == nil and ah.Options[1] then
				ah.Value = ah.Options[1].Value
			end
			local ai = true
			ah.SegmentedControlFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = ah.Width + 14,
				Hover = false,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.Container = aa.NewRoundFrame(13, 'Squircle', {
				Name = 'SegmentedControl',
				Size = UDim2.new(0, ah.Width, 0, 36),
				Position = UDim2.new(1, 0, ag.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, ag.Window.NewElements and 0 or 0.5),
				ImageTransparency = 0.93,
				ThemeTag = {
					ImageColor3 = 'SegmentedControlBackground'
				},
				Parent = ah.SegmentedControlFrame.UIElements.Main
			}, {
				ac('UIPadding', {
					PaddingTop = UDim.new(0, 4),
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
					PaddingBottom = UDim.new(0, 4)
				})
			})
			local function UpdateSegmentVisuals(aj)
				for ak, al in next, ah.Segments do
					local am = al.Option.Value == ah.Value
					local an, ao = am and 0.82 or 1, al.Option.Disabled and 0.55 or (am and 0 or 0.25)
					if aj and ah.Animation then
						ab.Play(al.Button, 'Select', {
							ImageTransparency = an
						}, nil, nil, 'Select')
						ab.Play(al.Title, 'Select', {
							TextTransparency = ao
						}, nil, nil, 'Select')
					else
						al.Button.ImageTransparency = an
						al.Title.TextTransparency = ao
					end
				end
			end
			local function CreateSegment(aj, ak, al)
				local am = 4
				local an, ao = math.max((ah.Width - 8 - (am * (al - 1))) / math.max(al, 1), 24), ac('TextLabel', {
					Name = 'Title',
					Size = UDim2.new(1, - 10, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Text = aj.Title,
					TextSize = 13,
					TextTruncate = 'AtEnd',
					FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
					ThemeTag = {
						TextColor3 = 'SegmentedControlText'
					}
				})
				local ap = aa.NewRoundFrame(10, 'Squircle', {
					Name = 'Segment',
					Size = UDim2.new(0, an, 1, 0),
					Position = UDim2.new(0, (ak - 1) * (an + am) + 4, 0, 4),
					ImageTransparency = 1,
					Active = not aj.Disabled,
					ThemeTag = {
						ImageColor3 = 'SegmentedControlActive'
					}
				}, {
					ao
				}, true)
				ap.Parent = ah.UIElements.Container
				local aq = {
					Button = ap,
					Title = ao,
					Option = aj
				}
				ah.Segments[ak] = aq
				ab.AttachPress(ap, aa, {
					Amount = 0.96,
					Enabled = function()
						return ah.Animation and not ah.Locked and not aj.Disabled
					end
				})
				aa.AddSignal(ap.MouseButton1Click, function()
					if not aj.Disabled then
						ah:Select(aj.Value)
					end
				end)
			end
			local function RenderSegments()
				for aj, ak in next, ah.Segments do
					if ak.Button then
						ak.Button:Destroy()
					end
				end
				ah.Segments = {}
				local aj = # ah.Options
				for ak, al in next, ah.Options do
					CreateSegment(al, ak, aj)
				end
				UpdateSegmentVisuals(false)
			end
			function ah.Lock(aj)
				ah.Locked = true
				ai = false
				return ah.SegmentedControlFrame:Lock(ah.LockedTitle)
			end
			function ah.Unlock(aj)
				ah.Locked = false
				ai = true
				return ah.SegmentedControlFrame:Unlock()
			end
			function ah.Get(aj)
				return ah.Value
			end
			function ah.Select(aj, ak, al)
				local am = ad.FindOption(ah.Options, ak)
				if not am or am.Disabled then
					return ah.Value
				end
				ah.Value = ak
				UpdateSegmentVisuals(true)
				if ai and al ~= false then
					aa.SafeCallback(ah.Callback, ak, am)
				end
				return ah.Value
			end
			function ah.SetOptions(aj, ak)
				ah.Options = ad.NormalizeOptions(ak)
				if not ad.FindOption(ah.Options, ah.Value) then
					ah.Value = ah.Options[1] and ah.Options[1].Value or nil
				end
				RenderSegments()
				return ah.Options
			end
			RenderSegments()
			if ah.Locked then
				ah:Lock()
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.ac()
		local aa, ab, ac = a.load'd', a.load'o'.New, {}
		function ac.New(ad, ae)
			local af, ag = {
				__type = 'TextArea',
				Title = ae.Title or 'Text Area',
				Desc = ae.Desc or nil,
				Locked = ae.Locked or false,
				LockedTitle = ae.LockedTitle,
				InputIcon = ae.InputIcon or false,
				Placeholder = ae.Placeholder or 'Enter Text...',
				Value = ae.Value or '',
				Callback = ae.Callback or function()
				end,
				ClearTextOnFocus = ae.ClearTextOnFocus or false,
				UIElements = {}
			}, true
			af.TextAreaFrame = a.load'I'{
				Title = af.Title,
				Desc = af.Desc,
				Parent = ae.Parent,
				TextOffset = 0,
				Hover = false,
				Tab = ae.Tab,
				Index = ae.Index,
				Window = ae.Window,
				ElementTable = af,
				ParentConfig = ae,
				Tags = ae.Tags
			}
			local ah = ab(af.Placeholder, af.InputIcon, af.TextAreaFrame.UIElements.Container, 'Textarea', function(ah)
				af:Set(ah, true, true)
			end, nil, ae.Window.NewElements and 12 or 10, af.ClearTextOnFocus)
			ah.Size = UDim2.new(1, 0, 0, ae.Height or 148)
			ah.LayoutOrder = 99
			local ai = ah.Frame.Frame.TextBox
			function af.Lock(aj)
				af.Locked = true
				ag = false
				return af.TextAreaFrame:Lock(af.LockedTitle)
			end
			function af.Unlock(aj)
				af.Locked = false
				ag = true
				return af.TextAreaFrame:Unlock()
			end
			function af.Get(aj)
				return af.Value
			end
			function af.Set(aj, ak, al, am)
				if not ag then
					return af.Value
				end
				af.Value = tostring(ak or '')
				if not am then
					ai.Text = af.Value
				end
				if al ~= false then
					aa.SafeCallback(af.Callback, af.Value)
				end
				return af.Value
			end
			function af.SetPlaceholder(aj, ak)
				af.Placeholder = tostring(ak or '')
				ai.PlaceholderText = af.Placeholder
			end
			af:Set(af.Value, false)
			if af.Locked then
				af:Lock()
			end
			return af.__type, af
		end
		return ac
	end
	function a.ad()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local ab, ac, ad = aa(game:GetService'UserInputService'), a.load'd', a.load'e'
		local ae, af, ag = ac.New, a.load'Z', {}
		local function ReadValueConfig(ah)
			local ai = typeof(ah.Value) == 'table' and ah.Value or {}
			local aj, ak = af.ToFiniteNumber(ai.Min) or af.ToFiniteNumber(ah.Min) or 0, af.ToFiniteNumber(ai.Max) or af.ToFiniteNumber(ah.Max) or 100
			if aj > ak then
				aj, ak = ak, aj
			end
			local al, am = typeof(ah.Value) == 'number' and ah.Value or af.ToFiniteNumber(ai.Default) or af.ToFiniteNumber(ah.Default) or aj, af.ToFiniteNumber(ai.Increment) or af.ToFiniteNumber(ah.Increment) or 1
			return aj, ak, math.clamp(af.ToFiniteNumber(al) or aj, aj, ak), math.max(math.abs(am), 0.0001)
		end
		function ag.New(ah, ai)
			local aj, ak, al, am = ReadValueConfig(ai)
			local an, ao = ab.TouchEnabled and not ab.KeyboardEnabled, ai.Buttons ~= false and ai.ShowButtons ~= false
			local ap, aq, ar = an and 38 or 34, an and 40 or 36, ao and 164 or 128
			local as, at = {
				__type = 'Stepper',
				Title = ai.Title or 'Stepper',
				Desc = ai.Desc or nil,
				Locked = ai.Locked or false,
				LockedTitle = ai.LockedTitle,
				Value = {
					Min = aj,
					Max = ak,
					Default = al,
					Increment = am
				},
				Callback = ai.Callback or function()
				end,
				Format = ai.Format,
				UIElements = {},
				Animation = ai.Animation ~= false,
				Draggable = ai.Draggable ~= false,
				ShowButtons = ao,
				Width = math.max(af.ToFiniteNumber(ai.Width) or af.ToFiniteNumber(ai.ControlWidth) or (an and 188 or 176), ar)
			}, true
			as.StepperFrame = a.load'I'{
				Title = as.Title,
				Desc = as.Desc,
				Parent = ai.Parent,
				TextOffset = as.Width + 14,
				Hover = false,
				Tab = ai.Tab,
				Index = ai.Index,
				Window = ai.Window,
				ElementTable = as,
				ParentConfig = ai,
				Tags = ai.Tags
			}
			local function FormatValue(au)
				if typeof(as.Format) == 'function' then
					local av, aw = pcall(as.Format, au, as.Value.Min, as.Value.Max)
					if av and aw ~= nil then
						return tostring(aw)
					end
				end
				return af.FormatNumber(au)
			end
			local function GetRange()
				return math.max(as.Value.Max - as.Value.Min, as.Value.Increment)
			end
			local function SnapValue(au)
				local av = af.ToFiniteNumber(au)
				if av == nil then
					return as.Value.Default
				end
				local aw = math.floor(((av - as.Value.Min) / as.Value.Increment) + 0.5)
				local ax = as.Value.Min + (aw * as.Value.Increment)
				return math.clamp(ax, as.Value.Min, as.Value.Max)
			end
			local function ValueToDelta(au)
				return math.clamp((au - as.Value.Min) / GetRange(), 0, 1)
			end
			local function CreateIconButton(au, av)
				local aw = ac.Icon(av)
				local ax = ae('ImageLabel', {
					Name = 'Icon',
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = aw[1],
					ImageRectOffset = aw[2].ImageRectPosition,
					ImageRectSize = aw[2].ImageRectSize,
					ThemeTag = {
						ImageColor3 = 'StepperIcon'
					}
				})
				local ay = ac.NewRoundFrame(12, 'Squircle', {
					Name = au,
					Size = UDim2.fromOffset(ap, ap),
					ImageTransparency = 0.88,
					ThemeTag = {
						ImageColor3 = 'StepperButton'
					}
				}, {
					ax
				}, true)
				return ay, ax
			end
			local au, av, aw, ax
			if as.ShowButtons then
				au, av = CreateIconButton('Minus', 'minus')
				aw, ax = CreateIconButton('Plus', 'plus')
				ad.AttachPress(au, ac, {
					Amount = 0.94,
					Enabled = function()
						return as.Animation and not as.Locked and as.Value.Default > as.Value.Min
					end
				})
				ad.AttachPress(aw, ac, {
					Amount = 0.94,
					Enabled = function()
						return as.Animation and not as.Locked and as.Value.Default < as.Value.Max
					end
				})
			end
			local ay, az = ac.NewRoundFrame(999, 'Squircle', {
				Name = 'Fill',
				Size = UDim2.new(ValueToDelta(as.Value.Default), 0, 1, 0),
				ImageTransparency = 0.12,
				ThemeTag = {
					ImageColor3 = 'Primary'
				}
			}), ac.NewRoundFrame(999, 'Squircle', {
				Name = 'Thumb',
				Size = UDim2.fromOffset(9, 9),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(ValueToDelta(as.Value.Default), 0, 0.5, 0),
				ImageTransparency = 0,
				ThemeTag = {
					ImageColor3 = 'SliderThumb'
				}
			})
			local aA = ac.NewRoundFrame(999, 'Squircle', {
				Name = 'Track',
				Size = UDim2.new(1, - 18, 0, 4),
				Position = UDim2.new(0.5, 0, 1, - 7),
				AnchorPoint = Vector2.new(0.5, 1),
				ImageTransparency = 0.88,
				ThemeTag = {
					ImageColor3 = 'Text'
				}
			}, {
				ay,
				az
			})
			as.UIElements.ValueLabel = ae('TextLabel', {
				Name = 'Value',
				Size = UDim2.new(1, - 18, 1, - 10),
				Position = UDim2.new(0.5, 0, 0, 1),
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundTransparency = 1,
				Text = FormatValue(as.Value.Default),
				TextSize = an and 15 or 14,
				TextTruncate = 'AtEnd',
				FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = 'StepperText'
				}
			})
			local aB = as.ShowButtons and ((ap * 2) + 10) or 0
			local aC = ac.NewRoundFrame(12, 'Squircle', {
				Name = 'ValueBackground',
				Size = UDim2.new(1, - aB, 0, aq),
				ImageTransparency = 0.92,
				Active = true,
				ClipsDescendants = true,
				ThemeTag = {
					ImageColor3 = 'StepperValueBackground'
				}
			}, {
				as.UIElements.ValueLabel,
				aA
			}, true)
			as.UIElements.Track = aA
			as.UIElements.TrackFill = ay
			as.UIElements.TrackThumb = az
			as.UIElements.ValueBackground = aC
			as.UIElements.Container = ae('Frame', {
				Name = 'Stepper',
				Size = UDim2.new(0, as.Width, 0, aq),
				Position = UDim2.new(1, 0, ai.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, ai.Window.NewElements and 0 or 0.5),
				BackgroundTransparency = 1,
				Parent = as.StepperFrame.UIElements.Main
			}, {
				ae('UIListLayout', {
					Padding = UDim.new(0, 5),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Right',
					VerticalAlignment = 'Center'
				}),
				au,
				aC,
				aw
			})
			local function SetProgressVisual(aD, aE)
				local aF = ValueToDelta(aD)
				local aG, aH = UDim2.new(aF, 0, 1, 0), UDim2.new(aF, 0, 0.5, 0)
				if aE and as.Animation then
					ad.Play(ay, 'Fast', {
						Size = aG
					}, nil, nil, 'StepperFill')
					ad.Play(az, 'Fast', {
						Position = aH
					}, nil, nil, 'StepperThumb')
				else
					ay.Size = aG
					az.Position = aH
				end
			end
			local function UpdateButtonStates(aD)
				if not as.ShowButtons then
					return
				end
				local aE, aF = as.Value.Default <= as.Value.Min, as.Value.Default >= as.Value.Max
				local aG, aH, aI, aJ = aE and 0.62 or 0, aF and 0.62 or 0, aE and 0.94 or 0.88, aF and 0.94 or 0.88
				if aD and as.Animation then
					ad.Play(av, 'Fast', {
						ImageTransparency = aG
					}, nil, nil, 'State')
					ad.Play(ax, 'Fast', {
						ImageTransparency = aH
					}, nil, nil, 'State')
					ad.Play(au, 'Fast', {
						ImageTransparency = aI
					}, nil, nil, 'State')
					ad.Play(aw, 'Fast', {
						ImageTransparency = aJ
					}, nil, nil, 'State')
				else
					av.ImageTransparency = aG
					ax.ImageTransparency = aH
					au.ImageTransparency = aI
					aw.ImageTransparency = aJ
				end
			end
			local function UpdateValue(aD, aE, aF)
				local aG = af.ToFiniteNumber(aD)
				if aG == nil then
					return as.Value.Default
				end
				local aH = as.Value.Default
				as.Value.Default = aF == false and math.clamp(aG, as.Value.Min, as.Value.Max) or SnapValue(aG)
				as.UIElements.ValueLabel.Text = FormatValue(as.Value.Default)
				SetProgressVisual(as.Value.Default, true)
				UpdateButtonStates(true)
				if as.Animation and aH ~= as.Value.Default then
					ad.Play(aC, 'Fast', {
						ImageTransparency = 0.86
					}, nil, nil, 'Pulse')
					task.delay(ad.GetDuration'Fast', function()
						if aC.Parent then
							ad.Play(aC, 'Select', {
								ImageTransparency = 0.92
							}, nil, nil, 'Pulse')
						end
					end)
				end
				if at and aE ~= false and aH ~= as.Value.Default then
					ac.SafeCallback(as.Callback, as.Value.Default)
				end
				return as.Value.Default
			end
			function as.Lock(aD)
				as.Locked = true
				at = false
				UpdateButtonStates(true)
				return as.StepperFrame:Lock(as.LockedTitle)
			end
			function as.Unlock(aD)
				as.Locked = false
				at = true
				UpdateButtonStates(true)
				return as.StepperFrame:Unlock()
			end
			function as.Get(aD)
				return as.Value.Default
			end
			function as.Set(aD, aE, aF)
				return UpdateValue(aE, aF)
			end
			function as.SetRange(aD, aE, aF)
				aE = af.ToFiniteNumber(aE)
				aF = af.ToFiniteNumber(aF)
				if aE == nil or aF == nil then
					return as.Value.Min, as.Value.Max
				end
				if aE > aF then
					aE, aF = aF, aE
				end
				as.Value.Min = aE
				as.Value.Max = aF
				UpdateValue(as.Value.Default, false)
				return as.Value.Min, as.Value.Max
			end
			function as.SetMin(aD, aE)
				as:SetRange(aE, math.max(af.ToFiniteNumber(aE) or as.Value.Min, as.Value.Max))
				return as.Value.Min
			end
			function as.SetMax(aD, aE)
				as:SetRange(math.min(as.Value.Min, af.ToFiniteNumber(aE) or as.Value.Max), aE)
				return as.Value.Max
			end
			local aD, aE, aF, aG, aH = ai.WindUI.GenerateGUID(), ai.Tab and ai.Tab.UIElements and ai.Tab.UIElements.ContainerFrame
			local function DisconnectDrag()
				local aI = aF ~= nil or aG ~= nil or aH ~= nil or ai.WindUI.CurrentInput == aD
				if aG then
					ac.DisconnectSignal(aG)
					aG = nil
				end
				if aH then
					ac.DisconnectSignal(aH)
					aH = nil
				end
				if aI and aE then
					aE.ScrollingEnabled = true
				end
				if ai.WindUI.CurrentInput == aD then
					ai.WindUI.CurrentInput = nil
				end
				aF = nil
				if aI and as.Animation then
					ad.Play(az, 'Focus', {
						Size = UDim2.fromOffset(9, 9)
					}, nil, nil, 'StepperDrag')
				end
			end
			local function GetInputX(aI)
				if aI.UserInputType == Enum.UserInputType.Touch then
					return aI.Position.X
				end
				return ab:GetMouseLocation().X
			end
			local function UpdateFromInput(aI)
				if not aA or aA.AbsoluteSize.X <= 0 then
					return
				end
				local aJ = math.clamp((GetInputX(aI) - aA.AbsolutePosition.X) / aA.AbsoluteSize.X, 0, 1)
				local aK = as.Value.Min + (aJ * GetRange())
				UpdateValue(aK, true)
			end
			if as.ShowButtons then
				ac.AddSignal(au.MouseButton1Click, function()
					if not as.Locked then
						as:Set(as.Value.Default - as.Value.Increment)
					end
				end)
				ac.AddSignal(aw.MouseButton1Click, function()
					if not as.Locked then
						as:Set(as.Value.Default + as.Value.Increment)
					end
				end)
			end
			ac.AddSignal(aC.InputBegan, function(aI)
				if as.Locked or not as.Draggable or aF then
					return
				end
				if aI.UserInputType ~= Enum.UserInputType.MouseButton1 and aI.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if ai.WindUI.CurrentInput and ai.WindUI.CurrentInput ~= aD then
					return
				end
				ai.WindUI.CurrentInput = aD
				aF = aI
				if aE then
					aE.ScrollingEnabled = false
				end
				if as.Animation then
					ad.Play(az, 'Focus', {
						Size = UDim2.fromOffset(13, 13)
					}, nil, nil, 'StepperDrag')
				end
				UpdateFromInput(aI)
				aG = ac.AddSignal(ab.InputChanged, function(aJ)
					if not aF then
						return
					end
					if aF.UserInputType == Enum.UserInputType.Touch and aJ ~= aF then
						return
					end
					if aF.UserInputType == Enum.UserInputType.MouseButton1 and aJ.UserInputType ~= Enum.UserInputType.MouseMovement then
						return
					end
					UpdateFromInput(aJ)
				end)
				aH = ac.AddSignal(ab.InputEnded, function(aJ)
					if not aF then
						return
					end
					local aK, aL = aF.UserInputType == Enum.UserInputType.Touch and aJ == aF, aF.UserInputType == Enum.UserInputType.MouseButton1 and aJ.UserInputType == Enum.UserInputType.MouseButton1
					if aK or aL then
						DisconnectDrag()
					end
				end)
			end)
			function as.Cleanup(aI)
				DisconnectDrag()
			end
			UpdateButtonStates(false)
			SetProgressVisual(as.Value.Default, false)
			if as.Locked then
				as:Lock()
			end
			return as.__type, as
		end
		return ag
	end
	function a.ae()
		local aa, ab = {}, {
			Info = {
				Icon = 'info',
				Color = Color3.fromHex'#2563eb'
			},
			Success = {
				Icon = 'circle-check',
				Color = Color3.fromHex'#16a34a'
			},
			Warning = {
				Icon = 'triangle-alert',
				Color = Color3.fromHex'#d97706'
			},
			Error = {
				Icon = 'circle-x',
				Color = Color3.fromHex'#dc2626'
			}
		}
		function aa.New(ac, ad)
			local ae = ad.Variant or 'Info'
			local af = ab[ae] or ab.Info
			local ag = {
				__type = 'Callout',
				Title = ad.Title or ae,
				Desc = ad.Desc or ad.Content,
				Icon = ad.Icon or af.Icon,
				Variant = ae,
				Color = ad.Color or af.Color,
				UIElements = {}
			}
			ag.CalloutFrame = a.load'I'{
				Title = ag.Title,
				Desc = ag.Desc,
				Image = ag.Icon,
				IconThemed = ad.IconThemed,
				Color = ag.Color,
				Parent = ad.Parent,
				TextOffset = 0,
				Hover = ad.Hover == true,
				Tab = ad.Tab,
				Index = ad.Index,
				Window = ad.Window,
				ElementTable = ag,
				ParentConfig = ad,
				Tags = ad.Tags,
				Size = ad.Size
			}
			return ag.__type, ag
		end
		return aa
	end
	function a.af()
		local aa = {}
		aa.Variants = {
			Info = {
				Icon = 'info',
				Color = Color3.fromHex'#2563eb'
			},
			Success = {
				Icon = 'circle-check',
				Color = Color3.fromHex'#16a34a'
			},
			Warning = {
				Icon = 'triangle-alert',
				Color = Color3.fromHex'#d97706'
			},
			Error = {
				Icon = 'circle-x',
				Color = Color3.fromHex'#dc2626'
			},
			Neutral = {
				Icon = 'circle',
				Color = Color3.fromHex'#71717a'
			}
		}
		function aa.ToFiniteNumber(ab)
			local ac = tonumber(ab)
			if ac == nil or ac ~= ac or math.abs(ac) == math.huge then
				return nil
			end
			return ac
		end
		function aa.GetVariant(ab)
			return aa.Variants[ab or 'Info'] or aa.Variants.Info
		end
		function aa.GetColor(ab, ac)
			if typeof(ab) == 'Color3' then
				return ab
			end
			if typeof(ab) == 'string' and string.sub(ab, 1, 1) == '#' then
				return Color3.fromHex(ab)
			end
			return ac
		end
		function aa.NormalizeItems(ab, ac, ad)
			local ae = {}
			for af, ag in next, ab or {} do
				if typeof(ag) == 'table' then
					local ah = ag[ad or 'Value']
					if ah == nil then
						ah = ag.Id or ag.Key or ag.Title or ag.Name or af
					end
					table.insert(ae, {
						Title = tostring(ag[ac or 'Title'] or ag.Name or ah),
						Desc = ag.Desc or ag.Content,
						Value = ah,
						Icon = ag.Icon,
						Color = ag.Color,
						Disabled = ag.Disabled == true,
						Items = ag.Items
					})
				else
					table.insert(ae, {
						Title = tostring(ag),
						Value = ag,
						Disabled = false
					})
				end
			end
			return ae
		end
		function aa.CloneArray(ab)
			local ac = {}
			for ad, ae in next, ab or {} do
				table.insert(ac, ae)
			end
			return ac
		end
		function aa.NormalizeValues(ab)
			if ab == nil then
				return {}
			end
			if typeof(ab) ~= 'table' then
				return {
					ab
				}
			end
			return aa.CloneArray(ab)
		end
		function aa.ContainsValue(ab, ac)
			for ad, ae in next, ab or {} do
				if ae == ac then
					return true
				end
			end
			return false
		end
		function aa.ToggleValue(ab, ac)
			local ad = aa.CloneArray(ab)
			for ae, af in next, ad do
				if af == ac then
					table.remove(ad, ae)
					return ad, false
				end
			end
			table.insert(ad, ac)
			return ad, true
		end
		function aa.CreateIcon(ab, ac, ad, ae, af, ag)
			if not ac or ac == '' then
				return nil
			end
			local ah = ab.Image(ac, ac, 0, ad, ae or 'Element', af ~= false, true, ag)
			ah.Size = UDim2.new(0, 18, 0, 18)
			return ah
		end
		function aa.GetImageTarget(ab)
			if typeof(ab) ~= 'Instance' then
				return nil
			end
			if ab:IsA'ImageLabel' or ab:IsA'ImageButton' then
				return ab
			end
			return ab:FindFirstChildWhichIsA'ImageLabel' or ab:FindFirstChildWhichIsA'ImageButton'
		end
		function aa.CreateText(ab, ac, ad, ae, af, ag)
			return ab('TextLabel', {
				BackgroundTransparency = 1,
				Text = tostring(ad or ''),
				TextSize = ae or 14,
				TextTransparency = ag or 0,
				TextWrapped = true,
				TextXAlignment = 'Left',
				AutomaticSize = 'Y',
				Size = UDim2.new(1, 0, 0, 0),
				FontFace = Font.new(ac.Font, af or Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
		end
		return aa
	end
	function a.ag()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		function ae.New(af, ag)
			local ah = ag.Variant or 'Info'
			local ai = ad.GetVariant(ah)
			local aj = {
				__type = 'Badge',
				Title = ag.Title or 'Badge',
				Desc = ag.Desc or nil,
				Value = ag.Value or ag.Badge or ah,
				Variant = ah,
				Color = ad.GetColor(ag.Color, ai.Color),
				Icon = ag.Icon or ai.Icon,
				Callback = ag.Callback,
				UIElements = {},
				Width = math.max(ad.ToFiniteNumber(ag.Width) or 96, 72)
			}
			aj.BadgeFrame = a.load'I'{
				Title = aj.Title,
				Desc = aj.Desc,
				Parent = ag.Parent,
				TextOffset = aj.Width + 14,
				Hover = ag.Hover == true or aj.Callback ~= nil,
				Scalable = aj.Callback ~= nil,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = aj,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			local ak = ad.CreateIcon(aa, aj.Icon, ag.Window.Folder, 'Badge', false, 'BadgeIcon')
			if ak then
				ak.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
				ak.ImageLabel.ImageTransparency = 0
				ak.Size = UDim2.new(0, 14, 0, 14)
			end
			aj.UIElements.Label = ac('TextLabel', {
				Name = 'Label',
				BackgroundTransparency = 1,
				Text = tostring(aj.Value),
				TextSize = 13,
				TextTruncate = 'AtEnd',
				TextXAlignment = 'Center',
				Size = UDim2.new(1, ak and - 20 or 0, 1, 0),
				FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
				TextColor3 = Color3.new(1, 1, 1)
			})
			aj.UIElements.Pill = aa.NewRoundFrame(999, 'Squircle', {
				Name = 'Badge',
				Size = UDim2.new(0, aj.Width, 0, 28),
				Position = UDim2.new(1, 0, ag.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, ag.Window.NewElements and 0 or 0.5),
				ImageTransparency = 0,
				ImageColor3 = aj.Color,
				Parent = aj.BadgeFrame.UIElements.Main
			}, {
				ac('UIPadding', {
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				ac('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center'
				}),
				ak,
				aj.UIElements.Label
			})
			function aj.SetValue(al, am)
				aj.Value = am
				aj.UIElements.Label.Text = tostring(am or '')
				ab.Play(aj.UIElements.Pill, 'Fast', {
					ImageTransparency = 0.08
				}, nil, nil, 'Pulse')
				task.delay(ab.GetDuration'Fast', function()
					if aj.UIElements.Pill.Parent then
						ab.Play(aj.UIElements.Pill, 'Select', {
							ImageTransparency = 0
						}, nil, nil, 'Pulse')
					end
				end)
				return aj.Value
			end
			function aj.SetVariant(al, am)
				local an = ad.GetVariant(am)
				aj.Variant = am
				aj.Color = an.Color
				ab.Play(aj.UIElements.Pill, 'Select', {
					ImageColor3 = aj.Color
				}, nil, nil, 'Variant')
				return aj.Variant
			end
			if aj.Callback then
				aa.AddSignal(aj.BadgeFrame.UIElements.Main.MouseButton1Click, function()
					aa.SafeCallback(aj.Callback, aj.Value)
				end)
			end
			return aj.__type, aj
		end
		return ae
	end
	function a.ah()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		function ae.New(af, ag)
			local ah = ag.Status or ag.Variant or 'Info'
			local ai = ad.GetVariant(ah)
			local aj = {
				__type = 'StatusCard',
				Title = ag.Title or 'Status',
				Desc = ag.Desc or ag.Content,
				Value = ag.Value or ah,
				Status = ah,
				Color = ad.GetColor(ag.Color, ai.Color),
				Callback = ag.Callback,
				UIElements = {},
				Width = math.max(ad.ToFiniteNumber(ag.Width) or 136, 96)
			}
			aj.StatusCardFrame = a.load'I'{
				Title = aj.Title,
				Desc = aj.Desc,
				Parent = ag.Parent,
				TextOffset = aj.Width + 14,
				Hover = ag.Hover == true or aj.Callback ~= nil,
				Scalable = aj.Callback ~= nil,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = aj,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			aj.UIElements.Dot = aa.NewRoundFrame(999, 'Circle', {
				Name = 'Dot',
				Size = UDim2.new(0, 10, 0, 10),
				ImageColor3 = aj.Color
			})
			aj.UIElements.Value = ac('TextLabel', {
				Name = 'Value',
				BackgroundTransparency = 1,
				Text = tostring(aj.Value),
				TextSize = 14,
				TextTransparency = 0.08,
				TextTruncate = 'AtEnd',
				AutomaticSize = 'Y',
				Size = UDim2.new(1, - 18, 0, 0),
				TextXAlignment = 'Left',
				FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			aj.UIElements.Status = ac('Frame', {
				Name = 'StatusCard',
				Size = UDim2.new(0, aj.Width, 0, 34),
				Position = UDim2.new(1, 0, ag.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, ag.Window.NewElements and 0 or 0.5),
				BackgroundTransparency = 1,
				Parent = aj.StatusCardFrame.UIElements.Main
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Right'
				}),
				aj.UIElements.Dot,
				aj.UIElements.Value
			})
			function aj.SetValue(ak, al)
				aj.Value = al
				aj.UIElements.Value.Text = tostring(al or '')
				return aj.Value
			end
			function aj.SetStatus(ak, al, am)
				local an = ad.GetVariant(al)
				aj.Status = al
				aj.Color = an.Color
				if am ~= nil then
					aj:SetValue(am)
				end
				ab.Play(aj.UIElements.Dot, 'Select', {
					ImageColor3 = aj.Color
				}, nil, nil, 'Status')
				return aj.Status
			end
			if aj.Callback then
				aa.AddSignal(aj.StatusCardFrame.UIElements.Main.MouseButton1Click, function()
					aa.SafeCallback(aj.Callback, aj.Status, aj.Value)
				end)
			end
			return aj.__type, aj
		end
		return ae
	end
	function a.ai()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		local function GetTrendColor(af)
			if af == 'Down' or af == 'Negative' then
				return Color3.fromHex'#dc2626'
			end
			if af == 'Neutral' then
				return Color3.fromHex'#71717a'
			end
			return Color3.fromHex'#16a34a'
		end
		function ae.New(af, ag)
			local ah = {
				__type = 'StatCard',
				Title = ag.Title or 'Stat',
				Desc = ag.Desc,
				Value = ag.Value or ag.Default or '0',
				SubValue = ag.SubValue or ag.TrendText,
				Trend = ag.Trend or 'Up',
				Icon = ag.Icon,
				UIElements = {}
			}
			ah.StatCardFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Image = ah.Icon,
				Parent = ag.Parent,
				TextOffset = 0,
				Hover = ag.Hover == true,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.Value = ac('TextLabel', {
				Name = 'Value',
				LayoutOrder = - 1,
				BackgroundTransparency = 1,
				Text = tostring(ah.Value),
				TextSize = ad.ToFiniteNumber(ag.ValueTextSize) or 24,
				TextWrapped = true,
				TextXAlignment = 'Left',
				AutomaticSize = 'Y',
				Size = UDim2.new(1, 0, 0, 0),
				FontFace = Font.new(aa.Font, Enum.FontWeight.Bold),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			ah.UIElements.TrendDot = aa.NewRoundFrame(999, 'Circle', {
				Name = 'TrendDot',
				Size = UDim2.new(0, 8, 0, 8),
				ImageColor3 = ad.GetColor(ag.TrendColor, GetTrendColor(ah.Trend))
			})
			ah.UIElements.SubValue = ac('TextLabel', {
				Name = 'SubValue',
				BackgroundTransparency = 1,
				Text = tostring(ah.SubValue or ''),
				TextSize = 13,
				TextTransparency = 0.35,
				TextWrapped = true,
				TextXAlignment = 'Left',
				AutomaticSize = 'Y',
				Size = UDim2.new(1, - 16, 0, 0),
				Visible = ah.SubValue ~= nil,
				FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			ah.UIElements.Footer = ac('Frame', {
				Name = 'Footer',
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ah.StatCardFrame.UIElements.Container
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Left'
				}),
				ah.UIElements.TrendDot,
				ah.UIElements.SubValue
			})
			ah.UIElements.Value.Parent = ah.StatCardFrame.UIElements.Container
			function ah.SetValue(ai, aj, ak)
				ah.Value = aj
				ah.UIElements.Value.Text = tostring(aj or '')
				if ak ~= nil then
					ah.SubValue = ak
					ah.UIElements.SubValue.Text = tostring(ak)
					ah.UIElements.SubValue.Visible = true
				end
				ab.Play(ah.UIElements.Value, 'Fast', {
					TextTransparency = 0.18
				}, nil, nil, 'Pulse')
				task.delay(ab.GetDuration'Fast', function()
					if ah.UIElements.Value.Parent then
						ab.Play(ah.UIElements.Value, 'Select', {
							TextTransparency = 0
						}, nil, nil, 'Pulse')
					end
				end)
				return ah.Value
			end
			function ah.SetTrend(ai, aj, ak)
				ah.Trend = aj
				local al = ad.GetColor(ak, GetTrendColor(aj))
				ab.Play(ah.UIElements.TrendDot, 'Select', {
					ImageColor3 = al
				}, nil, nil, 'Trend')
				return ah.Trend
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.aj()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		function ae.New(af, ag)
			local ah = {
				__type = 'KeyValue',
				Title = ag.Title or 'Details',
				Desc = ag.Desc,
				Items = ad.NormalizeItems(ag.Items or ag.Rows or ag.Values or {}, 'Key', 'Value'),
				UIElements = {},
				Rows = {}
			}
			ah.KeyValueFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = 0,
				Hover = ag.Hover == true,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.List = ac('Frame', {
				Name = 'KeyValueList',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ah.KeyValueFrame.UIElements.Container
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Vertical',
					VerticalAlignment = 'Top',
					HorizontalAlignment = 'Left'
				})
			})
			local function Render()
				for ai, aj in next, ah.Rows do
					aj:Destroy()
				end
				ah.Rows = {}
				for ai, aj in next, ah.Items do
					local ak = ad.CreateIcon(aa, aj.Icon, ag.Window.Folder, 'KeyValue', true, 'KeyValueIcon')
					if ak then
						ak.Size = UDim2.new(0, 16, 0, 16)
					end
					local al, am = ac('TextLabel', {
						Name = 'Key',
						BackgroundTransparency = 1,
						Text = tostring(aj.Title),
						TextSize = 14,
						TextTransparency = 0.35,
						TextTruncate = 'AtEnd',
						TextXAlignment = 'Left',
						Size = UDim2.new(0.45, ak and - 24 or 0, 0, 0),
						AutomaticSize = 'Y',
						FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					}), ac('TextLabel', {
						Name = 'Value',
						BackgroundTransparency = 1,
						Text = tostring(aj.Value or ''),
						TextSize = 14,
						TextTransparency = 0.05,
						TextWrapped = true,
						TextXAlignment = 'Right',
						Size = UDim2.new(0.55, 0, 0, 0),
						AutomaticSize = 'Y',
						FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
					local an = ac('Frame', {
						Name = 'Row',
						LayoutOrder = ai,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						BackgroundTransparency = 1,
						Parent = ah.UIElements.List
					}, {
						ac('UIListLayout', {
							Padding = UDim.new(0, 8),
							FillDirection = 'Horizontal',
							VerticalAlignment = 'Top',
							HorizontalAlignment = 'Left'
						}),
						ak,
						al,
						am
					})
					table.insert(ah.Rows, an)
				end
			end
			function ah.SetItems(ai, aj)
				ah.Items = ad.NormalizeItems(aj or {}, 'Key', 'Value')
				Render()
				ab.Play(ah.UIElements.List, 'Reveal', {
					BackgroundTransparency = 1
				}, nil, nil, 'Render')
				return ah.Items
			end
			Render()
			return ah.__type, ah
		end
		return ae
	end
	function a.ak()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		local function GetWidth(af)
			return math.max(ad.ToFiniteNumber(af.Width) or ad.ToFiniteNumber(af.ControlWidth) or 190, 120)
		end
		function ae.New(af, ag)
			local ah, ai = {
				__type = 'ChipList',
				Title = ag.Title or 'Chips',
				Desc = ag.Desc,
				Options = ad.NormalizeItems(ag.Options or ag.Values or {}),
				Values = ad.NormalizeValues(ag.Value or ag.ValuesSelected or ag.SelectedValues),
				Multi = ag.Multi ~= false,
				Callback = ag.Callback or function()
				end,
				Locked = ag.Locked or false,
				LockedTitle = ag.LockedTitle,
				Animation = ag.Animation ~= false,
				UIElements = {},
				Chips = {},
				Width = GetWidth(ag)
			}, true
			ah.ChipListFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = ah.Width + 14,
				Hover = false,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.List = ac('Frame', {
				Name = 'ChipList',
				Size = UDim2.new(0, ah.Width, 0, 0),
				AutomaticSize = 'Y',
				Position = UDim2.new(1, 0, ag.Window.NewElements and 0 or 0.5, 0),
				AnchorPoint = Vector2.new(1, ag.Window.NewElements and 0 or 0.5),
				BackgroundTransparency = 1,
				Parent = ah.ChipListFrame.UIElements.Main
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Right',
					SortOrder = 'LayoutOrder'
				})
			})
			local function IsSelected(aj)
				return ad.ContainsValue(ah.Values, aj)
			end
			local function UpdateVisuals(aj)
				for ak, al in next, ah.Chips do
					local am = IsSelected(al.Option.Value)
					local an, ao = am and 0.82 or 0.94, al.Option.Disabled and 0.55 or (am and 0 or 0.2)
					if aj and ah.Animation then
						ab.Play(al.Button, 'Select', {
							ImageTransparency = an
						}, nil, nil, 'State')
						ab.Play(al.Title, 'Select', {
							TextTransparency = ao
						}, nil, nil, 'State')
					else
						al.Button.ImageTransparency = an
						al.Title.TextTransparency = ao
					end
				end
			end
			local function Sanitize(aj)
				local ak = {}
				for al, am in next, aj or {} do
					for an, ao in next, ah.Options do
						if ao.Value == am and not ao.Disabled and not ad.ContainsValue(ak, am) then
							table.insert(ak, am)
							break
						end
					end
				end
				return ak
			end
			local function CreateChip(aj, ak)
				local al = ac('TextLabel', {
					Name = 'Title',
					BackgroundTransparency = 1,
					Text = aj.Title,
					TextSize = 13,
					TextTruncate = 'AtEnd',
					TextXAlignment = 'Center',
					Size = UDim2.new(1, - 16, 1, 0),
					FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				local am = aa.NewRoundFrame(999, 'Squircle', {
					Name = 'Chip',
					Size = UDim2.new(1, 0, 0, 30),
					LayoutOrder = ak,
					ImageTransparency = 0.94,
					Active = not aj.Disabled,
					ThemeTag = {
						ImageColor3 = 'ChipListBackground'
					},
					Parent = ah.UIElements.List
				}, {
					al
				}, true)
				local an = {
					Button = am,
					Title = al,
					Option = aj
				}
				ah.Chips[ak] = an
				ab.AttachPress(am, aa, {
					Amount = 0.96,
					Enabled = function()
						return ah.Animation and not ah.Locked and not aj.Disabled
					end
				})
				aa.AddSignal(am.MouseButton1Click, function()
					if not aj.Disabled then
						ah:Toggle(aj.Value)
					end
				end)
			end
			local function Render()
				for aj, ak in next, ah.Chips do
					ak.Button:Destroy()
				end
				ah.Chips = {}
				for aj, ak in next, ah.Options do
					CreateChip(ak, aj)
				end
				ah.Values = Sanitize(ah.Values)
				UpdateVisuals(false)
			end
			function ah.Lock(aj)
				ah.Locked = true
				ai = false
				return ah.ChipListFrame:Lock(ah.LockedTitle)
			end
			function ah.Unlock(aj)
				ah.Locked = false
				ai = true
				return ah.ChipListFrame:Unlock()
			end
			function ah.Get(aj)
				return ah.Multi and ad.CloneArray(ah.Values) or ah.Values[1]
			end
			function ah.Set(aj, ak, al)
				local am = ad.NormalizeValues(ak)
				if not ah.Multi and am[1] ~= nil then
					am = {
						am[1]
					}
				end
				ah.Values = Sanitize(am)
				UpdateVisuals(true)
				if ai and al ~= false then
					aa.SafeCallback(ah.Callback, ah:Get())
				end
				return ah:Get()
			end
			function ah.Toggle(aj, ak, al)
				if ah.Multi then
					ah.Values = ad.ToggleValue(ah.Values, ak)
					return ah:Set(ah.Values, al)
				end
				return ah:Set(ak, al)
			end
			function ah.SetOptions(aj, ak)
				ah.Options = ad.NormalizeItems(ak or {})
				Render()
				return ah.Options
			end
			Render()
			if ah.Locked then
				ah:Lock()
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.al()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		local function NormalizeActions(af)
			local ag = {}
			for ah, ai in next, af or {} do
				if typeof(ai) == 'table' then
					table.insert(ag, {
						Title = tostring(ai.Title or ai.Name or ai.Value or ('Action ' .. tostring(ah))),
						Desc = ai.Desc or ai.Content,
						Value = ai.Value or ai.Badge,
						Icon = ai.Icon,
						Color = ad.GetColor(ai.Color, nil),
						Disabled = ai.Disabled == true,
						Callback = ai.Callback
					})
				else
					table.insert(ag, {
						Title = tostring(ai),
						Disabled = false
					})
				end
			end
			return ag
		end
		function ae.New(af, ag)
			local ah = {
				__type = 'ActionList',
				Title = ag.Title or 'Actions',
				Desc = ag.Desc,
				Actions = NormalizeActions(ag.Actions or ag.Items or ag.Values or {}),
				Rows = {},
				UIElements = {}
			}
			ah.ActionListFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = 0,
				Hover = ag.Hover == true,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.List = ac('Frame', {
				Name = 'ActionList',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ah.ActionListFrame.UIElements.Container
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, ag.Window.NewElements and 6 or 8),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left',
					SortOrder = 'LayoutOrder'
				})
			})
			local function Render()
				for ai, aj in next, ah.Rows do
					aj:Destroy()
				end
				ah.Rows = {}
				for ai, aj in next, ah.Actions do
					local ak = ad.CreateIcon(aa, aj.Icon or 'circle-dot', ag.Window.Folder, 'ActionList', true, 'ActionListIcon')
					if ak then
						ak.Size = UDim2.fromOffset(17, 17)
					end
					local al = ad.GetImageTarget(ak)
					if al and aj.Color then
						al.ImageColor3 = aj.Color
					end
					local am, an = (ac('Frame', {
						Name = 'Texts',
						Size = UDim2.new(1, aj.Value and - 96 or - 42, 0, 0),
						AutomaticSize = 'Y',
						BackgroundTransparency = 1
					}, {
						ac('UIListLayout', {
							Padding = UDim.new(0, 2),
							FillDirection = 'Vertical',
							HorizontalAlignment = 'Left'
						}),
						ac('TextLabel', {
							Name = 'Title',
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = 'Y',
							BackgroundTransparency = 1,
							Text = aj.Title,
							TextSize = 14,
							TextTransparency = aj.Disabled and 0.46 or 0.04,
							TextXAlignment = 'Left',
							TextTruncate = 'AtEnd',
							FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
							ThemeTag = {
								TextColor3 = 'Text'
							}
						}),
						aj.Desc and ac('TextLabel', {
							Name = 'Desc',
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = 'Y',
							BackgroundTransparency = 1,
							Text = tostring(aj.Desc),
							TextSize = 12,
							TextTransparency = aj.Disabled and 0.62 or 0.38,
							TextXAlignment = 'Left',
							TextWrapped = true,
							FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
							ThemeTag = {
								TextColor3 = 'Text'
							}
						}) or nil
					}))
					if aj.Value ~= nil then
						an = aa.NewRoundFrame(999, 'Squircle', {
							Name = 'Value',
							Size = UDim2.new(0, 0, 0, 26),
							AutomaticSize = 'X',
							ImageTransparency = 0.88,
							ThemeTag = {
								ImageColor3 = 'ElementBackground'
							}
						}, {
							ac('UIPadding', {
								PaddingLeft = UDim.new(0, 10),
								PaddingRight = UDim.new(0, 10)
							}),
							ac('TextLabel', {
								Size = UDim2.new(0, 0, 1, 0),
								AutomaticSize = 'X',
								BackgroundTransparency = 1,
								Text = tostring(aj.Value),
								TextSize = 12,
								TextTransparency = 0.12,
								FontFace = Font.new(aa.Font, Enum.FontWeight.Bold),
								ThemeTag = {
									TextColor3 = 'Text'
								}
							})
						})
					end
					local ao = aa.NewRoundFrame(14, 'Squircle', {
						Name = 'Action',
						LayoutOrder = ai,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						ImageTransparency = aj.Disabled and 0.96 or 0.92,
						Parent = ah.UIElements.List,
						ThemeTag = {
							ImageColor3 = 'ElementBackground'
						}
					}, {
						ac('UIPadding', {
							PaddingTop = UDim.new(0, 10),
							PaddingLeft = UDim.new(0, 10),
							PaddingRight = UDim.new(0, 10),
							PaddingBottom = UDim.new(0, 10)
						}),
						ac('UIListLayout', {
							Padding = UDim.new(0, 10),
							FillDirection = 'Horizontal',
							VerticalAlignment = 'Center',
							HorizontalAlignment = 'Left'
						}),
						ak,
						am,
						an
					}, not aj.Disabled)
					if not aj.Disabled then
						ab.AttachPress(ao, aa, {
							Amount = 0.985
						})
						aa.AddSignal(ao.MouseButton1Click, function()
							if typeof(aj.Callback) == 'function' then
								aa.SafeCallback(aj.Callback, aj, ai)
							elseif typeof(ag.Callback) == 'function' then
								aa.SafeCallback(ag.Callback, aj, ai)
							end
						end)
					end
					table.insert(ah.Rows, ao)
				end
			end
			function ah.SetActions(ai, aj)
				ah.Actions = NormalizeActions(aj)
				Render()
				return ah.Actions
			end
			function ah.AddAction(ai, aj)
				local ak = NormalizeActions{
					aj
				}[1]
				if ak then
					table.insert(ah.Actions, ak)
					Render()
				end
				return ak
			end
			Render()
			return ah.__type, ah
		end
		return ae
	end
	function a.am()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		local function NormalizeMeters(af)
			local ag = {}
			for ah, ai in next, af or {} do
				if typeof(ai) == 'table' then
					local aj, ak = ad.ToFiniteNumber(ai.Max) or 100, ad.ToFiniteNumber(ai.Value or ai.Default) or 0
					table.insert(ag, {
						Title = tostring(ai.Title or ai.Name or ('Meter ' .. tostring(ah))),
						Value = math.clamp(ak, 0, aj),
						Max = math.max(aj, 0.0001),
						Desc = ai.Desc,
						Color = ad.GetColor(ai.Color, nil),
						Format = ai.Format
					})
				else
					table.insert(ag, {
						Title = tostring(ah),
						Value = math.clamp(ad.ToFiniteNumber(ai) or 0, 0, 100),
						Max = 100
					})
				end
			end
			return ag
		end
		function ae.New(af, ag)
			local ah = {
				__type = 'MeterGroup',
				Title = ag.Title or 'Meters',
				Desc = ag.Desc,
				Meters = NormalizeMeters(ag.Meters or ag.Items or ag.Values or {}),
				Rows = {},
				UIElements = {}
			}
			ah.MeterGroupFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = 0,
				Hover = ag.Hover == true,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.List = ac('Frame', {
				Name = 'MeterGroup',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ah.MeterGroupFrame.UIElements.Container
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left',
					SortOrder = 'LayoutOrder'
				})
			})
			local function FormatValue(ai)
				local aj = math.clamp(ai.Value / ai.Max, 0, 1)
				if typeof(ai.Format) == 'function' then
					local ak, al = pcall(ai.Format, ai.Value, ai.Max, aj)
					if ak and al ~= nil then
						return tostring(al)
					end
				end
				return tostring(math.floor((aj * 100) + 0.5)) .. '%'
			end
			local function Render()
				for ai, aj in next, ah.Rows do
					aj.Frame:Destroy()
				end
				ah.Rows = {}
				for ai, aj in next, ah.Meters do
					local ak = math.clamp(aj.Value / aj.Max, 0, 1)
					local al, am = aa.NewRoundFrame(999, 'Squircle', {
						Name = 'Fill',
						Size = UDim2.new(ak, 0, 1, 0),
						ImageTransparency = 0.08,
						ImageColor3 = aj.Color,
						ThemeTag = not aj.Color and {
							ImageColor3 = 'Primary'
						} or nil
					}), ac('TextLabel', {
						Name = 'Value',
						Size = UDim2.new(0, 52, 0, 18),
						BackgroundTransparency = 1,
						Text = FormatValue(aj),
						TextSize = 12,
						TextTransparency = 0.22,
						TextXAlignment = 'Right',
						FontFace = Font.new(aa.Font, Enum.FontWeight.Bold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
					local an = ac('Frame', {
						Name = 'Meter',
						LayoutOrder = ai,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						BackgroundTransparency = 1,
						Parent = ah.UIElements.List
					}, {
						ac('UIListLayout', {
							Padding = UDim.new(0, 6),
							FillDirection = 'Vertical',
							HorizontalAlignment = 'Left'
						}),
						ac('Frame', {
							Name = 'Header',
							Size = UDim2.new(1, 0, 0, 18),
							BackgroundTransparency = 1
						}, {
							ac('UIListLayout', {
								FillDirection = 'Horizontal',
								VerticalAlignment = 'Center'
							}),
							ac('TextLabel', {
								Name = 'Title',
								Size = UDim2.new(1, - 58, 1, 0),
								BackgroundTransparency = 1,
								Text = aj.Title,
								TextSize = 13,
								TextTransparency = 0.1,
								TextXAlignment = 'Left',
								TextTruncate = 'AtEnd',
								FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
								ThemeTag = {
									TextColor3 = 'Text'
								}
							}),
							am
						}),
						aa.NewRoundFrame(999, 'Squircle', {
							Name = 'Track',
							Size = UDim2.new(1, 0, 0, 7),
							ImageTransparency = 0.9,
							ClipsDescendants = true,
							ThemeTag = {
								ImageColor3 = 'ElementBackground'
							}
						}, {
							al
						}),
						aj.Desc and ac('TextLabel', {
							Name = 'Desc',
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = 'Y',
							BackgroundTransparency = 1,
							Text = tostring(aj.Desc),
							TextSize = 12,
							TextTransparency = 0.42,
							TextXAlignment = 'Left',
							TextWrapped = true,
							FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
							ThemeTag = {
								TextColor3 = 'Text'
							}
						}) or nil
					})
					ah.Rows[ai] = {
						Frame = an,
						Fill = al,
						ValueLabel = am
					}
				end
			end
			function ah.SetValue(ai, aj, ak)
				local al, am = ah.Meters[aj], ah.Rows[aj]
				if not al or not am then
					return nil
				end
				al.Value = math.clamp(ad.ToFiniteNumber(ak) or al.Value, 0, al.Max)
				local an = math.clamp(al.Value / al.Max, 0, 1)
				am.ValueLabel.Text = FormatValue(al)
				ab.Play(am.Fill, 'Fast', {
					Size = UDim2.new(an, 0, 1, 0)
				}, nil, nil, 'Meter')
				return al.Value
			end
			function ah.SetMeters(ai, aj)
				ah.Meters = NormalizeMeters(aj)
				Render()
				return ah.Meters
			end
			Render()
			return ah.__type, ah
		end
		return ae
	end
	function a.an()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		function ae.New(af, ag)
			local ah = {
				__type = 'Timeline',
				Title = ag.Title or 'Timeline',
				Desc = ag.Desc,
				Items = ad.NormalizeItems(ag.Items or ag.Events or {}),
				UIElements = {},
				Rows = {}
			}
			ah.TimelineFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = 0,
				Hover = ag.Hover == true,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.List = ac('Frame', {
				Name = 'TimelineList',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ah.TimelineFrame.UIElements.Container
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Vertical',
					VerticalAlignment = 'Top',
					HorizontalAlignment = 'Left'
				})
			})
			local function Render()
				for ai, aj in next, ah.Rows do
					aj:Destroy()
				end
				ah.Rows = {}
				for ai, aj in next, ah.Items do
					local ak = ad.GetVariant(aj.Value)
					local al = ad.GetColor(aj.Color, ak.Color)
					local am = aa.NewRoundFrame(999, 'Circle', {
						Name = 'Dot',
						Size = UDim2.new(0, 10, 0, 10),
						Position = UDim2.new(0.5, 0, 0, 5),
						AnchorPoint = Vector2.new(0.5, 0),
						ImageTransparency = 1,
						ImageColor3 = al
					})
					local an, ao = ac('Frame', {
						Name = 'Rail',
						Size = UDim2.new(0, 24, 0, aj.Desc and 46 or 30),
						BackgroundTransparency = 1
					}, {
						ac('Frame', {
							Name = 'Line',
							Size = UDim2.new(0, 1, 1, ai == # ah.Items and - 8 or 0),
							Position = UDim2.new(0.5, 0, 0, 16),
							AnchorPoint = Vector2.new(0.5, 0),
							BackgroundTransparency = 0.86,
							ThemeTag = {
								BackgroundColor3 = 'TimelineLine'
							}
						}),
						am
					}), ac('Frame', {
						Name = 'Text',
						Size = UDim2.new(1, - 32, 0, 0),
						AutomaticSize = 'Y',
						BackgroundTransparency = 1
					}, {
						ac('UIListLayout', {
							Padding = UDim.new(0, 3),
							FillDirection = 'Vertical',
							VerticalAlignment = 'Top',
							HorizontalAlignment = 'Left'
						}),
						ad.CreateText(ac, aa, aj.Title, 14, Enum.FontWeight.SemiBold, 0),
						aj.Desc and ad.CreateText(ac, aa, aj.Desc, 13, Enum.FontWeight.Medium, 0.4) or nil
					})
					local ap = ac('Frame', {
						Name = 'Item',
						LayoutOrder = ai,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						BackgroundTransparency = 1,
						Parent = ah.UIElements.List
					}, {
						ac('UIListLayout', {
							Padding = UDim.new(0, 8),
							FillDirection = 'Horizontal',
							VerticalAlignment = 'Top',
							HorizontalAlignment = 'Left'
						}),
						an,
						ao
					})
					table.insert(ah.Rows, ap)
					task.delay((ai - 1) * 0.025, function()
						if am.Parent then
							ab.Play(am, 'Reveal', {
								ImageTransparency = 0
							}, nil, nil, 'Reveal')
						end
					end)
				end
			end
			function ah.SetItems(ai, aj)
				ah.Items = ad.NormalizeItems(aj or {})
				Render()
				return ah.Items
			end
			Render()
			return ah.__type, ah
		end
		return ae
	end
	function a.ao()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae, af = aa.New, a.load'af', {}, 34
		function ae.New(ag, ah)
			local ai, aj = {
				__type = 'Accordion',
				Title = ah.Title or 'Accordion',
				Desc = ah.Desc,
				Items = ad.NormalizeItems(ah.Items or ah.Sections or {}),
				OpenIndex = ad.ToFiniteNumber(ah.OpenIndex or ah.DefaultOpen),
				Multiple = ah.Multiple == true,
				UIElements = {},
				Rows = {}
			}, {}
			if ai.OpenIndex then
				aj[ai.OpenIndex] = true
			end
			ai.AccordionFrame = a.load'I'{
				Title = ai.Title,
				Desc = ai.Desc,
				Parent = ah.Parent,
				TextOffset = 0,
				Hover = ah.Hover == true,
				Tab = ah.Tab,
				Index = ah.Index,
				Window = ah.Window,
				ElementTable = ai,
				ParentConfig = ah,
				Tags = ah.Tags
			}
			ai.UIElements.List = ac('Frame', {
				Name = 'AccordionList',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ai.AccordionFrame.UIElements.Container
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Vertical',
					VerticalAlignment = 'Top',
					HorizontalAlignment = 'Left'
				})
			})
			local function GetOpenHeight(ak)
				return af + (ak.Content.AbsoluteSize.Y / ah.UIScale) + 10
			end
			local function SetRowOpen(ak, al, am)
				local an = ai.Rows[ak]
				if not an then
					return
				end
				aj[ak] = al or nil
				an.Open = al
				local ao = UDim2.new(1, 0, 0, al and GetOpenHeight(an) or af)
				if am then
					an.Frame.Size = ao
					an.Chevron.Rotation = al and 180 or 0
				else
					ab.Play(an.Frame, 'Expand', {
						Size = ao
					}, nil, nil, 'Expand')
					ab.Play(an.Chevron, 'Expand', {
						Rotation = al and 180 or 0
					}, nil, nil, 'Chevron')
				end
			end
			local function Render()
				for ak, al in next, ai.Rows do
					al.Frame:Destroy()
				end
				ai.Rows = {}
				for ak, al in next, ai.Items do
					local am = ad.CreateIcon(aa, al.Icon, ah.Window.Folder, 'Accordion', true, 'AccordionIcon')
					if am then
						am.Size = UDim2.new(0, 16, 0, 16)
					end
					local an = aa.Icon'chevron-down'
					local ao = ac('ImageLabel', {
						Name = 'Chevron',
						Size = UDim2.new(0, 16, 0, 16),
						BackgroundTransparency = 1,
						Image = an[1],
						ImageRectOffset = an[2].ImageRectPosition,
						ImageRectSize = an[2].ImageRectSize,
						ImageTransparency = 0.4,
						ThemeTag = {
							ImageColor3 = 'Icon'
						}
					})
					local ap, aq = ac('TextButton', {
						Name = 'Header',
						Size = UDim2.new(1, 0, 0, af),
						BackgroundTransparency = 1,
						Text = ''
					}, {
						ac('UIListLayout', {
							Padding = UDim.new(0, 8),
							FillDirection = 'Horizontal',
							VerticalAlignment = 'Center',
							HorizontalAlignment = 'Left'
						}),
						ac('UIPadding', {
							PaddingLeft = UDim.new(0, 10),
							PaddingRight = UDim.new(0, 10)
						}),
						am,
						ac('TextLabel', {
							Name = 'Title',
							Size = UDim2.new(1, am and - 48 or - 24, 1, 0),
							BackgroundTransparency = 1,
							Text = al.Title,
							TextSize = 14,
							TextTruncate = 'AtEnd',
							TextXAlignment = 'Left',
							FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
							ThemeTag = {
								TextColor3 = 'Text'
							}
						}),
						ao
					}), ac('Frame', {
						Name = 'Content',
						Size = UDim2.new(1, - 20, 0, 0),
						Position = UDim2.new(0, 10, 0, af),
						AutomaticSize = 'Y',
						BackgroundTransparency = 1
					}, {
						ad.CreateText(ac, aa, al.Desc or '', 13, Enum.FontWeight.Medium, 0.4)
					})
					local ar = aa.NewRoundFrame(12, 'Squircle', {
						Name = 'Item',
						LayoutOrder = ak,
						Size = UDim2.new(1, 0, 0, af),
						ClipsDescendants = true,
						ImageTransparency = 0.94,
						ThemeTag = {
							ImageColor3 = 'AccordionBackground'
						},
						Parent = ai.UIElements.List
					}, {
						ap,
						aq
					})
					ai.Rows[ak] = {
						Frame = ar,
						Header = ap,
						Content = aq,
						Chevron = ao,
						Open = false
					}
					ab.AttachPress(ap, aa, {
						Amount = 0.985
					})
					aa.AddSignal(ap.MouseButton1Click, function()
						ai:Toggle(ak)
					end)
					aa.AddSignal(aq:GetPropertyChangedSignal'AbsoluteSize', function()
						if ai.Rows[ak] and ai.Rows[ak].Open then
							SetRowOpen(ak, true, true)
						end
					end)
				end
				for ak in next, aj do
					SetRowOpen(ak, true, true)
				end
			end
			function ai.Open(ak, al)
				if not ai.Multiple then
					for am in next, aj do
						if am ~= al then
							SetRowOpen(am, false)
						end
					end
				end
				SetRowOpen(al, true)
			end
			function ai.Close(ak, al)
				SetRowOpen(al, false)
			end
			function ai.Toggle(ak, al)
				local am = ai.Rows[al]
				if not am then
					return
				end
				if am.Open then
					ai:Close(al)
				else
					ai:Open(al)
				end
			end
			function ai.SetItems(ak, al)
				ai.Items = ad.NormalizeItems(al or {})
				aj = {}
				Render()
				return ai.Items
			end
			Render()
			return ai.__type, ai
		end
		return ae
	end
	function a.ap()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'n'.New, {}
		function ae.New(af, ag)
			local ah, ai = {
				__type = 'EmptyState',
				Title = ag.Title or 'Nothing here',
				Desc = ag.Desc or ag.Content,
				Icon = ag.Icon or 'inbox',
				Buttons = ag.Buttons or {},
				UIElements = {}
			}, math.max(tonumber(ag.Height) or 138, 96)
			ah.UIElements.Main = aa.NewRoundFrame(ag.Window.ElementConfig.UICorner, 'Squircle', {
				Name = 'EmptyState',
				Size = UDim2.new(1, 0, 0, ai),
				AutomaticSize = # ah.Buttons > 0 and 'Y' or 'None',
				ImageTransparency = 0.94,
				Parent = ag.Parent,
				ThemeTag = {
					ImageColor3 = 'ElementBackground'
				}
			}, {
				ac('UIPadding', {
					PaddingTop = UDim.new(0, 16),
					PaddingLeft = UDim.new(0, 16),
					PaddingRight = UDim.new(0, 16),
					PaddingBottom = UDim.new(0, 16)
				}),
				ac('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Vertical',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Center'
				})
			})
			local aj = aa.Image(ah.Icon, ah.Icon, 0, ag.Window.Folder, 'EmptyState', true, true, 'EmptyStateIcon')
			aj.Size = UDim2.new(0, tonumber(ag.IconSize) or 34, 0, tonumber(ag.IconSize) or 34)
			aj.ImageLabel.ImageTransparency = 0.2
			aj.Parent = ah.UIElements.Main
			ah.UIElements.Title = ac('TextLabel', {
				Name = 'Title',
				BackgroundTransparency = 1,
				Text = ah.Title,
				TextSize = 17,
				TextWrapped = true,
				TextXAlignment = 'Center',
				AutomaticSize = 'Y',
				Size = UDim2.new(1, 0, 0, 0),
				FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
				Parent = ah.UIElements.Main,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			ah.UIElements.Desc = ac('TextLabel', {
				Name = 'Desc',
				BackgroundTransparency = 1,
				Text = ah.Desc or '',
				TextSize = 14,
				TextTransparency = 0.4,
				TextWrapped = true,
				TextXAlignment = 'Center',
				AutomaticSize = 'Y',
				Visible = ah.Desc ~= nil,
				Size = UDim2.new(1, 0, 0, 0),
				FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				Parent = ah.UIElements.Main,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			if # ah.Buttons > 0 then
				local ak = ac('Frame', {
					Name = 'Buttons',
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					BackgroundTransparency = 1,
					Parent = ah.UIElements.Main
				}, {
					ac('UIListLayout', {
						Padding = UDim.new(0, 8),
						FillDirection = 'Vertical',
						HorizontalAlignment = 'Center'
					})
				})
				for al, am in next, ah.Buttons do
					local an = ad(am.Title, am.Icon, am.Callback, am.Variant or 'White', ak, nil, nil, ag.Window.NewElements and 999 or 10)
					an.Size = UDim2.new(1, 0, 0, 36)
				end
			end
			function ah.SetTitle(ak, al)
				ah.Title = al
				ah.UIElements.Title.Text = al
			end
			function ah.SetDesc(ak, al)
				ah.Desc = al
				ah.UIElements.Desc.Text = al or ''
				ah.UIElements.Desc.Visible = al ~= nil
			end
			function ah.Highlight(ak)
				ab.Play(ah.UIElements.Main, 'Highlight', {
					ImageTransparency = 0.9
				}, nil, nil, 'Highlight')
				task.delay(ab.GetDuration'Highlight', function()
					if ah.UIElements.Main.Parent then
						ab.Play(ah.UIElements.Main, 'Highlight', {
							ImageTransparency = 0.94
						}, nil, nil, 'Highlight')
					end
				end)
			end
			function ah.Destroy(ak)
				ah.UIElements.Main:Destroy()
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.aq()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae, af, ag = aa.New, a.load'af', {}, Color3.fromHex'#5865F2', Color3.fromHex'#1E1F2A'
		local function Trim(ah)
			ah = tostring(ah or '')
			ah = string.gsub(ah, '^%s+', '')
			ah = string.gsub(ah, '%s+$', '')
			return ah
		end
		local function GetInviteUrl(ah)
			local ai = Trim(ah)
			if ai == '' then
				return 'https://discord.gg/'
			end
			if string.match(ai, '^https?://') then
				return ai
			end
			if string.match(ai, '^discord%.gg/') or string.match(ai, '^discord%.com/invite/') then
				return 'https://' .. ai
			end
			return 'https://discord.gg/' .. ai
		end
		local function CopyText(ah)
			if typeof(setclipboard) == 'function' then
				local ai = pcall(function()
					setclipboard(ah)
				end)
				return ai
			end
			if typeof(toclipboard) == 'function' then
				local ai = pcall(function()
					toclipboard(ah)
				end)
				return ai
			end
			return false
		end
		local function Notify(ah, ai, aj, ak, al)
			if ah and ah.Notify then
				ah:Notify{
					Title = ai,
					Content = aj,
					Icon = ak,
					Style = al
				}
			end
		end
		function ae.New(ah, ai)
			local aj = ai.Url or ai.Invite or ai.InviteCode or ai.Code
			local ak = GetInviteUrl(aj)
			local al, am = {
				__type = 'DiscordCard',
				Title = ai.Title or ai.ServerName or 'Discord Server',
				Desc = ai.Desc or ai.Content or 'Join the community and get updates.',
				Invite = aj,
				Url = ak,
				Icon = ai.Icon or 'message-circle',
				Members = ai.Members or ai.MemberCount,
				Online = ai.Online or ai.OnlineCount,
				Callback = ai.Callback,
				UIElements = {}
			}, math.max(tonumber(ai.Height) or 152, 126)
			al.UIElements.Main = aa.NewRoundFrame(ai.Window.ElementConfig.UICorner, 'Squircle', {
				Name = 'DiscordCard',
				Size = UDim2.new(1, 0, 0, am),
				AutomaticSize = 'Y',
				ImageColor3 = ag,
				ImageTransparency = 0,
				Parent = ai.Parent
			}, {
				ac('UIGradient', {
					Rotation = 22,
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, ag),
						ColorSequenceKeypoint.new(1, af)
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.02),
						NumberSequenceKeypoint.new(1, 0.18)
					}
				}),
				ac('UIPadding', {
					PaddingTop = UDim.new(0, 14),
					PaddingLeft = UDim.new(0, 14),
					PaddingRight = UDim.new(0, 14),
					PaddingBottom = UDim.new(0, 14)
				}),
				ac('UIListLayout', {
					Padding = UDim.new(0, 12),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left'
				})
			})
			local an = ac('Frame', {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = al.UIElements.Main
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center'
				})
			})
			local ao = aa.NewRoundFrame(999, 'Squircle', {
				Size = UDim2.new(0, 42, 0, 42),
				ImageColor3 = Color3.new(1, 1, 1),
				ImageTransparency = 0.9,
				Parent = an
			}, {
				ad.CreateIcon(aa, al.Icon, ai.Window.Folder, 'DiscordCard', false, nil)
			})
			local ap = ao:FindFirstChildWhichIsA'Frame' or ao:FindFirstChildWhichIsA'ImageLabel'
			if ap then
				ap.Size = UDim2.new(0, 20, 0, 20)
				ap.Position = UDim2.new(0.5, 0, 0.5, 0)
				ap.AnchorPoint = Vector2.new(0.5, 0.5)
				local aq = ad.GetImageTarget(ap)
				if aq then
					aq.ImageColor3 = Color3.new(1, 1, 1)
					aq.ImageTransparency = 0
				end
			end
			local aq = ac('Frame', {
				Size = UDim2.new(1, - 52, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = an
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 3),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left'
				})
			})
			al.UIElements.Title = ac('TextLabel', {
				Name = 'Title',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Text = al.Title,
				TextSize = 18,
				TextWrapped = true,
				TextXAlignment = 'Left',
				TextColor3 = Color3.new(1, 1, 1),
				FontFace = Font.new(aa.Font, Enum.FontWeight.Bold),
				Parent = aq
			})
			al.UIElements.Desc = ac('TextLabel', {
				Name = 'Desc',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Text = al.Desc,
				TextSize = 13,
				TextWrapped = true,
				TextXAlignment = 'Left',
				TextColor3 = Color3.new(1, 1, 1),
				TextTransparency = 0.26,
				FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				Parent = aq
			})
			local ar = ac('Frame', {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Visible = al.Members ~= nil or al.Online ~= nil,
				Parent = al.UIElements.Main
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Left',
					VerticalAlignment = 'Center'
				})
			})
			local function CreateStat(as, at, au)
				return aa.NewRoundFrame(999, 'Squircle', {
					Size = UDim2.new(0, 0, 0, 28),
					AutomaticSize = 'X',
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 0.9,
					Parent = ar
				}, {
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					ac('UIListLayout', {
						Padding = UDim.new(0, 6),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center'
					}),
					aa.NewRoundFrame(999, 'Circle', {
						Size = UDim2.new(0, 7, 0, 7),
						ImageColor3 = au
					}),
					ac('TextLabel', {
						BackgroundTransparency = 1,
						Text = tostring(at) .. ' ' .. as,
						TextSize = 12,
						TextColor3 = Color3.new(1, 1, 1),
						TextTransparency = 0.08,
						AutomaticSize = 'XY',
						FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold)
					})
				})
			end
			if al.Members then
				CreateStat('members', al.Members, Color3.fromHex'#B6C2FF')
			end
			if al.Online then
				CreateStat('online', al.Online, Color3.fromHex'#23A55A')
			end
			local as = ac('Frame', {
				Size = UDim2.new(1, 0, 0, 36),
				BackgroundTransparency = 1,
				Parent = al.UIElements.Main
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 8),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Center'
				})
			})
			local function CreateButton(at, au, av, aw)
				local ax = aa.NewRoundFrame(999, 'Squircle', {
					Size = UDim2.new(0.5, - 4, 1, 0),
					ImageColor3 = av == 'Primary' and Color3.new(1, 1, 1) or Color3.new(1, 1, 1),
					ImageTransparency = av == 'Primary' and 0.08 or 0.9,
					Parent = as
				}, {
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					ac('UIListLayout', {
						Padding = UDim.new(0, 7),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Center'
					}),
					ad.CreateIcon(aa, au, ai.Window.Folder, 'DiscordCard', false, nil),
					ac('TextLabel', {
						BackgroundTransparency = 1,
						Text = at,
						TextSize = 13,
						TextColor3 = av == 'Primary' and Color3.fromHex'#111827' or Color3.new(1, 1, 1),
						TextTransparency = 0,
						FontFace = Font.new(aa.Font, Enum.FontWeight.Bold),
						AutomaticSize = 'XY'
					})
				}, true)
				local ay = ax:FindFirstChildWhichIsA'Frame' or ax:FindFirstChildWhichIsA'ImageLabel'
				local az = ad.GetImageTarget(ay)
				if az then
					az.ImageColor3 = av == 'Primary' and Color3.fromHex'#111827' or Color3.new(1, 1, 1)
					az.ImageTransparency = 0
				end
				ab.AttachPress(ax, aa, {
					Amount = 0.97
				})
				aa.AddSignal(ax.MouseButton1Click, function()
					aa.SafeCallback(aw)
				end)
				return ax
			end
			local function CopyInvite(at)
				if CopyText(al.Url) then
					Notify(ai.WindUI, at or 'Discord link copied', al.Url, 'check', 'Success')
					return true
				else
					Notify(ai.WindUI, 'Discord invite', al.Url, 'link', 'Warning')
					return false
				end
			end
			CreateButton(ai.CopyTitle or 'Copy Link', 'link', 'Secondary', function()
				CopyInvite'Discord link copied'
			end)
			CreateButton(ai.JoinTitle or 'Join', 'external-link', 'Primary', function()
				if al.Callback then
					aa.SafeCallback(al.Callback, al.Url, al)
				end
				CopyInvite'Discord invite ready'
			end)
			function al.SetInvite(at, au)
				al.Invite = au
				al.Url = GetInviteUrl(au)
				return al.Url
			end
			function al.GetUrl(at)
				return al.Url
			end
			function al.Copy(at)
				return CopyInvite'Discord link copied'
			end
			function al.Open(at)
				if al.Callback then
					aa.SafeCallback(al.Callback, al.Url, al)
				end
				return CopyInvite'Discord invite ready'
			end
			function al.SetTitle(at, au)
				al.Title = au
				al.UIElements.Title.Text = au
			end
			function al.SetDesc(at, au)
				al.Desc = au
				al.UIElements.Desc.Text = au or ''
			end
			function al.Highlight(at)
				ab.Play(al.UIElements.Main, 'Highlight', {
					ImageTransparency = 0.08
				}, nil, nil, 'Highlight')
				task.delay(ab.GetDuration'Highlight', function()
					if al.UIElements.Main.Parent then
						ab.Play(al.UIElements.Main, 'Highlight', {
							ImageTransparency = 0
						}, nil, nil, 'Highlight')
					end
				end)
			end
			function al.Destroy(at)
				al.UIElements.Main:Destroy()
			end
			return al.__type, al
		end
		return ae
	end
	function a.ar()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		function ae.New(af, ag)
			local ah = {
				__type = 'TabBox',
				Title = ag.Title or 'Tabs',
				Desc = ag.Desc,
				Tabs = {},
				Selected = nil,
				SelectedValue = nil,
				UIElements = {}
			}
			ah.TabBoxFrame = a.load'I'{
				Title = ah.Title,
				Desc = ah.Desc,
				Parent = ag.Parent,
				TextOffset = 0,
				Hover = ag.Hover == true,
				Tab = ag.Tab,
				Index = ag.Index,
				Window = ag.Window,
				ElementTable = ah,
				ParentConfig = ag,
				Tags = ag.Tags
			}
			ah.UIElements.Tabs = ac('ScrollingFrame', {
				Name = 'Tabs',
				Size = UDim2.new(1, 0, 0, ag.TabHeight or 36),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ScrollingDirection = 'X',
				ScrollingEnabled = true,
				AutomaticCanvasSize = 'X',
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ElasticBehavior = 'Never',
				Active = true,
				Parent = ah.TabBoxFrame.UIElements.Container
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Center',
					HorizontalAlignment = 'Left',
					SortOrder = 'LayoutOrder'
				})
			})
			ah.UIElements.Pages = ac('Frame', {
				Name = 'Pages',
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				Parent = ah.TabBoxFrame.UIElements.Container
			})
			local function UpdateTabVisuals()
				for ai, aj in next, ah.Tabs do
					local ak = ah.Selected == ai
					ab.Play(aj.Button, 'Switch', {
						ImageTransparency = ak and 0.82 or 0.94
					}, nil, nil, 'State')
					ab.Play(aj.TitleLabel, 'Switch', {
						TextTransparency = ak and 0 or 0.25
					}, nil, nil, 'State')
					if aj.IconTarget then
						ab.Play(aj.IconTarget, 'Switch', {
							ImageTransparency = ak and 0 or 0.35
						}, nil, nil, 'State')
					end
				end
			end
			local function GetPageHeight(ai)
				local aj, ak = ai.UIElements.Container.UIListLayout, ag.Window.ElementConfig.UIPadding / 2
				local al = aj.AbsoluteContentSize.Y / ag.UIScale + ak
				return math.max(al, ak)
			end
			local function UpdatePageHeight(ai)
				if not ai or not ai.UIElements.Container then
					return
				end
				local aj = GetPageHeight(ai)
				ai.UIElements.Container.Size = UDim2.new(1, 0, 0, aj)
				ah.UIElements.Pages.Size = UDim2.new(1, 0, 0, aj)
				return aj
			end
			local function ScrollTabIntoView(ai)
				task.defer(function()
					if not ai or not ai.Button or not ai.Button.Parent then
						return
					end
					local aj = ah.UIElements.Tabs
					local ak, al = aj.AbsoluteSize.X, ai.Button.AbsolutePosition.X - aj.AbsolutePosition.X + aj.CanvasPosition.X
					local am, an = al + ai.Button.AbsoluteSize.X, aj.CanvasPosition.X
					local ao, ap = an + ak, an
					if al < an then
						ap = al
					elseif am > ao then
						ap = am - ak
					end
					if math.abs(ap - an) > 1 then
						aj.CanvasPosition = Vector2.new(math.max(ap, 0), 0)
					end
				end)
			end
			local function QueuePageHeightUpdate(ai, aj)
				task.defer(function()
					if ah.Selected == aj and ai and ai.UIElements.Container.Parent then
						UpdatePageHeight(ai)
					end
				end)
			end
			function ah.Select(ai, aj)
				local ak = ah.Tabs[aj]
				if not ak then
					return nil
				end
				ah.Selected = aj
				ah.SelectedValue = ak.Value
				for al, am in next, ah.Tabs do
					local an = al == aj
					am.UIElements.Container.Visible = an
					am.UIElements.Container.Active = an
					am.UIElements.Container.GroupTransparency = 1
					if an then
						am.UIElements.Container.Position = UDim2.new(0, 0, 0, 8)
					end
				end
				UpdatePageHeight(ak)
				ab.Play(ak.UIElements.Container, 'Switch', {
					GroupTransparency = 0
				}, nil, nil, 'Page')
				ab.Play(ak.UIElements.Container, 'Switch', {
					Position = UDim2.new(0, 0, 0, 0)
				}, nil, nil, 'PageSlide')
				QueuePageHeightUpdate(ak, aj)
				UpdateTabVisuals()
				ScrollTabIntoView(ak)
				return ak
			end
			function ah.GetSelected(ai)
				return ah.Selected and ah.Tabs[ah.Selected] or nil
			end
			function ah.Get(ai)
				return ah.SelectedValue
			end
			function ah.SelectValue(ai, aj)
				for ak, al in next, ah.Tabs do
					if al.Value == aj then
						return ah:Select(ak)
					end
				end
				return nil
			end
			function ah.Set(ai, aj)
				return ah:SelectValue(aj)
			end
			function ah.Tab(ai, aj)
				aj = aj or {}
				local ak = # ah.Tabs + 1
				local al = {
					__type = 'TabBoxPage',
					Title = aj.Title or ('Tab ' .. tostring(ak)),
					Value = aj.Value or aj.Id or ak,
					Icon = aj.Icon,
					Elements = {},
					UIElements = {},
					Gap = ag.Tab and ag.Tab.Gap or 6
				}
				local am = ad.CreateIcon(aa, al.Icon, ag.Window.Folder, 'TabBox', true, 'TabBoxIcon')
				if am then
					am.Size = UDim2.new(0, 15, 0, 15)
				end
				local an, ao = ad.GetImageTarget(am), string.len(al.Title) * (ag.Window.IsPC == false and 6 or 7)
				local ap = math.clamp(ao + (am and 40 or 26), ag.MinTabWidth or 68, ag.MaxTabWidth or 154)
				local aq = ac('TextLabel', {
					Name = 'Title',
					BackgroundTransparency = 1,
					Text = al.Title,
					TextSize = ag.Window.IsPC == false and 12 or 13,
					TextTruncate = 'AtEnd',
					Size = UDim2.new(0, math.max(ap - (am and 42 or 20), 24), 1, 0),
					FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				local ar, as = aa.NewRoundFrame(999, 'Squircle', {
					Name = 'Tab',
					LayoutOrder = ak,
					Size = UDim2.new(0, ap, 0, ag.TabButtonHeight or 30),
					ImageTransparency = 0.94,
					ClipsDescendants = true,
					ThemeTag = {
						ImageColor3 = 'TabBoxTabBackground'
					},
					Parent = ah.UIElements.Tabs
				}, {
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10)
					}),
					ac('UIListLayout', {
						Padding = UDim.new(0, 6),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Center'
					}),
					am,
					aq
				}, true), ac('CanvasGroup', {
					Name = 'Page',
					LayoutOrder = ak,
					Size = UDim2.new(1, 0, 0, 0),
					Position = UDim2.new(0, 0, 0, 0),
					BackgroundTransparency = 1,
					GroupTransparency = 1,
					Visible = false,
					Active = false,
					Parent = ah.UIElements.Pages
				}, {
					ac('UIPadding', {
						PaddingTop = UDim.new(0, ag.Window.ElementConfig.UIPadding / 2)
					}),
					ac('UIListLayout', {
						Padding = UDim.new(0, al.Gap),
						FillDirection = 'Vertical',
						VerticalAlignment = 'Top',
						HorizontalAlignment = 'Left',
						SortOrder = 'LayoutOrder'
					})
				})
				al.Button = ar
				al.TitleLabel = aq
				al.Icon = am
				al.IconTarget = an
				al.ElementFrame = as
				al.UIElements.Container = as
				al.UIElements.Title = aq
				ag.ElementsModule.Load(al, as, ag.ElementsModule.Elements, ag.Window, ag.WindUI, function()
					QueuePageHeightUpdate(al, ak)
				end, ag.ElementsModule, ag.UIScale, ag.Tab)
				function al.Select(at)
					return ah:Select(ak)
				end
				function al.Destroy(at)
					ar:Destroy()
					as:Destroy()
					table.remove(ah.Tabs, ak)
					if ah.Selected == ak then
						ah.Selected = nil
						if ah.Tabs[1] then
							ah:Select(1)
						end
					end
				end
				ah.Tabs[ak] = al
				ab.AttachPress(ar, aa, {
					Amount = 0.97
				})
				aa.AddSignal(ar.MouseButton1Click, function()
					ah:Select(ak)
				end)
				aa.AddSignal(as.UIListLayout:GetPropertyChangedSignal'AbsoluteContentSize', function()
					QueuePageHeightUpdate(al, ak)
				end)
				if not ah.Selected or aj.Selected == true or aj.Value == ag.Value then
					ah:Select(ak)
				else
					UpdateTabVisuals()
				end
				if typeof(aj.Elements) == 'function' then
					task.defer(function()
						aa.SafeCallback(aj.Elements, al)
					end)
				end
				return al
			end
			function ah.CreateTab(ai, aj)
				return ah:Tab(aj)
			end
			for ai, aj in next, ag.Tabs or {} do
				ah:Tab(aj)
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.as()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae, af, ag, ah = aa.New, a.load'af', {}, {
			Vector2.new(0.08, 0.72),
			Vector2.new(0.28, 0.38),
			Vector2.new(0.52, 0.56),
			Vector2.new(0.72, 0.24),
			Vector2.new(0.92, 0.42)
		}, 92, 22
		local function NormalizePoint(ai)
			if typeof(ai) == 'Vector2' then
				return Vector2.new(math.clamp(ai.X, 0, 1), math.clamp(ai.Y, 0, 1))
			end
			if typeof(ai) == 'table' then
				local aj, ak = ad.ToFiniteNumber(ai.X or ai.x or ai[1]) or 0, ad.ToFiniteNumber(ai.Y or ai.y or ai[2]) or 0
				return Vector2.new(math.clamp(aj, 0, 1), math.clamp(ak, 0, 1))
			end
			return Vector2.new(0, 0)
		end
		local function NormalizePoints(ai)
			local aj, ak = {}, typeof(ai) == 'table' and ai or af
			if # ak > 0 then
				for al = 1, # ak do
					table.insert(aj, NormalizePoint(ak[al]))
				end
			else
				for al, am in next, ak do
					table.insert(aj, NormalizePoint(am))
				end
			end
			if # aj < 2 then
				aj = af
			end
			return aj
		end
		local function PointToUDim2(ai)
			return UDim2.new(ai.X, 0, ai.Y, 0)
		end
		local function PixelToUDim2(ai)
			return UDim2.fromOffset(ai.X, ai.Y)
		end
		local function GetTweenPoint(ai, aj, ak)
			return ai:Lerp(aj, math.clamp(ak, 0, 1))
		end
		local function GetAngle(ai, aj)
			if math.atan2 then
				return math.atan2(ai, aj)
			end
			if aj == 0 then
				return ai >= 0 and math.pi / 2 or - math.pi / 2
			end
			local ak = math.atan(ai / aj)
			if aj < 0 then
				ak += math.pi
			end
			return ak
		end
		function ae.New(ai, aj)
			local ak = {
				__type = 'Path2D',
				Title = aj.Title or 'Path 2D',
				Desc = aj.Desc,
				Points = NormalizePoints(aj.Points or aj.Path),
				Labels = aj.Labels or {},
				Height = math.max(ad.ToFiniteNumber(aj.Height) or 156, 96),
				Thickness = math.max(ad.ToFiniteNumber(aj.Thickness) or 4, 2),
				Padding = math.max(ad.ToFiniteNumber(aj.PathPadding or aj.Padding) or 20, 0),
				DotSize = math.max(ad.ToFiniteNumber(aj.DotSize) or 9, 5),
				MarkerSize = math.max(ad.ToFiniteNumber(aj.MarkerSize) or 16, 10),
				Duration = math.max(ad.ToFiniteNumber(aj.Duration) or 1.2, 0.18),
				StepDelay = math.max(ad.ToFiniteNumber(aj.StepDelay) or 0.055, 0),
				Loop = aj.Loop == true,
				AutoPlay = aj.AutoPlay ~= false,
				Glow = aj.Glow ~= false,
				UIElements = {},
				Segments = {},
				Dots = {},
				LabelObjects = {},
				PlayToken = 0,
				HasRendered = false,
				Destroyed = false
			}
			ak.Path2DFrame = a.load'I'{
				Title = ak.Title,
				Desc = ak.Desc,
				Parent = aj.Parent,
				TextOffset = 0,
				Hover = aj.Hover == true,
				Tab = aj.Tab,
				Index = aj.Index,
				Window = aj.Window,
				ElementTable = ak,
				ParentConfig = aj,
				Tags = aj.Tags
			}
			ak.UIElements.Canvas = aa.NewRoundFrame(aj.Window.ElementConfig.UICorner, 'Squircle', {
				Name = 'Path2DCanvas',
				Size = UDim2.new(1, 0, 0, ak.Height),
				ClipsDescendants = true,
				ImageTransparency = aa.ClampTransparency(aj.BackgroundTransparency, 0.92),
				Parent = ak.Path2DFrame.UIElements.Container,
				ThemeTag = {
					ImageColor3 = 'Path2DBackground'
				}
			}, {
				ac('UIGradient', {
					Rotation = 25,
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.08),
						NumberSequenceKeypoint.new(1, 0.28)
					}
				})
			})
			local function ClearObjects()
				for al, am in next, ak.Segments do
					am.Track:Destroy()
				end
				for al, am in next, ak.Dots do
					am:Destroy()
				end
				for al, am in next, ak.LabelObjects do
					am:Destroy()
				end
				if ak.UIElements.Marker then
					ak.UIElements.Marker:Destroy()
					ak.UIElements.Marker = nil
				end
				ak.Segments = {}
				ak.Dots = {}
				ak.LabelObjects = {}
			end
			local function GetCanvasSize()
				local al = ak.UIElements.Canvas.AbsoluteSize
				return Vector2.new(al.X / aj.UIScale, al.Y / aj.UIScale)
			end
			local function GetPixelPoint(al, am)
				local an = math.min(ak.Padding, math.max(am.X, am.Y) / 3)
				local ao = Vector2.new(math.max(am.X - (an * 2), 1), math.max(am.Y - (an * 2), 1))
				return Vector2.new(an + (al.X * ao.X), an + (al.Y * ao.Y))
			end
			local function GetLabelPosition(al, am, an)
				local ao, ap, aq, ar = math.max(ad.ToFiniteNumber(an.Width) or ag, 54), math.max(ad.ToFiniteNumber(an.Height) or ah, 18), ad.ToFiniteNumber(an.OffsetX) or 0, ad.ToFiniteNumber(an.OffsetY)
				if ar == nil then
					ar = an.Above == false and 18 or - 18
				end
				return Vector2.new(math.clamp(al.X + aq, (ao / 2) + 6, math.max((ao / 2) + 6, am.X - (ao / 2) - 6)), math.clamp(al.Y + ar, (ap / 2) + 6, math.max((ap / 2) + 6, am.Y - (ap / 2) - 6))), ao, ap
			end
			function ak.Render(al, am)
				local an = GetCanvasSize()
				if an.X <= 0 or an.Y <= 0 then
					return
				end
				local ao = am ~= false and ak.AutoPlay
				ak.PlayToken = ak.PlayToken + 1
				ak.HasRendered = true
				ClearObjects()
				for ap = 1, # ak.Points - 1 do
					local aq, ar = GetPixelPoint(ak.Points[ap], an), GetPixelPoint(ak.Points[ap + 1], an)
					local as = ar - aq
					local at, au, av = as.Magnitude, math.deg(GetAngle(as.Y, as.X)), (aq + ar) / 2
					local aw = aa.NewRoundFrame(999, 'Squircle', {
						Name = 'Segment' .. tostring(ap),
						Size = UDim2.new(0, at, 0, ak.Thickness),
						Position = PixelToUDim2(av),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Rotation = au,
						ImageTransparency = 0.84,
						Parent = ak.UIElements.Canvas,
						ZIndex = 2,
						ThemeTag = {
							ImageColor3 = 'Path2DTrack'
						}
					})
					local ax, ay = ak.Glow and aa.NewRoundFrame(999, 'Squircle', {
						Name = 'Glow',
						Size = UDim2.new(0, ao and 0 or at, 0, ak.Thickness + 8),
						Position = UDim2.new(0, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5),
						ImageTransparency = 0.84,
						ZIndex = 2,
						Parent = aw,
						ThemeTag = {
							ImageColor3 = 'Path2DLine'
						}
					}) or nil, aa.NewRoundFrame(999, 'Squircle', {
						Name = 'Fill',
						Size = UDim2.new(0, ao and 0 or at, 1, 0),
						ImageTransparency = 0,
						ZIndex = 3,
						Parent = aw,
						ThemeTag = {
							ImageColor3 = 'Path2DLine'
						}
					})
					table.insert(ak.Segments, {
						Track = aw,
						Glow = ax,
						Fill = ay,
						Length = at,
						From = ak.Points[ap],
						To = ak.Points[ap + 1],
						FromPixel = aq,
						ToPixel = ar,
						FromPosition = PixelToUDim2(aq),
						ToPosition = PixelToUDim2(ar)
					})
				end
				for ap = 1, # ak.Points do
					local aq = ak.Points[ap]
					local ar, as = GetPixelPoint(aq, an), ap == 1 and ak.DotSize + 3 or ak.DotSize
					local at = aa.NewRoundFrame(999, 'Circle', {
						Name = 'Point' .. tostring(ap),
						Size = UDim2.new(0, as, 0, as),
						Position = PixelToUDim2(ar),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ImageTransparency = ao and 0.54 or 0.12,
						Parent = ak.UIElements.Canvas,
						ZIndex = 4,
						ThemeTag = {
							ImageColor3 = ap == # ak.Points and 'Path2DMarker' or 'Path2DLine'
						}
					}, {
						aa.NewRoundFrame(999, 'Circle', {
							Name = 'DotCore',
							Size = UDim2.new(0, math.max(as - 5, 3), 0, math.max(as - 5, 3)),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5),
							ImageColor3 = Color3.new(1, 1, 1),
							ImageTransparency = 0.22,
							ZIndex = 5
						})
					})
					table.insert(ak.Dots, at)
				end
				for ap, aq in next, ak.Labels do
					if typeof(aq) ~= 'table' then
						aq = {
							Text = tostring(aq)
						}
					end
					local ar = math.clamp(math.floor(ad.ToFiniteNumber(aq.Point or aq.Index) or 1), 1, # ak.Points)
					local as = GetPixelPoint(ak.Points[ar], an)
					local at, au, av = GetLabelPosition(as, an, aq)
					local aw = ac('TextLabel', {
						Name = 'PathLabel',
						Size = UDim2.new(0, au, 0, av),
						Position = PixelToUDim2(at),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1,
						Text = tostring(aq.Text or aq.Title or ar),
						TextSize = 12,
						TextTransparency = 0.22,
						TextXAlignment = 'Center',
						FontFace = Font.new(aa.Font, Enum.FontWeight.SemiBold),
						Parent = ak.UIElements.Canvas,
						ZIndex = 6,
						ThemeTag = {
							TextColor3 = 'Path2DLabel'
						}
					})
					table.insert(ak.LabelObjects, aw)
				end
				local ap = aa.NewRoundFrame(999, 'Circle', {
					Name = 'Marker',
					Size = UDim2.new(0, ak.MarkerSize, 0, ak.MarkerSize),
					Position = ao and ak.Segments[1] and ak.Segments[1].FromPosition or PixelToUDim2(GetPixelPoint(ak.Points[# ak.Points], an)),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 0,
					Parent = ak.UIElements.Canvas,
					ZIndex = 8,
					ThemeTag = {
						ImageColor3 = 'Path2DMarker'
					}
				}, {
					aa.NewRoundFrame(999, 'Circle', {
						Name = 'Halo',
						Size = UDim2.new(1, 12, 1, 12),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ImageTransparency = 0.78,
						ZIndex = 7,
						ThemeTag = {
							ImageColor3 = 'Path2DMarker'
						}
					}),
					aa.NewRoundFrame(999, 'Circle', {
						Name = 'Core',
						Size = UDim2.new(0, 6, 0, 6),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ImageColor3 = Color3.new(1, 1, 1),
						ZIndex = 9
					})
				})
				ak.UIElements.Marker = ap
				if ao then
					ak:Play()
				end
			end
			function ak.Play(al)
				ak.PlayToken = ak.PlayToken + 1
				local am, an = ak.PlayToken, ak.Duration / math.max(# ak.Segments, 1)
				if ak.UIElements.Marker then
					ak.UIElements.Marker.Position = ak.Segments[1] and ak.Segments[1].FromPosition or PointToUDim2(ak.Points[1])
				end
				for ao, ap in next, ak.Dots do
					ap.ImageTransparency = 0.72
				end
				for ao, ap in next, ak.Segments do
					ap.Fill.Size = UDim2.new(0, 0, 1, 0)
					if ap.Glow then
						ap.Glow.Size = UDim2.new(0, 0, 0, ak.Thickness + 8)
					end
				end
				for ao = 1, # ak.Segments do
					local ap, aq = ak.Segments[ao], (ao - 1) * (an + ak.StepDelay)
					task.delay(aq, function()
						if am ~= ak.PlayToken or ak.Destroyed then
							return
						end
						if ak.Dots[ao] then
							ab.Play(ak.Dots[ao], 'Reveal', {
								ImageTransparency = 0.12
							}, nil, nil, 'Point')
						end
						ab.Play(ap.Fill, an, {
							Size = UDim2.new(0, ap.Length, 1, 0)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Draw')
						if ap.Glow then
							ab.Play(ap.Glow, an, {
								Size = UDim2.new(0, ap.Length, 0, ak.Thickness + 8)
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Glow')
						end
						if ak.UIElements.Marker then
							ab.Play(ak.UIElements.Marker, an, {
								Position = ap.ToPosition
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Path')
						end
					end)
				end
				local ao = # ak.Segments * (an + ak.StepDelay)
				task.delay(ao, function()
					if am ~= ak.PlayToken or ak.Destroyed then
						return
					end
					if ak.Dots[# ak.Dots] then
						ab.Play(ak.Dots[# ak.Dots], 'Reveal', {
							ImageTransparency = 0
						}, nil, nil, 'Point')
					end
					if ak.Loop then
						task.delay(0.4, function()
							if am == ak.PlayToken and not ak.Destroyed then
								ak:Play()
							end
						end)
					end
				end)
			end
			function ak.Stop(al)
				ak.PlayToken = ak.PlayToken + 1
				if ak.UIElements.Marker then
					ab.Cancel(ak.UIElements.Marker, 'Path')
				end
				for am, an in next, ak.Segments do
					ab.Cancel(an.Fill, 'Draw')
					if an.Glow then
						ab.Cancel(an.Glow, 'Glow')
					end
				end
			end
			function ak.SetProgress(al, am)
				ak:Stop()
				local an = math.clamp(ad.ToFiniteNumber(am) or 0, 0, 1)
				if # ak.Segments == 0 then
					return an
				end
				local ao = math.max(# ak.Segments, 1)
				local ap = an * ao
				for aq = 1, # ak.Segments do
					local ar, as = ak.Segments[aq], math.clamp(ap - (aq - 1), 0, 1)
					ar.Fill.Size = UDim2.new(0, ar.Length * as, 1, 0)
					if ar.Glow then
						ar.Glow.Size = UDim2.new(0, ar.Length * as, 0, ak.Thickness + 8)
					end
				end
				local aq = math.clamp(math.ceil(ap), 1, # ak.Segments)
				local ar = ak.Segments[aq]
				if ar and ak.UIElements.Marker then
					local as = math.clamp(ap - (aq - 1), 0, 1)
					ak.UIElements.Marker.Position = PixelToUDim2(GetTweenPoint(ar.FromPixel, ar.ToPixel, as))
				end
				for as = 1, # ak.Dots do
					local at = ak.Dots[as]
					at.ImageTransparency = as <= math.floor(ap) + 1 and 0.12 or 0.54
				end
				return an
			end
			function ak.SetPoints(al, am)
				ak.Points = NormalizePoints(am)
				ak:Render(true)
				return ak.Points
			end
			function ak.Destroy(al)
				ak.Destroyed = true
				ak:Stop()
				ak.Path2DFrame:Destroy()
			end
			aa.AddSignal(ak.UIElements.Canvas:GetPropertyChangedSignal'AbsoluteSize', function()
				ak:Render(not ak.HasRendered)
			end)
			task.defer(function()
				ak:Render(true)
			end)
			return ak.__type, ak
		end
		return ae
	end
	function a.at()
		local aa, ab = a.load'd', a.load'e'
		local ac, ad, ae = aa.New, a.load'af', {}
		local function GetText(af, ag)
			if af == nil then
				return ag
			end
			return tostring(af)
		end
		local function GetCardColor(af, ag)
			return ad.GetColor(af, ag)
		end
		function ae.New(af, ag)
			local ah, ai, aj, ak = {
				__type = 'Card',
				Title = GetText(ag.Title, 'Card'),
				Desc = ag.Desc or ag.Content,
				Icon = ag.Icon,
				Image = ag.Image or ag.Background or ag.BackgroundImage,
				Callback = ag.Callback,
				OpenTab = ag.OpenTab == true or ag.CardTab == true or typeof(ag.Build) == 'function',
				Elements = {},
				UIElements = {},
				ElementFrame = nil,
				LinkCorners = ag.LinkCorners,
				CornerGroup = ag.CornerGroup or ag.LinkCornerGroup,
				CornerBreak = ag.CornerBreak,
				CornerBreakBefore = ag.CornerBreakBefore,
				CornerBreakAfter = ag.CornerBreakAfter
			}, ag.Radius or ag.Window.ElementConfig.UICorner, GetCardColor(ag.Color or ag.Accent, nil), tonumber(ag.Height) or 0
			local al, am, an, ao = typeof(ah.Callback) == 'function' or ah.OpenTab
			ah.UIElements.Main, am = aa.NewRoundFrame(ai, 'Squircle', {
				Name = 'Card',
				Size = UDim2.new(1, 0, 0, ak),
				AutomaticSize = 'Y',
				ImageTransparency = 1,
				Parent = ag.Parent,
				ClipsDescendants = true
			}, {}, al)
			ah.ElementFrame = ah.UIElements.Main
			ah.UIElements.Background = ac('Frame', {
				Name = 'Background',
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = aa.ClampTransparency(ag.Transparency, ag.Window.LiquidGlass and 0.84 or 0.9),
				BackgroundColor3 = aj or nil,
				ZIndex = 0,
				Parent = ah.UIElements.Main,
				ThemeTag = aj and nil or {
					BackgroundColor3 = 'ElementBackground'
				}
			}, {
				ac('UICorner', {
					CornerRadius = UDim.new(0, ai)
				})
			})
			an = ah.UIElements.Background.UICorner
			ah.UIElements.Content = ac('Frame', {
				Name = 'Content',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				ZIndex = 2,
				Parent = ah.UIElements.Main
			}, {
				ac('UIPadding', {
					PaddingTop = UDim.new(0, ag.Padding or 14),
					PaddingLeft = UDim.new(0, ag.Padding or 14),
					PaddingRight = UDim.new(0, ag.Padding or 14),
					PaddingBottom = UDim.new(0, ag.Padding or 14)
				}),
				ac('UIListLayout', {
					Padding = UDim.new(0, ag.Gap or 12),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left',
					SortOrder = 'LayoutOrder'
				})
			})
			if ah.Image then
				ah.UIElements.Image = aa.Image(ah.Image, ah.Title .. '-card-image', 0, ag.Window.Folder, 'Card', false, false)
				ah.UIElements.Image.Size = UDim2.new(1, 0, 1, 0)
				ah.UIElements.Image.Position = UDim2.new(0.5, 0, 0.5, 0)
				ah.UIElements.Image.AnchorPoint = Vector2.new(0.5, 0.5)
				ah.UIElements.Image.Parent = ah.UIElements.Main
				ah.UIElements.Image.ZIndex = 0
				local ap = ad.GetImageTarget(ah.UIElements.Image)
				if ap then
					ap.ZIndex = 0
					ap.ImageTransparency = ag.ImageTransparency or 0.32
					ap.ScaleType = ag.ScaleType or Enum.ScaleType.Crop
					ao = ac('UICorner', {
						CornerRadius = UDim.new(0, ai),
						Parent = ap
					})
				end
			end
			local ap = ac('Frame', {
				Name = 'Header',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Parent = ah.UIElements.Content
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 10),
					FillDirection = 'Horizontal',
					VerticalAlignment = 'Top',
					HorizontalAlignment = 'Left'
				})
			})
			if ah.Icon then
				local aq = ad.CreateIcon(aa, ah.Icon, ag.Window.Folder, 'Card', true, 'CardIcon')
				if aq then
					aq.Size = UDim2.new(0, 22, 0, 22)
					aq.Parent = ap
					local ar = ad.GetImageTarget(aq)
					if ar and aj then
						ar.ImageColor3 = aj
						ar.ImageTransparency = 0
					end
				end
			end
			local aq = ac('Frame', {
				Name = 'Texts',
				Size = UDim2.new(1, ah.Icon and - 32 or 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Parent = ap
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, 3),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left'
				})
			})
			ah.UIElements.Title = ac('TextLabel', {
				Name = 'Title',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Text = ah.Title,
				TextSize = ag.TitleSize or 17,
				TextTransparency = 0.02,
				TextXAlignment = 'Left',
				TextWrapped = true,
				FontFace = Font.new(aa.Font, Enum.FontWeight.Bold),
				Parent = aq,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			ah.UIElements.Desc = ac('TextLabel', {
				Name = 'Desc',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				Text = ah.Desc or '',
				TextSize = ag.DescSize or 13,
				TextTransparency = 0.34,
				TextXAlignment = 'Left',
				TextWrapped = true,
				Visible = ah.Desc ~= nil,
				FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				Parent = aq,
				ThemeTag = {
					TextColor3 = 'Text'
				}
			})
			ah.UIElements.Body = ac('Frame', {
				Name = 'Body',
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = 'Y',
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Parent = ah.UIElements.Content
			}, {
				ac('UIListLayout', {
					Padding = UDim.new(0, ag.BodyGap or (ag.Window.NewElements and 6 or 8)),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left',
					SortOrder = 'LayoutOrder'
				})
			})
			local function EnsureActions()
				if ah.UIElements.Actions then
					return ah.UIElements.Actions
				end
				ah.UIElements.Actions = ac('Frame', {
					Name = 'Actions',
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Parent = ah.UIElements.Content
				}, {
					ac('UIListLayout', {
						Padding = UDim.new(0, 8),
						FillDirection = 'Vertical',
						HorizontalAlignment = 'Left',
						SortOrder = 'LayoutOrder'
					})
				})
				return ah.UIElements.Actions
			end
			local function CreateActionButton(ar, as)
				ar = ar or {}
				local at = GetCardColor(ar.Color, aj)
				local au = aa.NewRoundFrame(ar.Radius or 14, 'Squircle', {
					Name = ar.Name or 'CardButton',
					Size = UDim2.new(1, 0, 0, ar.Height or 44),
					ImageColor3 = at or nil,
					ImageTransparency = ar.Transparency or (at and 0.18 or 0.9),
					Parent = EnsureActions(),
					ThemeTag = at and nil or {
						ImageColor3 = 'ElementBackground'
					}
				}, {
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 12),
						PaddingRight = UDim.new(0, 12)
					}),
					ac('UIListLayout', {
						Padding = UDim.new(0, 10),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Left'
					}),
					ad.CreateIcon(aa, ar.Icon or 'arrow-right', ag.Window.Folder, 'Card', not at, 'CardButtonIcon'),
					ac('TextLabel', {
						Name = 'Title',
						Size = UDim2.new(1, - 34, 1, 0),
						BackgroundTransparency = 1,
						Text = GetText(ar.Title or ar.Name, 'Open'),
						TextSize = ar.TextSize or 14,
						TextTransparency = 0.04,
						TextXAlignment = 'Left',
						TextTruncate = 'AtEnd',
						FontFace = Font.new(aa.Font, Enum.FontWeight.Bold),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
				}, true)
				local av = au:FindFirstChildWhichIsA'Frame' or au:FindFirstChildWhichIsA'ImageLabel'
				local aw = ad.GetImageTarget(av)
				if aw and at then
					aw.ImageColor3 = at
					aw.ImageTransparency = 0
				end
				ab.AttachPress(au, aa, {
					Amount = 0.975
				})
				aa.AddSignal(au.MouseButton1Click, function()
					if as then
						as()
					end
					if typeof(ar.Callback) == 'function' then
						aa.SafeCallback(ar.Callback, ah)
					end
				end)
				return au
			end
			local ar
			local function CreateCardTab(as)
				as = as or {}
				local at = as.Tab
				if typeof(at) ~= 'table' and as.CreateTab ~= false and ag.Window and ag.Window.Tab then
					at = ag.Window:Tab{
						Title = as.TabTitle or as.Title or ah.Title,
						Desc = as.TabDesc or as.Desc,
						Icon = as.TabIcon or as.Icon or ah.Icon or 'panels-top-left',
						ShowTabTitle = as.ShowTabTitle,
						Golden = as.Golden,
						Premium = as.Premium,
						LinkCorners = as.LinkCorners,
						Gap = as.Gap
					}
					if typeof(as.Build) == 'function' then
						aa.SafeCallback(as.Build, at, ah)
					end
				end
				return {
					Tab = at,
					Select = function()
						if at and at.Select then
							return at:Select()
						end
					end
				}
			end
			function ah.CardButton(as, at)
				return CreateActionButton(at)
			end
			function ah.CardTab(as, at)
				at = at or {}
				local au = CreateCardTab(at)
				local av = CreateActionButton({
					Title = at.Title or 'Open Card Tab',
					Icon = at.Icon or 'panels-top-left',
					Color = at.Color,
					Callback = at.Callback
				}, function()
					au.Select()
				end)
				au.Button = av
				return au
			end
			if ah.OpenTab then
				local as = typeof(ag.CardTab) == 'table' and ag.CardTab or {}
				ar = CreateCardTab{
					Tab = ag.TabTarget or ag.Page or as.Tab,
					CreateTab = ag.CreateTab ~= false and as.CreateTab ~= false,
					Title = ag.TabTitle or ag.PageTitle or as.Title or ah.Title,
					TabTitle = ag.TabTitle or ag.PageTitle or as.TabTitle or ah.Title,
					TabDesc = ag.TabDesc or ag.PageDesc or as.TabDesc or ah.Desc,
					Icon = ag.TabIcon or ag.PageIcon or as.Icon or ah.Icon,
					TabIcon = ag.TabIcon or ag.PageIcon or as.TabIcon or ah.Icon,
					ShowTabTitle = ag.ShowTabTitle or as.ShowTabTitle,
					Golden = ag.Golden or as.Golden,
					Premium = ag.Premium or as.Premium,
					LinkCorners = ag.PageLinkCorners or as.LinkCorners,
					Gap = ag.PageGap or as.Gap,
					Build = ag.Build or as.Build
				}
				ah.Page = ar.Tab
				ah.PageController = ar
			end
			function ah.Open(as)
				if ar then
					return ar.Select()
				end
				if typeof(ah.Callback) == 'function' then
					return aa.SafeCallback(ah.Callback, ah)
				end
			end
			function ah.GetPage(as)
				return ar and ar.Tab
			end
			function ah.SetPage(as, at)
				ar = {
					Tab = at,
					Select = function()
						if at and at.Select then
							return at:Select()
						end
					end
				}
				ah.Page = at
				ah.PageController = ar
				return {
					Tab = at,
					Select = ar.Select
				}
			end
			if al then
				ab.AttachPress(ah.UIElements.Main, aa, {
					Amount = 0.985
				})
				aa.AddSignal(ah.UIElements.Main.MouseButton1Click, function()
					if ar then
						ar.Select()
					end
					if typeof(ah.Callback) == 'function' then
						aa.SafeCallback(ah.Callback, ah)
					end
				end)
			end
			local as = ag.ElementsModule
			as.Load(ah, ah.UIElements.Body, as.Elements, ag.Window, ag.WindUI, nil, as, ag.UIScale, ag.Tab)
			function ah.SetTitle(at, au)
				ah.Title = tostring(au or '')
				ah.UIElements.Title.Text = ah.Title
			end
			function ah.SetDesc(at, au)
				ah.Desc = au
				ah.UIElements.Desc.Text = tostring(au or '')
				ah.UIElements.Desc.Visible = au ~= nil
			end
			function ah.Highlight(at)
				ab.Play(ah.UIElements.Background, 'Highlight', {
					BackgroundTransparency = 0.78
				}, nil, nil, 'CardHighlight')
				task.delay(ab.GetDuration'Highlight', function()
					if ah.UIElements.Main.Parent then
						ab.Play(ah.UIElements.Background, 'Highlight', {
							BackgroundTransparency = aa.ClampTransparency(ag.Transparency, ag.Window.LiquidGlass and 0.84 or 0.9)
						}, nil, nil, 'CardHighlight')
					end
				end)
			end
			function ah.UpdateShape(at)
				local au, av, aw, ax = ah.LinkCorners ~= false and (ah.LinkCorners == true or ag.Window.ElementConfig.LinkCorners or (ag.ParentTable and ag.ParentTable.LinkCorners == true)), {
					TopLeft = true,
					TopRight = true,
					BottomLeft = true,
					BottomRight = true
				}, 'Squircle', {
					Position = 'Single',
					Count = 1
				}
				if au and at and at.Elements then
					local ay = ag.ParentConfig and ag.ParentConfig.ParentTable and ag.ParentConfig.ParentTable.__type or ag.ParentType or (ag.ParentTable and ag.ParentTable.__type)
					aw, av, ax = aa.GetLinkedCornerShape(at.Elements, ah.Index, at, ay, ag.CornerLink or (ag.ParentConfig and ag.ParentConfig.CornerLink) or ag.Window.ElementConfig.CornerLink)
				end
				if aw and am then
					local ay = if ax.Count > 1 then 'Square' else (aw == 'Squircle-TL-BL' or aw == 'Squircle-TR-BR') and 'Squircle' or aw
					am:SetType(ay)
				end
				aa.ApplyCornerRadii(an, UDim.new(0, ai), av)
				aa.ApplyCornerRadii(ao, UDim.new(0, ai), av)
			end
			ah.UpdateShape(ag.Tab or ag.ParentTable)
			function ah.Destroy(at)
				ah.UIElements.Main:Destroy()
			end
			return ah.__type, ah
		end
		return ae
	end
	function a.au()
		local aa = a.load'd'
		local ab, ac, ad = aa.New, aa.Tween, {}
		function ad.New(ae, af)
			local ag, ah = {
				__type = 'Section',
				Title = af.Title or 'Section',
				Desc = af.Desc,
				Icon = af.Icon,
				IconThemed = af.IconThemed,
				TextXAlignment = af.TextXAlignment or 'Left',
				TextSize = af.TextSize or 19,
				DescTextSize = af.DescTextSize or 16,
				Box = af.Box or false,
				BoxBorder = af.BoxBorder or false,
				FontWeight = af.FontWeight or Enum.FontWeight.SemiBold,
				DescFontWeight = af.DescFontWeight or Enum.FontWeight.Medium,
				TextTransparency = af.TextTransparency or 0.05,
				DescTextTransparency = af.DescTextTransparency or 0.4,
				Opened = af.Opened or false,
				UIElements = {},
				HeaderSize = 48,
				IconSize = 20,
				Padding = 10,
				Elements = {},
				Expandable = false
			}
			function ag.SetIcon(ai, aj)
				ag.Icon = aj or nil
				if ah then
					ah:Destroy()
				end
				if aj then
					ah = aa.Image(aj, aj .. ':' .. ag.Title, 0, af.Window.Folder, ag.__type, true, ag.IconThemed, 'SectionIcon')
					ah.Size = UDim2.new(0, ag.IconSize, 0, ag.IconSize)
				end
			end
			local ai = ab('Frame', {
				Size = UDim2.new(0, ag.IconSize, 0, ag.IconSize),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				ab('ImageLabel', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = aa.Icon'chevron-down'[1],
					ImageRectSize = aa.Icon'chevron-down'[2].ImageRectSize,
					ImageRectOffset = aa.Icon'chevron-down'[2].ImageRectPosition,
					ThemeTag = {
						ImageTransparency = 'SectionExpandIconTransparency',
						ImageColor3 = 'SectionExpandIcon'
					}
				})
			})
			if ag.Icon then
				ag:SetIcon(ag.Icon)
			end
			local aj, ak, al = (ab('Frame', {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1
			}, {
				ab('UIListLayout', {
					FillDirection = 'Vertical',
					HorizontalAlignment = ag.TextXAlignment,
					VerticalAlignment = 'Center',
					Padding = UDim.new(0, 4)
				})
			}))
			local function createTitle(am, an)
				return ab('TextLabel', {
					BackgroundTransparency = 1,
					TextXAlignment = ag.TextXAlignment,
					AutomaticSize = 'Y',
					TextSize = an == 'Title' and ag.TextSize or ag.DescTextSize,
					TextTransparency = an == 'Title' and ag.TextTransparency or ag.DescTextTransparency,
					ThemeTag = {
						TextColor3 = 'Text'
					},
					FontFace = Font.new(aa.Font, an == 'Title' and ag.FontWeight or ag.DescFontWeight),
					Text = am,
					Size = UDim2.new(1, 0, 0, 0),
					TextWrapped = true,
					Parent = aj
				})
			end
			ak = createTitle(ag.Title, 'Title')
			if ag.Desc then
				al = createTitle(ag.Desc, 'Desc')
			end
			local function UpdateTitleSize()
				local am = 0
				if ah then
					am = am - (ag.IconSize + 8)
				end
				if ai.Visible then
					am = am - (ag.IconSize + 8)
				end
				aj.Size = UDim2.new(1, am, 0, 0)
			end
			local am = aa.NewRoundFrame(af.Window.ElementConfig.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = af.Parent,
				AutomaticSize = 'Y',
				ThemeTag = {
					ImageTransparency = ag.Box and 'SectionBoxBackgroundTransparency' or nil,
					ImageColor3 = 'SectionBoxBackground'
				},
				ImageTransparency = not ag.Box and 1 or nil
			}, {
				aa.NewRoundFrame(af.Window.ElementConfig.UICorner - 1, 'SquircleOutline', {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = 'SectionBoxBorder'
					},
					ImageTransparency = ag.Box and ag.BoxBorder and 0.92 or 1,
					Name = 'Outline',
					ClipsDescendants = true
				}, {
					ab('TextButton', {
						Size = UDim2.new(1, 0, 0, ag.Expandable and 0 or (not al and ag.HeaderSize or 0)),
						BackgroundTransparency = 1,
						AutomaticSize = (not ag.Expandable or al) and 'Y' or nil,
						Text = '',
						Name = 'Top'
					}, {
						ag.Box and ab('UIPadding', {
							PaddingTop = UDim.new(0, af.Window.ElementConfig.UIPadding + (af.Window.NewElements and 4 or 0)),
							PaddingLeft = UDim.new(0, af.Window.ElementConfig.UIPadding + (af.Window.NewElements and 4 or 0)),
							PaddingRight = UDim.new(0, af.Window.ElementConfig.UIPadding + (af.Window.NewElements and 4 or 0)),
							PaddingBottom = UDim.new(0, af.Window.ElementConfig.UIPadding + (af.Window.NewElements and 4 or 0))
						}) or nil,
						ah,
						aj,
						ab('UIListLayout', {
							Padding = UDim.new(0, 8),
							FillDirection = 'Horizontal',
							VerticalAlignment = 'Center',
							HorizontalAlignment = 'Left'
						}),
						ai
					}),
					ab('Frame', {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						Name = 'Content',
						Visible = false,
						Position = UDim2.new(0, 0, 0, ag.HeaderSize + 10)
					}, {
						ag.Box and ab('UIPadding', {
							PaddingLeft = UDim.new(0, af.Window.ElementConfig.UIPadding / 1.5),
							PaddingRight = UDim.new(0, af.Window.ElementConfig.UIPadding / 1.5),
							PaddingBottom = UDim.new(0, af.Window.ElementConfig.UIPadding / 1.5)
						}) or nil,
						ab('UIListLayout', {
							FillDirection = 'Vertical',
							Padding = UDim.new(0, af.Tab.Gap),
							VerticalAlignment = 'Top'
						})
					})
				})
			})
			ag.ElementFrame = am
			aa.AddSignal(am.Outline.Top:GetPropertyChangedSignal'AbsoluteSize', function()
				am.Outline.Content.Position = UDim2.new(0, 0, 0, (am.Outline.Top.AbsoluteSize.Y / af.UIScale) + 10)
				if ag.Opened then
					ag:Open(true)
				else
					ag:Close(true)
				end
			end)
			local an = af.ElementsModule
			an.Load(ag, am.Outline.Content, an.Elements, af.Window, af.WindUI, function()
				if not ag.Expandable then
					ag.Expandable = true
					ai.Visible = true
					UpdateTitleSize()
				end
			end, an, af.UIScale, af.Tab)
			UpdateTitleSize()
			function ag.SetTitle(ao, ap)
				ag.Title = ap
				ak.Text = ap
			end
			function ag.SetDesc(ao, ap)
				ag.Desc = ap
				if not al then
					al = createTitle(ap, 'Desc')
				end
				al.Text = ap
			end
			function ag.Destroy(ao)
				for ap, aq in next, ag.Elements do
					aq:Destroy()
				end
				am:Destroy()
			end
			function ag.Open(ao, ap)
				if ag.Expandable then
					ag.Opened = true
					if ap then
						am.Size = UDim2.new(am.Size.X.Scale, am.Size.X.Offset, 0, am.Outline.Top.AbsoluteSize.Y / af.UIScale + (am.Outline.Content.AbsoluteSize.Y / af.UIScale) + 10)
						ai.ImageLabel.Rotation = 180
					else
						ac(am, 0.33, {
							Size = UDim2.new(am.Size.X.Scale, am.Size.X.Offset, 0, am.Outline.Top.AbsoluteSize.Y / af.UIScale + (am.Outline.Content.AbsoluteSize.Y / af.UIScale) + 10)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						ac(ai.ImageLabel, 0.2, {
							Rotation = 180
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
				end
			end
			function ag.Close(ao, ap)
				if ag.Expandable then
					ag.Opened = false
					if ap then
						am.Size = UDim2.new(am.Size.X.Scale, am.Size.X.Offset, 0, (am.Outline.Top.AbsoluteSize.Y / af.UIScale))
						ai.ImageLabel.Rotation = 0
					else
						ac(am, 0.26, {
							Size = UDim2.new(am.Size.X.Scale, am.Size.X.Offset, 0, (am.Outline.Top.AbsoluteSize.Y / af.UIScale))
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						ac(ai.ImageLabel, 0.2, {
							Rotation = 0
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
				end
			end
			aa.AddSignal(am.Outline.Top.MouseButton1Click, function()
				if ag.Expandable then
					if ag.Opened then
						ag:Close()
					else
						ag:Open()
					end
				end
			end)
			aa.AddSignal(am.Outline.Content.UIListLayout:GetPropertyChangedSignal'AbsoluteContentSize', function()
				if ag.Opened then
					ag:Open(true)
				else
					ag:Close(true)
				end
			end)
			task.defer(function()
				if ag.Expandable then
					am.Size = UDim2.new(am.Size.X.Scale, am.Size.X.Offset, 0, am.Outline.Top.AbsoluteSize.Y / af.UIScale)
					am.AutomaticSize = 'None'
					am.Outline.Top.Size = UDim2.new(1, 0, 0, (not al and ag.HeaderSize or 0))
					am.Outline.Top.AutomaticSize = (not ag.Expandable or al) and 'Y' or 'None'
					am.Outline.Content.Visible = true
				end
				if ag.Opened then
					ag:Open()
				else
					ag:Close(true)
				end
			end)
			return ag.__type, ag
		end
		return ad
	end
	function a.av()
		local aa = a.load'd'
		local ab, ac = aa.New, {}
		function ac.New(ad, ae)
			local af = ab('Frame', {
				Parent = ae.Parent,
				Size = not table.find({
					'Group',
					'HStack'
				}, ae.ParentType) and UDim2.new(1, - 7, 0, 7 * (ae.Columns or 1)) or UDim2.new(0, 7 * (ae.Columns or 1), 0, 0),
				BackgroundTransparency = 1
			})
			return 'Space', {
				__type = 'Space',
				ElementFrame = af
			}
		end
		return ac
	end
	function a.aw()
		local aa = a.load'd'
		local ab, ac = aa.New, {}
		local function ParseAspectRatio(ad)
			if type(ad) == 'string' then
				local ae, af = ad:match'(%d+):(%d+)'
				if ae and af then
					return tonumber(ae) / tonumber(af)
				end
			elseif type(ad) == 'number' then
				return ad
			end
			return nil
		end
		function ac.New(ad, ae)
			local af = {
				__type = 'Image',
				Image = ae.Image or '',
				AspectRatio = ae.AspectRatio or '16:9',
				Radius = ae.Radius or ae.Window.ElementConfig.UICorner
			}
			local ag = aa.Image(af.Image, af.Image, af.Radius, ae.Window.Folder, 'Image', false)
			if ag and ag.Parent then
				ag.Parent = ae.Parent
				ag.Size = UDim2.new(1, 0, 0, 0)
				ag.BackgroundTransparency = 1
				local ah, ai = (ParseAspectRatio(af.AspectRatio))
				if ah then
					ai = ab('UIAspectRatioConstraint', {
						Parent = ag,
						AspectRatio = ah,
						AspectType = 'ScaleWithParentSize',
						DominantAxis = 'Width'
					})
				end
				function af.Destroy(aj)
					ag:Destroy()
				end
			end
			return af.__type, af
		end
		return ac
	end
	function a.ax()
		local aa = a.load'd'
		local ab, ac = aa.New, {}
		function ac.New(ad, ae)
			local af, ag = ae.LinkCorners == true or typeof(ae.LinkCorners) == 'table', ae.CornerLink or (typeof(ae.LinkCorners) == 'table' and ae.LinkCorners)
			local ah = typeof(ag) == 'table' and (ag.Gap or ag.Spacing) or nil
			local ai, aj = ae.Gap or ae.ElementGap or (af and (tonumber(ah) or 1)) or (ae.Tab and ae.Tab.Gap) or (ae.Window.NewElements and 1 or 6), {
				__type = 'Group',
				Elements = {},
				ElementFrame = nil,
				LinkCorners = af,
				CornerLink = ag
			}
			local ak = ab('Frame', {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = 'Y',
				Parent = ae.Parent
			}, {
				ab('UIListLayout', {
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, ai)
				})
			})
			aj.ElementFrame = ak
			local al = ae.ElementsModule
			al.Load(aj, ak, al.Elements, ae.Window, ae.WindUI, function(am, an)
				local ao, ap = {}, 0
				for aq, ar in next, an do
					if ar.__type == 'Space' then
						ap = ap + (ar.ElementFrame.Size.X.Offset or 6)
					elseif ar.__type == 'Divider' then
						ap = ap + (ar.ElementFrame.Size.X.Offset or 1)
					else
						table.insert(ao, ar)
					end
				end
				local aq = # ao
				if aq == 0 then
					return
				end
				local ar, as = 1 / aq, ai * (aq - 1)
				local at = - (as + ap)
				local au = math.floor(at / aq)
				local av = at - (au * aq)
				for aw, ax in next, ao do
					local ay = au
					if aw <= math.abs(av) then
						ay = ay - 1
					end
					if ax.ElementFrame then
						ax.ElementFrame.Size = UDim2.new(ar, ay, 1, 0)
					end
				end
			end, al, ae.UIScale, ae.Tab)
			return aj.__type, aj
		end
		return ac
	end
	function a.ay()
		local aa = a.load'd'
		local ab, ac = aa.New, {}
		function ac.New(ad, ae)
			local af, ag = ae.LinkCorners == true or typeof(ae.LinkCorners) == 'table', ae.CornerLink or (typeof(ae.LinkCorners) == 'table' and ae.LinkCorners)
			local ah = typeof(ag) == 'table' and (ag.Gap or ag.Spacing) or nil
			local ai, aj = ae.Gap or ae.ElementGap or (af and (tonumber(ah) or 1)) or (ae.Tab and ae.Tab.Gap) or (ae.Window.NewElements and 1 or 6), {
				__type = 'HStack',
				AutoSpace = ae.AutoSpace or false,
				Elements = {},
				ElementFrame = nil,
				LinkCorners = af,
				CornerLink = ag,
				MinChildWidth = math.max(tonumber(ae.MinChildWidth) or 128, 40),
				IsStacked = false
			}
			local ak = ab('Frame', {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = 'Y',
				Parent = ae.Parent
			}, {
				ab('UIListLayout', {
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, ai)
				})
			})
			aj.ElementFrame = ak
			local al = ae.ElementsModule
			local function UpdateLayout(am)
				am = am or aj.Elements
				local an, ao, ap = {}, 0, ak.AbsoluteSize.X / ae.UIScale
				for aq, ar in next, am do
					if ar.__type == 'Space' then
						ao = ao + (ar.ElementFrame.Size.X.Offset or 6)
					elseif ar.__type == 'Divider' then
						ao = ao + (ar.ElementFrame.Size.X.Offset or 1)
					else
						table.insert(an, ar)
					end
				end
				local aq = # an
				if aq == 0 then
					return
				end
				local ar = ai * (aq - 1)
				local as = ap - ar - ao
				local at = ap > 0 and as / aq < aj.MinChildWidth
				local au = aj.IsStacked ~= at
				aj.IsStacked = at
				local av, aw = at and 1 or (1 / aq), at and 0 or - (ar + ao)
				local ax = math.floor(aw / aq)
				local ay = aw - (ax * aq)
				ak.UIListLayout.FillDirection = at and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
				ak.UIListLayout.HorizontalAlignment = at and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
				for az, aA in next, an do
					local aB = at and 0 or ax
					if not at and az <= math.abs(ay) then
						aB = aB - 1
					end
					if aA.ElementFrame then
						local aC = aA.ElementFrame.Size
						aA.ElementFrame.Size = UDim2.new(av, aB, aC.Y.Scale == 1 and 0 or aC.Y.Scale, aC.Y.Scale == 1 and 0 or aC.Y.Offset)
					end
				end
				if au and aj.UpdateAllElementShapes then
					aj:UpdateAllElementShapes(aj)
				end
			end
			al.Load(aj, ak, al.Elements, ae.Window, ae.WindUI, function(am, an)
				UpdateLayout(an)
			end, al, ae.UIScale, ae.Tab)
			aa.AddSignal(ak:GetPropertyChangedSignal'AbsoluteSize', function()
				UpdateLayout()
			end)
			if aj.AutoSpace then
				for am in next, al.Elements do
					if am ~= 'Space' and am ~= 'Divider' then
						local an = aj[am]
						aj[am] = function(ao, ap)
							if # aj.Elements > 0 then
								aj:Space()
							end
							return an(ao, ap)
						end
					end
				end
			end
			return aj.__type, aj
		end
		return ac
	end
	function a.az()
		local aa = a.load'd'
		local ab, ac = aa.New, {}
		function ac.New(ad, ae)
			local af, ag = ae.LinkCorners == true or typeof(ae.LinkCorners) == 'table', ae.CornerLink or (typeof(ae.LinkCorners) == 'table' and ae.LinkCorners)
			local ah = typeof(ag) == 'table' and (ag.Gap or ag.Spacing) or nil
			local ai, aj = ae.Gap or ae.ElementGap or (af and (tonumber(ah) or 1)) or (ae.Tab and ae.Tab.Gap) or (ae.Window.NewElements and 1 or 6), {
				__type = 'VStack',
				Elements = {},
				ElementFrame = nil,
				LinkCorners = af,
				CornerLink = ag
			}
			local ak = ab('Frame', {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = 'Y',
				Parent = ae.Parent
			}, {
				ab('UIListLayout', {
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Center',
					Padding = UDim.new(0, ai)
				})
			})
			aj.ElementFrame = ak
			local al = ae.ElementsModule
			al.Load(aj, ak, al.Elements, ae.Window, ae.WindUI, nil, al, ae.UIScale, ae.Tab)
			return aj.__type, aj
		end
		return ac
	end
	function a.aA()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local ab, ac = aa(game:GetService'UserInputService'), a.load'd'
		local ad, ae = ac.New, {}
		function ae.New(af, ag)
			local ah, ai, aj, ak, al = {
				__type = 'Viewport',
				Object = ag.Object,
				Camera = ag.Camera or Instance.new'Camera',
				Interactive = ag.Interactive or false,
				Height = ag.Height or 200,
				Focused = ag.Focused ~= false
			}, false, false, 0
			local am = ac.NewRoundFrame(ag.Window.ElementConfig.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 0, ah.Height),
				Parent = ag.Parent,
				ThemeTag = {
					ImageColor3 = 'ViewportBackground',
					ImageTransparency = 'ViewportBackgroundTransparency'
				}
			}, {
				ad('CanvasGroup', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					ad('UICorner', {
						CornerRadius = UDim.new(0, ag.Window.ElementConfig.UICorner)
					}),
					ad('ViewportFrame', {
						Name = 'Viewport',
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						CurrentCamera = ah.Camera,
						Active = ah.Interactive
					}, {
						ah.Object
					})
				})
			})
			local function IsTouchInsideViewport(an)
				local ao, ap = am.CanvasGroup.Viewport.AbsolutePosition, am.CanvasGroup.Viewport.AbsoluteSize
				return an.X >= ao.X and an.X <= ao.X + ap.X and an.Y >= ao.Y and an.Y <= ao.Y + ap.Y
			end
			local an = ag.WindUI.GenerateGUID()
			ac.AddSignal(am.CanvasGroup.Viewport.MouseEnter, function()
				if ah.Interactive then
					ag.Tab.UIElements.ContainerFrame.ScrollingEnabled = false
				end
			end)
			ac.AddSignal(am.CanvasGroup.Viewport.InputEnded, function(ao)
				if ao.UserInputType == Enum.UserInputType.MouseMovement or ao.UserInputType == Enum.UserInputType.Touch then
					ag.Tab.UIElements.ContainerFrame.ScrollingEnabled = true
				end
			end)
			ac.AddSignal(am.CanvasGroup.Viewport.InputBegan, function(ao)
				if ah.Interactive then
					if (ao.UserInputType == Enum.UserInputType.MouseButton1) or (ao.UserInputType == Enum.UserInputType.Touch and not aj) then
						if ag.WindUI.CurrentInput and ag.WindUI.CurrentInput ~= an then
							return
						end
						ag.WindUI.CurrentInput = an
						ai = true
						al = ao.Position
					end
				end
			end)
			ac.AddSignal(ab.InputEnded, function(ao)
				if ah.Interactive then
					if ao.UserInputType == Enum.UserInputType.MouseButton1 or ao.UserInputType == Enum.UserInputType.Touch then
						if ag.WindUI.CurrentInput and ag.WindUI.CurrentInput ~= an then
							return
						end
						ag.WindUI.CurrentInput = nil
						ai = false
					end
				end
			end)
			ac.AddSignal(ab.InputChanged, function(ao)
				if ah.Interactive and ai and not aj then
					if ao.UserInputType == Enum.UserInputType.MouseMovement or ao.UserInputType == Enum.UserInputType.Touch then
						local ap = ao.Position - al
						al = ao.Position
						local aq, ar, as = ah.Object:GetPivot().Position, ah.Camera, CFrame.fromAxisAngle(Vector3.new(0, 1, 0), - ap.X * 0.02)
						ar.CFrame = CFrame.new(aq) * as * CFrame.new(- aq) * ar.CFrame
						local at = CFrame.fromAxisAngle(ar.CFrame.RightVector, - ap.Y * 0.02)
						local au = CFrame.new(aq) * at * CFrame.new(- aq) * ar.CFrame
						if au.UpVector.Y > 0.1 then
							ar.CFrame = au
						end
					end
				end
			end)
			ac.AddSignal(am.CanvasGroup.Viewport.InputChanged, function(ao)
				if ah.Interactive then
					if ao.UserInputType == Enum.UserInputType.MouseWheel then
						local ap = ao.Position.Z * 2
						ah.Camera.CFrame += ah.Camera.CFrame.LookVector * ap
					end
				end
			end)
			ac.AddSignal(ab.TouchPinch, function(ao, ap, aq, ar)
				if not IsTouchInsideViewport(ao[1]) or not IsTouchInsideViewport(ao[2]) then
					return
				end
				if ah.Interactive then
					if ar == Enum.UserInputState.Begin then
						aj = true
						ai = false
						ak = (ao[1] - ao[2]).Magnitude
					elseif ar == Enum.UserInputState.Change then
						if aj then
							local as = (ao[1] - ao[2]).Magnitude
							local at = (as - ak) * 0.03
							ak = as
							ah.Camera.CFrame += ah.Camera.CFrame.LookVector * at
						end
					elseif ar == Enum.UserInputState.End or ar == Enum.UserInputState.Cancel then
						aj = false
					end
				end
			end)
			local function FocusCamera()
				local ao = ah.Object:IsA'BasePart' and ah.Object.Size or select(2, ah.Object:GetBoundingBox(0))
				local ap = math.max(ao.X, ao.Y, ao.Z)
				local aq, ar = ap * 2, ah.Object:GetPivot().Position
				ah.Camera.CFrame = CFrame.new(ar + Vector3.new(0, ap / 2, aq), ar)
			end
			if ah.Focused then
				FocusCamera()
			end
			function ah.SetObject(ao, ap, aq)
				if aq then
					ap = ap:Clone()
				end
				if ah.Object then
					ah.Object:Destroy()
				end
				ah.Object = ap
				ah.Object.Parent = am.CanvasGroup.Viewport
			end
			function ah.SetHeight(ao, ap)
				am.Size = UDim2.new(1, 0, 0, ap)
			end
			function ah.Focus(ao)
				if ah.Object then
					FocusCamera()
				end
			end
			function ah.SetCamera(ao, ap)
				ah.Camera = ap
				am.CanvasGroup.Viewport.CurrentCamera = ap
			end
			function ah.SetInteractive(ao, ap)
				ah.Interactive = ap
				am.CanvasGroup.Viewport.Active = ap
			end
			ah.Main = am
			return ah.__type, ah
		end
		return ae
	end
	function a.aB()
		local aa = a.load'd'
		local ab, ac = aa.New, {}
		local function ParseAspectRatio(ad)
			if type(ad) == 'string' then
				local ae, af = ad:match'(%d+):(%d+)'
				if ae and af then
					return tonumber(ae) / tonumber(af)
				end
			elseif type(ad) == 'number' then
				return ad
			end
			return nil
		end
		function ac.New(ad, ae)
			local af, ag = {
				__type = 'Video',
				Video = ae.Video or '',
				AspectRatio = ae.AspectRatio or '16:9',
				Radius = ae.Radius or ae.Window.ElementConfig.UICorner,
				ElementFrame = nil
			}
			if af.Video then
				local ah
				if string.find(af.Video, 'http') then
					local ai = ae.Window.Folder or 'Temp'
					if makefolder and isfolder then
						if not isfolder(ai) then
							makefolder(ai)
						end
						if not isfolder(ai .. '/assets') then
							makefolder(ai .. '/assets')
						end
					end
					local aj = ai .. '/assets/.' .. aa.SanitizeFilename(af.Video) .. '.webm'
					if not isfile or not isfile(aj) then
						local ak, al = pcall(function()
							local ak = game.HttpGet and game:HttpGet(af.Video) or nil
							if not ak and aa.Request then
								local al = aa.Request{
									Url = af.Video,
									Method = 'GET',
									Headers = {
										['User-Agent'] = 'Roblox/Exploit'
									}
								}
								ak = al and al.Body
							end
							if ak and writefile then
								writefile(aj, ak)
							end
						end)
						if not ak then
							warn('[ Window.Background ] Failed to download video: ' .. tostring(al))
							return
						end
					end
					local ak, al = pcall(function()
						return typeof(getcustomasset) == 'function' and getcustomasset(aj) or aj
					end)
					if not ak then
						warn('[ WindUI.Video ] Failed to load custom asset: ' .. tostring(al))
					end
					ah = al
				else
					ah = af.Video
				end
				ag = ab('VideoFrame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Video = ah,
					Looped = false,
					Volume = 0,
					Parent = ae.Parent
				}, {
					ab('UICorner', {
						CornerRadius = UDim.new(0, af.Radius)
					})
				})
				af.ElementFrame = ag
				ag:Play()
				local ai, aj = (ParseAspectRatio(af.AspectRatio))
				if ai then
					aj = ab('UIAspectRatioConstraint', {
						Parent = ag,
						AspectRatio = ai,
						AspectType = 'ScaleWithParentSize',
						DominantAxis = 'Width'
					})
				end
			end
			function af.Destroy(ah)
				if ag then
					ag:Destroy()
				end
			end
			return af.__type, af
		end
		return ac
	end
	function a.aC()
		local aa = a.load'd'
		return {
			Elements = {
				Paragraph = a.load'J',
				Button = a.load'K',
				Toggle = a.load'N',
				Slider = a.load'O',
				ProgressBar = a.load'P',
				Keybind = a.load'Q',
				Input = a.load'R',
				Dropdown = a.load'U',
				Code = a.load'X',
				Colorpicker = a.load'Y',
				RadioGroup = a.load'_',
				CheckboxGroup = a.load'aa',
				SegmentedControl = a.load'ab',
				TextArea = a.load'ac',
				Stepper = a.load'ad',
				Callout = a.load'ae',
				Badge = a.load'ag',
				StatusCard = a.load'ah',
				StatCard = a.load'ai',
				KeyValue = a.load'aj',
				ChipList = a.load'ak',
				ActionList = a.load'al',
				MeterGroup = a.load'am',
				Timeline = a.load'an',
				Accordion = a.load'ao',
				EmptyState = a.load'ap',
				DiscordCard = a.load'aq',
				TabBox = a.load'ar',
				Path2D = a.load'as',
				Card = a.load'at',
				Section = a.load'au',
				Divider = a.load'S',
				Space = a.load'av',
				Image = a.load'aw',
				Group = a.load'ax',
				HStack = a.load'ay',
				VStack = a.load'az',
				Viewport = a.load'aA',
				Video = a.load'aB'
			},
			Load = function(ab, ac, ad, ae, af, ag, ah, ai, aj)
				for ak, al in next, ad do
					ab[ak] = function(am, an)
						an = an or {}
						an.Tab = aj or ab
						an.ParentType = ab.__type
						an.ParentTable = ab
						an.Index = # ab.Elements + 1
						an.GlobalIndex = # ae.AllElements + 1
						if an.LinkCorners == nil then
							an.LinkCorners = ab.LinkCorners == true or typeof(ab.LinkCorners) == 'table' or (aj and (aj.LinkCorners == true or typeof(aj.LinkCorners) == 'table'))
						end
						if an.CornerLink == nil then
							an.CornerLink = ab.CornerLink or (aj and aj.CornerLink) or ae.ElementConfig.CornerLink
						end
						an.Parent = ac
						an.Window = ae
						an.WindUI = af
						an.UIScale = ai
						an.ElementsModule = ah
						local ao, ap = al:New(an)
						ap.Index = an.Index
						ap.LinkCorners = an.LinkCorners
						ap.CornerGroup = an.CornerGroup or an.LinkCornerGroup
						ap.CornerBreak = an.CornerBreak
						ap.CornerBreakBefore = an.CornerBreakBefore
						ap.CornerBreakAfter = an.CornerBreakAfter
						if an.Flag and typeof(an.Flag) == 'string' then
							if ae.CurrentConfig then
								ae.CurrentConfig:Register(an.Flag, ap)
								if ae.PendingConfigData and ae.PendingConfigData[an.Flag] then
									local aq, ar = ae.PendingConfigData[an.Flag], ae.ConfigManager
									if typeof(aq) == 'table' and ar.Parser[aq.__type] then
										task.defer(function()
											local as, at = pcall(function()
												ar.Parser[aq.__type].Load(ap, aq)
											end)
											if as then
												ae.PendingConfigData[an.Flag] = nil
											else
												warn("[ WindUI ] Failed to apply pending config for '" .. an.Flag .. "': " .. tostring(at))
											end
										end)
									end
								end
							else
								ae.PendingFlags = ae.PendingFlags or {}
								ae.PendingFlags[an.Flag] = ap
							end
						end
						local aq
						for ar, as in next, ap do
							if typeof(as) == 'table' and ar ~= 'ElementFrame' and ar:match'Frame$' then
								aq = as
								break
							end
						end
						if aq then
							ap.ElementFrame = aq.UIElements.Main
							function ap.SetTitle(ar, as)
								return aq.SetTitle and aq:SetTitle(as)
							end
							function ap.SetDesc(ar, as)
								return aq.SetDesc and aq:SetDesc(as)
							end
							function ap.SetImage(ar, as, at)
								return aq.SetImage and aq:SetImage(as, at)
							end
							function ap.SetThumbnail(ar, as, at)
								return aq.SetThumbnail and aq:SetThumbnail(as, at)
							end
							function ap.SetTransparency(ar, as)
								return aq.SetTransparency and aq:SetTransparency(as)
							end
							function ap.SetLiquidGlass(ar, as)
								return aq.SetLiquidGlass and aq:SetLiquidGlass(as)
							end
							function ap.Highlight(ar)
								aq:Highlight()
							end
							function ap.Destroy(ar)
								if ap.Cleanup then
									ap:Cleanup()
								end
								aq:Destroy()
								table.remove(ae.AllElements, an.GlobalIndex)
								table.remove(ab.Elements, an.Index)
								table.remove(aj.Elements, an.Index)
								ab:UpdateAllElementShapes(ab)
							end
						end
						if not ap.ElementFrame and ap.UIElements and ap.UIElements.Main then
							ap.ElementFrame = ap.UIElements.Main
						end
						if not ap.UpdateShape and ap.ElementFrame then
							function ap.UpdateShape(ar)
								local as, at, au = ap.LinkCorners ~= false and (ap.LinkCorners == true or ae.ElementConfig.LinkCorners or (ar and ar.LinkCorners == true)), aa.DefaultCornerMap(), {
									Count = 1
								}
								if as and ar and ar.Elements then
									_, at, au = aa.GetLinkedCornerShape(ar.Elements, ap.Index, ar, ar.__type, an.CornerLink or ae.ElementConfig.CornerLink)
								end
								aa.ApplyLinkedCornerSurface(ap.ElementFrame, UDim.new(0, ae.ElementConfig.UICorner), at, as and au.Count > 1)
							end
						end
						ae.AllElements[an.GlobalIndex] = ap
						ab.Elements[an.Index] = ap
						if aj then
							aj.Elements[an.Index] = ap
						end
						if ae.NewElements then
							ab:UpdateAllElementShapes(ab)
						end
						if ag then
							ag(ap, ab.Elements)
						end
						return ap
					end
				end
				function ab.UpdateAllElementShapes(ak, al)
					for am, an in next, al.Elements do
						local ao
						for ap, aq in pairs(an) do
							if typeof(aq) == 'table' and ap:match'Frame$' then
								ao = aq
								break
							end
						end
						if not ao and an.UpdateShape then
							ao = an
						end
						if ao then
							ao.Index = am
							if ao.UpdateShape then
								ao.UpdateShape(al)
							end
						end
					end
				end
			end
		}
	end
	function a.aD()
		local aa, ab, ac = (cloneref or clonereference or function(aa)
			return aa
		end), game:GetService'Players', game:GetService'TweenService'
		aa(game:GetService'UserInputService')
		local ad, ae, af = ab.LocalPlayer:GetMouse(), a.load'd', a.load'e'
		local ag, ah, ai, aj = ae.New, a.load'G'.New, a.load'z'.New, {
			Tabs = {},
			Containers = {},
			SelectedTab = nil,
			TabCount = 0,
			ToolTipParent = nil,
			TabHighlight = nil,
			OnChangeFunc = function(ag)
			end
		}
		local function GetImageTarget(ak)
			if typeof(ak) ~= 'Instance' then
				return nil
			end
			if ak:IsA'ImageLabel' or ak:IsA'ImageButton' then
				return ak
			end
			return ak:FindFirstChildWhichIsA('ImageLabel', true) or ak:FindFirstChildWhichIsA('ImageButton', true)
		end
		function aj.Init(ak, al, am, an)
			Window = ak
			WindUI = al
			aj.ToolTipParent = am
			aj.TabHighlight = an
			return aj
		end
		function aj.New(ak, al)
			local am, an = Window.TabHolderType == 'top', Window.TabHolderType == 'sidebar' and Window.SidebarCompact == true
			local ao, ap, aq, ar = an, if ak.LinkCorners ~= nil then ak.LinkCorners == true or typeof(ak.LinkCorners) == 'table' else Window.LinkElementCorners == true, ak.CornerLink or (typeof(ak.LinkCorners) == 'table' and ak.LinkCorners) or Window.ElementCornerLink, ak.Gap or ak.ElementGap
			local as = typeof(aq) == 'table' and (aq.Gap or aq.Spacing) or nil
			local at = {
				__type = 'Tab',
				Title = ak.Title or 'Tab',
				Desc = ak.Desc,
				Icon = ak.Icon or (ao and 'circle' or nil),
				Golden = ak.Golden == true or ak.Premium == true,
				Premium = ak.Premium == true or ak.Golden == true,
				IconColor = ak.IconColor or ((ak.Golden == true or ak.Premium == true) and Color3.fromRGB(255, 222, 105) or nil),
				IconShape = ak.IconShape,
				IconThemed = ak.IconThemed,
				Locked = ak.Locked,
				ShowTabTitle = ak.ShowTabTitle,
				TabTitleAlign = ak.TabTitleAlign or 'Left',
				CustomEmptyPage = (ak.CustomEmptyPage and next(ak.CustomEmptyPage) ~= nil) and ak.CustomEmptyPage or {
					Icon = 'lucide:frown',
					IconSize = 48,
					Title = 'This tab is Empty',
					Desc = nil
				},
				Border = ak.Border,
				Selected = false,
				Index = nil,
				Parent = ak.Parent,
				UIElements = {},
				Elements = {},
				ContainerFrame = nil,
				UICorner = if am then 12 else Window.UICorner - (Window.UIPadding / 2),
				HolderType = Window.TabHolderType,
				IconOnly = ao,
				LinkCorners = ap,
				CornerLink = aq,
				Gap = ar or (ap and (tonumber(as) or 1)) or Window.ElementGap or (Window.NewElements and (Window.LiquidGlass and 6 or 1) or 6),
				TabPaddingX = if am then 12 elseif ao then 8 else 4 + (Window.UIPadding / 2),
				TabPaddingY = if am then 7 elseif ao then 8 else 3 + (Window.UIPadding / 2),
				TitlePaddingY = 0
			}
			if at.IconShape then
				at.TabPaddingX = 2 + (Window.UIPadding / 4)
				at.TabPaddingY = 2 + (Window.UIPadding / 4)
				at.TitlePaddingY = 2 + (Window.UIPadding / 4)
			end
			aj.TabCount = aj.TabCount + 1
			local au = aj.TabCount
			at.Index = au
			at.UIElements.Main = ae.NewRoundFrame(at.UICorner, 'Squircle', {
				BackgroundTransparency = 1,
				Size = if am then UDim2.new(0, 0, 0, 36) elseif ao then UDim2.new(1, - 8, 0, 44) else UDim2.new(1, - 7, 0, 0),
				AutomaticSize = if am then Enum.AutomaticSize.X elseif ao then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
				Parent = ak.Parent,
				ThemeTag = {
					ImageColor3 = 'TabBackground'
				},
				ImageTransparency = 1
			}, {
				ae.NewRoundFrame(at.UICorner - 1, 'Glass-1.4', {
					Size = UDim2.new(1, 1, 1, 1),
					ThemeTag = {
						ImageColor3 = 'TabBorder'
					},
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ImageTransparency = 1,
					Name = 'Outline'
				}, {}),
				ae.NewRoundFrame(999, 'Squircle', {
					Name = 'ActiveRail',
					Size = if am then UDim2.new(0, 0, 0, 3) else UDim2.new(0, 3, 0, 0),
					AnchorPoint = if am then Vector2.new(0.5, 1) else Vector2.new(0, 0.5),
					Position = if am then UDim2.new(0.5, 0, 1, - 1) else UDim2.new(0, 2, 0.5, 0),
					ImageTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'Primary'
					}
				}),
				ae.NewRoundFrame(at.UICorner, 'Squircle', {
					Size = if am then UDim2.new(0, 0, 1, 0) elseif ao then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, 0),
					AutomaticSize = if am then Enum.AutomaticSize.X elseif ao then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
					ThemeTag = {
						ImageColor3 = 'Text'
					},
					ImageTransparency = 1,
					Name = 'Frame'
				}, {
					ag('UIListLayout', {
						SortOrder = 'LayoutOrder',
						Padding = UDim.new(0, 2 + (Window.UIPadding / 2)),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = if ao then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left
					}),
					ag('TextLabel', {
						Text = at.Title,
						ThemeTag = not at.Golden and {
							TextColor3 = 'TabTitle'
						} or nil,
						TextColor3 = at.Golden and Color3.fromRGB(255, 232, 144) or nil,
						TextTransparency = not at.Locked and (at.Golden and 0.12 or 0.4) or 0.7,
						TextSize = 15,
						Size = if am then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
						FontFace = Font.new(ae.Font, Enum.FontWeight.Medium),
						TextWrapped = true,
						RichText = true,
						AutomaticSize = if am then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
						Visible = not ao,
						LayoutOrder = 2,
						TextXAlignment = 'Left',
						BackgroundTransparency = 1
					}, {
						ag('UIPadding', {
							PaddingTop = UDim.new(0, at.TitlePaddingY),
							PaddingBottom = UDim.new(0, at.TitlePaddingY)
						})
					}),
					ag('UIPadding', {
						PaddingTop = UDim.new(0, at.TabPaddingY),
						PaddingLeft = UDim.new(0, at.TabPaddingX),
						PaddingRight = UDim.new(0, at.TabPaddingX),
						PaddingBottom = UDim.new(0, at.TabPaddingY)
					})
				})
			}, true)
			if at.Golden then
				at.UIElements.Main.Frame.ImageColor3 = Color3.fromRGB(64, 49, 18)
				at.UIElements.Main.Frame.ImageTransparency = 0.88
				at.UIElements.Main.Outline.ImageColor3 = Color3.fromRGB(255, 214, 92)
				at.UIElements.Main.Outline.ImageTransparency = 0.78
				at.UIElements.GoldenShine = ag('UIGradient', {
					Rotation = 18,
					Offset = Vector2.new(- 1, 0),
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 185, 56)),
						ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 244, 184)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(154, 94, 18))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 0.88),
						NumberSequenceKeypoint.new(0.48, 0.72),
						NumberSequenceKeypoint.new(0.55, 0.18),
						NumberSequenceKeypoint.new(0.64, 0.74),
						NumberSequenceKeypoint.new(1, 0.9)
					},
					Parent = at.UIElements.Main.Frame
				})
				if af:IsEnabled() and not af.Reduced then
					task.spawn(function()
						while at.UIElements.Main and at.UIElements.Main.Parent and at.UIElements.GoldenShine do
							at.UIElements.GoldenShine.Offset = Vector2.new(- 1, 0)
							local av = ac:Create(at.UIElements.GoldenShine, TweenInfo.new(1.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
								Offset = Vector2.new(1, 0)
							})
							av:Play()
							av.Completed:Wait()
							task.wait(1.1)
						end
					end)
				end
			end
			local av, aw, ax = 0
			if at.Icon then
				local ay = tostring(at.Icon) .. ':' .. at.Title
				aw = ae.Image(at.Icon, ay, 0, Window.Folder, at.__type, at.IconColor and false or true, at.IconThemed, 'TabIcon')
				aw.Size = UDim2.fromOffset(ao and 20 or 16, ao and 20 or 16)
				local az = GetImageTarget(aw)
				if at.IconColor and az then
					az.ImageColor3 = at.IconColor
				end
				if not at.IconShape or ao then
					aw.Parent = at.UIElements.Main.Frame
					at.UIElements.Icon = aw
					if az then
						az.ImageTransparency = not at.Locked and 0 or 0.7
					end
					av = - 18 - (Window.UIPadding / 2)
					if not am and not ao then
						at.UIElements.Main.Frame.TextLabel.Size = UDim2.new(1, av, 0, 0)
					end
				elseif at.IconColor then
					ae.NewRoundFrame(at.IconShape ~= 'Circle' and (at.UICorner + 5 - (2 + (Window.UIPadding / 4))) or 9999, 'Squircle', {
						Size = UDim2.new(0, 26, 0, 26),
						ImageColor3 = at.IconColor,
						Parent = at.UIElements.Main.Frame
					}, {
						aw,
						ae.NewRoundFrame(at.IconShape ~= 'Circle' and (at.UICorner + 5 - (2 + (Window.UIPadding / 4))) or 9999, 'Glass-1.4', {
							Size = UDim2.new(1, 0, 1, 0),
							ThemeTag = {
								ImageColor3 = 'White'
							},
							ImageTransparency = 0,
							Name = 'Outline'
						}, {})
					})
					aw.AnchorPoint = Vector2.new(0.5, 0.5)
					aw.Position = UDim2.new(0.5, 0, 0.5, 0)
					if az then
						az.ImageTransparency = 0
						az.ImageColor3 = ae.GetTextColorForHSB(at.IconColor, 0.68)
					end
					av = - 28 - (Window.UIPadding / 2)
					at.UIElements.Main.Frame.TextLabel.Size = UDim2.new(1, av, 0, 0)
				end
				ax = ae.Image(at.Icon, ay, 0, Window.Folder, at.__type, true, at.IconThemed)
				ax.Size = UDim2.new(0, 16, 0, 16)
				local aA = GetImageTarget(ax)
				if aA then
					aA.ImageTransparency = not at.Locked and 0 or 0.7
				end
				av = - 30
			end
			at.UIElements.ContainerFrame = ag('ScrollingFrame', {
				Size = UDim2.new(1, 0, 1, at.ShowTabTitle and - ((Window.UIPadding * 2.4) + 12) or 0),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = 'Never',
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AutomaticCanvasSize = 'Y',
				ScrollingDirection = 'Y'
			}, {
				ag('UIPadding', {
					PaddingTop = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingLeft = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingRight = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingBottom = UDim.new(0, not Window.HidePanelBackground and 20 or 10)
				}),
				ag('UIListLayout', {
					SortOrder = 'LayoutOrder',
					Padding = UDim.new(0, at.Gap),
					HorizontalAlignment = 'Center'
				})
			})
			at.UIElements.ContainerFrameCanvas = ag('CanvasGroup', {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				GroupTransparency = 1,
				Visible = false,
				Parent = Window.UIElements.MainBar,
				ZIndex = 5
			}, {
				at.UIElements.ContainerFrame,
				ag('Frame', {
					Size = UDim2.new(1, - 14, 1, - 14),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Name = 'ScrollSliderHolder'
				}),
				ag('Frame', {
					Size = UDim2.new(1, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					BackgroundTransparency = 1,
					Visible = at.ShowTabTitle or false,
					Name = 'TabTitle'
				}, {
					ax,
					ag('TextLabel', {
						Text = at.Title,
						ThemeTag = {
							TextColor3 = 'Text'
						},
						TextSize = 20,
						TextTransparency = 0.1,
						Size = UDim2.new(0, 0, 1, 0),
						FontFace = Font.new(ae.Font, Enum.FontWeight.SemiBold),
						RichText = true,
						LayoutOrder = 2,
						TextXAlignment = 'Left',
						BackgroundTransparency = 1,
						AutomaticSize = 'X'
					}),
					ag('UIPadding', {
						PaddingTop = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 20)
					}),
					ag('UIListLayout', {
						SortOrder = 'LayoutOrder',
						Padding = UDim.new(0, 10),
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						HorizontalAlignment = at.TabTitleAlign
					})
				}),
				ag('Frame', {
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundTransparency = 0.9,
					ThemeTag = {
						BackgroundColor3 = 'Text'
					},
					Position = UDim2.new(0, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					Visible = at.ShowTabTitle or false
				})
			})
			aj.Containers[au] = at.UIElements.ContainerFrameCanvas
			aj.Tabs[au] = at
			at.ContainerFrame = at.UIElements.ContainerFrameCanvas
			ae.AddSignal(at.UIElements.Main.MouseButton1Click, function()
				if not at.Locked then
					aj:SelectTab(au)
				end
			end)
			af.AttachPress(at.UIElements.Main, ae, {
				Amount = 0.985
			})
			if Window.ScrollBarEnabled then
				ai(at.UIElements.ContainerFrame, at.UIElements.ContainerFrameCanvas.ScrollSliderHolder, Window, 4, WindUI)
			end
			local ay, az, aA, aB, aC = if ao then at.Desc or at.Title else at.Desc, false
			if ay then
				ae.AddSignal(at.UIElements.Main.InputBegan, function()
					az = true
					aB = task.spawn(function()
						task.wait(0.35)
						if az and not aA then
							aA = ah(ay, aj.ToolTipParent, true)
							aA.Container.AnchorPoint = Vector2.new(0.5, 0.5)
							local function updatePosition()
								if aA then
									aA.Container.Position = UDim2.new(0, ad.X, 0, ad.Y - 4)
								end
							end
							updatePosition()
							aC = ad.Move:Connect(updatePosition)
							aA:Open()
						end
					end)
				end)
			end
			ae.AddSignal(at.UIElements.Main.MouseEnter, function()
				if not at.Locked and not at.Selected then
					ae.SetThemeTag(at.UIElements.Main.Frame, {
						ImageTransparency = 'TabBackgroundHoverTransparency',
						ImageColor3 = 'TabBackgroundHover'
					}, 0.1)
				end
			end)
			ae.AddSignal(at.UIElements.Main.MouseLeave, function()
				if not at.Locked and not at.Selected then
					af.Play(at.UIElements.Main.Frame, 'Hover', {
						ImageTransparency = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'TabHover')
				end
			end)
			ae.AddSignal(at.UIElements.Main.InputEnded, function()
				if ay then
					az = false
					if aB then
						task.cancel(aB)
						aB = nil
					end
					if aC then
						aC:Disconnect()
						aC = nil
					end
					if aA then
						aA:Close()
						aA = nil
					end
				end
				if not at.Locked and not at.Selected then
					af.Play(at.UIElements.Main.Frame, 'Hover', {
						ImageTransparency = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'TabHover')
				end
			end)
			function at.ScrollToTheElement(aD, aE)
				at.UIElements.ContainerFrame.ScrollingEnabled = false
				af.Play(at.UIElements.ContainerFrame, 'Resize', {
					CanvasPosition = Vector2.new(0, at.Elements[aE].ElementFrame.AbsolutePosition.Y - at.UIElements.ContainerFrame.AbsolutePosition.Y - at.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'ScrollToElement')
				task.spawn(function()
					task.wait(af.GetDuration'Resize' + 0.03)
					if at.Elements[aE].Highlight then
						at.Elements[aE]:Highlight()
					end
					at.UIElements.ContainerFrame.ScrollingEnabled = true
				end)
				return at
			end
			local aD = a.load'aC'
			aD.Load(at, at.UIElements.ContainerFrame, aD.Elements, Window, WindUI, nil, aD, al, at)
			function at.LockAll(aE)
				for aF, aG in next, Window.AllElements do
					if aG.Tab and aG.Tab.Index and aG.Tab.Index == at.Index and aG.Lock then
						aG:Lock()
					end
				end
			end
			function at.UnlockAll(aE)
				for aF, aG in next, Window.AllElements do
					if aG.Tab and aG.Tab.Index and aG.Tab.Index == at.Index and aG.Unlock then
						aG:Unlock()
					end
				end
			end
			function at.GetLocked(aE)
				local aF = {}
				for aG, aH in next, Window.AllElements do
					if aH.Tab and aH.Tab.Index and aH.Tab.Index == at.Index and aH.Locked == true then
						table.insert(aF, aH)
					end
				end
				return aF
			end
			function at.GetUnlocked(aE)
				local aF = {}
				for aG, aH in next, Window.AllElements do
					if aH.Tab and aH.Tab.Index and aH.Tab.Index == at.Index and aH.Locked == false then
						table.insert(aF, aH)
					end
				end
				return aF
			end
			function at.Select(aE)
				return aj:SelectTab(at.Index)
			end
			task.spawn(function()
				local aE
				if at.CustomEmptyPage.Icon then
					aE = ae.Image(at.CustomEmptyPage.Icon, at.CustomEmptyPage.Icon, 0, 'Temp', 'EmptyPage', true)
					aE.Size = UDim2.fromOffset(at.CustomEmptyPage.IconSize or 48, at.CustomEmptyPage.IconSize or 48)
				end
				local aF, aG = (ag('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, - Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
					Parent = at.UIElements.ContainerFrame
				}, {
					ag('UIListLayout', {
						Padding = UDim.new(0, 8),
						SortOrder = 'LayoutOrder',
						VerticalAlignment = 'Center',
						HorizontalAlignment = 'Center',
						FillDirection = 'Vertical'
					}),
					aE,
					at.CustomEmptyPage.Title and ag('TextLabel', {
						AutomaticSize = 'XY',
						Text = at.CustomEmptyPage.Title,
						ThemeTag = {
							TextColor3 = 'Text'
						},
						TextSize = 18,
						TextTransparency = 0.5,
						BackgroundTransparency = 1,
						FontFace = Font.new(ae.Font, Enum.FontWeight.Medium)
					}) or nil,
					at.CustomEmptyPage.Desc and ag('TextLabel', {
						AutomaticSize = 'XY',
						Text = at.CustomEmptyPage.Desc,
						ThemeTag = {
							TextColor3 = 'Text'
						},
						TextSize = 15,
						TextTransparency = 0.65,
						BackgroundTransparency = 1,
						FontFace = Font.new(ae.Font, Enum.FontWeight.Regular)
					}) or nil
				}))
				aG = ae.AddSignal(at.UIElements.ContainerFrame.ChildAdded, function()
					aF.Visible = false
					aG:Disconnect()
				end)
			end)
			return at
		end
		function aj.OnChange(ak, al)
			aj.OnChangeFunc = al
		end
		local function ApplyGoldenTabVisual(ak, al)
			if not ak or not ak.Golden then
				return
			end
			local am = ak.UIElements and ak.UIElements.Main and ak.UIElements.Main.Frame and ak.UIElements.Main.Frame.TextLabel
			if am then
				am.TextColor3 = al and Color3.fromRGB(255, 244, 184) or Color3.fromRGB(255, 224, 120)
				am.TextTransparency = al and 0 or 0.12
			end
			local an = ak.UIElements and ak.UIElements.Icon and GetImageTarget(ak.UIElements.Icon)
			if an then
				an.ImageColor3 = ak.IconColor or Color3.fromRGB(255, 222, 105)
				an.ImageTransparency = al and 0 or 0.08
			end
			local ao = ak.UIElements and ak.UIElements.Main and ak.UIElements.Main.Outline
			if ao then
				ao.ImageColor3 = al and Color3.fromRGB(255, 232, 132) or Color3.fromRGB(255, 214, 92)
				ao.ImageTransparency = al and 0.58 or 0.78
			end
		end
		local function ApplyTabMotionVisual(ak, al)
			if not ak or not ak.UIElements or not ak.UIElements.Main then
				return
			end
			local am = ak.UIElements.Main.ActiveRail
			if am then
				if ak.Golden then
					am.ImageColor3 = al and Color3.fromRGB(255, 232, 132) or Color3.fromRGB(255, 214, 92)
				end
				local an
				if ak.HolderType == 'top' then
					an = al and UDim2.new(1, - 16, 0, 3) or UDim2.new(0, 0, 0, 3)
				else
					an = al and UDim2.new(0, 3, 1, - 12) or UDim2.new(0, 3, 0, 0)
				end
				af.Play(am, 'Switch', {
					Size = an,
					ImageTransparency = al and 0.08 or 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'TabRail')
			end
			if not al and ak.UIElements.Main.Frame then
				af.Play(ak.UIElements.Main.Frame, 'Hover', {
					ImageTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'TabHover')
			end
		end
		function aj.SelectTab(ak, al)
			local am = aj.Tabs[al]
			if am and not am.Locked and aj.SelectedTab ~= al then
				aj.SelectedTab = al
				for an, ao in next, aj.Tabs do
					if not ao.Locked then
						ae.SetThemeTag(ao.UIElements.Main, {
							ImageTransparency = 'TabBorderTransparency'
						}, 0.15)
						if ao.Border then
							ae.SetThemeTag(ao.UIElements.Main.Outline, {
								ImageTransparency = 'TabBorderTransparency'
							}, 0.15)
						end
						ae.SetThemeTag(ao.UIElements.Main.Frame.TextLabel, {
							TextTransparency = 'TabTextTransparency'
						}, 0.15)
						local ap = ao.UIElements.Icon and GetImageTarget(ao.UIElements.Icon)
						if ap and not ao.IconColor then
							ae.SetThemeTag(ap, {
								ImageTransparency = 'TabIconTransparency'
							}, 0.15)
						end
						ao.Selected = false
						ApplyGoldenTabVisual(ao, false)
						ApplyTabMotionVisual(ao, false)
					end
				end
				ae.SetThemeTag(am.UIElements.Main, {
					ImageColor3 = 'TabBackgroundActive',
					ImageTransparency = 'TabBackgroundActiveTransparency'
				}, 0.15)
				if am.Border then
					ae.SetThemeTag(am.UIElements.Main.Outline, {
						ImageTransparency = 'TabBorderTransparencyActive'
					}, 0.15)
				end
				ae.SetThemeTag(am.UIElements.Main.Frame.TextLabel, {
					TextTransparency = 'TabTextTransparencyActive'
				}, 0.15)
				local an = am.UIElements.Icon and GetImageTarget(am.UIElements.Icon)
				if an and not am.IconColor then
					ae.SetThemeTag(an, {
						ImageTransparency = 'TabIconTransparencyActive'
					}, 0.15)
				end
				am.Selected = true
				ApplyGoldenTabVisual(am, true)
				ApplyTabMotionVisual(am, true)
				task.spawn(function()
					local ao = aj.Containers[al]
					for ap, aq in next, aj.Containers do
						if aq ~= ao then
							aq.AnchorPoint = Vector2.new(0, 0.035)
							aq.GroupTransparency = 1
							aq.Visible = false
						end
					end
					ao.AnchorPoint = Vector2.new(0, 0.035)
					ao.GroupTransparency = 1
					ao.Visible = true
					af.Play(ao, 'Switch', {
						AnchorPoint = Vector2.new(0, 0),
						GroupTransparency = 0
					}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 'Select')
				end)
				aj.OnChangeFunc(al)
			end
		end
		return aj
	end
	function a.aE()
		local aa, ab = {}, a.load'd'
		local ac, ad, ae = ab.New, ab.Tween, a.load'aD'
		function aa.New(af, ag, ah, ai, aj)
			local ak, al = {
				Title = af.Title or 'Section',
				Icon = af.Icon,
				IconThemed = af.IconThemed,
				Opened = af.Opened or false,
				HeaderSize = 42,
				IconSize = 18,
				Expandable = false
			}
			if ak.Icon then
				al = ab.Image(ak.Icon, ak.Icon, 0, ah, 'Section', true, ak.IconThemed, 'TabSectionIcon')
				al.Size = UDim2.new(0, ak.IconSize, 0, ak.IconSize)
				al.ImageLabel.ImageTransparency = 0.25
			end
			local am = ac('Frame', {
				Size = UDim2.new(0, ak.IconSize, 0, ak.IconSize),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				ac('ImageLabel', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = ab.Icon'chevron-down'[1],
					ImageRectSize = ab.Icon'chevron-down'[2].ImageRectSize,
					ImageRectOffset = ab.Icon'chevron-down'[2].ImageRectPosition,
					ThemeTag = {
						ImageColor3 = 'Icon'
					},
					ImageTransparency = 0.7
				})
			})
			local an = ac('Frame', {
				Size = UDim2.new(1, 0, 0, ak.HeaderSize),
				BackgroundTransparency = 1,
				Parent = ag,
				ClipsDescendants = true
			}, {
				ac('TextButton', {
					Size = UDim2.new(1, 0, 0, ak.HeaderSize),
					BackgroundTransparency = 1,
					Text = ''
				}, {
					al,
					ac('TextLabel', {
						Text = ak.Title,
						TextXAlignment = 'Left',
						Size = UDim2.new(1, al and (- ak.IconSize - 10) * 2 or (- ak.IconSize - 10), 1, 0),
						ThemeTag = {
							TextColor3 = 'Text'
						},
						FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
						TextSize = 14,
						BackgroundTransparency = 1,
						TextTransparency = 0.7,
						TextWrapped = true
					}),
					ac('UIListLayout', {
						FillDirection = 'Horizontal',
						VerticalAlignment = 'Center',
						Padding = UDim.new(0, 10)
					}),
					am,
					ac('UIPadding', {
						PaddingLeft = UDim.new(0, 11),
						PaddingRight = UDim.new(0, 11)
					})
				}),
				ac('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					Name = 'Content',
					Visible = true,
					Position = UDim2.new(0, 0, 0, ak.HeaderSize)
				}, {
					ac('UIListLayout', {
						FillDirection = 'Vertical',
						Padding = UDim.new(0, aj.Gap),
						VerticalAlignment = 'Bottom'
					})
				})
			})
			function ak.Tab(ao, ap)
				if not ak.Expandable then
					ak.Expandable = true
					am.Visible = true
				end
				ap.Parent = an.Content
				return ae.New(ap, ai)
			end
			function ak.Open(ao)
				if ak.Expandable then
					ak.Opened = true
					ad(an, 0.33, {
						Size = UDim2.new(1, 0, 0, ak.HeaderSize + (an.Content.AbsoluteSize.Y / ai))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					ad(am.ImageLabel, 0.1, {
						Rotation = 180
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			function ak.Close(ao)
				if ak.Expandable then
					ak.Opened = false
					ad(an, 0.26, {
						Size = UDim2.new(1, 0, 0, ak.HeaderSize)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					ad(am.ImageLabel, 0.1, {
						Rotation = 0
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			ab.AddSignal(an.TextButton.MouseButton1Click, function()
				if ak.Expandable then
					if ak.Opened then
						ak:Close()
					else
						ak:Open()
					end
				end
			end)
			ab.AddSignal(an.Content.UIListLayout:GetPropertyChangedSignal'AbsoluteContentSize', function()
				if ak.Opened then
					ak:Open()
				end
			end)
			if ak.Opened then
				task.spawn(function()
					task.wait()
					ak:Open()
				end)
			end
			return ak
		end
		return aa
	end
	function a.aF()
		return {
			Tab = 'table-of-contents',
			Paragraph = 'type',
			Button = 'square-mouse-pointer',
			Toggle = 'toggle-right',
			Slider = 'sliders-horizontal',
			Keybind = 'command',
			Input = 'text-cursor-input',
			Dropdown = 'chevrons-up-down',
			Code = 'terminal',
			Colorpicker = 'palette'
		}
	end
	function a.aG()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		aa(game:GetService'UserInputService')
		local ab, ac = {
			Margin = 8,
			Padding = 9
		}, a.load'd'
		local ad, ae = ac.New, ac.Tween
		function ab.new(af, ag, ah)
			local ai = {
				IconSize = 18,
				Padding = 14,
				Radius = 22,
				Width = 400,
				MaxHeight = 380,
				Icons = a.load'aF'
			}
			local aj, ak, al = ad('TextBox', {
				Text = '',
				PlaceholderText = 'Search...',
				ThemeTag = {
					PlaceholderColor3 = 'Placeholder',
					TextColor3 = 'Text'
				},
				Size = UDim2.new(1, - ((ai.IconSize * 2) + (ai.Padding * 2)), 0, 0),
				AutomaticSize = 'Y',
				ClipsDescendants = true,
				ClearTextOnFocus = false,
				BackgroundTransparency = 1,
				TextXAlignment = 'Left',
				FontFace = Font.new(ac.Font, Enum.FontWeight.Regular),
				TextSize = 18
			}), ad('ImageLabel', {
				Image = ac.Icon'x'[1],
				ImageRectSize = ac.Icon'x'[2].ImageRectSize,
				ImageRectOffset = ac.Icon'x'[2].ImageRectPosition,
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = 'Icon'
				},
				ImageTransparency = 0.1,
				Size = UDim2.new(0, ai.IconSize, 0, ai.IconSize)
			}, {
				ad('TextButton', {
					Size = UDim2.new(1, 8, 1, 8),
					BackgroundTransparency = 1,
					Active = true,
					ZIndex = 999999999,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Text = ''
				})
			}), ad('ScrollingFrame', {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticCanvasSize = 'Y',
				ScrollingDirection = 'Y',
				ElasticBehavior = 'Never',
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				ad('UIListLayout', {
					Padding = UDim.new(0, 0),
					FillDirection = 'Vertical'
				}),
				ad('UIPadding', {
					PaddingTop = UDim.new(0, ai.Padding),
					PaddingLeft = UDim.new(0, ai.Padding),
					PaddingRight = UDim.new(0, ai.Padding),
					PaddingBottom = UDim.new(0, ai.Padding)
				})
			})
			local am = ac.NewRoundFrame(ai.Radius, 'Squircle', {
				Size = UDim2.new(1, 0, 1, 0),
				ThemeTag = {
					ImageColor3 = 'WindowSearchBarBackground'
				},
				ImageTransparency = 0
			}, {
				ac.NewRoundFrame(ai.Radius, 'Squircle', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Visible = false,
					ThemeTag = {
						ImageColor3 = 'White'
					},
					ImageTransparency = 1,
					Name = 'Frame'
				}, {
					ad('Frame', {
						Size = UDim2.new(1, 0, 0, 46),
						BackgroundTransparency = 1
					}, {
						ad('Frame', {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1
						}, {
							ad('ImageLabel', {
								Image = ac.Icon'search'[1],
								ImageRectSize = ac.Icon'search'[2].ImageRectSize,
								ImageRectOffset = ac.Icon'search'[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = 'Icon'
								},
								ImageTransparency = 0.1,
								Size = UDim2.new(0, ai.IconSize, 0, ai.IconSize)
							}),
							aj,
							ak,
							ad('UIListLayout', {
								Padding = UDim.new(0, ai.Padding),
								FillDirection = 'Horizontal',
								VerticalAlignment = 'Center'
							}),
							ad('UIPadding', {
								PaddingLeft = UDim.new(0, ai.Padding),
								PaddingRight = UDim.new(0, ai.Padding)
							})
						})
					}),
					ad('Frame', {
						BackgroundTransparency = 1,
						AutomaticSize = 'Y',
						Size = UDim2.new(1, 0, 0, 0),
						Name = 'Results'
					}, {
						ad('Frame', {
							Size = UDim2.new(1, 0, 0, 1),
							ThemeTag = {
								BackgroundColor3 = 'Outline'
							},
							BackgroundTransparency = 0.9,
							Visible = false
						}),
						al,
						ad('UISizeConstraint', {
							MaxSize = Vector2.new(ai.Width, ai.MaxHeight)
						})
					}),
					ad('UIListLayout', {
						Padding = UDim.new(0, 0),
						FillDirection = 'Vertical'
					})
				})
			})
			local an = ad('Frame', {
				Size = UDim2.new(0, ai.Width, 0, 0),
				AutomaticSize = 'Y',
				Parent = ag,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Visible = false,
				ZIndex = 99999999
			}, {
				ad('UIScale', {
					Scale = 0.9
				}),
				am
			})
			local function CreateSearchTab(ao, ap, aq, ar, as, at)
				local au = ad('TextButton', {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					BackgroundTransparency = 1,
					Parent = ar or nil
				}, {
					ac.NewRoundFrame(ai.Radius - 11, 'Squircle', {
						Size = UDim2.new(1, 0, 0, 0),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ThemeTag = {
							ImageColor3 = 'Text'
						},
						ImageTransparency = 1,
						Name = 'Main'
					}, {
						ac.NewRoundFrame(ai.Radius - 11, 'Glass-1', {
							Size = UDim2.new(1, 0, 1, 0),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5),
							ThemeTag = {
								ImageColor3 = 'White'
							},
							ImageTransparency = 1,
							Name = 'Outline'
						}, {
							ad('UIPadding', {
								PaddingTop = UDim.new(0, ai.Padding - 2),
								PaddingLeft = UDim.new(0, ai.Padding),
								PaddingRight = UDim.new(0, ai.Padding),
								PaddingBottom = UDim.new(0, ai.Padding - 2)
							}),
							ad('ImageLabel', {
								Image = ac.Icon(aq)[1],
								ImageRectSize = ac.Icon(aq)[2].ImageRectSize,
								ImageRectOffset = ac.Icon(aq)[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = 'Icon'
								},
								ImageTransparency = 0.1,
								Size = UDim2.new(0, ai.IconSize, 0, ai.IconSize)
							}),
							ad('Frame', {
								Size = UDim2.new(1, - ai.IconSize - ai.Padding, 0, 0),
								BackgroundTransparency = 1
							}, {
								ad('TextLabel', {
									Text = ao,
									ThemeTag = {
										TextColor3 = 'Text'
									},
									TextSize = 17,
									BackgroundTransparency = 1,
									TextXAlignment = 'Left',
									FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = 'AtEnd',
									AutomaticSize = 'Y',
									Name = 'Title'
								}),
								ad('TextLabel', {
									Text = ap or '',
									Visible = ap and true or false,
									ThemeTag = {
										TextColor3 = 'Text'
									},
									TextSize = 15,
									TextTransparency = 0.3,
									BackgroundTransparency = 1,
									TextXAlignment = 'Left',
									FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = 'AtEnd',
									AutomaticSize = 'Y',
									Name = 'Desc'
								}) or nil,
								ad('UIListLayout', {
									Padding = UDim.new(0, 6),
									FillDirection = 'Vertical'
								})
							}),
							ad('UIListLayout', {
								Padding = UDim.new(0, ai.Padding),
								FillDirection = 'Horizontal'
							})
						})
					}, true),
					ad('Frame', {
						Name = 'ParentContainer',
						Size = UDim2.new(1, - ai.Padding, 0, 0),
						AutomaticSize = 'Y',
						BackgroundTransparency = 1,
						Visible = as
					}, {
						ac.NewRoundFrame(99, 'Squircle', {
							Size = UDim2.new(0, 2, 1, 0),
							BackgroundTransparency = 1,
							ThemeTag = {
								ImageColor3 = 'Text'
							},
							ImageTransparency = 0.9
						}),
						ad('Frame', {
							Size = UDim2.new(1, - ai.Padding - 2, 0, 0),
							Position = UDim2.new(0, ai.Padding + 2, 0, 0),
							BackgroundTransparency = 1
						}, {
							ad('UIListLayout', {
								Padding = UDim.new(0, 0),
								FillDirection = 'Vertical'
							})
						})
					}),
					ad('UIListLayout', {
						Padding = UDim.new(0, 0),
						FillDirection = 'Vertical',
						HorizontalAlignment = 'Right'
					})
				})
				au.Main.Size = UDim2.new(1, 0, 0, au.Main.Outline.Frame.Desc.Visible and (((ai.Padding - 2) * 2) + au.Main.Outline.Frame.Title.TextBounds.Y + 6 + au.Main.Outline.Frame.Desc.TextBounds.Y) or (((ai.Padding - 2) * 2) + au.Main.Outline.Frame.Title.TextBounds.Y))
				ac.AddSignal(au.Main.MouseEnter, function()
					ae(au.Main, 0.04, {
						ImageTransparency = 0.95
					}):Play()
				end)
				ac.AddSignal(au.Main.InputEnded, function()
					ae(au.Main, 0.08, {
						ImageTransparency = 1
					}):Play()
				end)
				ac.AddSignal(au.Main.MouseButton1Click, function()
					if at then
						at()
					end
				end)
				return au
			end
			local function ContainsText(ao, ap)
				if not ap or ap == '' then
					return false
				end
				if not ao or ao == '' then
					return false
				end
				local aq, ar = string.lower(ao), string.lower(ap)
				return string.find(aq, ar, 1, true) ~= nil
			end
			local function Search(ao)
				if not ao or ao == '' then
					return {}
				end
				local ap = {}
				for aq, ar in next, af.Tabs do
					local as, at = ContainsText(ar.Title or '', ao), {}
					for au, av in next, ar.Elements do
						if av.__type ~= 'Section' then
							local aw, ax = ContainsText(av.Title or '', ao), ContainsText(av.Desc or '', ao)
							if aw or ax then
								at[au] = {
									Title = av.Title,
									Desc = av.Desc,
									Original = av,
									__type = av.__type,
									Index = au
								}
							end
						end
					end
					if as or next(at) ~= nil then
						ap[aq] = {
							Tab = ar,
							Title = ar.Title,
							Icon = ar.Icon,
							Elements = at
						}
					end
				end
				return ap
			end
			ac.AddSignal(al.UIListLayout:GetPropertyChangedSignal'AbsoluteContentSize', function()
				ae(al, 0.06, {
					Size = UDim2.new(1, 0, 0, math.clamp(al.UIListLayout.AbsoluteContentSize.Y + (ai.Padding * 2), 0, ai.MaxHeight))
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
			end)
			function ai.Open(ao)
				task.spawn(function()
					am.Frame.Visible = true
					an.Visible = true
					ae(an.UIScale, 0.12, {
						Scale = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end)
			end
			function ai.Close(ao, ap)
				task.spawn(function()
					ah()
					am.Frame.Visible = false
					ae(an.UIScale, 0.12, {
						Scale = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					task.wait(0.12)
					an.Visible = false
					if ap then
						an:Destroy()
					end
				end)
			end
			ac.AddSignal(ak.TextButton.MouseButton1Click, function()
				ai:Close(true)
			end)
			ai:Open()
			function ai.Search(ao, ap)
				ap = ap or ''
				local aq = Search(ap)
				al.Visible = true
				am.Frame.Results.Frame.Visible = true
				for ar, as in next, al:GetChildren() do
					if as.ClassName ~= 'UIListLayout' and as.ClassName ~= 'UIPadding' then
						as:Destroy()
					end
				end
				if aq and next(aq) ~= nil then
					for ar, as in next, aq do
						local at = ai.Icons.Tab
						local au = CreateSearchTab(as.Title, nil, at, al, true, function()
							ai:Close()
							af:SelectTab(ar)
						end)
						if as.Elements and next(as.Elements) ~= nil then
							for av, aw in next, as.Elements do
								local ax = ai.Icons[aw.__type]
								CreateSearchTab(aw.Title, aw.Desc, ax, au:FindFirstChild'ParentContainer' and au.ParentContainer.Frame or nil, false, function()
									ai:Close()
									af:SelectTab(ar)
									if as.Tab.ScrollToTheElement then
										as.Tab:ScrollToTheElement(aw.Index)
									end
								end)
							end
						end
					end
				elseif ap ~= '' then
					ad('TextLabel', {
						Size = UDim2.new(1, 0, 0, 70),
						Text = 'No results found',
						TextSize = 16,
						ThemeTag = {
							TextColor3 = 'Text'
						},
						TextTransparency = 0.2,
						BackgroundTransparency = 1,
						FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
						Parent = al,
						Name = 'NotFound'
					})
				else
					al.Visible = false
					am.Frame.Results.Frame.Visible = false
				end
			end
			ac.AddSignal(aj:GetPropertyChangedSignal'Text', function()
				ai:Search(aj.Text)
			end)
			return ai
		end
		return ab
	end
	function a.aH()
		local aa = (cloneref or clonereference or function(aa)
			return aa
		end)
		local ab, ac, ad, ae, af, ag, ah = aa(game:GetService'UserInputService'), aa(game:GetService'RunService'), aa(game:GetService'Players'), workspace.CurrentCamera, a.load'v', a.load'd', a.load'e'
		local ai, aj, ak, al, am, an, ao = ag.New, ag.Tween, a.load'y'.New, a.load'n'.New, a.load'z'.New, a.load'A', a.load'B'
		return function(ap)
			local aq, ar = ap.Default == true or ap.Preset == 'Default' or ap.Preset == 'Obsidian', ap.SideBarWidth ~= nil
			local function Pick(as, at)
				if as ~= nil then
					return as
				end
				return at
			end
			local function PickAlias(as, at, au)
				if as ~= nil then
					return as
				end
				if at ~= nil then
					return at
				end
				return au
			end
			if aq then
				ap.NewElements = Pick(ap.NewElements, true)
				ap.LiquidGlass = PickAlias(ap.LiquidGlass, ap.GlassLiquid, true)
				ap.HideSearchBar = Pick(ap.HideSearchBar, false)
				ap.LinkElementCorners = PickAlias(ap.LinkElementCorners, ap.ElementsLinkCorners, true)
				ap.CornerLink = ap.CornerLink or ap.LinkedCornerOptions or (typeof(ap.LinkElementCorners) == 'table' and ap.LinkElementCorners) or (typeof(ap.ElementsLinkCorners) == 'table' and ap.ElementsLinkCorners) or {
					InnerRadius = 0,
					BridgeHidden = true
				}
				local as = typeof(ap.CornerLink) == 'table' and (ap.CornerLink.Gap or ap.CornerLink.Spacing)
				ap.ElementGap = PickAlias(ap.ElementGap, ap.ElementsGap, ap.LinkElementCorners and (tonumber(as) or 1) or 8)
				ap.ElementTransparency = PickAlias(ap.ElementTransparency, ap.ElementsTransparency, 0.18)
				ap.BackgroundOverlayTransparency = Pick(ap.BackgroundOverlayTransparency, 0.5)
				ap.BackgroundColor = Pick(ap.BackgroundColor, Color3.fromHex'#101821')
				ap.Radius = Pick(ap.Radius, 20)
				ap.SideBarWidth = Pick(ap.SideBarWidth, 210)
				ap.Topbar = ap.Topbar or {
					Height = 48,
					ButtonsType = 'Mac'
				}
			end
			local as = tostring(ap.TabHolderType or ap.TabHolder or 'sidebar'):lower():gsub('[%s_%-]', '')
			local at, au = as == 'compact' or as == 'sidebarcompact' or as == 'icon' or as == 'icononly', if as == 'top' or as == 'horizontal' then 'top' else 'sidebar'
			local av = au == 'sidebar' and (at or ap.SidebarCompact == true or ap.SideBarCompact == true or ap.CompactSidebar == true)
			local aw = if av then (ap.CompactSideBarWidth or (ar and ap.SideBarWidth or 68)) else (ap.SideBarWidth or 200)
			local ax = {
				Title = ap.Title or 'UI Library',
				Author = ap.Author,
				Icon = ap.Icon,
				IconSize = ap.IconSize or 22,
				IconThemed = ap.IconThemed,
				IconRadius = ap.IconRadius or 0,
				Folder = ap.Folder,
				Resizable = ap.Resizable ~= false,
				Background = ap.Background or ap.BackgroundImage,
				BackgroundColor = ap.BackgroundColor,
				BackgroundGradient = ap.BackgroundGradient,
				BackgroundImageTransparency = ap.BackgroundImageTransparency or 0,
				BackgroundOverlayTransparency = ap.BackgroundOverlayTransparency or 0.62,
				BackgroundScaleType = ap.BackgroundScaleType or 'Crop',
				ShadowTransparency = ap.ShadowTransparency or 0.6,
				User = ap.User or {},
				Footer = ap.Footer or {},
				Topbar = ap.Topbar or {
					Height = 52,
					ButtonsType = 'Default'
				},
				Size = ap.Size,
				MinSize = ap.MinSize or Vector2.new(560, 350),
				MaxSize = ap.MaxSize or Vector2.new(850, 560),
				TopBarButtonIconSize = ap.TopBarButtonIconSize,
				ToggleKey = ap.ToggleKey,
				ElementsRadius = ap.ElementsRadius,
				Radius = ap.Radius or 16,
				Transparent = ap.Transparent or false,
				ElementTransparency = ap.ElementTransparency or ap.ElementsTransparency,
				ElementGlassTransparency = ap.ElementGlassTransparency or ap.GlassTransparency,
				LiquidGlass = ap.LiquidGlass or ap.GlassLiquid or ap.ElementGlass or false,
				ElementCornerStyle = ap.ElementCornerStyle or ap.ElementsCornerStyle or ap.CornerStyle,
				ElementGap = ap.ElementGap or ap.ElementsGap,
				LinkElementCorners = ap.LinkElementCorners == true or ap.ElementsLinkCorners == true or typeof(ap.LinkElementCorners) == 'table' or typeof(ap.ElementsLinkCorners) == 'table',
				ElementCornerLink = ap.CornerLink or ap.LinkedCornerOptions or (typeof(ap.LinkElementCorners) == 'table' and ap.LinkElementCorners) or (typeof(ap.ElementsLinkCorners) == 'table' and ap.ElementsLinkCorners),
				Watermark = ap.Watermark ~= nil and ap.Watermark or ap.WaterMark,
				KeyBindMenu = ap.KeyBindMenu == false and false or (ap.KeyBindMenu or {}),
				HideSearchBar = ap.HideSearchBar ~= false or av,
				ScrollBarEnabled = ap.ScrollBarEnabled or false,
				SideBarWidth = aw,
				TabHolderType = au,
				SidebarCompact = av,
				TopTabHeight = math.max(tonumber(ap.TopTabHeight or ap.TabHolderHeight) or 48, 38),
				Acrylic = ap.Acrylic or false,
				NewElements = ap.NewElements or false,
				Motion = ap.Motion,
				Settings = ap.Settings == false and false or (ap.Settings or {}),
				IgnoreAlerts = ap.IgnoreAlerts or false,
				HidePanelBackground = ap.HidePanelBackground or false,
				AutoScale = ap.AutoScale ~= false,
				OpenButton = ap.OpenButton,
				DragFrameSize = 160,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				UICorner = 16,
				UIPadding = 14,
				UIElements = {},
				CanDropdown = true,
				Closed = false,
				Parent = ap.Parent,
				Destroyed = false,
				IsFullscreen = false,
				CanResize = ap.Resizable ~= false,
				IsOpenButtonEnabled = true,
				CurrentConfig = nil,
				ConfigManager = nil,
				AcrylicPaint = nil,
				CurrentTab = nil,
				TabModule = nil,
				OnOpenCallback = nil,
				OnCloseCallback = nil,
				OnDestroyCallback = nil,
				IsPC = false,
				Gap = 5,
				TopBarButtons = {},
				AllElements = {},
				ElementConfig = {},
				PendingFlags = {},
				IsToggleDragging = false
			}
			ax.UICorner = ax.Radius
			ax.TopBarButtonIconSize = ax.TopBarButtonIconSize or (ax.Topbar.ButtonsType == 'Mac' and 11 or 16)
			ax.ElementConfig = {
				UIPadding = (ax.NewElements and 10 or 13),
				UICorner = ax.ElementsRadius or (ax.NewElements and 23 or 16),
				Transparency = ax.ElementTransparency,
				GlassTransparency = ax.ElementGlassTransparency or 0.24,
				LiquidGlass = ax.LiquidGlass,
				CornerStyle = ax.ElementCornerStyle or (ax.NewElements and 'Native' or 'Shape'),
				LinkCorners = ax.LinkElementCorners,
				CornerLink = ax.ElementCornerLink
			}
			local ay = ax.Size or UDim2.new(0, 580, 0, 460)
			ax.Size = UDim2.new(ay.X.Scale, math.clamp(ay.X.Offset, ax.MinSize.X, ax.MaxSize.X), ay.Y.Scale, math.clamp(ay.Y.Offset, ax.MinSize.Y, ax.MaxSize.Y))
			if ax.Topbar == {} then
				ax.Topbar = {
					Height = 52,
					ButtonsType = 'Default'
				}
			end
			if not ac:IsStudio() and ax.Folder and writefile then
				if not isfolder('WindUI/' .. ax.Folder) then
					makefolder('WindUI/' .. ax.Folder)
				end
				if not isfolder('WindUI/' .. ax.Folder .. '/assets') then
					makefolder('WindUI/' .. ax.Folder .. '/assets')
				end
				if not isfolder(ax.Folder) then
					makefolder(ax.Folder)
				end
				if not isfolder(ax.Folder .. '/assets') then
					makefolder(ax.Folder .. '/assets')
				end
			end
			local az = ai('UICorner', {
				CornerRadius = UDim.new(0, ax.UICorner)
			})
			if ax.Folder then
				ax.ConfigManager = ao:Init(ax)
			end
			if ax.Acrylic then
				local aA = af.AcrylicPaint{
					UseAcrylic = ax.Acrylic
				}
				ax.AcrylicPaint = aA
			end
			local aA, aB, aC = ai('Frame', {
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				ZIndex = 99,
				Active = true
			}, {
				ai('ImageLabel', {
					Size = UDim2.new(0, 96, 0, 96),
					BackgroundTransparency = 1,
					Image = 'rbxassetid://120997033468887',
					Position = UDim2.new(0.5, - 16, 0.5, - 16),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1
				})
			}), ag.NewRoundFrame(ax.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 98,
				Active = false
			}, {
				ai('ImageLabel', {
					Size = UDim2.new(0, 70, 0, 70),
					Image = ag.Icon'expand'[1],
					ImageRectOffset = ag.Icon'expand'[2].ImageRectPosition,
					ImageRectSize = ag.Icon'expand'[2].ImageRectSize,
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1
				})
			}), ag.NewRoundFrame(ax.UICorner, 'Squircle', {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 999,
				Active = false
			})
			ax.UIElements.SideBar = ai('ScrollingFrame', {
				Size = UDim2.new(1, ax.ScrollBarEnabled and - 3 - (ax.UIPadding / 2) or 0, 1, not ax.HideSearchBar and - 45 or 0),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = 'Never',
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = 'Y',
				ScrollingDirection = 'Y',
				ClipsDescendants = true,
				VerticalScrollBarPosition = 'Left'
			}, {
				ai('Frame', {
					BackgroundTransparency = 1,
					AutomaticSize = 'Y',
					Size = UDim2.new(1, 0, 0, 0),
					Name = 'Frame'
				}, {
					ai('UIPadding', {
						PaddingBottom = UDim.new(0, ax.UIPadding / 2)
					}),
					ai('UIListLayout', {
						SortOrder = 'LayoutOrder',
						Padding = UDim.new(0, ax.Gap)
					})
				}),
				ai('UIPadding', {
					PaddingLeft = UDim.new(0, ax.UIPadding / 2),
					PaddingRight = UDim.new(0, ax.UIPadding / 2),
					PaddingBottom = UDim.new(0, ax.UIPadding / 2)
				})
			})
			ax.UIElements.SideBarContainer = ai('Frame', {
				Size = UDim2.new(0, ax.SideBarWidth, 1, ax.User.Enabled and - ax.Topbar.Height - 42 - (ax.UIPadding * 2) or - ax.Topbar.Height),
				Position = UDim2.new(0, 0, 0, ax.Topbar.Height),
				BackgroundTransparency = 1,
				Visible = ax.TabHolderType == 'sidebar'
			}, {
				ai('Frame', {
					Name = 'Content',
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, not ax.HideSearchBar and - 45 - ax.UIPadding or - ax.UIPadding / 2),
					Position = UDim2.new(0, 0, 1, - ax.UIPadding / 2),
					AnchorPoint = Vector2.new(0, 1)
				}),
				ax.UIElements.SideBar
			})
			ax.UIElements.TopTabHolder = ai('ScrollingFrame', {
				Name = 'TopTabHolder',
				Size = UDim2.new(1, - ax.UIPadding, 0, ax.TopTabHeight),
				Position = UDim2.new(0, ax.UIPadding / 2, 0, ax.Topbar.Height),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				Visible = ax.TabHolderType == 'top',
				ClipsDescendants = true
			}, {
				ai('Frame', {
					Name = 'Frame',
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					ai('UIListLayout', {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 6)
					}),
					ai('UIPadding', {
						PaddingLeft = UDim.new(0, ax.UIPadding / 2),
						PaddingRight = UDim.new(0, ax.UIPadding / 2)
					})
				})
			})
			ax.UIElements.TabHolder = if ax.TabHolderType == 'top' then ax.UIElements.TopTabHolder.Frame else ax.UIElements.SideBar.Frame
			if ax.TabHolderType == 'sidebar' and ax.ScrollBarEnabled then
				am(ax.UIElements.SideBar, ax.UIElements.SideBarContainer.Content, ax, 3, ap.WindUI)
			end
			ax.UIElements.MainBar = ai('Frame', {
				Size = if ax.TabHolderType == 'top' then UDim2.new(1, 0, 1, - (ax.Topbar.Height + ax.TopTabHeight)) else UDim2.new(1, - ax.SideBarWidth, 1, - ax.Topbar.Height),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 1),
				BackgroundTransparency = 1
			}, {
				ag.NewRoundFrame(ax.UICorner - (ax.UIPadding / 2), 'Squircle', {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = 'PanelBackground',
						ImageTransparency = 'PanelBackgroundTransparency'
					},
					ZIndex = 3,
					Name = 'Background',
					Visible = not ax.HidePanelBackground
				}),
				ai('UIPadding', {
					PaddingLeft = UDim.new(0, ax.UIPadding / 2),
					PaddingRight = UDim.new(0, ax.UIPadding / 2),
					PaddingBottom = UDim.new(0, ax.UIPadding / 2)
				})
			})
			local aD = ai('ImageLabel', {
				Image = 'rbxassetid://8992230677',
				ThemeTag = {
					ImageColor3 = 'WindowShadow'
				},
				ImageTransparency = 1,
				Size = UDim2.new(1, 100, 1, 100),
				Position = UDim2.new(0, - 50, 0, - 50),
				ScaleType = 'Slice',
				SliceCenter = Rect.new(99, 99, 99, 99),
				BackgroundTransparency = 1,
				ZIndex = - 999999999999999,
				Name = 'Blur'
			})
			if ab.TouchEnabled and not ab.KeyboardEnabled then
				ax.IsPC = false
			elseif ab.KeyboardEnabled then
				ax.IsPC = true
			else
				ax.IsPC = nil
			end
			local aE
			if ax.User then
				local function GetUserThumb()
					local aF = ad:GetUserThumbnailAsync(ax.User.Anonymous and 1 or ad.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
					return aF
				end
				aE = ai('TextButton', {
					Size = UDim2.new(0, ax.UIElements.SideBarContainer.AbsoluteSize.X - (ax.UIPadding / 2), 0, 42 + ax.UIPadding),
					Position = UDim2.new(0, ax.UIPadding / 2, 1, - (ax.UIPadding / 2)),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
					Visible = ax.TabHolderType == 'sidebar' and (ax.User.Enabled or false)
				}, {
					ag.NewRoundFrame(ax.UICorner - (ax.UIPadding / 2), 'SquircleOutline', {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = 'Text'
						},
						ImageTransparency = 1,
						Name = 'Outline'
					}, {
						ai('UIGradient', {
							Rotation = 78,
							Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
							},
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1, 0.1)
							}
						})
					}),
					ag.NewRoundFrame(ax.UICorner - (ax.UIPadding / 2), 'Squircle', {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = 'Text'
						},
						ImageTransparency = 1,
						Name = 'UserIcon'
					}, {
						ai('ImageLabel', {
							Image = GetUserThumb(),
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 42, 0, 42),
							ThemeTag = {
								BackgroundColor3 = 'Text'
							},
							BackgroundTransparency = 0.93
						}, {
							ai('UICorner', {
								CornerRadius = UDim.new(1, 0)
							})
						}),
						ai('Frame', {
							AutomaticSize = 'XY',
							BackgroundTransparency = 1
						}, {
							ai('TextLabel', {
								Text = ax.User.Anonymous and 'Anonymous' or ad.LocalPlayer.DisplayName,
								TextSize = 17,
								ThemeTag = {
									TextColor3 = 'Text'
								},
								FontFace = Font.new(ag.Font, Enum.FontWeight.SemiBold),
								AutomaticSize = 'Y',
								BackgroundTransparency = 1,
								Size = UDim2.new(1, - 27, 0, 0),
								TextTruncate = 'AtEnd',
								TextXAlignment = 'Left',
								Name = 'DisplayName'
							}),
							ai('TextLabel', {
								Text = ax.User.Anonymous and 'anonymous' or ad.LocalPlayer.Name,
								TextSize = 15,
								TextTransparency = 0.6,
								ThemeTag = {
									TextColor3 = 'Text'
								},
								FontFace = Font.new(ag.Font, Enum.FontWeight.Medium),
								AutomaticSize = 'Y',
								BackgroundTransparency = 1,
								Size = UDim2.new(1, - 27, 0, 0),
								TextTruncate = 'AtEnd',
								TextXAlignment = 'Left',
								Name = 'UserName'
							}),
							ai('UIListLayout', {
								Padding = UDim.new(0, 4),
								HorizontalAlignment = 'Left'
							})
						}),
						ai('UIListLayout', {
							Padding = UDim.new(0, ax.UIPadding),
							FillDirection = 'Horizontal',
							VerticalAlignment = 'Center'
						}),
						ai('UIPadding', {
							PaddingLeft = UDim.new(0, ax.UIPadding / 2),
							PaddingRight = UDim.new(0, ax.UIPadding / 2)
						})
					})
				})
				function ax.User.Enable(aF)
					ax.User.Enabled = true
					aj(ax.UIElements.SideBarContainer, 0.25, {
						Size = UDim2.new(0, ax.SideBarWidth, 1, - ax.Topbar.Height - 42 - (ax.UIPadding * 2))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					aE.Visible = ax.TabHolderType == 'sidebar'
				end
				function ax.User.Disable(aF)
					ax.User.Enabled = false
					aj(ax.UIElements.SideBarContainer, 0.25, {
						Size = UDim2.new(0, ax.SideBarWidth, 1, - ax.Topbar.Height)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					aE.Visible = false
				end
				function ax.User.SetAnonymous(aF, aG)
					if aG ~= false then
						aG = true
					end
					ax.User.Anonymous = aG
					aE.UserIcon.ImageLabel.Image = GetUserThumb()
					aE.UserIcon.Frame.DisplayName.Text = aG and 'Anonymous' or ad.LocalPlayer.DisplayName
					aE.UserIcon.Frame.UserName.Text = aG and 'anonymous' or ad.LocalPlayer.Name
				end
				if ax.User.Enabled then
					ax.User:Enable()
				else
					ax.User:Disable()
				end
				if ax.User.Callback then
					ag.AddSignal(aE.MouseButton1Click, function()
						ax.User.Callback()
					end)
					ag.AddSignal(aE.MouseEnter, function()
						aj(aE.UserIcon, 0.04, {
							ImageTransparency = 0.95
						}):Play()
						aj(aE.Outline, 0.04, {
							ImageTransparency = 0.85
						}):Play()
					end)
					ag.AddSignal(aE.InputEnded, function()
						aj(aE.UserIcon, 0.04, {
							ImageTransparency = 1
						}):Play()
						aj(aE.Outline, 0.04, {
							ImageTransparency = 1
						}):Play()
					end)
				end
			end
			local aF, aG, aH, aI = false
			local function GetTransparencyValue(aJ, aK)
				local aL = tonumber(aJ)
				if aL == nil then
					return aK
				end
				return math.clamp(math.floor(aL * 100 + 0.5) / 100, 0, 1)
			end
			local function ParseColorValue(aJ)
				if typeof(aJ) == 'Color3' then
					return aJ
				end
				if typeof(aJ) == 'string' and string.sub(aJ, 1, 1) == '#' then
					local aK, aL = pcall(function()
						return Color3.fromHex(aJ)
					end)
					return aK and aL or nil
				end
				return nil
			end
			local function GetUrlExtension(aJ, aK)
				if not aJ or typeof(aJ) ~= 'string' then
					return aK or '.png'
				end
				local aL = aJ:match'^([^?#]+)' or aJ
				local aM = aL:match'%.(%w+)$'
				if aM then
					aM = aM:lower()
					if aM == 'jpg' or aM == 'jpeg' or aM == 'png' or aM == 'webp' or aM == 'webm' then
						return '.' .. aM
					end
				end
				return aK or '.png'
			end
			local function EnsureAssetFolder()
				if ac:IsStudio() or not makefolder or not isfolder then
					return
				end
				local aJ = ax.Folder or 'Temp'
				if not isfolder(aJ) then
					makefolder(aJ)
				end
				if not isfolder(aJ .. '/assets') then
					makefolder(aJ .. '/assets')
				end
			end
			local function ReadHttp(aJ)
				if game.HttpGet then
					return game:HttpGet(aJ)
				end
				if ag.Request then
					local aK = ag.Request{
						Url = aJ,
						Method = 'GET',
						Headers = {
							['User-Agent'] = 'Roblox/Exploit'
						}
					}
					return aK and aK.Body
				end
				return nil
			end
			local function GetCustomAsset(aJ)
				if typeof(getcustomasset) ~= 'function' then
					return aJ
				end
				local aK, aL = pcall(function()
					return getcustomasset(aJ)
				end)
				if aK then
					return aL
				end
				warn('[ WindUI.Window.Background ] Failed to load custom asset: ' .. tostring(aL))
				return aJ
			end
			local function CacheHttpAsset(aJ, aK)
				if not writefile then
					return aJ
				end
				EnsureAssetFolder()
				local aL = (ax.Folder or 'Temp') .. '/assets/.' .. ag.SanitizeFilename(aJ) .. GetUrlExtension(aJ, aK)
				if not isfile or not isfile(aL) then
					local aM, aN = pcall(function()
						local aM = ReadHttp(aJ)
						if aM then
							writefile(aL, aM)
						end
					end)
					if not aM then
						warn('[ WindUI.Window.Background ] Failed to download asset: ' .. tostring(aN))
						return aJ
					end
				end
				return GetCustomAsset(aL)
			end
			local function ResolveBackgroundAsset(aJ, aK)
				if typeof(aJ) ~= 'string' then
					return ''
				end
				local aL = string.match(aJ, '^video:(.+)')
				if aL then
					aJ = aL
					aK = 'Video'
				end
				local aM = string.match(aJ, '^customasset:(.+)') or string.match(aJ, '^getcustomasset:(.+)') or string.match(aJ, '^file:(.+)')
				if aM then
					return GetCustomAsset(aM)
				end
				if isfile and isfile(aJ) then
					return GetCustomAsset(aJ)
				end
				if string.match(aJ, '^https?://') then
					return CacheHttpAsset(aJ, aK == 'Video' and '.webm' or '.png')
				end
				return aJ
			end
			local function GetBackgroundKind(aJ)
				if aJ == nil or aJ == false then
					return nil, nil, {}
				end
				if typeof(aJ) == 'table' then
					local aK = aJ.Type or aJ.Kind or aJ.Mode
					if aJ.Video or aK == 'Video' or aK == 'video' then
						return 'Video', aJ.Video or aJ.Url or aJ.URL or aJ.Source or aJ.Asset or aJ.Path, aJ
					end
					if aJ.Image or aJ.Url or aJ.URL or aJ.Asset or aJ.Path or aK == 'Image' or aK == 'image' then
						return 'Image', aJ.Image or aJ.Url or aJ.URL or aJ.Asset or aJ.Path or aJ.Source, aJ
					end
					if aJ.Color or aK == 'Color' or aK == 'color' then
						return 'Color', aJ.Color or aJ.Value, aJ
					end
					return 'Gradient', aJ.Gradient or aJ, aJ
				end
				local aK = ParseColorValue(aJ)
				if aK then
					return 'Color', aK, {}
				end
				if typeof(aJ) == 'string' then
					local aL, aM = string.match(aJ, '^video:(.+)'), aJ:match'^([^?#]+)' or aJ
					if aL or string.match(aM:lower(), '%.webm$') then
						return 'Video', aL or aJ, {}
					end
					return 'Image', aJ, {}
				end
				return nil, nil, {}
			end
			local function CreateDetachedMediaBackground(aJ, aK, aL)
				if aJ == 'Image' then
					ax.BackgroundScaleType = aL.ScaleType or ax.BackgroundScaleType
					ax.BackgroundImageTransparency = GetTransparencyValue(aL.Transparency or aL.ImageTransparency, ax.BackgroundImageTransparency)
					return ai('ImageLabel', {
						Name = 'BackgroundImage',
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						Image = ResolveBackgroundAsset(aK, 'Image'),
						ImageTransparency = ax.BackgroundImageTransparency,
						ScaleType = ax.BackgroundScaleType,
						ZIndex = - 10
					}, {
						ai('UICorner', {
							CornerRadius = UDim.new(0, ax.UICorner)
						})
					})
				end
				if aJ == 'Video' then
					local aM = ai('VideoFrame', {
						Name = 'BackgroundVideo',
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						Video = ResolveBackgroundAsset(aK, 'Video'),
						Looped = aL.Looped ~= false,
						Volume = math.clamp(tonumber(aL.Volume) or 0, 0, 1),
						ZIndex = - 10
					}, {
						ai('UICorner', {
							CornerRadius = UDim.new(0, ax.UICorner)
						})
					})
					aM:Play()
					return aM
				end
				return nil
			end
			local aJ, aK, aL = GetBackgroundKind(ax.Background)
			aF = aJ == 'Video'
			aI = CreateDetachedMediaBackground(aJ, aK, aL)
			local aM = ag.NewRoundFrame(99, 'Squircle', {
				ImageTransparency = 0.8,
				ImageColor3 = Color3.new(1, 1, 1),
				Size = UDim2.new(0, 0, 0, 4),
				Position = UDim2.new(0.5, 0, 1, 4),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				ai('TextButton', {
					Size = UDim2.new(1, 12, 1, 12),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Active = true,
					ZIndex = 99,
					Name = 'Frame'
				})
			})
			function createAuthor(aN)
				return ai('TextLabel', {
					Text = aN,
					FontFace = Font.new(ag.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					TextTransparency = 0.35,
					AutomaticSize = 'XY',
					Parent = ax.UIElements.Main and ax.UIElements.Main.Main.Topbar.Left.Title,
					TextXAlignment = 'Left',
					TextSize = 13,
					LayoutOrder = 2,
					ThemeTag = {
						TextColor3 = 'WindowTopbarAuthor'
					},
					Name = 'Author'
				})
			end
			local aN, aO
			if ax.Author then
				aN = createAuthor(ax.Author)
			end
			local aP = ai('TextLabel', {
				Text = ax.Title,
				FontFace = Font.new(ag.Font, Enum.FontWeight.SemiBold),
				BackgroundTransparency = 1,
				AutomaticSize = 'XY',
				Name = 'Title',
				TextXAlignment = 'Left',
				TextSize = 16,
				ThemeTag = {
					TextColor3 = 'WindowTopbarTitle'
				}
			})
			ax.UIElements.Main = ai('Frame', {
				Size = UDim2.new(ax.Size.X.Scale, ax.Size.X.Offset, 0, 0),
				Position = ax.Position,
				BackgroundTransparency = 1,
				Parent = ap.Parent,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Active = true
			}, {
				ap.WindUI.UIScaleObj,
				ax.AcrylicPaint and ax.AcrylicPaint.Frame or nil,
				aD,
				ag.NewRoundFrame(ax.UICorner, 'Squircle', {
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = 'Background',
					ThemeTag = {
						ImageColor3 = 'WindowBackground'
					}
				}, {
					aI,
					aM,
					aA
				}),
				az,
				aB,
				aC,
				ai('Frame', {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Name = 'Main',
					Visible = false,
					ZIndex = 97
				}, {
					ai('UICorner', {
						CornerRadius = UDim.new(0, ax.UICorner)
					}),
					ax.UIElements.SideBarContainer,
					ax.UIElements.TopTabHolder,
					ax.UIElements.MainBar,
					aE,
					aH,
					ai('Frame', {
						Size = UDim2.new(1, 0, 0, ax.Topbar.Height),
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(50, 50, 50),
						Name = 'Topbar'
					}, {
						aG,
						ai('Frame', {
							AutomaticSize = 'X',
							Size = UDim2.new(0, 0, 1, 0),
							BackgroundTransparency = 1,
							Name = 'Left'
						}, {
							ai('UIListLayout', {
								Padding = UDim.new(0, ax.UIPadding + 4),
								SortOrder = 'LayoutOrder',
								FillDirection = 'Horizontal',
								VerticalAlignment = 'Center'
							}),
							ai('Frame', {
								AutomaticSize = 'XY',
								BackgroundTransparency = 1,
								Name = 'Title',
								Size = UDim2.new(0, 0, 1, 0),
								LayoutOrder = 2
							}, {
								ai('UIListLayout', {
									Padding = UDim.new(0, 0),
									SortOrder = 'LayoutOrder',
									FillDirection = 'Vertical',
									VerticalAlignment = 'Center'
								}),
								aP,
								aN
							}),
							ai('UIPadding', {
								PaddingLeft = UDim.new(0, 4)
							})
						}),
						ai('CanvasGroup', {
							Size = UDim2.new(0, 0, 1, 0),
							BackgroundTransparency = 1,
							Name = 'Center',
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(0, 0, 0.5, 0),
							AutomaticSize = 'Y',
							Visible = false
						}, {
							ai('ScrollingFrame', {
								Name = 'Holder',
								BackgroundTransparency = 1,
								AutomaticSize = 'Y',
								ScrollBarThickness = 0,
								ScrollingDirection = 'X',
								AutomaticCanvasSize = 'X',
								CanvasSize = UDim2.new(0, 0, 0, 0),
								Size = UDim2.new(1, 0, 1, 0)
							}, {
								ai('UIListLayout', {
									FillDirection = 'Horizontal',
									VerticalAlignment = 'Center',
									HorizontalAlignment = 'Left',
									Padding = UDim.new(0, ax.UIPadding / 2)
								})
							})
						}),
						ai('Frame', {
							AutomaticSize = 'XY',
							BackgroundTransparency = 1,
							Position = UDim2.new(ax.Topbar.ButtonsType == 'Default' and 1 or 0, 0, 0.5, 0),
							AnchorPoint = Vector2.new(ax.Topbar.ButtonsType == 'Default' and 1 or 0, 0.5),
							Name = 'Right'
						}, {
							ai('UIListLayout', {
								Padding = UDim.new(0, ax.Topbar.ButtonsType == 'Default' and 9 or 0),
								FillDirection = 'Horizontal',
								SortOrder = 'LayoutOrder'
							})
						}),
						ai('UIPadding', {
							PaddingTop = UDim.new(0, ax.UIPadding),
							PaddingLeft = UDim.new(0, ax.Topbar.ButtonsType == 'Default' and ax.UIPadding or ax.UIPadding - 2),
							PaddingRight = UDim.new(0, 8),
							PaddingBottom = UDim.new(0, ax.UIPadding)
						})
					})
				})
			})
			ag.AddSignal(ax.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal'AbsoluteSize', function()
				local aQ, aR = 0, ax.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X / ap.WindUI.UIScale
				aQ = ax.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X / ap.WindUI.UIScale
				if ax.Topbar.ButtonsType ~= 'Default' then
					aQ = aQ + aR + ax.UIPadding - 4
				end
				ax.UIElements.Main.Main.Topbar.Center.Position = UDim2.new(0, aQ + (ax.UIPadding / ap.WindUI.UIScale), 0.5, 0)
				ax.UIElements.Main.Main.Topbar.Center.Size = UDim2.new(1, - aQ - (ax.UIPadding / ap.WindUI.UIScale) - (ax.Topbar.ButtonsType == 'Default' and aR + ax.UIPadding or 0), 1, 0)
			end)
			if ax.Topbar.ButtonsType ~= 'Default' then
				ag.AddSignal(ax.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal'AbsoluteSize', function()
					ax.UIElements.Main.Main.Topbar.Left.Position = UDim2.new(0, (ax.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X / ap.WindUI.UIScale) + ax.UIPadding - 4, 0, 0)
				end)
			end
			local function GetImageTarget(aQ)
				if typeof(aQ) ~= 'Instance' then
					return nil
				end
				if aQ:IsA'ImageLabel' or aQ:IsA'ImageButton' then
					return aQ
				end
				return aQ:FindFirstChildWhichIsA'ImageLabel' or aQ:FindFirstChildWhichIsA'ImageButton'
			end
			function ax.CreateTopbarButton(aQ, aR, aS, aT, aU, aV, aW, aX, aY)
				local aZ = aU or 999
				aY = aY or {}
				local a_, a0 = aY.ForceIcon == true, ax.Topbar.ButtonsType == 'Mac' and aY.MacAccent == true
				local a1, a2, a3 = ax.Topbar.ButtonsType == 'Default' or a_, ax.Topbar.ButtonsType ~= 'Default' and not a_, math.max(tonumber(aY.Size) or ax.Topbar.Height - 18, 20)
				local a4 = ag.Image(aS, aS, 0, ax.Folder, 'WindowTopbarIcon', a1 and not a0, aV, 'WindowTopbarButtonIcon')
				a4.Size = a1 and UDim2.new(0, aX or ax.TopBarButtonIconSize, 0, aX or ax.TopBarButtonIconSize) or UDim2.new(0, 0, 0, 0)
				a4.AnchorPoint = Vector2.new(0.5, 0.5)
				a4.Position = UDim2.new(0.5, 0, 0.5, 0)
				local a5 = GetImageTarget(a4)
				if a5 then
					a5.ImageTransparency = a1 and 0 or 1
				end
				if a0 and a5 then
					a5.ImageColor3 = ag.GetTextColorForHSB(aW or Color3.fromHex'#A78BFA', 0.72)
					a5.ImageTransparency = 0
				end
				if a2 and a5 then
					a5.ImageColor3 = ag.GetTextColorForHSB(aW or Color3.fromHex'#ff3030')
				end
				local a6 = ag.NewRoundFrame(a1 and (a0 and 999 or ax.UICorner - (ax.UIPadding / 2)) or 999, 'Squircle', {
					Size = a1 and UDim2.fromOffset(a0 and a3 or ax.Topbar.Height - 16, a0 and a3 or ax.Topbar.Height - 16) or UDim2.new(0, 14, 0, 14),
					LayoutOrder = aZ,
					ZIndex = 9999,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ImageColor3 = (a2 or a0) and (aW or Color3.fromHex'#ff3030') or nil,
					ThemeTag = a1 and not a0 and {
						ImageColor3 = 'Text'
					} or nil,
					ImageTransparency = a1 and (a0 and 0.08 or 1) or 0
				}, {
					a4,
					ai('UIScale', {
						Scale = 1
					})
				}, true)
				local a7 = ai('Frame', {
					Size = a2 and UDim2.new(0, 24, 0, 24) or a0 and UDim2.fromOffset(a3 + 4, a3 + 4) or UDim2.new(0, ax.Topbar.Height - 16, 0, ax.Topbar.Height - 16),
					BackgroundTransparency = 1,
					Parent = ax.UIElements.Main.Main.Topbar.Right,
					LayoutOrder = aZ
				}, {
					a6
				})
				ax.TopBarButtons[100 - aZ] = {
					Name = aR,
					Object = a7
				}
				ag.AddSignal(a6.MouseButton1Click, function()
					if aT then
						aT()
					end
				end)
				ag.AddSignal(a6.MouseEnter, function()
					if a1 then
						ah.Play(a6, 'Hover', {
							ImageTransparency = if a0 then 0 else 0.93
						}, nil, nil, 'Hover')
					else
						ah.Play(a5, 'Hover', {
							ImageTransparency = 0
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						ah.Play(a4, 'Hover', {
							Size = UDim2.new(0, aX or ax.TopBarButtonIconSize, 0, aX or ax.TopBarButtonIconSize)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
					end
				end)
				ag.AddSignal(a6.MouseButton1Down, function()
					ah.Play(a6.UIScale, 'Press', {
						Scale = 0.9
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Press')
				end)
				ag.AddSignal(a6.MouseLeave, function()
					if a1 then
						ah.Play(a6, 'Hover', {
							ImageTransparency = if a0 then 0.08 else 1
						}, nil, nil, 'Hover')
					else
						ah.Play(a5, 'Hover', {
							ImageTransparency = 1
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
						ah.Play(a4, 'Hover', {
							Size = UDim2.new(0, 0, 0, 0)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Hover')
					end
				end)
				ag.AddSignal(a6.InputEnded, function()
					ah.Play(a6.UIScale, 'Press', {
						Scale = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Press')
				end)
				return a6
			end
			function ax.Topbar.Button(aQ, aR)
				return ax:CreateTopbarButton(aR.Name, aR.Icon, aR.Callback, aR.LayoutOrder or 0, aR.IconThemed, aR.Color, aR.IconSize, aR.Options)
			end
			local aQ = ag.Drag(ax.UIElements.Main, {
				ax.UIElements.Main.Main.Topbar,
				aM.Frame
			}, function(aQ, aR)
				if not ax.Closed then
					if aQ and aR == aM.Frame then
						aj(aM, 0.1, {
							ImageTransparency = 0.35
						}):Play()
					else
						aj(aM, 0.2, {
							ImageTransparency = 0.8
						}):Play()
					end
					ax.Position = ax.UIElements.Main.Position
					ax.Dragging = aQ
				end
			end)
			local function ParseBackgroundColor(aR)
				return ParseColorValue(aR)
			end
			local function ApplyBackgroundColor(aR)
				local aS = ParseBackgroundColor(aR)
				if aS then
					ax.BackgroundColor = aR
					ah.Play(ax.UIElements.Main.Background, 'Background', {
						ImageColor3 = aS
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'BackgroundColor')
				end
				return aS
			end
			local function SetBackgroundGradientObject(aR, aS)
				if ax.UIElements.BackgroundGradient then
					ax.UIElements.BackgroundGradient:Destroy()
					ax.UIElements.BackgroundGradient = nil
				end
				if typeof(aR) ~= 'table' then
					return nil
				end
				local aT = aR.Color ~= nil or aR.Transparency ~= nil or aR.Rotation ~= nil or aR.Offset ~= nil
				if not aT then
					return nil
				end
				local aU = ai'UIGradient'
				for aV, aW in next, aR do
					if aV == 'Transparency' and typeof(aW) == 'number' then
						continue
					end
					pcall(function()
						aU[aV] = aW
					end)
				end
				local aV = ag.NewRoundFrame(ax.UICorner, 'Squircle', {
					Name = 'BackgroundGradient',
					Size = UDim2.new(1, 0, 1, 0),
					Parent = ax.UIElements.Main.Background,
					ImageTransparency = aS or ax.BackgroundOverlayTransparency,
					ZIndex = - 9
				}, {
					aU
				})
				ax.UIElements.BackgroundGradient = aV
				return aV
			end
			local function ClearDetachedBackgroundMedia(aR)
				if aR ~= 'Image' and aI and aI:IsA'ImageLabel' then
					aI:Destroy()
					aI = nil
				elseif aR ~= 'Video' and aI and aI:IsA'VideoFrame' then
					aI:Destroy()
					aI = nil
				end
				if aR ~= 'Gradient' and ax.UIElements.BackgroundGradient then
					ax.UIElements.BackgroundGradient:Destroy()
					ax.UIElements.BackgroundGradient = nil
				end
			end
			local function CreateImageBackground()
				ClearDetachedBackgroundMedia'Image'
				if aI and aI:IsA'ImageLabel' then
					return aI
				end
				if aI then
					aI:Destroy()
				end
				aI = ai('ImageLabel', {
					Name = 'BackgroundImage',
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 1,
					ScaleType = ax.BackgroundScaleType,
					ZIndex = - 10,
					Parent = ax.UIElements.Main.Background
				}, {
					ai('UICorner', {
						CornerRadius = UDim.new(0, ax.UICorner)
					})
				})
				return aI
			end
			local function CreateVideoBackground()
				ClearDetachedBackgroundMedia'Video'
				if aI then
					aI:Destroy()
				end
				aI = ai('VideoFrame', {
					Name = 'BackgroundVideo',
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Looped = true,
					Volume = 0,
					ZIndex = - 10,
					Parent = ax.UIElements.Main.Background
				}, {
					ai('UICorner', {
						CornerRadius = UDim.new(0, ax.UICorner)
					})
				})
				return aI
			end
			if ax.BackgroundColor then
				ApplyBackgroundColor(ax.BackgroundColor)
			elseif aJ == 'Color' then
				ApplyBackgroundColor(aK)
			end
			local aR = ax.BackgroundGradient or (aJ == 'Gradient' and aK or nil)
			if aR then
				local aS = ax.BackgroundGradient and ax.BackgroundOverlayTransparency or (ax.Transparent and ap.WindUI.TransparencyValue or 0)
				SetBackgroundGradientObject(aR, aS)
			end
			ax.OpenButtonMain = a.load'C'.New(ax)
			ax.OpenButtonController = ax.OpenButtonMain
			ax.WatermarkMain = a.load'D'.New(ax, ap.WindUI)
			function ax.SetWatermark(aS, aT)
				ax.Watermark = aT
				return ax.WatermarkMain:Edit(aT)
			end
			function ax.ToggleWatermark(aS, aT)
				if ax.WatermarkMain then
					ax.WatermarkMain:Visible(aT)
				end
			end
			if ax.Watermark ~= nil and ax.Watermark ~= false then
				ax:SetWatermark(ax.Watermark)
			end
			task.spawn(function()
				if ax.Icon then
					local aS = ai('Frame', {
						Size = UDim2.new(0, 22, 0, 22),
						BackgroundTransparency = 1,
						Parent = ax.UIElements.Main.Main.Topbar.Left
					})
					aO = ag.Image(ax.Icon, ax.Title, ax.IconRadius, ax.Folder, 'Window', true, ax.IconThemed, 'WindowTopbarIcon')
					aO.Parent = aS
					aO.Size = UDim2.new(0, ax.IconSize, 0, ax.IconSize)
					aO.Position = UDim2.new(0.5, 0, 0.5, 0)
					aO.AnchorPoint = Vector2.new(0.5, 0.5)
					ax.OpenButtonMain:SetIcon(ax.Icon)
				else
					ax.OpenButtonMain:SetIcon(ax.Icon)
				end
			end)
			function ax.SetToggleKey(aS, aT)
				ax.ToggleKey = aT
			end
			function ax.SetTitle(aS, aT)
				ax.Title = aT
				aP.Text = aT
			end
			function ax.SetAuthor(aS, aT)
				ax.Author = aT
				if not aN then
					aN = createAuthor(ax.Author)
				end
				aN.Text = aT
			end
			function ax.SetSize(aS, aT)
				if typeof(aT) == 'UDim2' then
					ax.Size = aT
					aj(ax.UIElements.Main, 0.08, {
						Size = aT
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			local function GetBackgroundTransparency(aS, aT)
				return GetTransparencyValue(aS, aT)
			end
			function ax.SetBackgroundImage(aS, aT, aU)
				aU = typeof(aU) == 'table' and aU or {
					Transparency = aU
				}
				ClearDetachedBackgroundMedia'Image'
				local aV = CreateImageBackground()
				ax.Background = aT
				ax.BackgroundGradient = nil
				ax.BackgroundScaleType = aU.ScaleType or ax.BackgroundScaleType
				ax.BackgroundImageTransparency = GetBackgroundTransparency(aU.Transparency or aU.ImageTransparency, ax.BackgroundImageTransparency)
				aV.ScaleType = ax.BackgroundScaleType
				aV.Image = ResolveBackgroundAsset(aT, 'Image')
				aV.ImageTransparency = 1
				ah.Play(aV, 'Background', {
					ImageTransparency = ax.BackgroundImageTransparency
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'BackgroundImage')
				return aV
			end
			function ax.SetBackgroundVideo(aS, aT, aU)
				aU = typeof(aU) == 'table' and aU or {}
				ClearDetachedBackgroundMedia'Video'
				local aV = CreateVideoBackground()
				ax.Background = 'video:' .. tostring(aT or '')
				ax.BackgroundGradient = nil
				aV.Video = ResolveBackgroundAsset(aT, 'Video')
				aV.Visible = true
				aV.Looped = aU.Looped ~= false
				aV.Volume = math.clamp(tonumber(aU.Volume) or aV.Volume or 0, 0, 1)
				aV:Play()
				return aV
			end
			function ax.SetBackgroundGradient(aS, aT, aU)
				ClearDetachedBackgroundMedia'Gradient'
				ax.BackgroundGradient = aT
				ax.Background = nil
				ax.BackgroundOverlayTransparency = GetBackgroundTransparency(aU, ax.BackgroundOverlayTransparency)
				local aV = SetBackgroundGradientObject(aT, 1)
				if aV then
					ah.Play(aV, 'Background', {
						ImageTransparency = ax.BackgroundOverlayTransparency
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'BackgroundGradient')
				end
				return aV
			end
			function ax.SetBackgroundColor(aS, aT)
				return ApplyBackgroundColor(aT)
			end
			function ax.SetBackgroundOverlayTransparency(aS, aT)
				ax.BackgroundOverlayTransparency = GetBackgroundTransparency(aT, ax.BackgroundOverlayTransparency)
				if ax.UIElements.BackgroundGradient then
					ah.Play(ax.UIElements.BackgroundGradient, 'Background', {
						ImageTransparency = ax.BackgroundOverlayTransparency
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'BackgroundGradient')
				end
				return ax.BackgroundOverlayTransparency
			end
			function ax.SetBackground(aS, aT, aU)
				if aT == nil or aT == false then
					ax.Background = nil
					ax.BackgroundGradient = nil
					if aI then
						aI:Destroy()
						aI = nil
					end
					if ax.UIElements.BackgroundGradient then
						ax.UIElements.BackgroundGradient:Destroy()
						ax.UIElements.BackgroundGradient = nil
					end
					return nil
				end
				local aV, aW, aX = GetBackgroundKind(aT)
				local aY = {}
				if typeof(aX) == 'table' then
					for aZ, a_ in next, aX do
						aY[aZ] = a_
					end
				end
				if typeof(aU) == 'table' then
					for aZ, a_ in next, aU do
						aY[aZ] = a_
					end
				elseif aU ~= nil then
					aY.Transparency = aU
				end
				if aV == 'Gradient' then
					return ax:SetBackgroundGradient(aW, aY.Transparency or aY.OverlayTransparency)
				elseif aV == 'Color' then
					return ax:SetBackgroundColor(aW)
				elseif aV == 'Video' then
					return ax:SetBackgroundVideo(aW, aY)
				elseif aV == 'Image' then
					return ax:SetBackgroundImage(aW, aY)
				end
				return nil
			end
			function ax.SetBackgroundImageTransparency(aS, aT)
				ax.BackgroundImageTransparency = GetBackgroundTransparency(aT, ax.BackgroundImageTransparency)
				if aI and aI:IsA'ImageLabel' then
					ah.Play(aI, 'Background', {
						ImageTransparency = ax.BackgroundImageTransparency
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'BackgroundImage')
				end
			end
			function ax.SetBackgroundTransparency(aS, aT)
				local aU = math.floor(tonumber(aT) * 10 + 0.5) / 10
				ap.WindUI.TransparencyValue = aU
				ax:ToggleTransparency(aU > 0)
			end
			function ax.SetElementTransparency(aS, aT)
				local aU = math.floor(ag.ClampTransparency(aT, ax.ElementConfig.Transparency or 0) * 100 + 0.5) / 100
				ax.ElementTransparency = aU
				ax.ElementConfig.Transparency = aU
				for aV, aW in next, ax.AllElements do
					if aW and aW.SetTransparency then
						aW:SetTransparency(aU)
					end
				end
				return aU
			end
			function ax.SetLiquidGlass(aS, aT)
				ax.LiquidGlass = aT == true
				ax.ElementConfig.LiquidGlass = ax.LiquidGlass
				for aU, aV in next, ax.AllElements do
					if aV and aV.SetLiquidGlass then
						aV:SetLiquidGlass(ax.LiquidGlass)
					end
				end
			end
			local aS, aT
			ag.Icon'minimize'
			ag.Icon'maximize'
			if ax.Settings ~= false and ax.Topbar.Settings ~= false then
				local aU = a.load'E'.New(ax, ap.WindUI, ap)
				aU:SetButton(aV)
				ax.SettingsMenu = aU
			end
			if ax.KeyBindMenu ~= false and ax.Topbar.KeyBindMenu ~= false then
				local aU = a.load'F'.New(ax, ap.WindUI, ap)
				aU:SetButton(aV)
				ax.KeyBindMenuMain = aU
				function ax.ToggleKeyBindMenu(aW)
					return aU:Toggle()
				end
				function ax.OpenKeyBindMenu(aW)
					return aU:OpenMenu()
				end
			end
			ax:CreateTopbarButton('Fullscreen', ax.Topbar.ButtonsType == 'Mac' and 'rbxassetid://127426072704909' or 'maximize', function()
				ax:ToggleFullscreen()
			end, (ax.Topbar.ButtonsType == 'Default' and 998 or 999), true, Color3.fromHex'#60C762', ax.Topbar.ButtonsType == 'Mac' and 9 or nil)
			local function SetSize(aU)
				ah.Play(ax.UIElements.Main, 'Resize', {
					Size = not ax.IsFullscreen and aT or UDim2.new(0, (ap.WindUI.ScreenGui.AbsoluteSize.X - 20) / ap.WindUI.UIScale, 0, (ap.WindUI.ScreenGui.AbsoluteSize.Y - 20 - 52) / ap.WindUI.UIScale),
					Position = not ax.IsFullscreen and aS or UDim2.new(0.5, 0, 0.5, 26)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Fullscreen')
			end
			function ax.ToggleFullscreen(aU)
				local aV = ax.IsFullscreen
				aQ:Set(aV)
				if not aV then
					aS = ax.UIElements.Main.Position
					aT = ax.UIElements.Main.Size
					ax.CanResize = false
				else
					if ax.Resizable then
						ax.CanResize = true
					end
				end
				ax.IsFullscreen = not aV
				SetSize(true)
			end
			ag.AddSignal(ap.WindUI.ScreenGui:GetPropertyChangedSignal'AbsoluteSize', function()
				if ax.IsFullscreen then
					SetSize()
				end
			end)
			ax:CreateTopbarButton('Minimize', 'minus', function()
				if ax.Close then
					ax:Close()
				end
			end, (ax.Topbar.ButtonsType == 'Default' and 997 or 998), nil, Color3.fromHex'#F4C948')
			function ax.OnOpen(aU, aV)
				ax.OnOpenCallback = aV
			end
			function ax.OnClose(aU, aV)
				ax.OnCloseCallback = aV
			end
			function ax.OnDestroy(aU, aV)
				ax.OnDestroyCallback = aV
			end
			if ap.WindUI.UseAcrylic then
				ax.AcrylicPaint.AddParent(ax.UIElements.Main)
			end
			function ax.SetIconSize(aU, aV)
				local aW
				if typeof(aV) == 'number' then
					aW = UDim2.new(0, aV, 0, aV)
					ax.IconSize = aV
				elseif typeof(aV) == 'UDim2' then
					aW = aV
					ax.IconSize = aV.X.Offset
				end
				if aO then
					aO.Size = aW
				end
			end
			local aU = {
				Active = false,
				RestorePosition = ax.UIElements.Main.Position,
				TargetScale = nil
			}
			local function GetWindowMorphTarget()
				local aV = ax.OpenButtonMain
				if not aV or not ax.IsOpenButtonEnabled or ax.IsPC or not aV.GetMorphTarget then
					return nil
				end
				local aW = aV:GetMorphTarget()
				if not aW.Enabled or aW.Size.X <= 0 or aW.Size.Y <= 0 then
					return nil
				end
				local aX, aY = Vector2.new(0, 0), ax.UIElements.Main.Parent
				if typeof(aY) == 'Instance' and aY:IsA'GuiObject' then
					aX = aY.AbsolutePosition
				end
				local aZ, a_ = math.max(tonumber(ap.WindUI.UIScale) or 1, 0.01), ax.UIElements.Main.AbsoluteSize
				local a0, a1 = math.max(ax.Size.X.Offset, a_.X / aZ, 1), math.max(ax.Size.Y.Offset, a_.Y / aZ, 1)
				local a2 = math.clamp(math.min(aW.Size.X / a0, aW.Size.Y / a1), 0.035, aZ)
				return {
					Position = UDim2.fromOffset(aW.Position.X - aX.X, aW.Position.Y - aX.Y),
					Scale = a2,
					Duration = aW.Duration > 0 and aW.Duration or ah.GetDuration'WindowMorph'
				}
			end
			function ax.Open(aV)
				if ax.Destroyed then
					return
				end
				task.spawn(function()
					if ax.OnOpenCallback then
						task.spawn(function()
							ag.SafeCallback(ax.OnOpenCallback)
						end)
					end
					task.wait(0.06)
					ax.Closed = false
					local aW = aU.Active
					local aX = aW and GetWindowMorphTarget() or nil
					if aX then
						ax.UIElements.Main.Size = ax.Size
						ax.UIElements.Main.Position = aX.Position
						ap.WindUI.UIScaleObj.Scale = aU.TargetScale or aX.Scale
						ax.UIElements.Main.Visible = true
						ax.UIElements.Main:WaitForChild'Main'.Visible = true
						ah.Play(ax.UIElements.Main, aX.Duration, {
							Position = aU.RestorePosition
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'WindowMorphPosition')
						ah.Play(ap.WindUI.UIScaleObj, aX.Duration, {
							Scale = ap.WindUI.UIScale
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'WindowMorphScale')
					else
						ax.UIElements.Main.Size = UDim2.new(ax.Size.X.Scale, ax.Size.X.Offset, 0, 100)
						ah.Play(ax.UIElements.Main, 'WindowOpen', {
							Size = ax.Size
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
					end
					if ax.UIElements.BackgroundGradient then
						ah.Play(ax.UIElements.BackgroundGradient, 'Focus', {
							ImageTransparency = ax.BackgroundGradient and ax.BackgroundOverlayTransparency or 0
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
					end
					if not aX then
						ax.UIElements.Main.Background.ImageTransparency = 1
					end
					ah.Play(ax.UIElements.Main.Background, 'WindowOpen', {
						ImageTransparency = ax.Transparent and ap.WindUI.TransparencyValue or 0
					}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 'WindowBackground')
					if aI then
						if aI:IsA'VideoFrame' then
							aI.Visible = true
						else
							ah.Play(aI, 'Focus', {
								ImageTransparency = ax.BackgroundImageTransparency
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
						end
					end
					if ax.OpenButtonMain and ax.IsOpenButtonEnabled and not aX then
						ax.OpenButtonMain:Visible(false)
					elseif aX then
						task.delay(math.min(aX.Duration * 0.22, 0.1), function()
							if not ax.Closed and ax.OpenButtonMain then
								ax.OpenButtonMain:Visible(false)
							end
						end)
					end
					ah.Play(aD, 'WindowOpen', {
						ImageTransparency = ax.ShadowTransparency
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
					ah.Play(aM, 'WindowOpen', {
						Size = UDim2.new(0, ax.DragFrameSize, 0, 4),
						ImageTransparency = 0.8
					}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 'Window')
					aQ:Set(true)
					if ax.Resizable then
						ah.Play(aA.ImageLabel, 'WindowOpen', {
							ImageTransparency = 0.8
						}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 'Window')
						ax.CanResize = true
					end
					ax.CanDropdown = true
					ax.UIElements.Main.Visible = true
					ax.UIElements.Main:WaitForChild'Main'.Visible = true
					ap.WindUI:ToggleAcrylic(true)
					aU.Active = false
				end)
			end
			function ax.Close(aV)
				if ax.Destroyed then
					return
				end
				local aW, aX = {}
				if ax.OpenButtonMain and ax.IsOpenButtonEnabled and not ax.IsPC then
					ax.OpenButtonMain:SetState('Compact', nil, false)
					ax.OpenButtonMain:Visible(true)
					aX = GetWindowMorphTarget()
				end
				local aY = aX ~= nil
				local aZ = aY and aX.Duration or ah.GetDuration'WindowClose'
				aU.Active = aY
				aU.RestorePosition = ax.UIElements.Main.Position
				aU.TargetScale = aY and aX.Scale or nil
				if ax.OnCloseCallback then
					task.spawn(function()
						ag.SafeCallback(ax.OnCloseCallback)
					end)
				end
				if not aY then
					ap.WindUI:ToggleAcrylic(false)
				end
				if not aY and ax.UIElements.Main and ax.UIElements.Main:WaitForChild'Main' then
					ax.UIElements.Main.Main.Visible = false
				end
				ax.CanDropdown = false
				ax.Closed = true
				if aY then
					ah.Play(ax.UIElements.Main, aX.Duration, {
						Position = aX.Position
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'WindowMorphPosition')
					ah.Play(ap.WindUI.UIScaleObj, aX.Duration, {
						Scale = aX.Scale
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'WindowMorphScale')
				else
					ah.Play(ax.UIElements.Main, 'WindowClose', {
						Size = UDim2.new(ax.Size.X.Scale, ax.Size.X.Offset, 0, 0)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
				end
				if not aY and ax.UIElements.BackgroundGradient then
					ah.Play(ax.UIElements.BackgroundGradient, 'Fast', {
						ImageTransparency = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
				end
				if not aY then
					ah.Play(ax.UIElements.Main.Background, 'WindowClose', {
						ImageTransparency = 1
					}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 'WindowBackground')
				end
				if aI and not aY then
					if aI:IsA'VideoFrame' then
						aI.Visible = false
					else
						ah.Play(aI, 'WindowClose', {
							ImageTransparency = 1
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
					end
				end
				if not aY then
					ah.Play(aD, 'WindowClose', {
						ImageTransparency = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 'Window')
				end
				ah.Play(aM, 'WindowClose', {
					Size = UDim2.new(0, 0, 0, 4),
					ImageTransparency = 1
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 'Window')
				ah.Play(aA.ImageLabel, 'WindowClose', {
					ImageTransparency = 1
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 'Window')
				aQ:Set(false)
				ax.CanResize = false
				task.spawn(function()
					task.wait(aZ + 0.05)
					if not ax.Closed then
						return
					end
					ax.UIElements.Main.Visible = false
					ax.UIElements.Main.Main.Visible = false
					if aY then
						ap.WindUI:ToggleAcrylic(false)
						if aI and aI:IsA'VideoFrame' then
							aI.Visible = false
						end
					end
					if ax.OpenButtonMain and not ax.Destroyed and not ax.IsPC and ax.IsOpenButtonEnabled then
						ax.OpenButtonMain:Visible(true)
					end
				end)
				function aW.Destroy(a_)
					task.spawn(function()
						if ax.OnDestroyCallback then
							task.spawn(function()
								ag.SafeCallback(ax.OnDestroyCallback)
							end)
						end
						if ax.AcrylicPaint and ax.AcrylicPaint.Model then
							ax.AcrylicPaint.Model:Destroy()
						end
						ax.Destroyed = true
						task.wait(0.4)
						ap.WindUI.ScreenGui:Destroy()
						ap.WindUI.NotificationGui:Destroy()
						ap.WindUI.DropdownGui:Destroy()
						ap.WindUI.TooltipGui:Destroy()
						ag.DisconnectAll()
						return
					end)
				end
				return aW
			end
			function ax.Destroy(aV)
				return ax:Close():Destroy()
			end
			function ax.Toggle(aV)
				if ax.Closed then
					ax:Open()
				else
					ax:Close()
				end
			end
			function ax.ToggleTransparency(aV, aW)
				ax.Transparent = aW
				ap.WindUI.Transparent = aW
				ax.UIElements.Main.Background.ImageTransparency = aW and ap.WindUI.TransparencyValue or 0
				if ax.UIElements.BackgroundGradient then
					ax.UIElements.BackgroundGradient.ImageTransparency = aW and ap.WindUI.TransparencyValue or ax.BackgroundOverlayTransparency
				end
			end
			function ax.LockAll(aV)
				for aW, aX in next, ax.AllElements do
					if aX.Lock then
						aX:Lock()
					end
				end
			end
			function ax.UnlockAll(aV)
				for aW, aX in next, ax.AllElements do
					if aX.Unlock then
						aX:Unlock()
					end
				end
			end
			function ax.GetLocked(aV)
				local aW = {}
				for aX, aY in next, ax.AllElements do
					if aY.Locked then
						table.insert(aW, aY)
					end
				end
				return aW
			end
			function ax.GetUnlocked(aV)
				local aW = {}
				for aX, aY in next, ax.AllElements do
					if aY.Locked == false then
						table.insert(aW, aY)
					end
				end
				return aW
			end
			function ax.GetUIScale(aV, aW)
				return ap.WindUI.UIScale
			end
			function ax.SetUIScale(aV, aW)
				ap.WindUI.UIScale = aW
				aj(ap.WindUI.UIScaleObj, 0.2, {
					Scale = aW
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				return ax
			end
			function ax.SetToTheCenter(aV)
				aj(ax.UIElements.Main, 0.45, {
					Position = UDim2.new(0.5, 0, 0.5, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				return ax
			end
			function ax.SetCurrentConfig(aV, aW)
				ax.CurrentConfig = aW
			end
			do
				local aV, aW, aX = 40, ae.ViewportSize, Vector2.new(ax.Size.X.Offset, ax.Size.Y.Offset)
				if not ax.IsFullscreen and ax.AutoScale then
					local aY, aZ = aW.X - (aV * 2), aW.Y - (aV * 2)
					local a_, a0 = aY / aX.X, aZ / aX.Y
					local a1, a2, a3 = math.min(a_, a0), 0.3, 1
					local a4, a5, a6 = math.clamp(a1, a2, a3), ax:GetUIScale() or 1, 0.05
					if math.abs(a4 - a5) > a6 then
						ax:SetUIScale(a4)
					end
				end
			end
			if ax.OpenButtonMain and ax.OpenButtonMain.Button then
				ag.AddSignal(ax.OpenButtonMain.Button.TextButton.MouseButton1Click, function()
					ax:Open()
				end)
			end
			ag.AddSignal(ab.InputBegan, function(aV, aW)
				if aW then
					return
				end
				if ax.ToggleKey then
					if aV.KeyCode == ax.ToggleKey then
						ax:Toggle()
					end
				end
			end)
			task.spawn(function()
				ax:Open()
			end)
			function ax.EditOpenButton(aV, aW)
				return ax.OpenButtonMain:Edit(aW)
			end
			function ax.GetOpenButton(aV)
				return ax.OpenButtonMain
			end
			function ax.SetOpenButtonState(aV, aW, aX, aY)
				return ax.OpenButtonMain:SetState(aW, aX, aY)
			end
			function ax.ExpandOpenButton(aV, aW, aX)
				return ax.OpenButtonMain:Expand(aW, aX)
			end
			function ax.CollapseOpenButton(aV, aW)
				return ax.OpenButtonMain:Collapse(aW)
			end
			function ax.CompactOpenButton(aV, aW)
				return ax.OpenButtonMain:Compact(aW)
			end
			function ax.HideOpenButton(aV, aW)
				return ax.OpenButtonMain:Idle(aW)
			end
			function ax.WakeOpenButton(aV, aW)
				return ax.OpenButtonMain:Wake(aW)
			end
			function ax.PushOpenButton(aV, aW, aX)
				return ax.OpenButtonMain:Push(aW, aX)
			end
			if ax.OpenButton and typeof(ax.OpenButton) == 'table' then
				ax:EditOpenButton(ax.OpenButton)
			end
			local aV, aW = a.load'aD', a.load'aE'
			local aX = aV.Init(ax, ap.WindUI, ap.WindUI.TooltipGui)
			aX:OnChange(function(aY)
				ax.CurrentTab = aY
			end)
			ax.TabModule = aX
			function ax.Tab(aY, aZ)
				aZ.Parent = ax.UIElements.TabHolder
				return aX.New(aZ, ap.WindUI.UIScale)
			end
			function ax.SelectTab(aY, aZ)
				aX:SelectTab(aZ)
			end
			function ax.Section(aY, aZ)
				return aW.New(aZ, ax.UIElements.TabHolder, ax.Folder, ap.WindUI.UIScale, ax)
			end
			function ax.IsResizable(aY, aZ)
				ax.Resizable = aZ
				ax.CanResize = aZ
			end
			function ax.SetPanelBackground(aY, aZ)
				if typeof(aZ) == 'boolean' then
					ax.HidePanelBackground = aZ
					ax.UIElements.MainBar.Background.Visible = aZ
					if aX then
						for a_, a0 in next, aX.Containers do
							a0.ScrollingFrame.UIPadding.PaddingTop = UDim.new(0, ax.HidePanelBackground and 20 or 10)
							a0.ScrollingFrame.UIPadding.PaddingLeft = UDim.new(0, ax.HidePanelBackground and 20 or 10)
							a0.ScrollingFrame.UIPadding.PaddingRight = UDim.new(0, ax.HidePanelBackground and 20 or 10)
							a0.ScrollingFrame.UIPadding.PaddingBottom = UDim.new(0, ax.HidePanelBackground and 20 or 10)
						end
					end
				end
			end
			function ax.Divider(aY)
				local aZ = ai('Frame', {
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 0.9,
					ThemeTag = {
						BackgroundColor3 = 'Text'
					}
				})
				local a_ = ai('Frame', {
					Parent = ax.UIElements.SideBar.Frame,
					Size = UDim2.new(1, - 7, 0, 5),
					BackgroundTransparency = 1
				}, {
					aZ
				})
				return a_
			end
			local aY = a.load'p'
			function ax.Dialog(aZ, a_)
				local a0, a1 = {
					Title = a_.Title or 'Dialog',
					Width = a_.Width or 320,
					Content = a_.Content,
					Buttons = a_.Buttons or {},
					TextPadding = 14
				}, aY.Create(false, 'Dialog', ax, ap.WindUI, ax.UIElements.Main.Main)
				a1.UIElements.Main.Size = UDim2.new(0, a0.Width, 0, 0)
				local a2 = ai('Frame', {
					Size = UDim2.new(1, 0, 1, 0),
					AutomaticSize = 'Y',
					BackgroundTransparency = 1,
					Parent = a1.UIElements.Main
				}, {
					ai('UIListLayout', {
						FillDirection = 'Vertical',
						Padding = UDim.new(0, a1.UIPadding)
					})
				})
				local a3, a4 = (ai('Frame', {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = 'Y',
					BackgroundTransparency = 1,
					Parent = a2
				}, {
					ai('UIListLayout', {
						FillDirection = 'Horizontal',
						Padding = UDim.new(0, a1.UIPadding),
						VerticalAlignment = 'Center'
					}),
					ai('UIPadding', {
						PaddingTop = UDim.new(0, a0.TextPadding / 2),
						PaddingLeft = UDim.new(0, a0.TextPadding / 2),
						PaddingRight = UDim.new(0, a0.TextPadding / 2)
					})
				}))
				if a_.Icon then
					a4 = ag.Image(a_.Icon, a0.Title .. ':' .. a_.Icon, 0, ax, 'Dialog', true, a_.IconThemed)
					a4.Size = UDim2.new(0, 22, 0, 22)
					a4.Parent = a3
				end
				a1.UIElements.UIListLayout = ai('UIListLayout', {
					Padding = UDim.new(0, 12),
					FillDirection = 'Vertical',
					HorizontalAlignment = 'Left',
					VerticalFlex = 'SpaceBetween',
					Parent = a1.UIElements.Main
				})
				ai('UISizeConstraint', {
					MinSize = Vector2.new(180, 20),
					MaxSize = Vector2.new(400, math.huge),
					Parent = a1.UIElements.Main
				})
				a1.UIElements.Title = ai('TextLabel', {
					Text = a0.Title,
					TextSize = 20,
					FontFace = Font.new(ag.Font, Enum.FontWeight.SemiBold),
					TextXAlignment = 'Left',
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, a4 and - 26 - a1.UIPadding or 0, 0, 0),
					AutomaticSize = 'Y',
					ThemeTag = {
						TextColor3 = 'Text'
					},
					BackgroundTransparency = 1,
					Parent = a3
				})
				if a0.Content then
					ai('TextLabel', {
						Text = a0.Content,
						TextSize = 18,
						TextTransparency = 0.4,
						TextWrapped = true,
						RichText = true,
						FontFace = Font.new(ag.Font, Enum.FontWeight.Medium),
						TextXAlignment = 'Left',
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = 'Y',
						LayoutOrder = 2,
						ThemeTag = {
							TextColor3 = 'Text'
						},
						BackgroundTransparency = 1,
						Parent = a2
					}, {
						ai('UIPadding', {
							PaddingLeft = UDim.new(0, a0.TextPadding / 2),
							PaddingRight = UDim.new(0, a0.TextPadding / 2),
							PaddingBottom = UDim.new(0, a0.TextPadding / 2)
						})
					})
				end
				local a5 = ai('UIListLayout', {
					Padding = UDim.new(0, 6),
					FillDirection = 'Horizontal',
					HorizontalAlignment = 'Center',
					HorizontalFlex = 'Fill'
				})
				local a6, a7 = ai('Frame', {
					Size = UDim2.new(1, 0, 0, 36),
					AutomaticSize = 'None',
					BackgroundTransparency = 1,
					Parent = a1.UIElements.Main,
					LayoutOrder = 4
				}, {
					a5
				}), {}
				for a8, a9 in next, a0.Buttons do
					local b = al(a9.Title, a9.Icon, a9.Callback, a9.Variant, a6, a1, true)
					table.insert(a7, b)
					b.Size = UDim2.new(1, 0, 1, 0)
				end
				a1:Open()
				return a1
			end
			local aZ = false
			ax:CreateTopbarButton('Close', 'x', function()
				if not aZ then
					if not ax.IgnoreAlerts then
						aZ = true
						ax:Dialog{
							Title = 'Close Window',
							Content = 'Do you want to close this window? You will not be able to open it again.',
							Buttons = {
								{
									Title = 'Cancel',
									Callback = function()
										aZ = false
									end,
									Variant = 'Secondary'
								},
								{
									Title = 'Close Window',
									Callback = function()
										aZ = false
										ax:Destroy()
									end,
									Variant = 'Primary'
								}
							}
						}
					else
						ax:Destroy()
					end
				end
			end, (ax.Topbar.ButtonsType == 'Default' and 999 or 997), nil, Color3.fromHex'#F4695F')
			function ax.Tag(a_, a0)
				if ax.UIElements.Main.Main.Topbar.Center.Visible == false then
					ax.UIElements.Main.Main.Topbar.Center.Visible = true
				end
				a0.Window = ax
				return an:New(a0, ax.UIElements.Main.Main.Topbar.Center.Holder)
			end
			local a_ = ap.WindUI.GenerateGUID()
			local function startResizing(a0)
				if ax.CanResize then
					isResizing = true
					aB.Active = true
					initialSize = ax.UIElements.Main.Size
					initialInputPosition = a0.Position
					aj(aA.ImageLabel, 0.1, {
						ImageTransparency = 0.35
					}):Play()
					ag.AddSignal(a0.Changed, function()
						if a0.UserInputState == Enum.UserInputState.End then
							if ap.WindUI.CurrentInput and ap.WindUI.CurrentInput ~= a_ then
								return
							end
							ap.WindUI.CurrentInput = nil
							isResizing = false
							aB.Active = false
							aj(aA.ImageLabel, 0.17, {
								ImageTransparency = 0.8
							}):Play()
						end
					end)
				end
			end
			ag.AddSignal(aA.InputBegan, function(a0)
				if a0.UserInputType == Enum.UserInputType.MouseButton1 or a0.UserInputType == Enum.UserInputType.Touch then
					if ap.WindUI.CurrentInput and ap.WindUI.CurrentInput ~= a_ then
						return
					end
					ap.WindUI.CurrentInput = a_
					if ax.CanResize then
						startResizing(a0)
					end
				end
			end)
			ag.AddSignal(ab.InputChanged, function(a0)
				if a0.UserInputType == Enum.UserInputType.MouseMovement or a0.UserInputType == Enum.UserInputType.Touch then
					if isResizing and ax.CanResize then
						local a1 = a0.Position - initialInputPosition
						local a2 = UDim2.new(0, initialSize.X.Offset + a1.X * 2, 0, initialSize.Y.Offset + a1.Y * 2)
						a2 = UDim2.new(a2.X.Scale, math.clamp(a2.X.Offset, ax.MinSize.X, ax.MaxSize.X), a2.Y.Scale, math.clamp(a2.Y.Offset, ax.MinSize.Y, ax.MaxSize.Y))
						aj(ax.UIElements.Main, 0.08, {
							Size = a2
						}, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
						ax.Size = a2
					end
				end
			end)
			ag.AddSignal(aA.MouseEnter, function()
				if ap.WindUI.CurrentInput and ap.WindUI.CurrentInput ~= a_ then
					return
				end
				if not isResizing then
					aj(aA.ImageLabel, 0.1, {
						ImageTransparency = 0.35
					}):Play()
				end
			end)
			ag.AddSignal(aA.MouseLeave, function()
				if ap.WindUI.CurrentInput and ap.WindUI.CurrentInput ~= a_ then
					return
				end
				if not isResizing then
					aj(aA.ImageLabel, 0.17, {
						ImageTransparency = 0.8
					}):Play()
				end
			end)
			local a0, a1, a2, a3 = 0, 0.4, 0
			function onDoubleClick()
				ax:SetToTheCenter()
			end
			ag.AddSignal(aM.Frame.MouseButton1Up, function()
				local a4, a5 = tick(), ax.Position
				a2 = a2 + 1
				if a2 == 1 then
					a0 = a4
					a3 = a5
					task.spawn(function()
						task.wait(a1)
						if a2 == 1 then
							a2 = 0
							a3 = nil
						end
					end)
				elseif a2 == 2 then
					if a4 - a0 <= a1 and a5 == a3 then
						onDoubleClick()
					end
					a2 = 0
					a3 = nil
					a0 = 0
				else
					a2 = 1
					a0 = a4
					a3 = a5
				end
			end)
			if ax.TabHolderType == 'sidebar' and not ax.HideSearchBar then
				local a4, a5, a6 = a.load'aG', false, ak('Search', 'search', ax.UIElements.SideBarContainer, true)
				a6.Size = UDim2.new(1, - ax.UIPadding / 2, 0, 39)
				a6.Position = UDim2.new(0, ax.UIPadding / 2, 0, 0)
				ag.AddSignal(a6.MouseButton1Click, function()
					if a5 then
						return
					end
					a4.new(ax.TabModule, ax.UIElements.Main, function()
						a5 = false
						if ax.Resizable then
							ax.CanResize = true
						end
						aj(aC, 0.1, {
							ImageTransparency = 1
						}):Play()
						aC.Active = false
					end)
					aj(aC, 0.1, {
						ImageTransparency = 0.65
					}):Play()
					aC.Active = true
					a5 = true
					ax.CanResize = false
				end)
			end
			function ax.DisableTopbarButtons(a4, a5)
				for a6, a7 in next, a5 do
					for a8, a9 in next, ax.TopBarButtons do
						if a9.Name == a7 then
							a9.Object.Visible = false
						end
					end
				end
			end
			return ax
		end
	end
end
local aa = {
	Window = nil,
	Theme = nil,
	Creator = a.load'd',
	Motion = a.load'e',
	LocalizationModule = a.load'f',
	NotificationModule = a.load'g',
	Themes = nil,
	Transparent = false,
	TransparencyValue = 0.15,
	UIScale = 1,
	ConfigManager = nil,
	Version = '0.0.0',
	Services = a.load'l',
	OnThemeChangeFunction = nil,
	cloneref = nil,
	UIScaleObj = nil,
	CreateWindow = nil,
	CurrentInput = nil
}
aa.IconAdapterVersion = aa.Creator.IconAdapterVersion
local ab, ac = aa.Creator, (cloneref or clonereference or function(ab)
	return ab
end)
aa.cloneref = ac
local ad, ae, af, ag, ah = ac(game:GetService'HttpService'), ac(game:GetService'Players'), ac(game:GetService'CoreGui'), ac(game:GetService'RunService'), ac(game:GetService'UserInputService')
function aa.GenerateGUID()
	return ad:GenerateGUID(false)
end
local ai = aa.GenerateGUID()
ab.AddSignal(ah.InputBegan, function(aj, ak)
	task.defer(function()
		if aj.UserInputType == Enum.UserInputType.MouseButton1 or aj.UserInputType == Enum.UserInputType.Touch then
			if aa.CurrentInput and aa.CurrentInput ~= ai then
				return
			end
			aa.CurrentInput = ai
		end
	end)
end)
ab.AddSignal(ah.InputEnded, function(aj, ak)
	if aj.UserInputType == Enum.UserInputType.MouseButton1 or aj.UserInputType == Enum.UserInputType.Touch then
		if aa.CurrentInput and aa.CurrentInput ~= ai then
			return
		end
		aa.CurrentInput = nil
	end
end)
local aj, ak = ae.LocalPlayer or nil, ad:JSONDecode(a.load'm')
if ak then
	aa.Version = ak.version
end
local al, am, an, ao, ap, aq = a.load'q', a.load'r', ab.New, a.load'v', protectgui or (syn and syn.protect_gui) or function()
end, gethui and gethui() or (af or aj:WaitForChild'PlayerGui')
local ar = an('UIScale', {
	Scale = aa.UIScale
})
aa.UIScaleObj = ar
aa.ScreenGui = an('ScreenGui', {
	Name = 'WindUI',
	Parent = aq,
	IgnoreGuiInset = true,
	ScreenInsets = 'None',
	DisplayOrder = - 99999
}, {
	an('Folder', {
		Name = 'Window'
	}),
	an('Folder', {
		Name = 'KeySystem'
	}),
	an('Folder', {
		Name = 'Popups'
	}),
	an('Folder', {
		Name = 'ToolTips'
	})
})
aa.NotificationGui = an('ScreenGui', {
	Name = 'WindUI/Notifications',
	Parent = aq,
	IgnoreGuiInset = true,
	ScreenInsets = 'None',
	ResetOnSpawn = false,
	DisplayOrder = 999999,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
})
aa.DropdownGui = an('ScreenGui', {
	Name = 'WindUI/Dropdowns',
	Parent = aq,
	IgnoreGuiInset = true
})
aa.TooltipGui = an('ScreenGui', {
	Name = 'WindUI/Tooltips',
	Parent = aq,
	IgnoreGuiInset = true
})
ap(aa.ScreenGui)
ap(aa.NotificationGui)
ap(aa.DropdownGui)
ap(aa.TooltipGui)
ab.Init(aa)
function aa.SetParent(as, at)
	if aa.ScreenGui then
		aa.ScreenGui.Parent = at
	end
	if aa.NotificationGui then
		aa.NotificationGui.Parent = at
	end
	if aa.DropdownGui then
		aa.DropdownGui.Parent = at
	end
	if aa.TooltipGui then
		aa.TooltipGui.Parent = at
	end
end
math.clamp(aa.TransparencyValue, 0, 1)
local as = aa.NotificationModule.Init(aa.NotificationGui)
function aa.Notify(at, au)
	au.Holder = as.Frame
	au.Window = aa.Window
	return aa.NotificationModule.New(au)
end
function aa.SetNotificationLower(at, au)
	as.SetLower(au)
end
function aa.RegisterIconSource(at, au, av, aw)
	return ab.RegisterIconSource(au, av, aw)
end
function aa.RegisterIconPack(at, au, av)
	return ab.RegisterIconPack(au, av)
end
aa.AddIconSource = aa.RegisterIconSource
aa.AddIcons = aa.RegisterIconPack
function aa.AddIcon(at, au, av, aw)
	return ab.AddIcon(au, av, aw)
end
function aa.AddIconSourceAlias(at, au, av)
	return ab.AddIconSourceAlias(au, av)
end
function aa.SetIconSource(at, au)
	return ab.SetIconSource(au)
end
function aa.GetIconSources(at)
	return ab.GetIconSources()
end
function aa.HasIcon(at, au, av)
	return ab.HasIcon(au, av)
end
function aa.LoadingScreen(at, au)
	return am.new(aa, au)
end
function aa.LoadingCreate(at, au)
	if aa.ActiveLoading and not aa.ActiveLoading.Closed then
		aa.ActiveLoading:Close(0)
	end
	aa.ActiveLoading = am.new(aa, au)
	return aa.ActiveLoading
end
function aa.LoadingSet(at, au, av)
	local aw = aa.ActiveLoading
	if not aw or aw.Closed then
		aw = aa:LoadingCreate{}
	end
	if typeof(au) == 'table' then
		if au.Status or au.Text or au.Title then
			aw:SetStatus(au.Status or au.Text or au.Title)
		end
		if au.Progress ~= nil or au.Value ~= nil then
			aw:SetProgress(au.Progress ~= nil and au.Progress or au.Value)
		end
		if au.Step then
			aw:Step(au.Step, au.Status or au.Text)
		end
		if au.Close then
			aw:Close(au.Delay or au.CloseDelay or 0)
		end
		return aw
	end
	if typeof(au) == 'number' then
		aw:SetProgress(au)
		if av then
			aw:SetStatus(av)
		end
	elseif au ~= nil then
		aw:SetStatus(au)
		if typeof(av) == 'number' then
			aw:SetProgress(av)
		end
	end
	return aw
end
function aa.SetFont(at, au)
	ab.UpdateFont(au)
end
function aa.SetMotionPreset(at, au)
	return aa.Motion:SetPreset(au)
end
function aa.SetReducedMotion(at, au)
	return aa.Motion:SetReducedMotion(au)
end
function aa.OnThemeChange(at, au)
	aa.OnThemeChangeFunction = au
end
function aa.AddTheme(at, au)
	aa.Themes[au.Name] = au
	return au
end
function aa.SetTheme(at, au)
	if aa.Themes[au] then
		aa.Theme = aa.Themes[au]
		ab.SetTheme(aa.Themes[au])
		if aa.OnThemeChangeFunction then
			aa.OnThemeChangeFunction(au)
		end
		return aa.Themes[au]
	end
	return nil
end
function aa.GetThemes(at)
	return aa.Themes
end
function aa.GetCurrentTheme(at)
	return aa.Theme.Name
end
function aa.GetTransparency(at)
	return aa.Transparent or false
end
function aa.GetWindowSize(at)
	return aa.Window.UIElements.Main.Size
end
function aa.Localization(at, au)
	return aa.LocalizationModule:New(au, ab)
end
function aa.SetLanguage(at, au)
	if ab.Localization then
		return ab.SetLanguage(au)
	end
	return false
end
function aa.ToggleAcrylic(at, au)
	if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
		aa.Window.Acrylic = au
		aa.Window.AcrylicPaint.Model.Transparency = au and 0.98 or 1
		if au then
			ao.Enable()
		else
			ao.Disable()
		end
	end
end
function aa.Gradient(at, au, av)
	local aw, ax = {}, {}
	for ay, az in next, au do
		local aA = tonumber(ay)
		if aA then
			aA = math.clamp(aA / 100, 0, 1)
			local aB = az.Color
			if typeof(aB) == 'string' and string.sub(aB, 1, 1) == '#' then
				aB = Color3.fromHex(aB)
			end
			local aC = az.Transparency or 0
			table.insert(aw, ColorSequenceKeypoint.new(aA, aB))
			table.insert(ax, NumberSequenceKeypoint.new(aA, aC))
		end
	end
	table.sort(aw, function(ay, az)
		return ay.Time < az.Time
	end)
	table.sort(ax, function(ay, az)
		return ay.Time < az.Time
	end)
	if # aw < 2 then
		table.insert(aw, ColorSequenceKeypoint.new(1, aw[1].Value))
		table.insert(ax, NumberSequenceKeypoint.new(1, ax[1].Value))
	end
	local ay = {
		Color = ColorSequence.new(aw),
		Transparency = NumberSequence.new(ax)
	}
	if av then
		for az, aA in pairs(av) do
			ay[az] = aA
		end
	end
	return ay
end
function aa.Popup(at, au)
	au.WindUI = aa
	return a.load'w'.new(au, aa.ScreenGui.Popups)
end
aa.Themes = a.load'x'(aa, ab)
ab.Themes = aa.Themes
aa:SetTheme'Dark'
aa:SetLanguage(ab.Language)
function aa.CreateWindow(at, au)
	local av = a.load'aH'
	if not ag:IsStudio() and writefile then
		if not isfolder'WindUI' then
			makefolder'WindUI'
		end
		if au.Folder then
			makefolder(au.Folder)
		else
			makefolder(au.Title)
		end
	end
	au.WindUI = aa
	au.Window = aa.Window
	au.Parent = aa.ScreenGui.Window
	if aa.Window then
		warn'You cannot create more than one window'
		return
	end
	aa.Motion:Configure(au.Motion)
	local aw, ax, ay = true, au.LoadingScreen or au.Loader or au.Loading
	local function OpenLoader(az, aA)
		if ax == nil or ax == false then
			return nil
		end
		if not ay then
			local aB = {}
			if typeof(ax) == 'table' then
				for aC, aD in next, ax do
					aB[aC] = aD
				end
			end
			aB.Title = aB.Title or au.Title or 'WindUI'
			aB.Desc = aB.Desc or 'Loading interface'
			aB.Icon = aB.Icon or au.Icon or 'sparkles'
			aB.Folder = aB.Folder or au.Folder
			ay = am.new(aa, aB)
		end
		if az then
			ay:SetStatus(az)
		end
		if aA then
			ay:SetProgress(aA)
		end
		return ay
	end
	if not au.KeySystem then
		OpenLoader('Preparing interface', 0.16)
	end
	local az, aA = au.Theme or 'Dark'
	if typeof(az) == 'table' then
		aA = az
	elseif typeof(az) == 'string' then
		aA = aa.Themes[az]
	end
	aA = aA or aa.Theme or aa.Themes.Dark
	aa.Theme = aA
	ab.SetTheme(aA)
	local aB = gethwid or function()
		return ae.LocalPlayer.UserId
	end
	local aC = aB()
	local function PickField(aD, aE)
		for aF, aG in next, aE do
			if aD[aG] ~= nil then
				return aD[aG]
			end
		end
		return nil
	end
	local function NormalizeServiceType(aD)
		local aE = string.lower(tostring(aD or ''))
		aE = string.gsub(aE, '%s+', '')
		aE = string.gsub(aE, '[_%-%./]', '')
		local aF = {
			luarmor = 'luarmor',
			platoboost = 'platoboost',
			plato = 'platoboost',
			panda = 'pandadevelopment',
			pandadev = 'pandadevelopment',
			pandadevelopment = 'pandadevelopment',
			junkie = 'junkiedevelopment',
			junkiedev = 'junkiedevelopment',
			junkiedevelopment = 'junkiedevelopment'
		}
		return aF[aE] or aE
	end
	local function NormalizeKeySystemAPI()
		if not au.KeySystem or typeof(au.KeySystem.API) ~= 'table' then
			return
		end
		local aD = au.KeySystem.API
		local aE = aD
		if aD.Type or aD.type or aD.Service or aD.service then
			aE = {
				aD
			}
		end
		local aF = {}
		for aG, aH in next, aE do
			if typeof(aH) == 'table' then
				local aI = {}
				for aJ, aK in next, aH do
					aI[aJ] = aK
				end
				aI.Type = NormalizeServiceType(PickField(aH, {
					'Type',
					'type',
					'Service',
					'service',
					'Provider',
					'provider'
				}))
				aI.ScriptId = PickField(aH, {
					'ScriptId',
					'ScriptID',
					'scriptId',
					'scriptID',
					'script_id',
					'Script',
					'script',
					'Id',
					'ID',
					'id'
				}) or aI.ScriptId
				aI.ServiceId = PickField(aH, {
					'ServiceId',
					'ServiceID',
					'serviceId',
					'serviceID',
					'service_id',
					'Service',
					'service',
					'Id',
					'ID',
					'id'
				}) or aI.ServiceId
				aI.Discord = PickField(aH, {
					'Discord',
					'discord',
					'DiscordURL',
					'DiscordUrl',
					'discordUrl',
					'discord_url',
					'Invite',
					'invite',
					'URL',
					'Url',
					'url'
				}) or aI.Discord
				aI.Secret = PickField(aH, {
					'Secret',
					'secret',
					'ApiSecret',
					'APISecret',
					'apiSecret',
					'api_secret'
				}) or aI.Secret
				aI.ApiKey = PickField(aH, {
					'ApiKey',
					'APIKey',
					'apiKey',
					'api_key',
					'Key',
					'key'
				}) or aI.ApiKey
				if aI.Type and aI.Type ~= '' then
					table.insert(aF, aI)
				end
			end
		end
		au.KeySystem.API = aF
	end
	NormalizeKeySystemAPI()
	if au.KeySystem then
		aw = false
		local function loadKeysystem()
			al.new(au, aC, function(aD)
				aw = aD
			end)
		end
		local aD = (au.Folder or 'Temp') .. '/' .. aC .. '.key'
		if au.KeySystem.KeyValidator then
			if au.KeySystem.SaveKey and isfile(aD) then
				local aE = readfile(aD)
				local aF, aG = pcall(au.KeySystem.KeyValidator, aE)
				if aF and aG then
					aw = true
				else
					loadKeysystem()
				end
			else
				loadKeysystem()
			end
		elseif not au.KeySystem.API then
			if au.KeySystem.SaveKey and isfile(aD) then
				local aE = readfile(aD)
				local aF = (type(au.KeySystem.Key) == 'table') and table.find(au.KeySystem.Key, aE) or tostring(au.KeySystem.Key) == tostring(aE)
				if aF then
					aw = true
				else
					loadKeysystem()
				end
			else
				loadKeysystem()
			end
		else
			if isfile(aD) then
				local aE, aF = readfile(aD), false
				for aG, aH in next, au.KeySystem.API do
					local aI = aa.Services[aH.Type]
					if aI then
						local aJ = {}
						for aK, aL in next, aI.Args do
							table.insert(aJ, aH[aL])
						end
						local aK, aL = pcall(function()
							return aI.New(table.unpack(aJ))
						end)
						local aM, aN = false, false
						if aK and aL and type(aL.Verify) == 'function' then
							aM, aN = pcall(aL.Verify, aE)
						end
						if aM and aN then
							aF = true
							break
						end
					end
				end
				aw = aF
				if not aF then
					loadKeysystem()
				end
			else
				loadKeysystem()
			end
		end
		repeat
			task.wait()
		until aw
		OpenLoader('Access granted', 0.42)
	end
	OpenLoader('Building window', 0.72)
	local aD = av(au)
	aa.Transparent = au.Transparent
	aa.Window = aD
	if au.Acrylic then
		ao.init()
	end
	if ay then
		ay:SetStatus'Ready'
		ay:SetProgress(1)
		ay:Close((typeof(ax) == 'table' and ax.CloseDelay) or 0.18)
	end
	return aD
end
return aa
