# ocaml-cordova-plugin-inappbrowser

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-inappbrowser/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-inappbrowser.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-inappbrowser)

Binding to
[cordova-plugin-inappbrowser](https://github.com/apache/cordova-plugin-inappbrowser)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-inappbrowser-example).

## Setup a dev environment

```shell
# create a local switch
opam install ocamlformat.0.15.0 merlin
opam install -y .
```

## What does cordova-plugin-inappbrowser do ?

> This plugin provides a web browser view that displays when calling
`cordova.InAppBrowser.open()`.

Source: [cordova-plugin-inappbrowser](https://github.com/apache/cordova-plugin-inappbrowser)

## How to install and compile your project by using this plugin?

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-inappbrowser https://github.com/dannywillems/ocaml-cordova-plugin-inappbrowser.git
```

and to compile your project, use
```Shell
dune build @install
```

Don't forget to install the cordova plugin inappbrowser with
```Shell
cordova plugin add cordova-plugin-inappbrowser
```

## How to use ?

The third argument of open method is an options list. A sum type *options* with
all possible value is implemented and we provide a function
*options_list_to_str* taking a *options list* and returning the corresponding
string.

```OCaml
let i = Cordova_in_app_browser.t () in
(* Clear cache and show InAppBrowser location bar *)
let opt = Cordova_in_app_browser.options_list_to_str [Cordova_in_app_browser.location true ;
Cordova_in_app_browser.ai_clear_cache true] in
(* Opens in the Cordova WebView if the URL is in the white list *)
i#open_ "https://ocaml.org" (Cordova_in_app_browser.target_self) opt
```
