
getTestName(testName)


#pass multiple list variables to function (in param) such that IN_LIST works

function (targetFn variableName1 variableName2)

    set(exp1 "")
    list(APPEND exp1 "value1.1")
    list(APPEND exp1 "value1.2")

    
    set(exp2 "")
    list(APPEND exp2 "value2.1")
    list(APPEND exp2 "value2.2")

    ASSERT_LIST_EQ(exp1 ${variableName1})

    ASSERT_LIST_EQ(exp2 ${variableName2})

endfunction()

function (test)

    message("Running ${testName}")

    set(var1 "")
    list(APPEND var1 "value1.1")
    list(APPEND var1 "value1.2")
    
    set(var2 "")
    list(APPEND var2 "value2.1")
    list(APPEND var2 "value2.2")

    targetFn(var1 var2)

endfunction()

test()