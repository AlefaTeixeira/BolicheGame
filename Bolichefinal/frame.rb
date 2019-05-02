require_relative 'jogada'

class Frame
  
  def initialize (jogada1, jogada2)
      j1 = Jogada.new(jogada1)
      j2  = Jogada.new(jogada2)
      puts j1.get_info
      puts j2.get_info
      @total = j1.pinos + j2.pinos
  end
  
  def get_total
    @total
  end

end