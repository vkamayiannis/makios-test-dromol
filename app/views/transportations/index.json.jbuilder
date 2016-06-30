json.array!(@transportations) do |transportation|
  json.extract! transportation, :id, :codeid, :shortcut, :descr
  json.url transportation_url(transportation, format: :json)
end
