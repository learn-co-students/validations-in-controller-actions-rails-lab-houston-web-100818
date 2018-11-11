class AuthorsController < ApplicationController
  before_action :set_author

  def set_author
    if params[:id]
      @author = Author.find(params[:id])
    else 
      @author = Author.new
    end 
  end 

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save 
      redirect_to author_path(@author)
    else 
      render :new
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
