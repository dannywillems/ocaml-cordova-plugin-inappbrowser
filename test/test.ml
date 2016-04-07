let i = Cordova_in_app_browser.t () in
(* Clear cache and show InAppBrowser location bar *)
let opt = Cordova_in_app_browser.options_list_to_str [Cordova_in_app_browser.location true ;
Cordova_in_app_browser.ai_clear_cache true] in
(* Opens in the Cordova WebView if the URL is in the white list *)
i#open_ "https://ocaml.org" (Cordova_in_app_browser.target_self) opt
