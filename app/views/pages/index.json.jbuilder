json.array!(@pages) do |page|
  json.extract! page, :id, :hashtags
  json.url page_url(page, format: :json)
end
