# SignalHandler

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
<img src="https://img.shields.io/badge/Swift-5.7_5.8-Orange?style=flat-square" />
<img src="https://img.shields.io/badge/platforms-macOS%20%7C%20Linux-lightgrey.svg" />


## Requirements 
**macOS** 10.10+ / **Ubuntu** 16.04+ with
working installation of **Swift 5.6+** 

## Installation 


Swift Package Manager</br>
<p>You can use <a href="https://swift.org/package-manager">The Swift Package Manager</a> to install <code>SignalHandler</code> by adding the proper description to your <code>Package.swift</code> file:</p>
  
<pre><code class="swift language-swift">import PackageDescription  

let package = Package(
    name: "YOUR_PROJECT_NAME", 
    targets: [],
    dependencies: [ 
         .package(url: "https://github.com/Genaro-Chris/SignalHandler.git", branch: "main") 
    ] 
) 
</code></pre> 

<p>Next, add <code>SignalHandler</code> to your targets dependencies like this:</p> 
<pre><code class="swift language-swift">.target( name: "YOUR_TARGET_NAME", dependencies: [ "SignalHandler", ] ),</code></pre> 
<p>Then run <code>swift package update</code>.</p> 


## Documentation 
For a better documentation of this swift package. Visit [here](https://genaro-chris.github.io/SignalHandler/documentation/signalhandler) 

## License 
SignalHandler is released under Apache-2.0 license. See [License](https://github.com/Genaro-Chris/SignalHandler/blob/main/license.txt) for more information.

