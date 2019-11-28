require './character'


class Monster < Character
    POWER_UP_RATE = 1.5
    CALC_HALF_HP = 0.5


    def initialize(params)
        super(
            name: params[:name],
            hp: params[:hp],
            offense: params[:offense],
            defense: params[:defense]
          )        
        @transform_flag = false
        @trigger_of_transform = params[:hp] * 0.5
    end

    def attack(brave)

        

        if @hp <=  @trigger_of_transform && @transform_flag == false
            @transform_flag = true
            transform
        end

        puts "#{@name}の攻撃"
            damage = calculate_damage(brave)
            cause_damage(target: brave, damage: damage)

            puts "#{brave.name}の残りHPは#{brave.hp}だ"

    end

    private

    def cause_damage(params)
        damage = params[:damage]
        target = params[:target]

        target.hp -= damage
        target.hp = 0 if target.hp < 0
        puts "#{target.name}は#{damage}のダメージを受けた!"
    end

    def calculate_damage(target)
        @offense - target.defense
    end

    def transform
        transform_name = "ドラゴン"

      # 変身メッセージ
      puts <<~EOS
      #{@name}は怒っている
      #{@name}は#{transform_name}に変身した
      #{transform_name}は力を溜めている...
      EOS

      # モンスターの攻撃力を1.5倍にする
      @offense *= POWER_UP_RATE
      # モンスターの名前を変更
      @name = transform_name
    end


end
