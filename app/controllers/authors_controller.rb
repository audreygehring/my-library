class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.find_or_create_by(author_params)
  end

  def create
    @author = Author.new(author_params)
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = "Author updated successfully!"
      redirect_to @author
    else
      flash[:notice] = @author.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :description)
  end
end
