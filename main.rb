class Brave

     # attr_readerの記述でゲッターを省略することができる
        attr_reader :name, :offense, :defense
        attr_accessor :hp

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
        
        damage = @offense - monster.defense

        monster.hp -= damage

        puts "#{monster.name}は#{damage}のダメージを受けた!"
        puts "#{monster.name}の残りHPは#{monster.hp}だ"
    end
end

class Monster
    attr_reader :name, :offense, :defense
    attr_accessor :hp

    def initialize(params)
        #各パラメーターをハッシュで取得
        @name = params[:name]
        @hp = params[:hp]
        @offense = params[:offense]
        @defense = params[:defense]
    end

end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'スライム', hp: 250, offense: 200,defense: 100)


brave.attack(monster)