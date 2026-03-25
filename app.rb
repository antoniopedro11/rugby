# app.rb
class RugbyMatch
  attr_reader :team_a, :team_b, :score_a, :score_b

  def initialize(team_a, team_b)
    @team_a = team_a
    @team_b = team_b
    @score_a = 0
    @score_b = 0
  end

  def add_try(team)
    if team == :a
      @score_a += 5
    elsif team == :b
      @score_b += 5
    end
    puts "Try marcado! (+5 pontos)"
    display_score
  end

  def add_conversion(team)
    if team == :a
      @score_a += 2
    elsif team == :b
      @score_b += 2
    end
    puts "Conversão bem sucedida! (+2 pontos)"
    display_score
  end

  def add_penalty(team)
    if team == :a
      @score_a += 3
    elsif team == :b
      @score_b += 3
    end
    puts "Pênalti/Drop Goal! (+3 pontos)"
    display_score
  end

  def display_score
    puts "------------------------------"
    puts "🏈 #{team_a} #{@score_a} x #{@score_b} #{team_b} 🏈"
    puts "------------------------------"
  end
end

puts "Bem-vindo ao Marcador de Placar de Rugby!"
match = RugbyMatch.new("Equipe A", "Equipe B")
match.display_score

loop do
  puts "\nEscolha uma opção:"
  puts "1. Try para Equipe A (5 pts)"
  puts "2. Conversão para Equipe A (2 pts)"
  puts "3. Pênalti para Equipe A (3 pts)"
  puts "4. Try para Equipe B (5 pts)"
  puts "5. Conversão para Equipe B (2 pts)"
  puts "6. Pênalti para Equipe B (3 pts)"
  puts "0. Sair"

  print "\nOpção: "
  choice = gets.chomp

  case choice
  when '1' then match.add_try(:a)
  when '2' then match.add_conversion(:a)
  when '3' then match.add_penalty(:a)
  when '4' then match.add_try(:b)
  when '5' then match.add_conversion(:b)
  when '6' then match.add_penalty(:b)
  when '0'
    puts "Fim de jogo! Placar final:"
    match.display_score
    break
  else
    puts "Opção inválida. Tente novamente."
  end
end
