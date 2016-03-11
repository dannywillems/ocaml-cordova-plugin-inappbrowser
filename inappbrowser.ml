(* -------------------------------------------------------------------------- *)
type target =
  | Self
  | Blank
  | System

let target_to_str t = match t with
  | Self -> Js.string "_self"
  | Blank -> Js.string "_blank"
  | System -> Js.string "_system"
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* See documentation for the description of each options.
 * Location and Hidden are available for all plateforms (android, ios, windows
 * phone). Options with AI are available only on android and ios, I only on ios
 * and W only on windows phone.
 *)
type type_presentation_style =
  | Pagesheet
  | Formsheet
  | Fullscreen

let type_presentation_style_to_str x = match x with
  | Pagesheet -> "pagesheet"
  | Formsheet -> "formsheet"
  | Fullscreen -> "fullscreen"

type type_transition_style =
  | Flip_horizontal
  | Cross_dissolve
  | Cover_vertical

let type_transition_style_to_str x = match x with
  | Flip_horizontal -> "fliphorizontal"
  | Cross_dissolve -> "crossdisolve"
  | Cover_vertical -> "coververtical"

type type_toolbar_position =
  | Top
  | Bottom

let type_toolbar_position_to_str x = match x with
  | Top -> "top"
  | Bottom -> "bottom"

type options =
  | Location of bool
  | Hidden of bool
  | AI_clear_chache of bool
  | AI_clear_session_cache of bool
  | AI_media_playback_require_user_action of bool
  | A_zoom of bool
  | A_hardware_back of bool
  | I_close_button_caption of bool
  | I_disallow_overscroll of bool
  | I_toolbar of bool
  | I_enable_viewport_scale of bool
  | I_allow_inline_media_player of bool
  | I_keyboard_display_require_user_action of bool
  | I_suppresses_incremental_rendering of bool
  | I_presentation_style of type_presentation_style
  | I_transition_style of type_transition_style
  | I_toolbar_position of type_toolbar_position
  | W_fullscreen of bool

let bool_to_confirmation b = match b with
  | true -> "yes"
  | false -> "no"

let options_to_str o = match o with
  | Location x -> "location=" ^ bool_to_confirmation x
  | Hidden x -> "hidden=" ^ bool_to_confirmation x
  | AI_clear_chache x -> "clearcache=" ^ bool_to_confirmation x
  | AI_clear_session_cache x -> "clearsessioncache=" ^ bool_to_confirmation x
  | AI_media_playback_require_user_action x ->
      "mediaPlaybackRequireUserAction=" ^ bool_to_confirmation x
  | A_zoom x -> "zoom=" ^ bool_to_confirmation x
  | A_hardware_back x -> "hardwareback=" ^ bool_to_confirmation x
  | I_close_button_caption x -> "closebuttoncaption=" ^ bool_to_confirmation x
  | I_disallow_overscroll x -> "disallowoverscroll=" ^ bool_to_confirmation x
  | I_toolbar x -> "toolbar=" ^ bool_to_confirmation x
  | I_enable_viewport_scale x -> "enableViewportScale=" ^ bool_to_confirmation x
  | I_allow_inline_media_player x ->
      "allowInlineMediaPlayer=" ^ bool_to_confirmation x
  | I_keyboard_display_require_user_action x ->
      "keyboardDisplayRequiresUserAction=" ^ bool_to_confirmation x
  | I_suppresses_incremental_rendering x ->
      "suppressesIncrementalRendering=" ^ bool_to_confirmation x
  | I_presentation_style x ->
      "presentationstyle=" ^ type_presentation_style_to_str x
  | I_transition_style x ->
      "transitionstyle=" ^ type_transition_style_to_str x
  | I_toolbar_position x ->
      "toolbarposition=" ^ type_toolbar_position_to_str x
  | W_fullscreen x -> "fullscreen=" ^ bool_to_confirmation x

let rec options_list_to_str o = match o with
  | [] -> ""
  | h::[] -> options_to_str h
  | h::t -> options_to_str h ^ "," ^ options_list_to_str t
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class type inappbrowser =
  object
    method open_ :  Js.js_string Js.t ->
                    Js.js_string Js.t ->
                    Js.js_string Js.t ->
                    unit Js.meth
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
let inappbrowser () = Js.Unsafe.js_expr ("cordova.InAppBrowser")
(* -------------------------------------------------------------------------- *)
