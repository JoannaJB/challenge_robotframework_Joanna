*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//span[text()='Sign in']
${LOGININPUT}       xpath=//input[@id='login']
${PASSWORDINPUT}    xpath=//input[@id='password']
${PAGELOGO}     xpath=//div[@title='Logo Scouts Panel']
${SIGNOUTBUTTON}    xpath=//span[text()='Sign out']
${REMINDPASSWORD}   xpath=//a[text()='Remind password']
${INVALIDLOGINPASSWORD}     xpath=//span[text()='Identifier or password invalid.']
${ADDPLAYERBUTTON}      xpath=//span[text()='Add player']
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${AGEINPUT}     xpath=//input[@name='age']
${MAINPOSITIONINPUT}       xpath=//input[@name='mainPosition']
${SUBMITBUTTON}     xpath=//button[@type='submit']
${HEADEROFBOXAFTERADDPLAYER}        Edit player Jan Kowalski
${EMAILINPUT}       xpath=//input[@name='email']
${PHONEINPUT}       xpath=//input[@name='phone']
${WEIGHTINPUT}      xpath=//input[@name='weight']
${HEIGHTINPUT}      xpath=//input[@name='height']
${LEGDROPDOWN}      xpath=//div[@id='mui-component-select-leg']
${RIGHTLEG}     xpath=//li[@data-value='right']
${CLUBINPUT}        xpath=//input[@name='club']
${DISTRICTDROPTOWN}     xpath=//div[@id='mui-component-select-district']
${WARMIAMASURIADISTRICT}        xpath=//li[@data-value='warminsko-mazurskie']
${MAINPAGE}     xpath=//span[text()='Main page']
${LASTCREATEDPLAYER}        xpath=//h6[text()='Last created player']//..//a[1]//span[1]
${MATCHES}      xpath=//span[text()='Matches']
${ADDMATCHBUTTON}     xpath=//span[text()='Add match']
${HEADEROFBOXADDMATCH}      xpath=//div[@class='MuiCardHeader-content']//span
${MYTEAMINPUT}       xpath=//input[@name='myTeam']
${ENEMYTEAMINPUT}        xpath=//input[@name='enemyTeam']
${MYTEAMSCOREINPUT}      xpath=//input[@name='myTeamScore']
${ENEMYTEAMSCOREINPUT}       xpath=//input[@name='enemyTeamScore']
${DATEMATCHINPUT}     xpath=//input[@name='date']
${SUBMITMATCHBUTTON}        xpath=//span[text()='Submit']
${TABLEAFTERADDMATCH}       xpath=//tr[@class='MuiTableRow-root']
${MYTEAMINTABLE}        xpath=//td[1]

*** Test Cases ***
Login to the system and logout
    Open Login Page
    Maximize Browser Window
    Type in Login
    Type in Password
    Click on the Sign In button
    Assert Dashboard
    Click On The Sign Out Button
    Assert Login Page
    [Teardown]  Close Browser

Login to the system with fail data
    Open Login Page
    Maximize Browser Window
    Type in fail Login
    Type in fail Password
    Click on the Sign In button
    Assert Invalid Login and Password
    [Teardown]  Close Browser

Login and add player
    Open Login Page
    Maximize Browser Window
    Type in Login
    Type in Password
    Click on the Sign In button
    Assert Dashboard
    Click Add Player
    Type Name
    Type Surname
    Type Age
    Type Main Position
    Click on the Submit button
    Assert Header of box after add player
    [Teardown]  Close Browser

Login, add player and edit
    Open Login Page
    Maximize Browser Window
    Type in Login
    Type in Password
    Click on the Sign In button
    Assert Dashboard
    Click Add Player
    Type Name
    Type Surname
    Type Age
    Type Main Position
    Click on the Submit button
    Assert Header of box after add player
    Type Email
    Type Phone
    Type Weight
    Type Height
    Type choose Leg
    Type Club
    Type District
    Click on The Submit Button
    Click on Main Page
    Assert Last Created Player
    [Teardown]  Close Browser

Login, add player and add match
    Open Login Page
    Maximize Browser Window
    Type in Login
    Type in Password
    Click on the Sign In button
    Assert Dashboard
    Click Add Player
    Type Name
    Type Surname
    Type Age
    Type Main Position
    Click on the Submit button
    Click on Matches on SidePanel
    Click Add Match
    Assert Add Match
    Type My Team
    Type Enemy Team
    Type My Team Score
    Type Enemy Team Score
    Type Date Match
    Click Submit Match
    Assert Table and my team
    [Teardown]  Close Browser

*** Keyword ***
Open Login Page
    Open Browser    ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in Login
    Wait Until Element Is Visible        ${LOGININPUT}
    Input Text      ${LOGININPUT}   user10@getnada.com
Type in Password
    Wait Until Element Is Visible        ${PASSWORDINPUT}
    Input Text      ${PASSWORDINPUT}        Test-1234
Click on the Sign In button
    Wait Until Element Is Visible        ${SIGNINBUTTON}
    Click Element       ${SIGNINBUTTON}
