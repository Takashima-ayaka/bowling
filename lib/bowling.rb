class Bowling
    def initialize
        @score = 0
        @pin = []
        @num = 0
        @strike = []
    end
    
    def add_score(score)
        @score += score
        @pin << score
        if score == 10
            @pin << 0
        end
    end
    
    def total_score
        p @pin
        @score
    end
    
    def calc_score
        20.times do
            #最終フレームでない時
            if @num < 18
                #ストライク発生
                if @num % 2 == 0 && @pin[@num] == 10
                    #次のフレームを足す
                    @score += @pin[@num + 2] + @pin[@num + 3]
                    #1フレーム目ではないかつ、前フレームがストライクの時
                    if @num >= 2 && @pin[@num - 2] == 10
                        @score += @pin[@num + 2]
                    end
                    
                    p @score
                #スペア発生
                elsif @pin[@num-1] != 10 && @num % 2 != 0 && @pin[@num] + @pin[@num - 1] == 10
                    @score += @pin[@num + 1]
                    p @score
                end    
            end
            @num += 1
        end
        p " 結果：#{@score} "
    end
end