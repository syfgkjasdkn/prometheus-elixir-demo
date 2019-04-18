defmodule Metrics do
  @moduledoc false
  def setup do
    require Prometheus.Registry

    if :os.type() in [unix: :linux, unix: :darwin] do
      Prometheus.Registry.register_collector(:prometheus_process_collector)
    end

    Metrics.Plug.setup()

    Repo.Instrumenter.setup()

    :ok =
      :telemetry.attach(
        "prometheus-ecto",
        [:metr, :repo, :query],
        &Repo.Instrumenter.handle_event/4,
        %{}
      )

    Web.Instrumenter.Phoenix.setup()
  end
end
