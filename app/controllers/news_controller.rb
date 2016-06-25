class NewsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
      
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  def news
    news = News.all
    @news=[]
    news.each do |item|
    html_data=open("#{item.news_url}")
      
     doc = Nokogiri::HTML(html_data)
     
     @news_item=[]
     style=item.news_style


     doc.css(style.to_s).each do |link|
       news_link = item.include_url? ? item.news_url+"/"+link["href"] : link["href"]
        @news_item <<  [link.text.strip,news_link]
      end
      @news << [item.title,@news_item]
        
    end
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :news_url, :news_style, :include_url)
    end
end
