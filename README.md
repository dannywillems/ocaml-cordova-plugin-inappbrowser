# ocaml-cordova-plugin-inappbrowser

Binding to
[cordova-plugin-inappbrowser](https://github.com/apache/cordova-plugin-inappbrowser)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-inappbrowser-example).

## What does cordova-plugin-inappbrowser do ?

```
This plugin provides a web browser view that displays when calling
`cordova.InAppBrowser.open()`.
```

Source: [cordova-plugin-inappbrowser](https://github.com/apache/cordova-plugin-inappbrowser)

## How to use ?

* TODO

## ! BE CAREFUL !

The plugin creates a new object called *cordova.InAppBrowser*, but the object is
available when the *deviceready* event is handled.

We don't provide a *cordova.InAppBrowser* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *cordova.InAppBrowser* will be set to **undefined**
because the *cordova.InAppBrowser* object doesn't exist when we create the variable.

Instead, we provide a function *inappbrowser* of type *unit -> inappbrowser Js.t* which creates the
binding to the *cordova.InAppBrowser* object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready =
  let inappbrowser = Inappbrowser.inappbrowser () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
