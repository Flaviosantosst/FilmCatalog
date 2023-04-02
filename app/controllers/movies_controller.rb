class MoviesController < ApplicationController

  def index
    if params[:search] && params[:released]
      @movies = Movie.where("name LIKE ? AND release_year <= ?", "%#{params[:search]}%", Date.today.year)
    elsif params[:search]
      @movies = Movie.where("name LIKE ?", "%#{params[:search]}%")
    elsif params[:released] == "true"
      @movies = Movie.where("release_year <= ?", Date.today.year)
    elsif params[:released] == "false"
      @movies = Movie.where("release_year > ?", Date.today.year)
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(name: params[:movie][:name],
                       release_year: params[:movie][:release_year],
                       synopsis: params[:movie][:synopsis],
                       country_of_origin: params[:movie][:country_of_origin],
                       duration: params[:movie][:duration],
                       genre_id: params[:movie][:genre_id],
                       director_id: params[:movie][:director_id])
    @movie.image.attach(params[:movie][:image])
        if @movie.save
          flash[:notice] = "Filme salvo com sucesso!"
          return redirect_to movie_path(@movie.id)
        end
        render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(name: params[:movie][:name],
                     release_year: params[:movie][:release_year],
                     synopsis: params[:movie][:synopsis],
                     country_of_origin: params[:movie][:country_of_origin],
                     duration: params[:movie][:duration],
                     genre_id: params[:movie][:genre_id],
                     director_id: params[:movie][:director_id])
       @movie.image.attach(params[:movie][:image]) if params[:movie][:image].present?
       flash[:notice] = "Filme atualizado com sucesso!"
      return redirect_to movie_path(@movie.id)
    end
    render :edit
  end

  def publish
    movie = Movie.find(params[:id])
    movie.published!
    flash[:notice] = "Filme publicado com sucesso!"
    return redirect_to movie_path(movie.id)
  end

  def unpublish
    movie = Movie.find(params[:id])
    movie.draft!
    flash[:notice] = "Filme como rascunho com sucesso!"
    return redirect_to movie_path(movie.id)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Filme apagado com sucesso!"
    redirect_to movies_path
  end

end