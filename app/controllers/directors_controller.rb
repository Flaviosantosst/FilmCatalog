class DirectorsController < ApplicationController
	def index
		@directors = Director.all
	end

	def show
		@director = Director.find(params[:id])
	end

	def new
    @director = Director.new
  end

	def create
    @director = Director.new(name: params[:director][:name],
                       nationality: params[:director][:nationality],
                       date_of_birth: params[:director][:date_of_birth],
                       favorite_genre: params[:director][:favorite_genre])
        if @director.save
		  flash[:notice] = "Diretor salvo com sucesso!"
          return redirect_to director_path(@director.id)
        end
        render :new
  end

	def edit
    @director = Director.find(params[:id])
  end

	def update
		@director = Director.find(params[:id])
		if @director.update(name: params[:director][:name],
										 nationality: params[:director][:nationality],
										 date_of_birth: params[:director][:date_of_birth],
										 favorite_genre: params[:director][:favorite_genre])
			flash[:notice] = "Diretor atualizado com sucesso!"
			return redirect_to director_path(@director.id)
		end
		render :edit
	end
end