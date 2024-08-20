// Intial common setup for all programs
// 1. Removing unnecessary import paths to speed up import
// 2. Importing necessary scripts which provide functionality to all programs
env.importPaths.push("common")
import "importutils"
import "math"
import "tile"
importpathsremove("/usr/lib")
importpathsremove("common")

// Set the path to the folder in which the entrypoint script
// resides to execute the program
rootPath = "/usr/farmtech_v001/"

// This kicks of the entry-point for a particular program
env.importPaths.push(rootPath)
import "entrypoint"
