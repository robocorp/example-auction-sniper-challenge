*** Settings ***
Documentation     Completes the Auction Sniper challenge.
Library           RPA.Browser.Playwright

*** Tasks ***
Complete the Auction Sniper challenge
    Open the auction website and accept cookies
    Prepare the bid
    Wait until the last moment
    Confirm the bid
    Take a screenshot of the result

*** Keywords ***
Open the auction website and accept cookies
    New Context    userAgent=Chrome/100.0.4896.75
    New Page
    ...    https://developer.automationanywhere.com/challenges/automationanywherelabs-auctionsniper.html
    Click    id=onetrust-accept-btn-handler

Wait until the last moment
    Wait For Elements State
    ...    id=time-left >> text="0 seconds"
    ...    timeout=0:00:59
    Sleep    0.961 seconds

Prepare the bid
    ${current_price}=    Get Text    id=auction-price
    Fill Text    id=ending-soonest-bid    ${{${current_price} + 3}}
    Click    id=auctionQuickBid

Confirm the bid
    Click    css=#bidConfirm .btn-success    force=True

Take a screenshot of the result
    Sleep    1 second
    Take Screenshot    selector=css=#myModal .modal-content
