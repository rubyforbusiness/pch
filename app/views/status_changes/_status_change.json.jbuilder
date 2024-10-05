json.extract! status_change, :id, :from, :to, :project_id
json.url status_change_url(status_change, format: :json)
