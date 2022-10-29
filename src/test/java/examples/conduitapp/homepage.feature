Feature: Testing Home Page

   Background:
     * url 'https://conduit.productionready.io/api'

  Scenario: get all users and then get the first user by id
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['welcome']
    And match response.tags !contains ['truck']
    And match response.tags == '#array'
    And match each response.tags == '#string'

  Scenario: get 10 articles
    #Given param limit = 10
    #Given param offset = 0
    Given params {limit:10, offset:0 }
    Given path 'articles'
    When method Get
    Then status 200


  