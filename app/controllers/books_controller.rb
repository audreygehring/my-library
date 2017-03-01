class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @author = Author.new(author_params)

    if @book.save
      flash[:notice] = "Book added successfully"
      redirect_to books_path
    else
      flash[:notice] = @book.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.udate(book_params)
      flash[:notice] = "Book updated successfully!"
      redirect_to @dish
    else
      flash[:notice] = @book.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book deleted"
      redirect_to books_path
    else
      flash[:notice] = "Sorry, you can't delete someone else's book!"
      render :show
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publication_date, :description, :pages)
  end
end
