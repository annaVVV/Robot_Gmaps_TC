*** Settings ***
Documentation  Test Case to search places
Library  BuiltIn
Library  myLibrary.py

*** Variables ***
#Constants
#${BASE_URL} https://maps.googleapis.com/maps/api/geocode/json?
${STATUS_CODE_200} =     200
${STATUS_OK} =   OK

#Test Variables
${search_address} =    95117
${EXPECTED_ADDRESS} =      San Jose, CA 95117, USA
${EXPECTED_PLACE_ID} =     ChIJ4YcqPMHKj4AR_oe_L8U_ojs



*** Test Cases ***
Verify Response Status Code
  [Documentation]  Checking response status code
  [Tags]  Smoke
  ${CODE}=  get status code      ${search_address}
  should be equal  ${CODE}      ${STATUS_CODE_200}

Verify Response Status
  [Documentation]  Checking response status
  [Tags]  Smoke
  ${STATUS}=  get status     ${search_address}
  should be equal  ${STATUS}      ${STATUS_OK}

Verify Address
  [Documentation]  Checking response address
  [Tags]  Smoke
  ${ADDRESS}=  get address     ${search_address}
  should be equal  ${ADDRESS}      ${EXPECTED_ADDRESS}

Verify Place ID
  [Documentation]  Checking response place_id
  [Tags]  Smoke
  ${PLACE_ID}=  get place id     ${search_address}
  should be equal  ${PLACE_ID}      ${EXPECTED_PLACE_ID}


*** Keywords ***


