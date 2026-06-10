function pip -d "Faster pip using uv, if available"
  if command -v uv
    uv pip $argv
  else
    command pip $argv
  end
end
