defmodule SampleApp.Repo do
  use Ecto.Repo,
    otp_app: :sample_app,
    adapter: Ecto.Adapters.SQLite3
end
