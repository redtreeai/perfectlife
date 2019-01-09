---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by chs.
--- DateTime: 19-1-7 下午3:03
--- 事件逻辑控制器

require('loader')
require('core.love_engine')
require('gdata.basedata')
require('utils.math_tool')

eventer = {}

function eventer.dojob(cur_scene,cur_mouse_x,cur_mouse_y,is_left_click,is_right_click)
    --print(cur_scene,cur_mouse_x,cur_mouse_y,is_left_click,is_right_click)
    --位于title界面时的操作
    if cur_scene == basedata.SCENE_CODE.TITLE.name then

        if 350 < cur_mouse_x and cur_mouse_x < 625 and 413 < cur_mouse_y and cur_mouse_y < 465 then
            --选中开始游戏按钮时，切换状态
            basedata.SCENE_CODE.TITLE.is_on_start=true
        elseif  410 < cur_mouse_x and cur_mouse_x < 545 and 540 < cur_mouse_y and cur_mouse_y < 587
        then
            --选中退出按钮时,
            basedata.SCENE_CODE.TITLE.is_on_exit=true
        else
            --其他状态下
            --如果没有检测到存档文件
            if basedata.SCENE_CODE.TITLE.is_save==false then
                basedata.SCENE_CODE.TITLE.is_on_exit = false
                basedata.SCENE_CODE.TITLE.is_on_start = false
                basedata.SCENE_CODE.TITLE.is_on_continue = false
            else
                if  381 < cur_mouse_x and cur_mouse_x < 593 and 317 < cur_mouse_y and cur_mouse_y < 360 then
                    basedata.SCENE_CODE.TITLE.is_on_continue=true
                else
                    basedata.SCENE_CODE.TITLE.is_on_exit = false
                    basedata.SCENE_CODE.TITLE.is_on_start = false
                    basedata.SCENE_CODE.TITLE.is_on_continue = false
                end
            end
        end

        if basedata.SCENE_CODE.TITLE.is_on_exit and is_left_click then
            --退出游戏
            love_engine.event.quit()
        end
        if basedata.SCENE_CODE.TITLE.is_on_start and is_left_click then
            --进入角色创建页面
            loader.SCENE_STATUS.cur_scene=basedata.SCENE_CODE.CREATE_USER.name
        end
        if basedata.SCENE_CODE.TITLE.is_on_continue and is_left_click then
            --继续游戏,读取存档数据
            last_saving_data = love_engine.filesystem.read('gamedata.txt',all)
            if last_saving_data == nil then
                --若读取异常，则提示存档文件损坏。
                basedata.SCENE_CODE.TITLE.is_save_broken = true
            else
                --正常读取游戏数据，然后进入到游戏主界面
            end
        end
    end

end
