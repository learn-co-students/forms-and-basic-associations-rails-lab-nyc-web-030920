class GenresController < ApplicationController

    def  index 
        @genres = Genre.all
    end 

    def show 
        @genre = Genre.find(params_id)
    end 

    def new 
        @genre = Genre.new
    end 

    def edit 
        @genre = Genre.find(params[:id])
    end 

    def update 
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        if genre.save 
           redirect_to genre_path(@genre)
        else 
            render :edit 
        end 
    end 

    def destory 
        @genre = Genre.find(params[:id])
        @genre.destroy 
        flash[:notice] = "Genre deleted."
        redirect_to genres_path 

    end 

    def create
        @genre = Genre.new 

        if @genre.save 
            redirect_to genre_path(@genre)
        else 
            render :new 
        end 
    end 

private 

def genre_params
    params.require(:genre).permit(:name)
end 


    
end
