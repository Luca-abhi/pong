push=require "push"

WINDOW_WIDTH=1280
WINDOW_HEIGHT=720
VIRTUAL_WIDTH=423
VIRTUAL_HEIGHT=243


PADDLE_SPEED=200
function love.load()
    
    love.graphics.setDefaultFilter("nearest","nearest")


    smallfont=love.graphics.newFont("font.ttf",8)

    scorefont=love.graphics.newFont("font.ttf",32)






    love.graphics.setFont(smallfont)


    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen =false,
        resizable=false,
        vsync=true
    })

    player1score=0
    player2score=0


    player1Y=30
    player2Y=VIRTUAL_HEIGHT-50




end


function love.update(dt)
    if love.keyboard.isDown('w') then
        player1Y=player1Y - PADDLE_SPEED*dt --as moving up so negative
    elseif love.keyboard.isDown('s') then
        player1Y=player1Y + PADDLE_SPEED*dt  --as moving down so positive
    end 

    if love.keyboard.isDown('up') then
        player2Y=player2Y - PADDLE_SPEED*dt --as moving up so negative
    elseif love.keyboard.isDown('down') then
        player2Y=player2Y + PADDLE_SPEED*dt  --as moving down so positve
    end






end

function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end
end
function love.draw()
    push:apply('start')



    love.graphics.clear(40/255,45/255,52/255,255/255)



    love.graphics.setFont(smallfont)

    love.graphics.printf(
        -- text,x,y,limit,align
        "HELLO PONG",
        0,
        20,
        VIRTUAL_WIDTH,
        'center'
    )
    love.graphics.setFont(scorefont)
    love.graphics.print(tostring(player1score),VIRTUAL_WIDTH/2-50,VIRTUAL_HEIGHT/3)
    love.graphics.print(tostring(player1score),VIRTUAL_WIDTH/2+30,VIRTUAL_HEIGHT/3)

    

    -- two paddles


    love.graphics.rectangle("fill",10,player1Y,5,20)
    love.graphics.rectangle("fill",VIRTUAL_WIDTH-10,player2Y,5,20)

    -- ball

    love.graphics.circle("fill",VIRTUAL_WIDTH/2-2,VIRTUAL_HEIGHT/2-2,4)
    push:apply('end')
end
