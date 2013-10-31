class RestaurantesController < ApplicationController
  before_filter :set_restaurante, only:[:edit, :update, :show, :destroy] 

  def index
    if (params[:nome] and params[:nome] != "")
      @restaurantes = Restaurante.by_nome(params[:nome]).order :nome
    else
      @restaurantes = Restaurante.order :nome
    end

    respond_to do |format|
      format.html
      format.xml { render xml: @restaurantes }
      format.json { render json: @restaurantes }
    end
  end

  def show
    #@restaurante = Restaurante.find(params[:id])
  end

  def destroy
    #Restaurante.find(params[:id]).destroy
    @restaurante.destroy
    redirect_to(action: "index")
  end

  def new 
    @restaurante = Restaurante.new
  end
 
  def create
    @restaurante = Restaurante.new(params[:restaurante])
    if @restaurante.save   
      redirect_to(action: "show", id: @restaurante) 
    else
      render action: "new"
    end
  end

  def edit
    #@restaurante = Restaurante.find params[:id]
  end

  def update
    #@restaurante = Restaurante.find params[:id]
    if @restaurante.update_attributes(params[:restaurante])
      redirect_to action: "show", id: @restaurante
    else 
      render action: "edit"
    end
  end

  private
  def set_restaurante
    @restaurante = Restaurante.find params[:id]
  end
end
