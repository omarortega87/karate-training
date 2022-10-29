Feature: Create Token

    Scenario: Creating the Token
        Given url 'https://conduit.productionready.io/api'
        Given path 'users/login'
        And request {user: {email: "#(email)", password: "#(password)"}}
        When method Post
        Then status 200
        * def autToken = response.user.token