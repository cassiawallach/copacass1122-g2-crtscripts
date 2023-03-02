*** Settings ***
Library            QWeb
Library            QForce
Resource           ../resources/common.robot
Suite Setup        Setup Browser
Suite Teardown     End suite
Default Tags       dev1

*** Test Cases ***
Prankster Object Test
    [Tags]         DM    reg
    Home
    LaunchApp      Pranksters
    ClickText      New
    UseModal       On
    TypeText       *Prankster Name             Test Prankster
    ClickText      Save                        partial_match=False
    UseModal       Off
    ClickText      Delete                      anchor=PranksterTest Prankster
    UseModal       On
    ClickText      Delete
    UseModal       Off
    LaunchApp      Service

Prank Object Test
    Home
    LaunchApp      Pranksters
    ClickText      New
    UseModal       On
    TypeText       *Prankster Name             CRT_Prankster_1
    ClickText      Save & New
    UseModal       Off
    UseModal       On
    UseModal       Off
    TypeText       *Prankster Name             CRT_Prankster_2
    ClickText      Save                        partial_match=False
    #create prank record
    ClickText      New                         partial_match=False
    UseModal       On
    TypeText       *Title                      CRT_Prank_1
    TypeText       Prank Score                 3
    ComboBox       Search Pranksters...        CRT_Prankster_1
    TypeText       Prank Description           CRT Test
    ClickText      Save                        partial_match=False
    UseModal       Off
    #verify prank was logged against first prankster
    UseTable       Select All
    ClickCell      r1c4
    ClickText      Pranks Against
    VerifyTable    r1c3                        CRT_Prank_1
    #delete test records
    LaunchApp      Pranks
    ClickText      Select a List View
    ClickText      All
    UseTable       Item Number
    ClickCell      r1c7
    ClickText      Delete
    UseModal       On
    ClickText      Delete
    LaunchApp      Pranksters
    UseModal       Off
    ClickCell      r1c3
    ClickText      Delete
    UseModal       On
    ClickText      Delete
    UseModal       Off
    ClickCell      r1c3
    ClickText      Delete
    UseModal       On
    ClickText      Delete
    UseModal       Off