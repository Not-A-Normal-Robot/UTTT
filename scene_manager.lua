CURRENT_SCENE = {}
local sceneManager = {}
sceneManager.stack = {}

function sceneManager.SwitchTo(sceneName)
    if type(CURRENT_SCENE.exit) == 'function' then CURRENT_SCENE.exit() end
    CURRENT_SCENE = require('scenes.' .. sceneName)
end

function sceneManager.Push(sceneName)
    table.insert(sceneManager.stack, CURRENT_SCENE)
    CURRENT_SCENE = require('scenes.' .. sceneName)
end

function sceneManager.Pop()
    if type(CURRENT_SCENE.exit) == 'function' then CURRENT_SCENE.quit() end
    CURRENT_SCENE = table.remove(sceneManager.stack)
end

sceneManager.SwitchTo('main_menu')
print(CURRENT_SCENE)
return sceneManager