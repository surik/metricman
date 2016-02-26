defmodule Metricman.Mixfile do
  use Mix.Project

  def project do
    [app: :metricman,
     version: "1.2.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(Mix.env)]
  end

  def application do
    [applications: [:exometer_influxdb],
     mod: {Metricman, []}]
  end

  defp deps(_) do
    [{:meck, "~> 0.8.2", override: true},
     {:exometer_influxdb, github: "travelping/exometer_influxdb", branch: "use_hut"},
     {:hackney, "~> 1.4.4", override: true},
     {:setup, github: "uwiger/setup", branch: "master", override: true},
     {:edown, github: "uwiger/edown", branch: "master", override: true},
     {:mock, github: "jjh42/mock"}]
  end
end
