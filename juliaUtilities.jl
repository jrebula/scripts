

function searchDir(path, key)
  println("searching dir " * path * " for the key " * key)
  if !isdir(path)
    println("turns out this is not a dir: " * path)
    return []
  end
  files = readdir(path)
  subDirs = filter(x -> isdir(path * "/" * x), files)

  #show(typeof(path)), println("")
  #show(typeof("/")), println("")
  #show(typeof(filter(x->contains(x,key), files))), println("")
  #show(filter(x->contains(x,key), files)), println("")

  ret = map(x -> path * "/" * x, filter(x->contains(x,key), files))
  for subDir in subDirs
    subDirName = path * "/" * subDir
    println("this dir is " * subDirName)
    ret = [ret, searchDir(subDirName, key)]
  end
  ret
end

results = searchDir("./HERMES", "del")
show(results)




function getEnvironmentVariable(var::String)
  ENV[var]
#=
  val = ccall( (:getenv, "libc"),
              Ptr{Uint8}, (Ptr{Uint8},), var)
  if val == C_NULL
    error("getenv: undefined variable: ", var)
  end
  bytestring(val)
  =#
end

function gitGui()
    run(`git gui`)
end


+(a::Symbol, b::Symbol) = symbol(string(a) * string(b))
