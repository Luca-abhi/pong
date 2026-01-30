Ball=Class{}
function Ball:init(x,y,radius)
    self.x=x    
    self.y=y
    self.radius=radius
    self.dx=math.random(100,-100)
    self.dy=math.random(-50,50)



end



function Ball:reset()
    self.x=VIRTUAL_WIDTH/2-2
    self.y=VIRTUAL_HEIGHT/2-2



    self.dy=math.random(-50,50)



    self.dx=math.random(100,-100)




end
function Ball:update(dt)
    self.x=self.x+self.dx*dt
    self.y=self.y+self.dy*dt
end
function Ball:render()
    love.graphics.circle("fill",self.x,self.y,self.radius)
end




function Ball:collision(paddle)
    if self.x>paddle.x+paddle.width or self.y>paddle.y+paddle.height then
        return false
    end
    if paddle.x>self.x+self.radius or paddle.y>self.y+self.radius then
        return false
    end
    return true
end
