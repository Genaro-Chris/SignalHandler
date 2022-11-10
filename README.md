# SignalHandler

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
<img src="https://img.shields.io/badge/Swift-5.7_5.8-Orange?style=flat-square" />
<img src="https://img.shields.io/badge/platforms-macOS%20%7C%20Linux-lightgrey.svg" />


## Requirements 
**macOS** 10.10+ / **Ubuntu** 16.04+ with
working installation of **Swift 5.6+** 

## Installation 

<summary>Swift Package Manager</summary> </br>
<p>You can use <a href="https://swift.org/package-manager">The Swift Package Manager</a> to install <code>SwifterSwift</code> by adding the proper description to your <code>Package.swift</code> file:</p>  
<pre><code class="swift language-swift">import PackageDescription  

let package = Package(
    name: "YOUR_PROJECT_NAME", 
    targets: [],
    dependencies: [ 
         .package(url: "https://github.com/SwifterSwift/SwifterSwift.git", from: "5.3.0") 
    ] 
) 


</code></pre> 

<p>Next, add <code>SwifterSwift</code> to your targets dependencies like so:</p> 
<pre><code class="swift language-swift">.target( name: "YOUR_TARGET_NAME", dependencies: [ "SwifterSwift", ] ),</code></pre> 
<p>Then run <code>swift package update</code>.</p> 


For a better documentation of this swift package. Visit [here](https://genaro-chris.github.io/SignalHandler/documentation/signalhandler)

