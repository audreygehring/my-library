class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.where(user_id: current_user)
    @author = Author.all
  end

  def show
    @book = Book.find(params[:id])
    @author = @book.author
  end

  def new
    @book = Book.new
    @book.build_author
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if Author.where(first_name: @book.author.first_name, last_name: @book.author.last_name) == []
      @author = Author.new(book_params[:author_attributes])
      # author = Author.new(first_name: book_params[:author_attributes][:first_name], last_name: book_params[:author_attributes][:last_name])
      binding.pry
    else
      @author = Author.where(first_name: @book.author.first_name, last_name: @book.author.last_name)
      @book.author_id = @author[0].id
      binding.pry
    end

    if @book.save
      @book.author = @author.id
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
    if @book.update(book_params)
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
    params.require(:book).permit(
      :title,
      :publication_date,
      :description,
      :pages,
      :user,
      author_attributes: [
          :first_name,
          :last_name,
          :description
      ]
    )
  end
  # def author_params
  #   params.require(:author).permit(
  #     :first_name,
  #     :last_name,
  #     :description
  #   )
  # end
end
