json.array!(@routes) do |route|
  json.extract! route, :id, :customer_id, :route_desc, :route_date, :quantity, :sales_value, :purchases_value
  json.url route_url(route, format: :json)
end
