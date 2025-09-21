
local utils = {}

function utils.add_values(dest, values)
    for _, v in ipairs(values) do
        table.insert(dest, v)
    end
end

function utils.contains(xs, x)
    for _, v in ipairs(xs) do
        if v == x then
            return true
        end
    end
    return false
end

return utils
