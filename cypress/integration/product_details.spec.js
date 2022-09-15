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

  it('Click on "Cliff Collard" and visit its detail page', () => {
    cy.get(".products article").contains("Cliff Collard").click()
    cy.get("h1").contains("Cliff Collard").should("be.visible")

    cy.go('back')
    cy.location('pathname').should('not.include', 'products')
  })

  it("Click on each product to view detail page", () => {
    cy.get(".products article").not(".soldout").each(item => {
      const title = item.find("h1 span").first().text()
      const baseURL = "http://localhost:3000"
      const link = item.find("a").first()

      cy.visit(baseURL + link.attr("href"))
      cy.get("h1").contains(title).should("be.visible")

      cy.go("back")
      cy.location('pathname').should('not.include', 'products')
    })
  })
})