
## some things you have to specify:

pathToJuliaExecutable = homedir() * "/julia";


##

currentJuliaVersion = VERSION;

currentJuliaFolder = homedir() * "/.julia/v$(currentJuliaVersion.major).$(currentJuliaVersion.minor)";

emacsStartupFileName = homedir() * "/.emacs";



# first do: sudo apt-add-repository ppa:cassou/emacs & sudo apt-get update & sudo apt-get install emacs24
function setupEmacsAsJuliaEditor()
    # as suggested at http://web.stanford.edu/class/aa222/software.html
    # also, read this http://ess.r-project.org/Manual/ess.html#Evaluating-code 
    essPath = currentJuliaFolder * "/ESS";
    if ~isdir(essPath)
        cd(currentJuliaFolder)
        Pkg.clone("git://github.com/emacs-ess/ESS.git");
    end
    open(emacsStartupFileName, "a") do emacsStartupFile
        write(emacsStartupFile, "\n\n(load \"$(essPath)/lisp/ess-site\")")
        write(emacsStartupFile, "\n(load-theme 'wombat t)")
        write(emacsStartupFile, "\n(tool-bar-mode -1)")
        write(emacsStartupFile, "\n(add-to-list 'ess-tracebug-search-path $(pathToJuliaExecutable))\n")
        write(emacsStartupFile, "\nadd-hook 'julia-mode-hook (lambda () (local-set-key [return] 'reindent-then-newline-and-indent)))")
    end
    ENV["JULIA_EDITOR"] = "emacs"
    #  cd(homedir() * '')
end



function putJuliaOnPath()
  found = ismatch(r"julia", ENV["PATH"])
  if !found
    ENV["PATH"] = ENV["PATH"] * ":" * pathToJuliaExecutable;
  end
    #open(homedir() * "/.profile", "a") do profileFile
    #    write(profileFile, 
    #end
end
#ENV["PATH"] = "./x86_64:/Network/Servers/duerer/Volumes/duerer/jrebula/HERMES/devel/bin:/usr/lib/ccache:.:./x86_64:/Network/Servers/duerer/Volumes/duerer/jrebula/bin:/Network/Servers/duerer/Volumes/duerer/jrebula/prog/bin/x86_64:/Network/Servers/duerer/Volumes/duerer/clmc/prog/bin/x86_64:.:/usr/X11R6/bin:/usr/local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/Network/Servers/duerer/Volumes/duerer/jrebula/julia"


edit(putJuliaOnPath)
## run all the functions thusly defined:

setupEmacsAsJuliaEditor()

putJuliaOnPath()





# TODO at some point play with opengl in julia
#run(`sudo apt-get install xorg-dev libglu1-mesa-dev`)
#Pkg.clone("https://github.com/glfw/glfw.git")
#cd(homedir() * "/.julia/v0.4/glfw/")
#Pkg.clone("https://github.com/JuliaGL/ModernGL.jl.git")
#Pkg.clone("https://github.com/SimonDanisch/GLWindow.jl.git")
#Pkg.clone("https://github.com/SimonDanisch/GLAbstraction.jl.git")
#Pkg.clone("https://github.com/SimonDanisch/GLText.jl.git")
#Pkg.clone("https://github.com/SimonDanisch/GLPlot.jl.git")



