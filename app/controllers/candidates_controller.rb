class CandidatesController < ApplicationController
  
  def index 
    # 請SQL撈全部資料出來 因為資料會很多所以我們這邊實體變數給他複數
    @candidates = Candidate.all

  end

  def show
    @candidate =  Candidate.find_by(id: params[:id])
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
      
  def  edit
    @candidate =  Candidate.find_by(id: params[:id])
  end

  def update
    @candidate =  Candidate.find_by(id: params[:id])
      if @candidate.update(candidate_params)
        # 成功
        redirect_to '/candidates'
        flash[:notice]  = "更新完成"
      else
        # 重複借用edit render
        render :edit
      end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    redirect_to '/candidates'
    flash[:notice]  = "刪除完成"
  end


  def vote
    @candidate = Candidate.find_by(id: params[:id])
    
    # VoteLog.create(candidate: @candidate , ip_address: request.remote_ip)
    @candidate.vote_logs.create(ip_address: request.remote_ip)
    
    # @candidate.votes = @candidate.votes + 1
    # @candidate.save
    redirect_to '/candidates'
    flash[:notice]  = "增加"
  end
  
  
  private
  def candidate_params
    # 上方的create中  clean_params 取下來當作方法重複使用
    clean_params = params.require(:candidate).permit(:name ,:party ,:age , :politics)
  end


end


