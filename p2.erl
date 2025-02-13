-module(p2).
-export([start/0, factorial/1]).

start() -> 
    loop().

loop() -> 
    io:format("Enter a number: "),
    case io:fread("", "~d") of
        {ok, [Value]} ->  
            if
                Value < 0 -> 
                    Result = math:pow(abs(Value), 7),
                    io:format("~w raised to the 7th power is: ~w~n", [abs(Value), Result]),
                    loop();
                Value == 0 -> 
                    io:format("0~nGoodbye!~n"),
                    halt();
                Value > 0 -> 
                    if
                        Value rem 7 == 0 -> 
                            Root = math:pow(Value, 1/5),
                            io:format("The 5th root of ~w is: ~w~n", [Value, Root]);
                        true -> 
                            Fact = factorial(Value),
                            io:format("The factorial of ~w is: ~w~n", [Value, Fact])
                    end,
                    loop()
            end;
        {error, _} ->  
            io:format("not an integer~n"),
            loop()
    end.

factorial(0) -> 1;
factorial(N) when N > 0 -> N * factorial(N - 1).
