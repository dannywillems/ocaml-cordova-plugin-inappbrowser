(* -------------------------------------------------------------------------- *)
type target =
  | Self [@js "_self"]
  | Blank [@js "_blank"]
  | System [@js "_system"]
  [@@js.enum]

[@@@js.stop]
val target_self     : target
val target_blank    : target
val target_system   : target
[@@@js.start]

[@@@js.implem
let target_self     = Self
let target_blank    = Blank
let target_system   = System
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
[@@@js.stop]
type presentation_style

val presentation_pagesheet    : presentation_style
val presentation_formsheet    : presentation_style
val presentation_fullscreen   : presentation_style
[@@@js.start]

[@@@js.implem
type presentation_style =
  | Pagesheet
  | Formsheet
  | Fullscreen

let presentation_pagesheet    = Pagesheet
let presentation_formsheet    = Formsheet
let presentation_fullscreen   = Fullscreen

let presentation_style_to_str x = match x with
  | Pagesheet -> "pagesheet"
  | Formsheet -> "formsheet"
  | Fullscreen -> "fullscreen"
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
[@@@js.stop]
type transition_style

val transition_flip    : transition_style
val transition_cross   : transition_style
val transition_cover   : transition_style
[@@@js.start]

[@@@js.implem
type transition_style =
  | Flip_horizontal
  | Cross_dissolve
  | Cover_vertical

let transition_flip    = Flip_horizontal
let transition_cross   = Cross_dissolve
let transition_cover   = Cover_vertical

let transition_style_to_str x = match x with
  | Flip_horizontal -> "fliphorizontal"
  | Cross_dissolve -> "crossdisolve"
  | Cover_vertical -> "coververtical"
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)

[@@@js.stop]
type toolbar_position

val toolbar_top     : toolbar_position
val toolbar_bottom  : toolbar_position
[@@@js.start]

[@@@js.implem
type toolbar_position =
  | Top
  | Bottom

let toolbar_top     = Top
let toolbar_bottom  = Bottom

let toolbar_position_to_str x = match x with
  | Top -> "top"
  | Bottom -> "bottom"
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* See documentation for the description of each options.
 * Location and Hidden are available for all plateforms (android, ios, windows
 * phone). Options with AI are available only on android and ios, I only on ios
 * and W only on windows phone.
 *)

[@@@js.stop]
type options

val location                                : bool -> options
val hidden                                  : bool -> options
val ai_clear_cache                          : bool -> options
val ai_clear_session_cache                  : bool -> options
val ai_media_playback_require_user_action   : bool -> options
val a_zoom                                  : bool -> options
val a_hardware_back                         : bool -> options
val i_close_button_caption                  : bool -> options
val i_disallow_overscroll                   : bool -> options
val i_toolbar                               : bool -> options
val i_enable_viewport_scale                 : bool -> options
val i_allow_inline_media_player             : bool -> options
val i_keyboard_display_require_user_action  : bool -> options
val i_suppresses_incremental_rendering      : bool -> options
val i_presentation_style                    : presentation_style -> options
val i_transition_style                      : transition_style -> options
val i_toolbar_position                      : toolbar_position -> options
val w_fullscreen                            : bool -> options

val options_list_to_str : options list -> string
[@@@js.start]

[@@@js.implem
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
  | I_presentation_style of presentation_style
  | I_transition_style of transition_style
  | I_toolbar_position of toolbar_position
  | W_fullscreen of bool

let  location x                               = Location x
let  hidden x                                 = Hidden x
let  ai_clear_cache x                         = AI_clear_chache x
let  ai_clear_session_cache x                 = AI_clear_session_cache x
let  ai_media_playback_require_user_action x  =
  AI_media_playback_require_user_action x
let  a_zoom x                                 = A_zoom x
let  a_hardware_back x                        = A_hardware_back x
let  i_close_button_caption x                 = I_close_button_caption x
let  i_disallow_overscroll x                  = I_disallow_overscroll x
let  i_toolbar x                              = I_toolbar x
let  i_enable_viewport_scale x                = I_enable_viewport_scale x
let  i_allow_inline_media_player x            = I_allow_inline_media_player x
let  i_keyboard_display_require_user_action x =
  I_keyboard_display_require_user_action x
let  i_suppresses_incremental_rendering x     =
  I_suppresses_incremental_rendering x
let  i_presentation_style x                   = I_presentation_style x
let  i_transition_style x                     = I_transition_style x
let  i_toolbar_position x                     = I_toolbar_position x
let  w_fullscreen x                           = W_fullscreen x

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
      "presentationstyle=" ^ presentation_style_to_str x
  | I_transition_style x ->
      "transitionstyle=" ^ transition_style_to_str x
  | I_toolbar_position x ->
      "toolbarposition=" ^ toolbar_position_to_str x
  | W_fullscreen x -> "fullscreen=" ^ bool_to_confirmation x

let rec options_list_to_str o = match o with
  | [] -> ""
  | h::[] -> options_to_str h
  | h::t -> options_to_str h ^ "," ^ options_list_to_str t
]
(* -------------------------------------------------------------------------- *)

class in_app_browser : Ojs.t ->
  object
    inherit Ojs.obj
    method open_ :  string -> (* The URL to load *)
                    target -> (* The target in which to load the URL *)
                    string -> (* Options for the InAppBrowser *)
                    unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> in_app_browser
[@@js.get "cordova.InAppBrowser"]
(* -------------------------------------------------------------------------- *)
