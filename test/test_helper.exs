ExUnit.start

Mix.Task.run "ecto.create", ~w(-r EsExplorer.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r EsExplorer.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(EsExplorer.Repo)

