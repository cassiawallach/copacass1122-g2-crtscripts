*** Settings ***
Library           QWeb
Library           QForce
Resource          ../resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite
Default Tags      dev1

*** Test Cases ***
Prankster Object Test
    [Tags]        DM
    Home
    LaunchApp     Pranksters
    ClickText     New
    UseModal      On
    TypeText      *Prankster Name             Test Prankster
    ClickText     Save                        partial_match=False
    UseModal      Off
    ClickText     Delete                      anchor=PranksterTest Prankster
    UseModal      On
    ClickText     Delete
    UseModal      Off
    LaunchApp     Service