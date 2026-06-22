function pip -d "Faster pip using uv, if available. Also makes a venv."
  if not test -f .venv/bin/activate.fish
    if command -q uv
      uv venv
    else
      python -m venv .venv
    end
  end

  source .venv/bin/activate.fish

  if command -q uv
    uv pip $argv
  else
    command pip $argv
  end
end
