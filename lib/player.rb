require 'gosu'
require_relative 'animation'

class Player
  attr_writer :animated

  def initialize(x, y)
    @frames = Gosu::Image.load_tiles 'res/dude.png', 32, 48
    @x, @y = x, y

    @moving_left = Animation.new @frames[0..3], 0.3
    @moving_right = Animation.new @frames[5..8], 0.3
    
    @animation = @moving_left
    @animated = false
  end

  def draw
    if @animated
      img = @animation.start
      img.draw @x, @y, 1
    else
      img = @animation.stop
      img.draw @x, @y, 1
    end
  end

  def move_left
    @x -= 1.0
    @animation = @moving_left if @animation != @moving_left
  end

  def move_right
    @x += 1.0
    @animation = @moving_right if @animation != @moving_right
  end
end
