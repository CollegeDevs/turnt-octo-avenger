json.array!(@events) do |event|
  json.extract! event, :id, :name
  json.id event.id
  json.start event.start_time
  json.end event.end_time
  json.url project_event_url(event.project, event, format: :html)
end
