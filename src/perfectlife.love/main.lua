---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by chs.
--- DateTime: 18-12-14 下午4:05
---
--预加载资源
require('core.love_engine')
require('loader')
require('painter')
require('eventer')
function love.load()
    --游戏初始化，先校验存档文件是否存在
    last_saving_data = love_engine.filesystem.read('gamedata.txt',all)
    if last_saving_data == nil then
        --若无存档文件，则加载title_nosave页面,
        loader.SCENE_STATUS.cur_scene=basedata.SCENE_CODE.TITLE.name
        basedata.SCENE_CODE.TITLE.is_save=false
    else
        --若文档存在，则加载title界面。
        loader.SCENE_STATUS.cur_scene=basedata.SCENE_CODE.TITLE.name
        basedata.SCENE_CODE.TITLE.is_save=true
    end

    --捕捉鼠标相关信息
    mouse_left_clicked = false
    mouse_right_clicked = false
    is_left_click = false
    is_right_click = false


    --预加载媒体资源
    --title_img = love.graphics.newImage("resource/ui_items/title.jpg")

    ----预加载游戏配置参数
    --cur_scene = basedata.SCENE_CODE.TITLE
    --cur_mouse_x = 0
    --cur_mouse_y = 0
    --mouse_left_clicked = false
    --mouse_right_clicked = false
    --校验存档文件，若存在则读取，若不存在则创建(存档丢失仅当重新开始游戏)。
    --从存档读取游戏数据

    ----读取存档文件
    --last_saving_data = love_engine.filesystem.read('gamedata.txt',all)
    ----赋值到游戏数据table
    --gamedata = dt_converter.StrToTable(last_saving_data)

end


--更新函数
function love.update()
    cur_mouse_x = love_engine.mouse.getX()
    cur_mouse_y = love_engine.mouse.getY()


    if love_engine.mouse.isDown("1") then
        mouse_left_clicked = true
    else
        if mouse_left_clicked ==true then
            mouse_left_clicked =false
            is_left_click = true
            --单次鼠标左击事件写在此处
            --gamedata.PlayerMoney = gamedata.PlayerMoney+1
            --save_data = dt_converter.TableToStr(gamedata)
            --fileData=love_engine.filesystem.newFileData(save_data,"gamedata.txt","base64")
            --res =love_engine.filesystem.write("gamedata.txt", fileData)
            --print(res)
        end
    end

    if love_engine.mouse.isDown("2") then
        mouse_right_clicked = true
    else
        if mouse_right_clicked ==true then
            mouse_right_clicked =false
            is_right_click = true
            --单次鼠标右击事件写在此处
            --gamedata.PlayerMoney = gamedata.PlayerMoney+1
        end
    end
    --执行更新事件
    eventer.dojob(loader.SCENE_STATUS.cur_scene,cur_mouse_x,cur_mouse_y,is_left_click,is_right_click)
    --重置参数
    is_left_click = false
    is_right_click = false

end


--画布
function love.draw()
    --if cur_scene == basedata.SCENE_CODE.TITLE then
    --    love.graphics.draw(title_img,0,0)
    --
    --end
    painter.dojob(loader.SCENE_STATUS.cur_scene)
end


