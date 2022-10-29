
Feature: Testing Articles Addition and Delete

    Background: Define URL
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature') {email: "karate1", password: "karate123"}
    * def token = response.user.token

 
    Scenario: Adding an Article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": [], "title": "Testing Karate","description": "Testing Karate","body": "Testing Karate"}}
    When method Post
    Then status 200
    And match response.article.title == 'Testing Karate'

    @debug
    Scenario: Deleting an Article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": [], "title": "Deleting Article","description": "Testing Deleting Karate","body": "Testing Karate"}}
    When method Post
    Then status 200
    And match response.article.title == 'Deleting Article'
    * def articleId = response.article.slug

    Given params { limit:10, offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
   # And match response.articles[0].title == 'Deleting Article'

    Given header Authorization = 'Token ' + token
    Given path 'articles', articleId
    When method Delete
    Then status 204

    Given params {limit:10, offset:0 }
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != 'Deleting Article'

