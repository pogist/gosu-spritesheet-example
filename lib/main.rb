require 'gosu'
require_relative 'player'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Spritesheet animation example"

    @player = Player.new 320, 240

    @key = {kb_left: Gosu::KbLeft,
            kb_right: Gosu::KbRight,
            gp_left: Gosu::GpLeft,
            gp_right: Gosu::GpRight}
  end

  def update
    if Gosu::button_down? @key[:kb_left] or Gosu::button_down? @key[:gp_left] then
      @player.move :left
    end
    if Gosu::button_down? @key[:kb_right] or Gosu::button_down? @key[:gp_right] then
      @player.move :right
    end
  end

  def draw
    @player.draw
  end

  def button_up(id)
    if id == @key[:kb_left] or id == @key[:gp_left] then
      @player.stop_move
    end
    if id == @key[:kb_right] or id == @key[:gp_right] then
      @player.stop_move
    end
  end
end

GameWindow.new.show
