function pip -d "Faster pip using uv, if available"
  if command -q uv
    uv pip $argv
  else
    command pip $argv
  end
end
