<p align="center">
<a href="http://kitura.io/">
<img src="https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Sources/Kitura/resources/kitura-bird.svg?sanitize=true" height="100" alt="Kitura">
</a>
</p>

<p align="center">
<a href="http://www.kitura.io/">
<img src="https://img.shields.io/badge/docs-kitura.io-1FBCE4.svg" alt="Docs">
</a>
<img src="https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat" alt="Mac OS X">
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
<img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
<a href="http://swift-at-ibm-slack.mybluemix.net/">
<img src="http://swift-at-ibm-slack.mybluemix.net/badge.svg" alt="Slack Status">
</a>
</p>

# Kitura-TemplateEngine
Template engine abstraction layer

## Summary
Kitura-TemplateEngine provides a TemplateEngine protocol to unify the APIs of multiple template engines and integrate them with Kitura's content generation APIs. At runtime, the template engine replaces variables in a template file with actual values, and transforms the template into an HTML file sent to the client. This approach makes it easier to design an HTML page with integrated swift code.

Kitura-TemplateEngine is easy to learn, consumable framework that comes with a set of [implemented plugins](#list-of-plugins).

## Examples

A Kitura-StencilTemplateEngine tutorial on adding a website front end to a food tracker application is available [here](https://github.com/IBM/FoodTrackerBackend/blob/master/StencilFrontend.md).

The following code examples will use the [Kitura-StencilTemplateEngine](https://github.com/IBM-Swift/Kitura-StencilTemplateEngine), however, because this is an abstraction layer, Stencil could be substituted for any other supported template engine.

The following code initializes a Stencil template engine and adds it to the [Kitura](https://github.com/IBM-Swift/Kitura) router.
The template engine is added which will render files with its default file extensions (so for StencilTemplateEngine() this would be .stencil files).
```swift
router.add(templateEngine: StencilTemplateEngine())
```

The following example specifies additional file extensions so the template engine will be used to render a file with the file extension ".example".  Because useDefaultFileExtension was set to false, the default file extentions (.stencil for StencilTemplateEngine) will not be rendered with this template engine.

```swift
router.add(templateEngine: StencilTemplateEngine(), forFileExtensions: [".example"], useDefaultFileExtension: false)
```

The following code will set the default template engine for the router. If there are any file extensions used which do not match to any template engines added to the router, then the router will render the file using this default template engine.
```swift
router.setDefault(templateEngine: StencilTemplateEngine())
```

The following example will render the stencil template "example.stencil" and add it to our routers response. Since no file path is provided the template file will be retrieved from the default location, which is the `Views` folder. the context variable must be valid JSON format and allows you to pass variables through to the template engine to be used inside your template file. The template files are template engine specific so for more details, look at the [template engine plugins](#list-of-plugins).
```swift
router.get("/example") { request, response, next in
    var context: [String: Any] = ["key" : "value"]
    try response.render("example.stencil", context: context).end()
    next()
}
```

## List of Plugins:

* [Kitura-StencilTemplateEngine](https://github.com/IBM-Swift/Kitura-StencilTemplateEngine)

* [Kitura-MustacheTemplateEngine](https://github.com/IBM-Swift/Kitura-MustacheTemplateEngine)

* [Kitura-Markdown](https://github.com/IBM-Swift/Kitura-Markdown)

## License
This library is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE.txt).

