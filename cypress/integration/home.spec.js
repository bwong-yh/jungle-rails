describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 14 products on the page", () => {
    cy.get(".products article").should("have.length", 14);
  });
})