json.array!(@project.events) do |event|
  json.extract! event, :id, :name
  json.start event.start_time
  json.end event.end_time
  json.url project_url(@project, format: :json)
end
