defmodule Metr.Repo do
  use Ecto.Repo,
    otp_app: :metr,
    adapter: Ecto.Adapters.Postgres
end
