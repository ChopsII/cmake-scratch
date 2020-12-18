
getTestName(testName)

#pass string variable to function (in param)
function (targetFn1 variableName)
    if(NOT ${variableName} STREQUAL "${testName} value")
        message(SEND_ERROR "${testName} failed: got '${variableName}'")
    endif()
endfunction()

function (test1)
    message("Running ${testName}")
    set(var "${testName} value")
    targetFn1(var)
endfunction()

test1()