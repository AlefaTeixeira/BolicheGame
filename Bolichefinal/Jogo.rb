require_relative 'jogada'
require_relative 'frame'

class Jogo
  def self.bemvindo

    puts "Seja Bem Vindo ao Seu Jogo de Boliche!"
    puts "            _                   _ _             "
    puts "           | |__   _____      _| (_)_ __   __ _ "
    puts "           | '_ \\ / _ \\ \\ /\\ / / | | '_ \\ / _` |"
    puts "           | |_) | (_) \\ V  V /| | | | | | (_| |"
    puts "           |_.__/ \\___/ \\_/\\_/ |_|_|_| |_|\\__, |"
    puts "                                          |___/ "

    puts "Por favor, digite o seu nome?"
    nome = gets
    puts "Ok, vamos lá #{nome}"
    puts "Pressione Enter Para Continuar"
    gets
  end

  def jogar

    jogador = Array.new
    jogadaPC = Array.new
   
    strike = false
    spare = false

    for i in 0..9

      jogada_1 = rand(11)
      jogada_2 = rand(11 - jogada_1)

      puts "\nFrame ID - #{i}"
      frame = Frame.new(jogada_1,jogada_2)
      puts "Frameusados#{frame.get_total}"

      jogador << jogada_1
      jogador << jogada_2

      jogada_3 = rand(11)
      jogada_4 = rand(11 - jogada_3)
      framePC = Frame.new(jogada_3,jogada_4)
      puts "TotalFramePC --> #{framePC.get_total}"

      jogadaPC << jogada_3
      jogadaPC << jogada_4

    end

    jogador[0] = 10
    jogador[1] = 0
    jogador[2] = 10
    jogador[3] = 0
    jogador[4] = 0

    puts
    puts "SUAS JOGADAS-"
    pontuacaoUser = totalizador jogador
    puts "JOGADAS DA MAQUINA-"
    pontuacaoPC = totalizador jogadaPC

    if pontuacaoUser > pontuacaoPC
      puts "Voce Venceu! #{pontuacaoUser} > #{pontuacaoPC}"
      puts " \n\n\n\n\n            
                    _     _     _     _     _ 
                    | | _ | | _ | | _ | | _ | |
                    )  | | _ | | _ | | _ | |  (
                  (   )  | | _ | | _ | |  (   )
                    \_(   )  | | _ | |  (   )_/
                      \_(   )  | |  (   )_/
                          \_(   ) (   )_/
                            \_(   )_/
                                \_/              
                                            "
    elsif pontuacaoPC > pontuacaoUser
      puts "Ah, Desta Vez o Jogador Virtual Ganhou!#{pontuacaoUser} < #{pontuacaoPC}"
      puts" \n\n\n\n\n
      
      ___.   ___  , _ , _     ___         __.  _   __   ___  .___ 
      .'   `  /   ` |' `|' `. .'   `      .'   \ |   /  .'   ` /   \
      |    | |    | |   |   | |----'      |    | `  /   |----' |   '
       `---| `.__/| /   '   / `.___,       `._.'  \/    `.___, /    
       \___/                        
      
      
      
      "

    else
      puts "Deu Empate #{pontuacaoUser} = #{pontuacaoPC}"
      puts" \n\n\n\n\n
    
                              
      /      , _ , _   \,___,   ___  _/_     ___ 
      |__.   |' `|' `. |    \  /   `  |    .'   `
      |      |   |   | |    | |    |  |    |----'
      /----/ /   '   / |`---' `.__/|  \__/ `.___,
                        \                         
  
      
      "
    
    end


  end

  def self.parar_de_jogar?
      puts "\n Quer jogar de novo ? (Sim ou Nao)"
      quero_jogar = gets.strip.upcase
      quero_jogar.casecmp('Nao').zero?
  end

  def totalizador(array)
    totalPontos2 = 0
    jogadaPontos = 0
    spareOrStrike = false

    puts array.inspect;puts
   
    array.each_with_index do |item, index|
      if spareOrStrike
        spareOrStrike = false
        next
      end
      number = index.to_i
      puts "Index - #{number} Item - #{item}"
      if array[index] == 10
        if array[index + 2] == 10
          jogadaPontos = 10 + array[index+2].to_i + array[index+4].to_i
          puts" DoubleStrike se for 10 + #{array[index+2]} + #{array[index+4]} = #{jogadaPontos}"
        else
          jogadaPontos = 10 + array[index+2].to_i + array[index+3].to_i
          puts" Strike : 10 + #{array[index+2]} + #{array[index+3]} = #{jogadaPontos}"
        end
        spareOrStrike = true

      elsif array[index].to_i + array[index+1].to_i == 10
        jogadaPontos = 10 + array[index+2].to_i
        spareOrStrike = true
       
        puts" Spare -(#{array[index]} + #{array[index+1]}) = 10 + #{array[index+2]}  = #{jogadaPontos} "
      else
        jogadaPontos = array[index]
     
      end
      totalPontos2 = totalPontos2 + jogadaPontos
      puts " PontuacaoTotal --> #{totalPontos2}"
      
    end
    
    puts "-TOTAL PONTOS: #{totalPontos2}\n\n"
    return totalPontos2
  end
end
