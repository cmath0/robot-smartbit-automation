

*** Settings ***
Documentation        Arquivo principal do projeto Robot

Library        Browser
Library        libs/Account.py

Resource        ./pages/Landing.resource
Resource        ./pages/Welcome.resource

*** Keywords ***
Start session
    New Browser    chromium    headless=False
    New Page    http://localhost:3000