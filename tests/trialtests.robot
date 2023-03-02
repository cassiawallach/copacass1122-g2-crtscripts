*** Settings ***
Library           QWeb
Library           QForce
Resource          ../resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite
Default Tags      dev1

*** Test Cases ***
Prankster Tracker App Test
    [Tags]        DM                        
    Home
    #launch DM Prank Tracker App
    LaunchApp     DMPC Prank Tracker
    #create pranksters
    ClickText     Pranksters
    ClickText     New
    UseModal      On
    TypeText      *Prankster Name             CRT_Prankster_1
    ClickText     Save & New
    UseModal      Off
    UseModal      On
    UseModal      Off
    UseModal      On
    TypeText      *Prankster Name             CRT_Prankster_2
    ClickText     Save                        partial_match=False
    UseModal      Off
    #create prank acheived
    ClickText     New                         partial_match=False
    UseModal      On
    TypeText      *Title                      CRT_Prank_1
    TypeText      Prank Score                 3
    ComboBox      Search Pranksters...        CRT_Prankster_1
    TypeText      Prank Description           Test
    ClickText     Save                        partial_match=False
    UseModal      Off
    #create prank against
    ClickText     Pranks Against
    ClickText     New                         partial_match=False
    UseModal      On
    TypeText      *Title                      CRT_Prank_2
    ComboBox      Search Pranksters...        CRT_Prankster_1
    TypeText      Prank Score                 5
    TypeText      Prank Description           Test Prank
    ClickText     Save                        partial_match=False
    UseModal      Off
    #verify pranks
    ClickText     Pranksters
    ClickText     CRT_Prankster_1
    UseTable      Select All
    VerifyText    RT_Prank_2
    ClickText     Pranks Against
    VerifyText    CRT_Prank_1
    #delete test records
    ClickText     Pranks                      partial_match=False
    ClickText     Select a List View
    ClickText     All
    UseTable      Item Number
    ClickCell     r1c7
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    ClickCell     r1c7
    ClickText     Delete
    ClickText     Delete
    ClickText     Pranksters
    UseModal      Off
    ClickCell     r1c3
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    UseModal      Off
    ClickCell     r1c3
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    UseModal      Off
    ClickText     Home


Prank Object Test
    Home
    LaunchApp     Pranksters
    ClickText     New
    UseModal      On
    TypeText      *Prankster Name             CRT_Prankster_1
    ClickText     Save & New
    UseModal      Off
    UseModal      On
    UseModal      Off
    TypeText      *Prankster Name             CRT_Prankster_2
    ClickText     Save                        partial_match=False
    #create prank record
    ClickText     New                         partial_match=False
    UseModal      On
    TypeText      *Title                      CRT_Prank_1
    TypeText      Prank Score                 3
    ComboBox      Search Pranksters...        CRT_Prankster_1
    TypeText      Prank Description           CRT Test
    ClickText     Save                        partial_match=False
    UseModal      Off
    #delete test records
    LaunchApp     Pranks
    ClickText     Select a List View
    ClickText     All
    UseTable      Item Number
    ClickCell     r1c7
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    LaunchApp     Pranksters
    UseModal      Off
    ClickCell     r1c3
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    UseModal      Off
    ClickCell     r1c3
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    UseModal      Off