class QualificacoesController < ApplicationController
  before_filter :inicializacao_combos, only:[:edit, :new]  

# GET /qualificacoes
  # GET /qualificacoes.json
  def index
    @qualificacoes = Qualificacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @qualificacoes }
    end
  end

  # GET /qualificacoes/1
  # GET /qualificacoes/1.json
  def show
    @qualificacao = Qualificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qualificacao }
    end
  end

  # GET /qualificacoes/new
  # GET /qualificacoes/new.json
  def new
    @qualificacao = Qualificacao.new
    
    if params[:cliente]
      @qualificacao.cliente = Cliente.find(params[:cliente])
    end

    if params[:restaurante]
      @qualificacao.restaurante = Restaurante.find(params[:restaurante])
    end

    inicializacao_combos

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @qualificacao }
    end
  end

  # GET /qualificacoes/1/edit
  def edit
    @qualificacao = Qualificacao.find(params[:id])
    inicializacao_combos
  end

  # POST /qualificacoes
  # POST /qualificacoes.json
  def create
    @qualificacao = Qualificacao.new(params[:qualificacao])

    respond_to do |format|
      if @qualificacao.save
        format.html { redirect_to @qualificacao, notice: 'Qualificacao was successfully created.' }
        format.json { render json: @qualificacao, status: :created, location: @qualificacao }
      else
        inicializacao_combos
        format.html { render action: "new" }
        format.json { render json: @qualificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /qualificacoes/1
  # PUT /qualificacoes/1.json
  def update
    @qualificacao = Qualificacao.find(params[:id])

    respond_to do |format|
      if @qualificacao.update_attributes(params[:qualificacao])
        format.html { redirect_to @qualificacao, notice: 'Qualificacao was successfully updated.' }
        format.json { head :no_content }
      else
        inicializacao_combos
        format.html { render action: "edit" }
        format.json { render json: @qualificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualificacoes/1
  # DELETE /qualificacoes/1.json
  def destroy
    @qualificacao = Qualificacao.find(params[:id])
    @qualificacao.destroy

    respond_to do |format|
      format.html { redirect_to qualificacoes_url }
      format.json { head :no_content }
    end
  end

  private
  def inicializacao_combos
    @restaurantes = Restaurante.order :nome
    @clientes = Cliente.order :nome
  end

end
