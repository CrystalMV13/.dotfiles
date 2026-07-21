function ipython -d "Runs ipython with uv, if available; else tries to run directly. If using uv, supply as arguments a list of packages to use in the ipyhon environment."
  if command -q uv
    set withs

    for arg in $argv
      set withs $withs --with $arg
    end

    uvx $withs ipython
  else
    command ipython
  end
end

