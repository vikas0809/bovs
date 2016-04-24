class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  #layout 'backend'
  
  
  # GET /orders
  # GET /orders.json
  def index
    
    if(current_user.userId == 3)
      @allorders = Order.all
      @orders = Order.where(bookId: Book.select("bookId").where(authorId: current_user.id)) 
      @active1 = 'active'
      @mypurchase = Order.where(:userId=>current_user.id)
    end
    
    if(current_user.userId == 2)
      @orders = Order.where(bookId: Book.select("bookId").where(authorId: current_user.id)) #Order.where(':bookId IN @temporders')
      @mypurchase = Order.where(:userId=>current_user.id)
      @active2 = 'active'
    end
    
    if(current_user.userId == 1)
      @mypurchase = Order.where(:userId=>current_user.id)
      @active3 = 'active'
    end
    
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orderbook = Book.find(Order.find(params[:id]).bookId)
    @BookAuthor = User.find(@orderbook.authorId)
  end

  # GET /orders/new
  def new
    if(params[:buybook].present?)
        @order = Order.new
        @orderbook = Book.find(params[:buybook])
        @BookAuthor = User.find(Book.find(params[:buybook]).authorId)
    else
      redirect_to root_path
    end
  end

  # GET /orders/1/edit
  def edit
    @orderbook = Book.find(Order.find(params[:id]).bookId)
    @BookAuthor = User.find(Book.find(@orderbook.id).authorId)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.userId = current_user.id
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
        params.require(:order).permit(:userId, :bookId, :quantity, :price, :tax, :totalAmount)
    end
end
