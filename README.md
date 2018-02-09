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
The Kitura template engine abstraction layer.

## Summary
Kitura-TemplateEngine provides a `TemplateEngine` protocol to unify the APIs of multiple template engines and integrate them with Kitura's content generation APIs. At runtime, the template engine replaces variables in a template file with actual values, and transforms the template into an HTML file sent to the client. This approach makes it easier to design an HTML page with integrated Swift code.

- Inspired by http://expressjs.com/en/guide/using-template-engines.html.

## List of Plugins:
Kitura-TemplateEngine is an easy to learn, consumable framework that comes with a set of implemented plugins:

* [Kitura-StencilTemplateEngine](https://github.com/IBM-Swift/Kitura-StencilTemplateEngine)
* [Kitura-MustacheTemplateEngine](https://github.com/IBM-Swift/Kitura-MustacheTemplateEngine)
* [Kitura-Markdown](https://github.com/IBM-Swift/Kitura-Markdown)

## Examples
The following code examples use the [Kitura-StencilTemplateEngine](https://github.com/IBM-Swift/Kitura-StencilTemplateEngine), however, because this is an abstraction layer, Stencil could be substituted for any supported template engine.

The following code initializes a [Stencil](https://github.com/kylef/Stencil) template engine and adds it to the [Kitura](https://github.com/IBM-Swift/Kitura) router.
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
    try response.render("example.stencil", context: context).end()
    next()
}
```

## License
This library is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE.txt).

