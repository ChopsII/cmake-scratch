
getTestName(testName)

#pass string variable by reference to function (in-out param)
function (targetFn variableName)
    if(NOT ${variableName} STREQUAL "${testName} value")
        message(SEND_ERROR "${testName} failed: got '${variableName}'")
    endif()
    set(${variableName} "${testName} return value" PARENT_SCOPE)
endfunction()

function (test)
    message("Running ${testName}")   
    set(var "${testName} value")
    targetFn(var)
    
    if(NOT var STREQUAL "${testName} return value")
        message(SEND_ERROR "${testName} failed: got '${var}'")
    endif()
endfunction()

test()