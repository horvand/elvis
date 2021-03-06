-module(fail_macro_module_names).

-export([
         module_name/0,
         function_name/0,
         no_errors/0,
         build_binary/0
        ]).

-define(FUNCTION_NAME, function_name).
-define(BINARY, "bla").
-define(function_name, function_name).
-define(module_name, ?MODULE).

module_name() ->
    ?MODULE:function_name(),
    ?module_name:?function_name().

function_name() ->
    module:?FUNCTION_NAME(params),
    module:?FUNCTION_NAME (params),
    lists:?MODULE().

build_binary() ->
    Bin = <<?BINARY:32>>,
    <<Bin, ?BINARY:1, "prefix">>.

no_errors() ->
    ?LINE.
