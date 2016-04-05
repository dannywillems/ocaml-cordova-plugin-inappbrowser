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

The third argument of open method is an options list. A sum type *options* with
all possible value is implemented and we provide a function
*options_list_to_str* taking a *options list* and returning the corresponding
string.

```OCaml
let i = In_app_browser.t () in
(* Clear cache and show InAppBrowser location bar *)
let opt = In_app_browser.options_list_to_str [In_app_browser.location true ;
In_app_browser.ai_clear_cache true] in
(* Opens in the Cordova WebView if the URL is in the white list *)
i#open_ "https://ocaml.org" (In_app_browser.target_self) opt
```

## ! BE CAREFUL !

The plugin creates a new object called *cordova.InAppBrowser*, but the object is
available when the *deviceready* event is handled.

We provide a function *In_app_browser.t* of type *unit -> In_app_browser.in_app_browser* which creates the
binding to the *cordova.InAppBrowser* object. You must call it when the deviceready
event is handled, eg (with js_of_ocaml)

```OCaml
let on_device_ready _ =
  let i = In_app_browser.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
