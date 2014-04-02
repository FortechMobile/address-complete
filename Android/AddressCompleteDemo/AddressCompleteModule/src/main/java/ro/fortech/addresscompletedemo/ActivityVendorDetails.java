package ro.fortech.addresscompletedemo;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;


public class ActivityVendorDetails extends ActionBarActivity implements Response.Listener<String>, Response.ErrorListener {

    public static final String DEBUG_TAG = "ActivityVendorDetails";

    public static final String BUNDLE_EXTRA_ADDRESS_ID = "ActivityVendorDetailsAddressID";

    private TextView mAddress1, mAddress2, mCity, mProvince, mPostalCode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_vendor_details);

        mAddress1 = (TextView) findViewById(R.id.addressLine1);
        mAddress2 = (TextView) findViewById(R.id.addressLine2);
        mCity = (TextView) findViewById(R.id.city);
        mProvince = (TextView) findViewById(R.id.province);
        mPostalCode = (TextView) findViewById(R.id.postalCode);

        // load the selected address details
        loadAddressDetail(getIntent().getStringExtra(BUNDLE_EXTRA_ADDRESS_ID));

    }

    /**
     * Load the address details from the webservice
     *
     * @param addressID the address ID
     */
    public void loadAddressDetail(String addressID) {

        String fullUrl = String.format("%1$s?key=%2$s&LanguagePreference=EN&id=%3$s",
                Constants.RETRIEVE_URL,
                Constants.API_KEY,
                addressID);


        RequestQueue mRequestQueue = Volley.newRequestQueue(ActivityVendorDetails.this.getApplicationContext());

        StringRequest request = new StringRequest(Request.Method.GET, fullUrl, this, this);

        mRequestQueue.add(request);

    }

    /**
     * Updates the labels text on the screen with the given address values
     *
     * @param vendorAddress vendor address to be displayed on the screen
     */
    public void updateUIWithAddress(VendorAddress vendorAddress) {

        mAddress1.setText(vendorAddress.getStreet());
        mAddress2.setText(vendorAddress.getSecondaryStreet());
        mCity.setText(vendorAddress.getCity());
        mProvince.setText(vendorAddress.getProvince());
        mPostalCode.setText(vendorAddress.getPostalCode());

    }

    @Override
    public void onErrorResponse(VolleyError error) {

        Log.d(DEBUG_TAG, error.getLocalizedMessage());

        Toast.makeText(ActivityVendorDetails.this, "Could not load data from webservice.", Toast.LENGTH_LONG).show();

    }

    @Override
    public void onResponse(String response) {

        Gson gson = new Gson();

        Log.d(DEBUG_TAG, response);

        // parse the data
        List<VendorAddress> vendorAddresses = gson.fromJson(response, new TypeToken<List<VendorAddress>>() {
        }.getType());

        updateUIWithAddress(vendorAddresses.get(0));

    }

}
