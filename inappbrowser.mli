(* -------------------------------------------------------------------------- *)
type target
val target_to_str : target -> Js.js_string Js.t
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type options

type type_presentation_style
val type_presentation_style_to_str : type_presentation_style -> string

type type_transition_style
val type_transition_style_to_str : type_transition_style -> string

type type_toolbar_position

val bool_to_confirmation : bool -> string
val options_to_str : options -> string
val options_list_to_str : options list -> string
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
val inappbrowser : unit -> inappbrowser Js.t
(* -------------------------------------------------------------------------- *)
