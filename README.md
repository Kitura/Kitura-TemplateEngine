<p align="center">
<a href="http://kitura.io/">
<img src="https://raw.githubusercontent.com/Kitura/Kitura/master/Sources/Kitura/resources/kitura-bird.svg?sanitize=true" height="100" alt="Kitura">
</a>
</p>

<p align="center">
    <a href="https://kitura.github.io/Kitura-TemplateEngine/index.html">
    <img src="https://img.shields.io/badge/apidoc-KituraTemplateEngine-1FBCE4.svg?style=flat" alt="APIDoc">
    </a>
    <img src="https://travis-ci.org/Kitura/Kitura-TemplateEngine.svg?branch=master" alt="Build Status - Master">
    </a>
    <img src="https://img.shields.io/badge/os-macOS-green.svg?style=flat" alt="macOS">
    <img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
    <img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
    <a href="http://swift-at-ibm-slack.mybluemix.net/">
    <img src="http://swift-at-ibm-slack.mybluemix.net/badge.svg" alt="Slack Status">
    </a>
</p>

# Kitura-TemplateEngine
The Kitura template engine abstraction layer.

Kitura-TemplateEngine provides a `TemplateEngine` protocol to unify the APIs of multiple template engines and integrate them with Kitura's content generation APIs. At runtime, the template engine replaces variables in a template file with actual values, and transforms the template into an HTML file sent to the client. This approach makes it easier to design an HTML page with integrated Swift code.

- Inspired by http://expressjs.com/en/guide/using-template-engines.html.

## List of Plugins:
Kitura-TemplateEngine is an easy to learn, consumable framework that comes with a set of implemented plugins:

* [Kitura-StencilTemplateEngine](https://github.com/Kitura/Kitura-StencilTemplateEngine)
* [Kitura-MustacheTemplateEngine](https://github.com/Kitura/Kitura-MustacheTemplateEngine)
* [Kitura-Markdown](https://github.com/Kitura/Kitura-Markdown)

## Usage

 We don't expect you to need to import Kitura-TemplateEngine, as it will automatically be pulled in as a dependency by the above plugins (you can see an example of this in [Examples](#examples) below) - unless you are implementing a new plugin for Kitura-TemplateEngine. If you do need to directly add Kitura-TemplateEngine as a dependency you can do so as follows:

#### Add dependencies

Add the `Kitura-TemplateEngine` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `Kitura-TemplateEngine` [release](https://github.com/Kitura/Kitura-TemplateEngine/releases).

```swift
.package(url: "https://github.com/Kitura/Kitura-TemplateEngine.git", from: "x.x.x")
```

Add `KituraTemplateEngine` to your target's dependencies:

```swift
.target(name: "example", dependencies: ["KituraTemplateEngine"]),
```

#### Import package

```swift
import KituraTemplateEngine
```

## Examples
The following code examples use the [Kitura-StencilTemplateEngine](https://github.com/Kitura/Kitura-StencilTemplateEngine), however, because this is an abstraction layer, Stencil could be substituted for any supported template engine.

If you are using Stencil, within your `Package.swift` file you will need to:

 - Define "https://github.com/Kitura/Kitura-StencilTemplateEngine.git" as a dependency.
 - Add "KituraStencil" to the targets for Application.

 You will also need to add `KituraStencil` to the file where you're writing your Swift code:
 ```swift
import KituraStencil
```

The following code initializes a [Stencil](https://github.com/kylef/Stencil) template engine and adds it to the [Kitura](https://github.com/Kitura/Kitura) router.
This will render files with the template engine's default file extension, in this example these would be `.stencil` files.
```swift
router.add(templateEngine: StencilTemplateEngine())
```

Here we show how to render files which don't have the same default file extension as the chosen template engine. In this example `useDefaultFileExtension` is set to false, so the default file extension (`.stencil` in this case) will not be rendered and files with the extension `.example` will be rendered.

```swift
router.add(templateEngine: StencilTemplateEngine(), forFileExtensions: [".example"], useDefaultFileExtension: false)
```

If there are any files with file extensions which do not match any of the template engines which have been added to the router, the router will render the file using the default template engine. You can set the default template engine for the router as follows:
```swift
router.setDefault(templateEngine: StencilTemplateEngine())
```

The following example will render the Stencil template `example.stencil` and add it to our router's response. The template file will be retrieved from the default location, which is the `Views` folder. The context variable allows you to pass data through to the template engine and must be valid JSON.
```swift
router.get("/example") { request, response, next in
    var context: [String: Any] = ["key" : "value"]
    try response.render("example.stencil", context: context)
    next()
}
```

## API Documentation
For more information visit our [API reference](https://kitura.github.io/Kitura-TemplateEngine/index.html).

## Community

We love to talk server-side Swift, and Kitura. Join our [Slack](http://swift-at-ibm-slack.mybluemix.net/) to meet the team!

## License
This library is licensed under Apache 2.0. Full license text is available in [LICENSE](https://github.com/Kitura/Kitura-TemplateEngine/blob/master/LICENSE.txt).
