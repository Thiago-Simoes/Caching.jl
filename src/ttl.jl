macro cache_ttl(ex::Expr, seconds::Int64=0)
    if ex.head == :(=) && length(ex.args) == 2
        var_name = ex.args[1]
        var_value = ex.args[2]
        cached_function_name = Symbol("$(var_name)_cached")

        if seconds != 0
            return quote
                function $(cached_function_name)(args...; kwargs...)
                    $(esc(var_value))(args...; kwargs...)
                end

                $(esc(var_name)) = @cache $(cached_function_name)            
                @async begin
                    while true
                        sleep($seconds)
                        empty!($(esc(var_name)))
                    end
                end
            end
        else
            return quote
                function $(cached_function_name)(args...; kwargs...)
                    $(esc(var_value))(args...; kwargs...)
                end

                $(esc(var_name)) = @cache $(cached_function_name)            
            end
        end
    else
        error("Error, invalid expression")
    end
end

