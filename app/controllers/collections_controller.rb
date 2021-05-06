class CollectionsController < ApplicationController
    
    def index
       
      @collections = Collection.all
      
    end
  
    def show
       
      @user = current_user
      if !@user.nil?
        if @user.isAdmin
          @collections = Collection.all
        else
          @collections = @user.collections
        end
      else
        redirect_to "/error"
      end
      @collection = Collection.find(params[:id])
      @notes = @collection.notes.all
    end
  
    def new
       
      @collection = Collection.new
    end
  
    def create
       
      @user = current_user
      @collection = @user.collections.new(collection_params)
      
      if @collection.save
        redirect_to @collection
      else
        render :new
      end
    end
  
    def edit
       
      @collection = Collection.find(params[:id])
    end
  
    def update
       
      @collection = Collection.find(params[:id])
  
      if @collection.update(collection_params)
        redirect_to "/collections/manage"
      else
        render :edit
      end
    end
  
    def destroy
       
      @collection = Collection.find(params[:id])
      @collection.destroy
  
      redirect_to "/collections/manage"
    end

    def manage
    
      @user = current_user
      if !@user.nil?
      if @user.isAdmin
        @collections = Collection.all
      else
        @collections = @user.collections
      end
    else
      redirect_to "/error"
    end
  end
  
    private
      def collection_params
        params.require(:collection).permit(:name)
      end
  end
  