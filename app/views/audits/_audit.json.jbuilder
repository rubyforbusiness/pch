json.extract! audit, :id, :created_at, :auditable_id, :auditable_type
json.url audit_url(audit, format: :json)