Assert Dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Click on the Sign out button
    Wait Until Element Is Visible        ${SIGNOUTBUTTON}
    Click Element       ${SIGNOUTBUTTON}
Assert Login Page
    Wait Until Element Is Visible        ${REMINDPASSWORD}
    Capture Page Screenshot     alert.png
Type in fail Login
    Wait Until Element Is Visible        ${LOGININPUT}
    Input Text      ${LOGININPUT}       mail@gmail.com
Type in fail Password
    Wait Until Element Is Visible        ${PASSWORDINPUT}
    Input Text      ${PASSWORDINPUT}        Haslo000
Assert Invalid Login and Password
    Wait Until Element Is Visible       ${INVALIDLOGINPASSWORD}
    Get Text      ${INVALIDLOGINPASSWORD}
    Element Text Should Be      ${INVALIDLOGINPASSWORD}       Identifier or password invalid.
    Capture Page Screenshot     alert.png
Click Add Player
    Wait Until Element Is Visible       ${ADDPLAYERBUTTON}
    Click Element       ${ADDPLAYERBUTTON}
Type Name
    Wait Until Element Is Visible       ${NAMEINPUT}
    Input Text      ${NAMEINPUT}        Jan
Type Surname
    Wait Until Element Is Visible       ${SURNAMEINPUT}
    Input Text      ${SURNAMEINPUT}     Kowalski
Type Age
    Wait Until Element Is Visible       ${AGEINPUT}
    Input Text       ${AGEINPUT}        14.05.1994
Type Main Position
    Wait Until Element Is Visible       ${MAINPOSITIONINPUT}
    Input Text      ${MAINPOSITIONINPUT}       Atak
Click on the Submit button
    Wait Until Element Is Visible       ${SUBMITBUTTON}     8s
    Click Element       ${SUBMITBUTTON}
Assert Header of box after add player
    Wait Until Page Contains      ${HEADEROFBOXAFTERADDPLAYER}
    Capture Page Screenshot     alert.png
Type Email
    Wait Until Element Is Visible       ${EMAILINPUT}
    Input Text      ${EMAILINPUT}       mail@test.com
Type Phone
    Wait Until Element Is Visible       ${PHONEINPUT}
    Input Text      ${PHONEINPUT}       123456789
Type Weight
    Wait Until Element Is Visible       ${WEIGHTINPUT}
    Input Text      ${WEIGHTINPUT}      72
Type Height
    Wait Until Element Is Visible       ${HEIGHTINPUT}
    Input Text      ${HEIGHTINPUT}      182
Type choose Leg
    Wait Until Element Is Visible       ${LEGDROPDOWN}
    Click Element      ${LEGDROPDOWN}
    Click Element        ${RIGHTLEG}
Type Club
    Wait Until Element Is Visible       ${CLUBINPUT}
    Input Text      ${CLUBINPUT}        Klub piłkarski
Type District
    Wait Until Element Is Visible       ${DISTRICTDROPTOWN}
    Click Element       ${DISTRICTDROPTOWN}
    Wait Until Element Is Visible       ${WARMIAMASURIADISTRICT}
    Click Element       ${WARMIAMASURIADISTRICT}
Click on Main Page
    Wait Until Element Is Visible       ${MAINPAGE}
    Click Element       ${MAINPAGE}
Assert Last Created Player
    Wait Until Element Contains     ${LASTCREATEDPLAYER}        JAN KOWALSKI        10s
    Capture Page Screenshot     alert.png
Click on Matches on SidePanel
    Wait Until Element Is Visible       ${MATCHES}
    Click Element       ${MATCHES}
Click Add Match
     Wait Until Element Is Visible       ${ADDMATCHBUTTON}
     Click Element      ${ADDMATCHBUTTON}
Assert Add Match
    Wait Until Element Contains     ${HEADEROFBOXADDMATCH}      Adding match player Jan Kowalski
Type My Team
    Wait Until Element Is Visible       ${MYTEAMINPUT}
    Input Text      ${MYTEAMINPUT}      Drużyna Wygrana
Type Enemy Team
    Wait Until Element Is Visible       ${ENEMYTEAMINPUT}
    Input Text      ${ENEMYTEAMINPUT}       Drużyna Przegrana
Type My Team Score
    Wait Until Element Is Visible       ${MYTEAMSCOREINPUT}
    Input Text      ${MYTEAMSCOREINPUT}     3
Type Enemy Team Score
    Wait Until Element Is Visible       ${ENEMYTEAMSCOREINPUT}
    Input Text      ${ENEMYTEAMSCOREINPUT}      0
Type Date Match
    Wait Until Element Is Visible       ${DATEMATCHINPUT}
    Input Text      ${DATEMATCHINPUT}        17.06.2022
Click Submit Match
    Click Element       ${SUBMITMATCHBUTTON}
Assert Table and My Team
    Wait Until Element Is Visible       ${TABLEAFTERADDMATCH}
    Wait Until Element Contains     ${MYTEAMINTABLE}        Drużyna Wygrana
    Capture Page Screenshot     alert.png

