class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @author = @book.author
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publication_date, :description, :pages)
  end
end
