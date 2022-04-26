package.path = "../?.lua;" .. package.path

local hamming = require("hamming")

describe(
    "hamming exercise",
    function()
        it(
            "should display error when any of the two strands is not a string",
            function()
                assert.equals(
                    hamming.calculate("GAGCCTACTAACGGGAT", 1),
                    "ERROR! One of the strands is not a valid string!"
                )
            end
        )

        it(
            "'should display an error if one of the two strands doesn't have the DNA letters (A, C, G or T)",
            function()
                assert.equals(
                    hamming.calculate("GAGCCTACTAACGGGAT2", "GAGCCTA2CTAACGGGAT"),
                    "ERROR! One of the strands contains incorrect letters!"
                )
            end
        )

        it(
            "should not allow hamming between two strands of different lengths",
            function()
                assert.equals(
                    hamming.calculate("GAGCCTACTAACGGGAT", "GAGCCTACT"),
                    "ERROR! Strands of different lengths!"
                )
            end
        )

        it(
            "should calculate hamming of zero",
            function()
                assert.equals(hamming.calculate("GAGCCTACTAACGGGAT", "GAGCCTACTAACGGGAT"), "Hamming of 0")
            end
        )

        it(
            "should calculate hamming greater than zero",
            function()
                assert.equals(hamming.calculate("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"), "Hamming of 7")
            end
        )
    end
)
