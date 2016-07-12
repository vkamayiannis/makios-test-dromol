module RoutesHelper
  def assign_order_arrow(fld_to)
    (session[:order] == fld_to && session[:reverse] == @reverse[:asc]) ? 'glyphicon glyphicon-sort-by-attributes' : 'glyphicon glyphicon-sort-by-attributes-alt'
  end
end
