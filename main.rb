class Brave

     # attr_readerの記述でゲッターを省略することができる
        attr_reader :name, :offense, :defense
        attr_accessor :hp

        SPECIAL_ATTACK_CONSTANT = 1.5
    #paramsで一括で受け取る
    def initialize(params)
        #各パラメーターをハッシュで取得
        @name = params[:name]
        @hp = params[:hp]
        @offense = params[:offense]
        @defense = params[:defense]
    end

    def attack(monster)
        # monster.hp = monster.hp - damage
        puts "#{@name}の攻撃!"

        attack_num = rand(4)

        if attack_num == 0
            puts "必殺!!"
            damage = calculate_special_attack - monster.defense
        else   
            puts "通常攻撃"
            damage = @offense - monster.defense
        end


        monster.hp -= damage

        puts "#{monster.name}は#{damage}のダメージを受けた!"
        puts "#{monster.name}の残りHPは#{monster.hp}だ"
    end

    def calculate_special_attack
        @offense * SPECIAL_ATTACK_CONSTANT
    end
end

class Monster
    attr_reader :offense, :defense
    attr_accessor :hp, :name

    POWER_UP_RATE = 1.5
    CALC_HALF_HP = 0.5


    def initialize(params)
        #各パラメーターをハッシュで取得
        @name = params[:name]
        @hp = params[:hp]
        @offense = params[:offense]
        @defense = params[:defense]
        
        @transform_flag = false
        @trigger_of_transform = params[:hp] * 0.5
    end

    def attack(brave)

        

        if @hp <=  @trigger_of_transform && @transform_flag == false
            @transform_flag = true
            transform
        end

        puts "#{@name}の攻撃"
            damage = @offense - brave.defense
            brave.hp -= damage

            puts "#{brave.name}は#{damage}のダメージを受けた!"
            puts "#{brave.name}の残りHPは#{brave.hp}だ"

    end

    private
    def transform
        transform_name = "ドラゴン"

      # 変身メッセージ
      puts <<~EOS
      #{@name}は怒っている
      #{@name}は#{transform_name}に変身した
      EOS

      # モンスターの攻撃力を1.5倍にする
      @offense *= POWER_UP_RATE
      # モンスターの名前を変更
      @name = transform_name
    end


end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'スライム', hp: 250, offense: 200,defense: 100)


brave.attack(monster)
monster.attack(brave)