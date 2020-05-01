class CandidatesController < ActionController::Base
  def index 
    # 請SQL撈全部資料出來 因為資料會很多所以我們這邊實體變數給他複數
    @candidates = Candidate.all

  end

  def show
    
    @Candidate =  Candidate.find_by(id: params[:id])
  end
  
  def new 
  #  form表單的Candidate 帶到這邊 因為view屬於被動盡量讓controller來做 變數要到erb用需要讓他變成實體變數@
   @candidate =  Candidate.new
  end
   
  def create
         # 2.把candidate hash的資料清洗過 帶進變數 clean_params 替換原本的params[:candidate]
    # clean_params = params.require(:candidate).permit(:name ,:party ,:age , :politics)
    @candidate =  Candidate.new(candidate_params)
    # 把candidate hash的資料整包丟進來(終端機看到的)
    # @candidate =  Candidate.new(params[:candidate])
    

    if @candidate.save
      # 成功
      redirect_to '/candidates'
      flash[:notice]  = "候選人新增完成"
    else
      #NG 沒驗證以前怎樣都成功
      render :new
    end

  end
  
  private
  def candidate_params
    # 上方的create中  clean_params 取下來當作方法重複使用
    clean_params = params.require(:candidate).permit(:name ,:party ,:age , :politics)
  end


end


