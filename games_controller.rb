class GamesController

EXP_CONSTANT = 2
GOLD_CONSTANT = 3

def battle(params)
    brave = params[:brave]
    monster = params[:monster]

    loop do
        brave.attack(monster)
        break if monster.hp <= 0
        monster.attack(brave)
        break if brave.hp <= 0
    end

battle_result = brave.hp > 0

# 勇者が勝利した場合の処理
if battle_result(brave)
    result = calculate_of_exp_and_gold(monster) 
    puts "#{brave.name}はたたかいに勝った"
    puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
else
  puts "#{brave.name}はたたかいに負けた"
  puts "目の前が真っ暗になった"
end
end

private

def battle_end?(character)
    character.hp <= 0
end

def battle_result(brave)
    brave.hp > 0
end

def calculate_of_exp_and_gold(monster)
    exp = (monster.offense + monster.defense) * EXP_CONSTANT
    gold = (monster.offense + monster.defense) * GOLD_CONSTANT
    result = { exp: exp, gold: gold}

    result
end
end