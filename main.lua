push=require "push"
Class=require  "class"
require "paddle"
require "ball"
require "computerpaddle"

WINDOW_WIDTH=1280
WINDOW_HEIGHT=720
VIRTUAL_WIDTH=423
VIRTUAL_HEIGHT=243


PADDLE_SPEED=200
function love.load()
    
    love.graphics.setDefaultFilter("nearest","nearest")

    love.window.setTitle("pong")

    smallfont=love.graphics.newFont("font.ttf",8)

    scorefont=love.graphics.newFont("font.ttf",32)


    love.graphics.setFont(smallfont)


    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen =false,
        resizable=true,
        vsync=true
    })



    player1=ComputerPaddle(10,30,5,20,PADDLE_SPPEED)
    player2=Paddle(VIRTUAL_WIDTH-10,VIRTUAL_HEIGHT-30,5,20)

    
    player1score=0
    player2score=0



    servingplayer=1

    ball=Ball(VIRTUAL_WIDTH/2-2,VIRTUAL_HEIGHT/2-2,4)


    gameState="start"



end             



function love.resize(w,h)
    push:resize(w,h)
end





function love.update(dt)

    if gameState=="serve" then
        ball.dy=math.random(-50,50)
        
        if servingplayer==1 then
            ball.dx=math.random(150,200)
        else 
            ball.dx=-math.random(150,200)
        end

    elseif gameState=="play" then
        
        
        
        







        
        if ball:collision(player1) then
            ball.dx=-ball.dx*1.03
            ball.x=player1.x+4
        
            if ball.dy<0 then
                ball.dy=-math.random(10,150)
            else
                ball.dy=math.random(10,150)
            
            end

        end

        if ball:collision(player2) then
            ball.dx=-ball.dx*1.03
            ball.x=player2.x-4
            



            if ball.dy<0 then
                ball.dy=-math.random(10,150)
            else
                ball.dy=math.random(10,150)
            
            end

        end


        if ball.y<0 then
            ball.y=0
            ball.dy=-ball.dy
        end
        if ball.y>VIRTUAL_HEIGHT then
            ball.y=VIRTUAL_HEIGHT
            ball.dy=-ball.dy
        end
    




        if ball.x<0 then
            servingplayer=1
        
            player2score=player2score+1
            if player2score==10 then 
                winningPlayer=2
                gameState="done"
            else
                gameState="serve"
                ball:reset()
            end 
        
        end

    

        if ball.x>VIRTUAL_WIDTH then
            servingplayer=2
            player1score=player1score+1
            if player1score==10 then 
                winningPlayer=1
                gameState="done"
            else
                gameState="serve"
                ball:reset()
            end
        end
    end








    -- if love.keyboard.isDown("a") then
    --     player1.dy=- PADDLE_SPEED --as moving up so negative
    -- elseif love.keyboard.isDown('z') then
    --     player1.dy= PADDLE_SPEED  --as moving down so positive
    -- else
    --     player1.dy=0
    -- end 
    

    if love.keyboard.isDown("up") then
        player2.dy=- PADDLE_SPEED --as moving up so negative
    elseif love.keyboard.isDown('down') then
        player2.dy= PADDLE_SPEED  --as moving down so positive
    else
        player2.dy=0
    end 



    if gameState=="play" then
        ball:update(dt)
        -- if ball.dy>0 then
        --     player1.dy=PADDLE_SPEED
        -- elseif ball.dy<0 then
        --     player1.dy=-PADDLE_SPEED
        -- end
        player1.y=player1.y+player1.dy*dt



        -- player1.y=ball.y         --    unbeatable computer player *\_/*
    end 

    player1:update(dt)
    player2:update(dt)







end

function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end



    if key=="enter" or key=="return" then
        if gameState=="start" then
            gameState="serve"
        elseif gameState=="serve" then
            gameState="play"
        elseif gameState=="done" then







            love.load()
            
            
            


        

 
        end
    end
end
function love.draw()
    push:apply('start')







    love.graphics.clear(40/255,45/255,52/255,255/255)
    displayScore()
    love.graphics.setFont(smallfont)



    


    if gameState=="start" then 
        love.graphics.setFont(smallfont)
        love.graphics.printf("pong Welcome ....",0,10,VIRTUAL_WIDTH,"center")
        love.graphics.printf("start n enter to begin!....",0,20,VIRTUAL_WIDTH,"center") 
        
        

    
    elseif gameState=="serve" then
        love.graphics.printf("player"..tostring(servingplayer),0,10,VIRTUAL_WIDTH,"center")
        love.graphics.printf("press enter to serve .",0,20,VIRTUAL_WIDTH,"center")

    elseif gameState=="done" then
            love.graphics.printf("player"..tostring(winningPlayer) .. "    wins....WINNER",0,10,VIRTUAL_WIDTH,"center")



            love.graphics.printf("press Enter or Return to start the game again...",0,30,VIRTUAL_WIDTH,"center")

    elseif gameState=="play" then

    


    end             

    -- two paddles

    player1:render()
    player2:render()
    -- love.graphics.rectangle("fill",10,player1Y,5,20)
    -- love.graphics.rectangle("fill",VIRTUAL_WIDTH-10,player2Y,5,20)

    -- ball
    ball:render()
    push:apply('end')


end


function displayScore()    
    love.graphics.setFont(scorefont)
    love.graphics.print(tostring(player1score),VIRTUAL_WIDTH/2-50,VIRTUAL_HEIGHT/3)
    love.graphics.print(tostring(player2score),VIRTUAL_WIDTH/2+30,VIRTUAL_HEIGHT/3)

end
