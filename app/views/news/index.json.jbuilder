json.array!(@news) do |news|
  json.extract! news, :id, :title, :news_url, :news_style
  json.url news_url(news, format: :json)
end
