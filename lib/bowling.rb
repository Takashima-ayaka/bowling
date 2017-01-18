class Bowling
    def initialize
        @score = 0
        @pin = []
        @num = 0
    end
    
    def add_score(score)
        @score += score
        @pin << score
    end
    
    def total_score
        @score
    end
    
    def calc_score
        20.times do
            #偶数投目の時
            if @num % 2 != 0    
                #最終フレームでない時
                if @num < 18
                    #1フレームの合計が10の時ボーナス発生
                    if @pin[@num] + @pin[@num - 1] == 10
                        @score += @pin[@num + 1]
                    end    
                end
            end
            @num += 1
        end
    end
end