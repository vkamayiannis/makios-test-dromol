class RouteReceiversController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @route_receiver = @route.route_receivers.create(route_receivers_params)
    #redirect_to tasks_path
    respond_to do |format|
      if @route_receiver.save
        format.html {redirect_to @route, notice: 'Comment inserted succesfully'}
        format.js
      end
    end
  end

  protected

  def route_receivers_params
    params.require(:customer_name).permit(:customer_name)
  end
end
