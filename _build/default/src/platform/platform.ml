type platform = 
  | Windows 
  | MacOS 
  | Linux

let string_of_platform = function
  | Windows -> "Windows"
  | MacOS -> "MacOS"
  | Linux -> "Linux"

let platform_of_system_string = function
  | "linux" -> Linux 
  | "macosx" -> MacOS
  | "mingw" -> Windows
  | s -> failwith (Printf.sprintf "Invalid system: %s. Should be one of [ linux | macosx | mingw ]." s)