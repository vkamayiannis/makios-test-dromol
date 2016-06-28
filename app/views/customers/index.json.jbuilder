json.array!(@customers) do |customer|
  json.extract! customer, :id, :code, :name, :afm
  json.url customer_url(customer, format: :json)
end
