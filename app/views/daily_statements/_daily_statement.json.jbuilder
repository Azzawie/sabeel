json.extract! daily_statement, :id, :age_days, :age_weeks, :total_count, :deceased, :remaining, :consumed_food, :consumed_water, :daily_production, :production_ratio, :highest_temp, :lowest_temp, :humidity_ratio, :chamber_id, :created_at, :updated_at
json.url daily_statement_url(daily_statement, format: :json)
