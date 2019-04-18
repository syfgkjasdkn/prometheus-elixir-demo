defmodule Repo do
  @moduledoc "Hmmm"
  use Ecto.Repo,
    otp_app: :metr,
    adapter: Ecto.Adapters.Postgres
end
