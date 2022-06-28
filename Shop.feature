# IntelliJ-iDEA
Feature: shopping
  Scenario: visit shop

    When I go to shop website
    Then I see 16 t-shirts

  Scenario: Check filter - M

    Given I go to shop website
    And I see 16 t-shirts
    When I select "M" size
    Then I see 1 t-shirts

  Scenario: Check filter - L

    Given I go to shop website
    And I see 16 t-shirts
    When I select "L" size
    Then I see 10 t-shirts

  Scenario Outline: Check filter

    Given I go to shop website
    And I see 16 t-shirts
    When I select "<size>" size
    Then I see <count> t-shirts

    Examples:
    |size|count|
    |M   |1    |
    |L   |10   |

  Scenario: Buy product
    Given I go to shop website
    And I see 16 t-shirts
    When I select 0 product
    And I select 1 product
    Then I see Total prize 24.15
    
    
    
    import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class ShopStepDefs {
    WebDriver webDriver;

//    @Before
//    public void iOpenBrowser() {
//        System.setProperty("webdriver.chrome.driver", "C:\\Users\\Tester\\chromedriver.exe");
//        webDriver = new ChromeDriver();
//        System.out.println("Otwieram przegladarke");
//    }
//
//    @After
//    public void iCloseBrowser() {
////        webDriver.close();
//        System.out.println("Zamykam przeglądarke");
//    }

    @When("I go to shop website")
    public void iGoToShopWebsite() {
        webDriver.get("https://react-shopping-cart-67954.firebaseapp.com/");
        System.out.println("Wchodze na strone sklepu");
    }

    @Then("I see {int} t-shirts")
    public void iSeeTShirts(int arg0) throws InterruptedException {
        Thread.sleep(3000);
        int size =
                webDriver.findElements(By.className("sc-124al1g-2")).size();


//        System.out.println("Widze "+ arg0 + " koszulek");
        System.out.println(String.format("Widze %s koszulek", size));
        System.out.println(String.format("Powinienem widzieć %s koszulek.", arg0));
        Assert.assertEquals(size, arg0);
    }

    @When("I select {string} size")
    public void iSelectSize(String size) {
        System.out.println(String.format("Wybieram rozmiar %s", size));
        webDriver.findElement(By.xpath(String.format("//span[text()='%s']", size))).click();
    }

    @Given("I Load the  shop website")
    public void iLoadTheShopWebsite() {
    }

    @And("I can see {int} product")
    public void iCanSeeProduct(int arg0) {
    }

    @When("I choose {int} ites")
    public void iChooseItes(int arg0) {
    }

    @When("I select {int} product")
    public void iSelectProduct(int arg0) {
        webDriver.findElements(By.cssSelector("button.sc-124al1g-0")).get(arg0).click();
    }


    @Then("I see Total prize {double}")
    public void iSeeTotalPrize(double price) {
        String cartValue = webDriver.findElement(By.cssSelector("p.jzywDV")).getText().replace("$ ", "");
        System.out.println("Oczekiwana wartość koszyka: "+ cartValue);
        System.out.println("Otrzymana wartość koszyka: "+ price);
        Assert.assertTrue(price==Double.valueOf(cartValue));
    }
}


