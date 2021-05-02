class CollectionsController < ApplicationController
    
    def index
      @notes = Collection.all
    end
  
    def show
      @note = Collection.find(params[:id])
    end
  
    def new
      @note = Collection.new
    end
  
    def create
      @user = current_user
      @note = @user.notes.new(note_params)
      
      if @note.save
        redirect_to @note
      else
        render :new
      end
    end
  
    def edit
      @note = Note.find(params[:id])
    end
  
    def update
      @note = Note.find(params[:id])
  
      if @note.update(note_params)
        redirect_to @note
      else
        render :edit
      end
    end
  
    def destroy
      @note = Note.find(params[:id])
      @note.destroy
  
      redirect_to notes_path
    end
  
    private
      def note_params
        params.require(:note).permit(:title, :body)
      end
  end
  