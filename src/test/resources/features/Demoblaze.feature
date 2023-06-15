#language : es
@PX-9
Feature: Demoblaze

  @TEST
  Scenario Outline: validar que se pueda Añadir un usuario a la tienda
    Given url 'https://api.demoblaze.com/signup'
    * def getUser = function(max){ return Math.floor(Math.random() * max) }
    * def user = getUser(999999999)
    And request {"username": '#(user)',"password": "<password>"}
    When method post
    Then status 200
    * def mensajeError = response.errorMessage
    * assert mensajeError != 'This user already exist.'
    Examples:
      | password |
      | clave123 |

  Scenario Outline: intento registrar un usuario ya existente
    Given url 'https://api.demoblaze.com/signup'
    And request {"username": "<newUser>","password": "<password>"}
    When method post
    Then status 200
    * def mensajeError = response.errorMessage
    * assert mensajeError == 'This user already exist.'
    Examples:
      | newUser  | password |
      | Duki1012 | clave123 |

  Scenario Outline: validar que se pueda logear
    Given url 'https://api.demoblaze.com/login'
    And request {"username": "<newUser>","password": "<password>"}
    When method post
    Then status 200
    Examples:
      | newUser    | password |
      | Duki1012 | clave123      |

  Scenario Outline: validar que se pueda logear incorrectamente
    Given url 'https://api.demoblaze.com/login'
    And request {"username": "<newUser>","password": "<password>"}
    When method post
    Then status 200
    * def mensajeError = response.errorMessage
    * assert mensajeError == 'Wrong password.'
    Examples:
      | newUser  | password   |
      | Duki1012 | clave12345 |