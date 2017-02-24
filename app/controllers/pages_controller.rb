class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(page_params)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.save
  end

  private
    def page_params
      params.require(:page).permit(:title,:description)
    end
end
