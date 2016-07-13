module RoutesHelper
  def assign_order_arrow(fld_to)
    (session[:order] == fld_to && session[:reverse] == @reverse[:asc]) ? 'glyphicon glyphicon-sort-by-attributes' : 'glyphicon glyphicon-sort-by-attributes-alt'
  end

  def assign_created_class(created)
     if !created.nil? && created = 1
       "bg-danger"
     else
       "bg-default"
     end
   end
end
