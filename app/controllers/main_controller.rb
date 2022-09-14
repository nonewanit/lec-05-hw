class MainController < ApplicationController
  def home
  end

  def test
    @root = params[:root]
    @no = params[:no]
    @subjectlist = []
    @scorelist = []
    ch = 1
    if @root.to_s != "true"
      for i in 1..@no.to_i do
        @subjectlist.push(params["subject#{i}"])
        @scorelist.push(params["score#{i}"])
        if params["subject#{i}"].blank? || params["score#{i}"].blank? || !(Integer(params["score#{i}"]) rescue nil)
          ch=0
        end
      end
      if ch == 1
        @mxscore = -100
        @mxsubject = ""
        @sum = 0
        for i in 1..@no.to_i
          scores = Score.where(subject: @subjectlist[i-1]).order(created_at: :desc)
          if scores.size == 0
            data = Score.new
            data.subject = @subjectlist[i-1]
            data.score = @scorelist[i-1].to_i
            data.save
          else
            for data in scores
              data.score = @scorelist[i-1].to_i
              data.save
            end
          end
          @sum += @scorelist[i-1].to_i
          if @mxscore < @scorelist[i-1].to_i
            @mxscore = @scorelist[i-1].to_i
            @mxsubject = @subjectlist[i-1]
          end
        end
        redirect_to action: 'test2', sum: @sum, mxsubject: @mxsubject
      end
    end
  end

  def test2
  end
end
