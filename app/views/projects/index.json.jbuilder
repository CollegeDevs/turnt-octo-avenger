@projects.each do |project|
  json.array!(project.events) do |event|
    json.extract! event, :id, :name, :description
    json.title event.name
    json.start event.start_time
    json.end event.end_time
    json.url project_event_url(project, event, format: :html)
  end
end
