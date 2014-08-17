# How to create a new git command:
* Create a executable script file somewhere in your executable paths. It must use the following naming schema  “git-your-custom-command” and must be without a extension. (In my example from above: “git-archive-file”)
* This file can be written in any scripting language who want and that is executable on your system. (It also should work with binaries.)
* This file does not need to be anywhere near all the other git command.
* Now you could use it as “git your-custom-command”

see also: http://blog.thehippo.de/2012/03/tools-and-software/how-to-create-a-custom-git-command-extension/
