function love.conf(t)
    t.version = "11.3"
    t.console = false
    t.accelerometerjoystick = false
    t.externalstorage = false
    t.gammacorrect = true

    t.audio.mic = false
    t.audio.mixwithsystem = true

    t.window.title = "Ultimate Tic Tac Toe"
    t.window.icon = "res/icon.png"
    t.window.width = 1280
    t.window.height = 720
    t.window.borderless = false
    t.window.resizable = true
    t.window.minwidth = 128
    t.window.minheight = 72
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
    t.window.depth = nil
    t.window.stencil = nil

    t.modules.audio = false
    t.modules.data = false
    t.modules.event = true
    t.modules.font = true
    t.modules.graphics = true
    t.modules.image = false
    t.modules.joystick = true
    t.modules.keyboard = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.physics = false
    t.modules.sound = true
    t.modules.system = true
    t.modules.thread = false
    t.modules.timer = true
    t.modules.touch = true
    t.modules.video = false
    t.modules.window = true
end
