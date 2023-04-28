*** Settings ***
Library           QWeb
Library           QForce
Library           DataDriver                  encoding=utf_8         file=House.csv
Resource          ../resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End suite
Default Tags      dev1

*** Test Cases ***
Create Account record   
    [Tags]        reg                         int
    Home
    LaunchApp     Sales
    ClickText     Accounts
    ClickText     New
    UseModal      On
    ClickText     Next
    TypeText      *Account Name               CRT_Test_Account
    PickList      Type                        Competitor
    ClickText     Save                        partial_match=False
    UseModal      Off
    ClickText     Details
    VerifyText    CRT_Test_Account
    ClickText     Show more actions
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    ClickText     Home




Prank Tracker App Test
    [Tags]        DM                          int                    reg
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
    ClickText     crt_TEST
    UseTable      Item Number
    ClickCell     r1c7
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    ClickCell     r1c7
    ClickText     Delete
    ClickText     Delete
    ClickText     Home



Create House record 
    [Tags]        int                         reg
    Home
    LaunchApp     Houses
    ClickText     New
    UseModal      On
    TypeText      *House Name                 crt_testHOUSE
    TypeText      Address                     123 North Street
    TypeText      State                       CA
    TypeText      City                        San Diego
    TypeText      Zip                         92109
    TypeText      Bedroom                     3
    TypeText      Bathrooms                   2
    TypeText      Price                       2000000
    ClickText     Save                        partial_match=False
    UseModal      Off
    ClickText     Show more actions
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    ClickText     Home

Baked Goods object
    [Tags]        int
    Home
    LaunchApp     Baked Goods
    ClickText     New
    UseModal      On
    TypeText      *Baked Good Name            CRT_Test Baked Good
    ClickText     Save                        partial_match=False
    UseModal      Off

    ClickText    Related
    ClickText    New    partial_match=False
    UseModal    On
    TypeText    *Recipe Name    CRT Recipe_test test
    TypeText    //*[@id\='sectionContent-407']/div[1]/slot[1]/records-record-layout-row[3]/slot[1]/records-record-layout-item[1]/div[1]/span[1]/slot[1]/records-record-layout-rich-text[1]/lightning-quill[1]/lightning-input-rich-text[1]/div[1]/div[1]/div[1]/div[2]/div[1]    Test instructions
    ClickText    Save    partial_match=False
    UseModal    Off
    VerifyText    Recipe Name\nCRT Recipe_test test
    ClickText     Show more actions
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    UseModal      Off

Recipe object
    [Tags]        int
    Home
    LaunchApp     Recipes
    ClickText     New
    UseModal      On
    TypeText      *Recipe Name                CRT Recipe_test
    ClickText     Search Baked Goods...
    ClickText     New Baked Good
    TypeText      Baked Good Name*            CRT Baked Good test
    ClickText     Save                        anchor=Information
    UseModal      Off
    ClickText     Save                        partial_match=False
    ClickText     CRT Baked Good test
    ClickText     Show more actions
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    UseModal      Off
    VerifyText    Success\nBaked Good "CRT Baked Good test" was deleted
    LaunchApp     Recipes
    ClickText     CRT CRT Recipe_test
    ClickText     Show more actions
    ClickText     Delete
    UseModal      On
    ClickText     Delete
    UseModal      Off
