
getTestName(testName)


#pass list variable to function (in param) such that IN_LIST works

function (targetFn variableName)
    if(NOT "value1" IN_LIST ${variableName})
        message(SEND_ERROR "${testName} failed: got '${variableName}'")
    endif()
    if(NOT "value2" IN_LIST ${variableName})
        message(SEND_ERROR "${testName} failed: got '${variableName}'")
    endif()
endfunction()

function (test)
    message("Running ${testName}")
    set(var "")
    LIST(APPEND var "value1")
    LIST(APPEND var "value2")
    targetFn(var)
endfunction()

test()