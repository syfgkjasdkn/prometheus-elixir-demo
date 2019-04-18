defmodule Web.PageController do
  use Web, :controller

  def index(conn, _params) do
    Prometheus.Metric.Counter.inc(name: :hello_world_total, labels: [:dummy])
    Prometheus.Metric.Gauge.inc(name: :hello_worlds_in_progress)
    :timer.sleep(:rand.uniform(10_000))
    Prometheus.Metric.Gauge.dec(name: :hello_worlds_in_progress)
    Prometheus.Metric.Gauge.set_to_current_time(name: :hello_world_last_time_seconds)
    render(conn, "index.html")
  end
end
