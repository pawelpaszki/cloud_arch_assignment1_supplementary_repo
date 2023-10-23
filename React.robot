*** Settings ***
Documentation       This is the basic info about the whole suite
Library             SeleniumLibrary

#Run the script
#robot -d Results Tests/React.robot

*** Variables ***


*** Test Cases ***
Should be able to query react app
    [Documentation]                 Open react sample app
    #Initialise Selenium
    Set selenium speed              .2s
    Set selenium timeout            100s

    FOR    ${index}    IN RANGE    1    119
        open browser                    http://cloud-arch-lb-1656797433.us-east-1.elb.amazonaws.com  chrome

        Set window position             x=100   y=200
        Set window size                 width=1600  height=1200

        ${insID} =	Get Text     xpath://h5[@id="instance-id"]
        log      Instance id: ${insID}
        ${reqCount} =	Get Text     xpath://h4[@id="counter"]
        log      Counter: ${reqCount}
        close browser
    END

*** Keywords ***

