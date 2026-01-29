push=require "push"

WINDOW_WIDTH=1280
WINDOW_HEIGHT=720
VIRTUAL_WIDTH=423
VIRTUAL_HEIGHT=243
function love.load()
    
    love.graphics.setDefaultFilter("nearest","nearest")


    smallfont=love.graphics.newFont("font.ttf",8)




    love.graphics.setFont(smallfont)


    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen =false,
        resizable=false,
        vsync=true
    })
end
function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end
end
function love.draw()
    push:apply('start')



    love.graphics.clear(40/255,45/255,52/255,255/255)

    love.graphics.printf(
        -- text,x,y,limit,align
        "HELLO PONG",
        0,
        20,
        VIRTUAL_WIDTH,
        'center'
    )
    -- two paddles

    love.graphics.rectangle("fill",10,30,5,20)
    love.graphics.rectangle("fill",VIRTUAL_WIDTH-10,VIRTUAL_HEIGHT-50,5,20)

    -- ball

    love.graphics.circle("fill",VIRTUAL_WIDTH/2,VIRTUAL_HEIGHT/2,4)
    push:apply('end')
end
