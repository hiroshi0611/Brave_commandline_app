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

puts "NAME:#{brave.name}"
puts "HP:#{brave.hp}"
puts "OFFENSE:#{brave.offense}"
puts "DEFENSE:#{brave.defense}"

brave.hp -= 30

monster = Monster.new(name: 'スライム', hp: 250, offense: 200,defense: 100)