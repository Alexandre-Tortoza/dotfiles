-- Change the default Omarchy look'n'feel.

-- Acrylic / frosted-glass effect
-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
    rounding = 12,
    active_opacity = 0.92,
    inactive_opacity = 0.85,

    blur = {
      enabled = true,
      size = 3,
      passes = 3,
      new_optimizations = true,
      xray = true,
      vibrancy = 0.25,
      contrast = 1.0,
      brightness = 1.0,
      special = true,
      popups = true,
    },
  },
})

-- The `n` launcher runs Neovim and sets the Ghostty window title to `n`.
o.window(
  { class = "com.mitchellh.ghostty", title = "^n$" },
  { opacity = "0.9062 override 0.816 override 0.9062 override" }
)

-- Blur the translucent backdrop shown by the Super+Space Omarchy menu.
hl.layer_rule({
  match = { namespace = "omarchy-menu" },
  blur = true,
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    -- No gaps between windows or borders.
    gaps_in = 3,
    gaps_out = 0,
    border_size = 2,

    -- Change to niri-like side-scrolling layout.
    -- layout = "scrolling",
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
    -- Use round window corners.
    rounding = 4,

    -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
    dim_inactive = true,
    dim_strength = 0.15,
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })
