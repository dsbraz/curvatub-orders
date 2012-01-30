class ItensController < ApplicationController
  # GET /pedidos/1/itens
  # GET /pedidos/1/itens.json
  def index
    @pedido = Pedido.find(params[:pedido_id])
    @itens = @pedido.itens

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itens }
    end
  end

  # GET /pedidos/1/itens/2
  # GET /pedidos/1/itens/2.json
  def show
    @pedido = Pedido.find(params[:pedido_id])
    @item = @pedido.itens.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item }
    end
  end

  # GET /pedidos/1/itens/new
  # GET /pedidos/1/itens/new.json
  def new
    @pedido = Pedido.find(params[:pedido_id])
    @item = @pedido.itens.build

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item }
    end
  end

  # GET /pedidos/1/itens/2/edit
  def edit
    @pedido = Pedido.find(params[:pedido_id])
    @item = @pedido.itens.find(params[:id])
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(params[:produto])

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'O produto foi criado com sucesso.' }
        format.json { render json: @produto, status: :created, location: @produto }
      else
        format.html { render action: "new" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /pedidos/1/itens
  # POST /pedidos/1/itens.json
  def create
    @pedido = Pedido.find(params[:pedido_id])
    @item = @pedido.itens.build(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to pedido_item_url(@pedido, @item), notice: 'O item foi criado com sucesso.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pedidos/1/itens/2
  # PUT /pedidos/1/itens/2.json
  def update
    @pedido = Pedido.find(params[:pedido_id])
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to pedido_item_url(@pedido, @item), notice: 'O item alterado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1/itens/2
  # DELETE /pedidos/1/itens/2.json
  def destroy
    @pedido = Pedido.find(params[:pedido_id])
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to pedido_itens_path(@pedido) }
      format.json { head :ok }
    end
  end
end
