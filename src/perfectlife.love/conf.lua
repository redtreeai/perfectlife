-- 游戏开始前加载 游戏的
function love.conf(win)
    win.title = 'DragonTower'
    win.window.width=1024
    win.window.height=768
    win.modules.joystick = false
    win.modules.physics = false
end

