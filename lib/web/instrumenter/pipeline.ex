defmodule Web.Instrumenter.Pipeline do
  @moduledoc false
  use Prometheus.PlugPipelineInstrumenter

  @spec label_value(:request_path, Plug.Conn.t()) :: binary
  def label_value(:request_path, conn) do
    conn.request_path
  end
end
