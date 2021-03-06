class RoutesController < ApplicationController
  before_filter :set_params
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  # GET /routes
  # GET /routes.json
  def index
    session[:order] ||= 'id'
    session[:reverse] ||= @reverse[:asc]
    @route = Route.new
    if Rails.application.config.ismainapplication
      @routes = Route.filters_from_form(params).all.paginate(:page => params[:page]).order(set_order_option)
    else
      if !params[:initial_date].present?
        session[:intial_date] = Date.today
        @routes = Route.where('route_date = ?', Date.today).paginate(:page => params[:page]).order(set_order_option)
        @prvroutes = Route.where('route_date = ?', Date.today - 1).paginate(:page => params[:page]).order(set_order_option)
        @nextroutes = Route.where('route_date = ?', Date.today + 1).paginate(:page => params[:page]).order(set_order_option)
      else
        @pdate = Date.parse params[:initial_date]
        session[:intial_date] = @pdate
        Rails.logger.warn @pDate
        @routes = Route.where('route_date = ?', @pdate).paginate(:page => params[:page]).order(set_order_option)
        @prvroutes = Route.where('route_date = ?', @pdate - 1).paginate(:page => params[:page]).order(set_order_option)
        @nextroutes = Route.where('route_date = ?', @pdate + 1).paginate(:page => params[:page]).order(set_order_option)
      end
    end
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
    @route.route_receivers.build
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(route_params)
    Rails.logger.warn "------------- Route creation -------------"
    respond_to do |format|
      if @route.save
        format.html { redirect_to routes_path }
        format.json { render :show, status: :created, location: @route }
        format.js
      else
        format.html { render routes_path }
        format.json { render json: @route.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_params
      @reverse = {asc: ' ASC', desc: ' DESC'}
    end

    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:customer_id, :route_desc, :route_date, :quantity, :sales_value, :purchases_value, :customer_name, :transportation_id, :transportation_shortcut, :loading_time, :created, { route_receivers_attributes: [:id, :customer_name, :_destroy] })
    end

    def set_order_option
    if params[:order]
      session[:reverse] = (params[:order] == session[:order] && session[:reverse] == @reverse[:asc] ? @reverse[:desc] : @reverse[:asc])
      session[:order] = params[:order]
    end
    return session[:order] + session[:reverse]
  end
end
