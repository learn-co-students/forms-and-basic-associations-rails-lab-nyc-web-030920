class NotesController < ApplicationController

    def index 
        @notes = Note.all
    end 

    def show 
        @note = Note.find(params[:id])
    end 

    def new 
        @note = Note.new 
    end 

    def edit 
        @note = Note.find(params[:id])

    end 

    def update
        @note = Note.find(params[:id])
        @note.update(note_params)

        if @note.save 
            redirect_to note_path 
        else
            render :edit 
        end 

    end 

    def create 
        @note = Note.new(note_params)

        if @note.save 
            redirect_to note_path(@note)
        else
            render :new 
        end 
    end 

    def destroy 
        @note = Note.find(params[:id])
        @note.destroy 
        flash[:notice] = "Note Deleted"
        redirect_to notes_path(@notes)
    end 

    
    private 

    def note_path 
        params.require(:note).permit(:content, :song_id)
    end 

    
end
