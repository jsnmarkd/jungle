describe('Product Details', () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Navigates to the first product details page", () => {
    cy.get(".products article").contains('Scented Blade').click();
  });

  it("Navigates to the second product details page", () => {
    cy.get(".products article").contains('Giant Tea').click();
  });
})