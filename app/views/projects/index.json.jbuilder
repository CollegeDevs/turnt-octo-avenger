json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :make_public
  json.url project_url(project, format: :json)
end
