
Paddle = Class{}

function Paddle:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
end

function Paddle:update(dt)
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    else
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end
end

-- Update function for AI paddle movement
function Paddle:updateAI(dt,ball)
    -- Move the AI paddle towards the ball's y position
    if ball.y < self.y then
        self.dy = -PADDLE_SPEED
    elseif ball.y > self.y + self.height then
        self.dy = PADDLE_SPEED
    else
        self.dy = 0
    end

    -- Call the update function to apply the movement
    self:update(dt)
end


function Paddle:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end