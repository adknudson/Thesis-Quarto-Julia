let
    using DataFrames
    using RData
    import CodecBzip2

    function load_one(path)
        filename = last(splitpath(path))
        name = first(splitext(filename))
        dat = load(path)
        return Symbol(name) => dat[name]
    end

    Dict(load_one(path) for path in readdir("data/fang-data"; join=true))
end
