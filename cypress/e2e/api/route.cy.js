/// <reference types="cypress" />

describe('Polychain - Blockchain service', () => {
  beforeEach(() => {
    // cy.server() // Start the server
    cy.intercept({
      method: 'GET',
      url: '/',
      response: { "message": 'Welcome to Polychain API.' },
      headers: {
        'content-type': 'application/json'
      }
    })
    cy.visit('/')
  })

  it('should display the welcome message', () => {
    cy.contains(JSON.stringify({ message: 'Welcome to Polychain API.' })) // Check if the welcome message is displayed on the page
  })
})
