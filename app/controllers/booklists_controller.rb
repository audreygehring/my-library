class BooklistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @booklists = Booklist.all
  end
  def show
  end
  def new
    @booklist = Booklist.new
    @books = Book.all
  end
  def create
    @booklist = Booklist.new(booklist_params)
    if @booklist.save
      flash[:notice] = "Booklist added successfully"
      redirect_to booklists_path
    else
      flash[:notice] = @booklist.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def booklist_params
    params.require(:booklist).permit(
      :booklist_title,
      :description,
      :user
    )
  end
end
