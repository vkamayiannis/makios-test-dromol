class FinalRoutesController < ApplicationController
  before_action :set_final_route, only: [:show, :edit, :update, :destroy]

  # GET /final_routes
  # GET /final_routes.json
  def index
    @final_routes = FinalRoute.all
  end

  # GET /final_routes/1
  # GET /final_routes/1.json
  def show
  end

  # GET /final_routes/new
  def new
    @final_route = FinalRoute.new
    if !params.nil?
      session[:routes] = []
      num_of_params = 0
      params.each do |key, value|
        if key.include? "ckb"
          val = key[4..key.length]
          Rails.logger.warn "Param #{key}: #{val}"
          @route = Route.find_by_id(val)
          @final_route.customer_name = @route.customer_name
          @final_route.transportation_shortcut = @route.transportation_shortcut
          @final_route.ftrdate = @route.route_date.strftime('%d/%m/%Y')
          @final_route.routes << @route
          session[:routes] << @route
          num_of_params += 1
        end
      end
      if num_of_params > 1
        @final_route.cusid = 2833
      end
    end
    Rails.logger.warn "------------- Routes: #{session[:routes].length} -------------"
  end

  # GET /final_routes/1/edit
  def edit
  end

  # POST /final_routes
  # POST /final_routes.json
  def create
    @final_route = FinalRoute.new(final_route_params)
    respond_to do |format|
      if @final_route.save
        session[:routes].each do |route|
          @route = Route.find_by_id(route["id"])
          @route.created = 1
          @route.save
        end
        session[:routes] = []
        format.html { redirect_to @final_route, notice: 'Final route was successfully created.' }
        format.json { render :show, status: :created, location: @final_route }
      else
        format.html { render :new }
        format.json { render json: @final_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /final_routes/1
  # PATCH/PUT /final_routes/1.json
  def update
    respond_to do |format|
      if @final_route.update(final_route_params)
        format.html { redirect_to @final_route, notice: 'Final route was successfully updated.' }
        format.json { render :show, status: :ok, location: @final_route }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @final_route.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /final_routes/1
  # DELETE /final_routes/1.json
  def destroy
    @final_route.destroy
    respond_to do |format|
      format.html { redirect_to final_routes_url, notice: 'Final route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_final_route
      @final_route = FinalRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def final_route_params
      params.require(:final_route).permit(:ftrdate, :trsid, :syromenoid, :supid, :cusid, :routetype, :iswebroute, :customer_name, :transportation_shortcut, {routes_attributes: [:id, :created]})
    end
end
