class ItemController < ApplicationController
    
    def index
        @item = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create  
        @item = Item.new(item_params)   
        if @item.save   
          flash[:notice] = 'Item added!'   
          redirect_to root_path   
        else   
          flash[:error] = 'Failed to edit item!'   
          render :new   
        end   
    end 

    def destroy 
      @item = Item.find(params[:id])
      @item.destroy
      flash[:success] = "The item was successfully destroyed."
      redirect_to root_path
        # @item = Item.find(params[:id])   
        # if @item.update_attributes(item_params)   
        #   flash[:notice] = 'Item deleted!'   
        #   redirect_to root_path   
        # else   
        #   flash[:error] = 'Failed to edit item!'   
        #   render :edit   
        # end   
    end

    def item_params   
        params.require(:item).permit(:name, :price, :description)   
    end 
end