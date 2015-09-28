require 'gosu'
require_relative 'player'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Spritesheet animation example"

    @player = Player.new 320, 240
  end

  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @player.move_left
      @player.animated = true
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @player.move_right
      @player.animated = true
    end
  end

  def draw
    @player.draw
  end

  def button_up(id)
    if id == Gosu::KbLeft or id == Gosu::GpLeft then
      @player.animated = false 
    end
    if id == Gosu::KbRight or id == Gosu::GpRight then
      @player.animated = false
    end
  end
end

GameWindow.new.show
