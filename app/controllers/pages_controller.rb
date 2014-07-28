class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all.order("id desc").page(params[:page]).per_page(8)
    
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getinstagramposts
    @medias = Array.new
    $checkerarray = Array.new
    fulltext = Instagram.tag_recent_media('Poems', options = {:count => 10})
    
    fulltext.each do |posts|
      #puts posts
      if posts['tags'].length > 5 && posts['tags']
        #saverthing = posts['tags']
        #puts posts['tags'].to_s
        @medias << posts['tags'].to_s
      
      
        #puts tag

        puts "   ****************************************************

       "
      
       

        
          @medias.each do |m|
            if !$checkerarray.include?(m)
              $checkerarray.push(m)
              @page = Page.new
              @page.hashtags = m.to_s.gsub(/\[/ , '').gsub(/\]/ , '').gsub(/\"/ , '')
              @page.save
             

            end
          end

        
      end

    end
    puts @medias
    
#puts $checkerarray
#redirect_to pages_index_url, notice: 'More hashtags were successfully loaded.'
    #respond_to do |format|
      #format.html { redirect_to pages_url, notice: 'More hashtags were loaded' }
      #format.json { head :no_content }
    #end
#render :nothing => true
redirect_to pages_path, notice: 'More hashtags were successfully loaded.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:hashtags)
    end
end

