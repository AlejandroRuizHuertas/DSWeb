class NotesController < ApplicationController
    
  def index
    @user = current_user
    if @user.isAdmin
      @notes = Note.all
      @collections = Collection.all
    else
      @notes = @user.notes
      @collections = @user.collections
    end
  end

  def show
    @note = Note.find(params[:id])
    
  end

  def new
    @note = Note.new
    
    @user = current_user
    if @user.isAdmin
      @collections = Collection.all
    else
      @collections = @user.collections
    end
  end

  def create
    @user = current_user
    if @user.isAdmin
      @collections = Collection.all
    else
      @collections = @user.collections
    end
    @note = @user.notes.new(note_params)

    if @note.save
      redirect_to @note
    else
      
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
    @user = current_user
    if @user.isAdmin
      @collections = Collection.all
    else
      @collections = @user.collections
    end
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
      params.require(:note).permit(:title, :body, :image, :collection_id)
    end
end
