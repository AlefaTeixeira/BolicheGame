require_relative 'Jogo'

class Testandogame
  
  Jogo.bemvindo
  
  loop do
      jogo = Jogo.new
      jogo.jogar
      break if Jogo.parar_de_jogar?
   end
  
end


