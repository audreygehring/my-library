class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :description)
  end
end
