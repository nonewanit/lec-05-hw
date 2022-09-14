class ScoreController < ApplicationController
  def list
    @db = Score.all
    @mxscore = -100
    @mxsubject = ""
    @sum = 0
    i = 1
    for data in @db
      @sum += data.score
      if @mxscore < data.score
        @mxscore = data.score
        @mxsubject = data.subject
      end
      if params["edit#{i}"]
        redirect_to action:"edit", x: i
      elsif params["delete#{i}"]
        data.destroy
        data.save
        redirect_to action:"list"  
      end
      i+=1
    end
  end

  def edit
    @db = Score.all
    @ni = params[:x]
    i=1
    for data in @db
      if i == @ni.to_i
        @subject = data.subject
        @score = data.score
        if params["save"]
          data.subject = params[:subject]
          data.score = params[:score]
          data.save
          redirect_to action:"edit", x:@ni.to_i
        end 
      end
      i+=1
    end
    if params["back"]
      redirect_to action:"list"
    end
  end
end
