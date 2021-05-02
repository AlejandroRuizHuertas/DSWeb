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

  def delete_image_attachment
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:title, :body, :image)
    end
end
