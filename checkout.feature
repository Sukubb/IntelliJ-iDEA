# IntelliJ-iDEA

Feature: Checkout
  Scenario: Add item with empty name
    Given the price of a "" is 25c
    When I checkout "" 1
    Then the total price should be 0c

  Scenario: Add item with empty name
    Given the price of a "banana" is -1c
    When I checkout "banana" 1
    Then the total price should be 0c

  Scenario: Checkout bananas twice
    Given the price of a "banana" is 40c
    When I checkout "banana" 1
    And I checkout "banana" 1
    Then the total price should be 80c

  Scenario: Checkout non existing items
    Given empty product list
    When I checkout "apple" 1
    And I checkout "banana" 2
    Then the total price should be 0c

  Scenario Outline: Checkout apples and bananas
    Given the price of a "banana" is 40c
    And the price of a "apple" is 25c
    When I checkout "apple" <applecount>
    And I checkout "banana" <bananacount>
    Then the total price should be <total>c

    Examples:
      | applecount | bananacount | total |
      |     1      |  1          | 65    |
      |     2      |  2          | 130   |
      
      
      
      
      
      import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

public class CheckoutStepsDevs {
    private CheckoutStepsDevs checkout;
    @Before
    public void setUpScenario () {
        checkout = new CheckoutStepsDevs();
    }
    @After
    public void tearDownScenario (){
        checkout = null;
    }
    @Given("the price of a {string} is {int}c")
    public void thePriceOfAIsC(String name, int price) {
        checkout.addItem(name,price);
    }

    private void addItem(String name, int price) {
    }

    @When("I checkout {string} {int}")
    public void iCheckoutApplecount (String name, int count) {
        checkout.scanItems (name, count);
    }

    private void scanItems(String name, int count) {
    }

    @Then("the total price should be {int}c")
    public void theTotalPriceShouldBeTotalC(int sumTotal) {
        Assert.assertEquals(sumTotal, checkout.totalCart());
    }

    private int totalCart() {
        return 0;
    }

    @Given("empty product list")
    public void emptyProductList() {
        checkout.reset();
    }

    private void reset() {
        
    }
}
