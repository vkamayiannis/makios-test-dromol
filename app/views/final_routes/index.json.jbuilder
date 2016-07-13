json.array!(@final_routes) do |final_route|
  json.extract! final_route, :id, :ftrdate, :trsid, :syromenoid, :supid, :cusid, :routetype, :iswebroute
  json.url final_route_url(final_route, format: :json)
end
