class CandidatesController < ActionController::Base
  def index 
  end
  
  def new 
  #  form表單的Candidate 帶到這邊 因為view屬於被動盡量讓controller來做 變數要到erb用需要讓他變成實體變數@
   @candidate =  Candidate.new
  end

  def create
    # 把candidate hash的資料整包丟進來(終端機看到的)
    @candidate =  Candidate.new(params[:candidate])

    if @candidate.save
      # 成功
      redirect_to '/candidates'
    else

    end

  end


end

