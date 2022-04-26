package.path = "../?.lua;" .. package.path

local helloWorld = require("helloWorld")

describe(
    "simple hello world method",
    function()
        it(
            "should return hello world correctly",
            function()
                assert.equals(helloWorld.salute(), "Hello, World!")
            end
        )
    end
)
