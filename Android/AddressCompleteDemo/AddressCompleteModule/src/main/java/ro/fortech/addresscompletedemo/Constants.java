package ro.fortech.addresscompletedemo;

/**
 * Keeps general app constants
 *
 * @author Catalin Prata
 *         Date: 4/1/14
 */
public interface Constants {

    /**
     * Address Complete API key, can be found here: https://www.canadapost.ca/pca/Account/
     */
    String API_KEY = "BM85-WY78-ZW96-FB59";

    String BASE_URL = "https://ws1.postescanada-canadapost.ca/AddressComplete/Interactive/";


    String WEBSERVICE_VERSION = "/v2.00/json.ws";

    /**
     * Contains the base url, find method name and the webservice version, used to load vendor addresses sugestions
     */
    String SEARCH_URL = BASE_URL + "Find" + WEBSERVICE_VERSION;

    /**
     * Contains the base url, retrieve method name and the webservice version, used to load a vendor address
     */
    String RETRIEVE_URL = BASE_URL + "Retrieve" + WEBSERVICE_VERSION;

}
