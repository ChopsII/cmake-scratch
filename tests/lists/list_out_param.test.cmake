
getTestName(testName)


#return list value from function (out param) such that IN_LIST works in the calling function

function (targetFn variableName)
    
    set(expected "")

    list(APPEND ${variableName} "value1")
    list(APPEND ${variableName} "value2")

    set(${variableName} ${${variableName}} PARENT_SCOPE)

endfunction()

function (test)

    message("Running ${testName}")

    set(var "")

    targetFn(var)

    set(expected "")
    list(APPEND expected "value1")
    list(APPEND expected "value2")

    ASSERT_LIST_EQ(var expected)

endfunction()

test()