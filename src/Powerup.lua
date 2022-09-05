Powerup = Class{}

function Powerup:init(skin)
  self.x = VIRTUAL_WIDTH / 2 - 16
  self.y = 0
  self.width = 16
  self.height = 16

  self.dy = 100
  self.key = false
  self.skin = skin
end

function Powerup:update(dt)
  self.y = self.y + self.dy * dt
end

function Powerup:collides(target)
  if self.x > target.x + target.width or target.x > self.x + self.width then
      return false
  end

  if self.y > target.y + target.height or target.y > self.y + self.height then
    return false
  end

    gSounds['recover']:play()
    self.x = -100
    return true
end

function Powerup:render()
  love.graphics.draw(gTextures['main'], gFrames['powerups'][(self.skin + 8)],
      self.x, self.y)
end
