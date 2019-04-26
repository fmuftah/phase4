class StoresController < ApplicationController
    
        
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  
  def index
    @stores = Store.alphabetical
  end

  def show
  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to store_path(@store), notice: "#{@store.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @store.update(store_params)
      redirect_to store_path(@store), notice: "#{@store.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_url
  end

  def active
      @active_stores = Store.active.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  
  def inactive
    @inactive_stores = Store.inactive.alphabetical.paginate(page: params[:page]).per_page(10) 
  end
  
  def store_manager
    @store_managers = Store.paginate(page: params[:page]).per_page(10) 
  end
    
  private
  
  def store_params
    params.require(:store).permit(:name, :street, :city, :state, :zip, :phone, :latitude, :longitude, :active)
  end
  
  def set_store
    @store = Store.find(params[:id])
  end


end
