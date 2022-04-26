--[[
    Calculate the Hamming Distance between two DNA strands.

    Your body is made up of cells that contain DNA. Those cells regularly wear out and need replacing, which they achieve by dividing into daughter cells. In fact, the average human body experiences about 10 quadrillion cell divisions in a lifetime!

    When cells divide, their DNA replicates too. Sometimes during this process mistakes happen and single pieces of DNA get encoded with the incorrect information. If we compare two strands of DNA and count the differences between them we can see how many mistakes occurred. This is known as the "Hamming Distance".

    We read DNA using the letters C,A,G and T. Two strands might look like this:

    GAGCCTACTAACGGGAT
    CATCGTAATGACGGCCT
    ^ ^ ^  ^ ^    ^^
    They have 7 differences, and therefore the Hamming Distance is 7.

    The Hamming Distance is useful for lots of things in science, not just biology, so it's a nice phrase to be familiar with :)

    The Hamming distance is only defined for sequences of equal length, so an attempt to calculate it between sequences of different lengths should not work. The general handling of this situation (e.g., raising an exception vs returning a special value) may differ between languages.
]]
local hamming = {}

function hamming.calculate(strand1, strand2)
    local regex = "^[Aa|Cc|Gg|Tt]+$"
    local count = 0

    if (type(strand1) ~= "string" or type(strand2) ~= "string") then
        return "ERROR! One of the strands is not a valid string!"
    elseif string.match(strand1, "^[Aa|Cc|Gg|Tt]+$") == nil or string.match(strand2, "^[Aa|Cc|Gg|Tt]+$") == nil then
        return "ERROR! One of the strands contains incorrect letters!"
    elseif #strand1 ~= #strand2 then
        return "ERROR! Strands of different lengths!"
    else
        for i = 1, #strand1 do
            local strand1Letter = strand1:sub(i, i)
            local strand2Letter = strand2:sub(i, i)

            if strand1Letter ~= strand2Letter then
                count = count + 1
            end
        end
    end

    return "Hamming of " .. count
end

return hamming
