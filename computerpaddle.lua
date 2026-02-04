ComputerPaddle=Class{}


function ComputerPaddle:init(x,y,width,height,speed)
    self.x=x
    self.y=y
    self.width=width
    self.height=height
    self.dy=400
end
function ComputerPaddle:update(dt)
    
    if self.y <0 then
        self.y=math.max(0,self.y-self.dy*dt)
        self.dy=-self.dy
    elseif self.y>VIRTUAL_HEIGHT-self.height then 
        self.y=math.min(VIRTUAL_HEIGHT-self.height,self.y+self.dy*dt)
        self.dy=-self.dy
    end
end
function ComputerPaddle:render()
    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end