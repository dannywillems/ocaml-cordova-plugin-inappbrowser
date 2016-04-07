let i = In_app_browser.t () in
(* Clear cache and show InAppBrowser location bar *)
let opt = In_app_browser.options_list_to_str [In_app_browser.location true ;
In_app_browser.ai_clear_cache true] in
(* Opens in the Cordova WebView if the URL is in the white list *)
i#open_ "https://ocaml.org" (In_app_browser.target_self) opt
