# IntelliJ-iDEA

Feature: login
  Scenario: Correct password
    Given I go to login page
    When  I type "tomsmith" login
    And I type "SuperSecretPassword!" password
    And I click buttons login
    Then User is correct logged

  Scenario: Incorrect password
    Given I go to login page
    When  I type "tomsmith" login
    And I type "xyz123!" password
    And I click buttons login
    Then User is not log

  Scenario Outline: login
    Given I go to login page
    When  I type "<login>" login
    And I type "<password>" password
    And I click buttons login
    Then expectedresult

    Examples:
    |login|password|expectedresult|
    |tomsmith|SuperSecretPassword!|User is correct logged|
    |tomsmith|xyz123!             |User is not log       |
    
    
    import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.cucumber.skeleton.LoginPage;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class LoginSteps {
    WebDriver webDriver;
    LoginPage loginPage;
    @Before
    public void iOpenBrowser() {
       System.setProperty("webdriver.chrome.driver", "C:\\Users\\Tester\\chromedriver.exe");
        webDriver = new ChromeDriver();
        webDriver.manage().window().maximize();

    }
    @Given("I go to login page")
    public void iGoToLoginPage() {

        webDriver.get("https://the-internet.herokuapp.com/login");
        loginPage = new LoginPage(webDriver);

    }

    @When("I type {string} login")
    public void iTypeLogin(String arg0) {
        loginPage.typeLogin(arg0);
    }

    @And("I type {string} password")
    public void iTypePassword(String arg0) {
        loginPage.typePassword (arg0);
    }

    @And("I click buttons login")
    public void iClickButtonsLogin() {
        loginPage.clickLogin();
    }

    @Then("User is correct logged")
    public void userIsCorrectLogged() throws InterruptedException {
        Thread.sleep(2000);
        String expected = "You logged into a secure areal";
        String currentInfo = loginPage.getLogedInfo();
        Assert.assertTrue(currentInfo.contains(expected));
    }

    @Then("User is not log")
    public void userIsNotLog() {
    }
}
