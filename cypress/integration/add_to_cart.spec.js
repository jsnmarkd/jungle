describe("Add to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Adds a product into the user cart", () => {
    cy.get(".end-0 > .nav-link").should("include.text", "My Cart (0)");

    cy.get(".products > :nth-child(1) > div")
      .contains("Add")
      .click({ force: true });

    cy.get(".end-0 > .nav-link").should("include.text", "My Cart (1)");
  });
});
