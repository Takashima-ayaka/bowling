class Bowling
    def initialize
        @score = 0
        @pin = []
        @num = 0
        @subtotal = []
    end
    
    def add_score(score)
        @pin << score
        if score == 10
            @pin << 0
        end
    end
    
    def total_score
        @score
    end
    
    def frame_score(index)
        @subtotal[index-1]
    end
    
    def calc_score
        while @num < @pin.size
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
                #スペア発生
                elsif @pin[@num-1] != 10 && @num % 2 != 0 && @pin[@num] + @pin[@num - 1] == 10
                    @score += @pin[@num + 1]
                end    
            end
            @score += @pin[@num]
            #フレームごとに小計を計算する
            if @num % 2 != 0
                @subtotal << @score
            end
            @num += 1
        end
    end
end