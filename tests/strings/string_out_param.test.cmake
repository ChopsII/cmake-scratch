
getTestName(testName)

#return string value from function (out param)
function (targetFn variableName)
    set(${variableName} "${testName} return value" PARENT_SCOPE)
endfunction()

function (test)
    message("Running ${testName}")
    targetFn(var)
    
    if(NOT var STREQUAL "${testName} return value")
        message(SEND_ERROR "${testName} failed: got '${var}'")
    endif()
endfunction()

test()