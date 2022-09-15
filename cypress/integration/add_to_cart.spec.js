describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 14 products on the page", () => {
    cy.get(".products article").should("have.length", 14);
  });

  it("Click 'Void Fennel' add button and cart increase by 1", () => {
    cy.visit("http://localhost:3000/login")
    cy.get("#email").type("test@example.com")
    cy.get("#password").type("test")
    cy.get("input[value=Submit]").click()
    cy.get(".products article form button").eq(1).click({force: true})
    cy.get("a[href='/cart']").should("contain", " My Cart (1) ")
  })
})