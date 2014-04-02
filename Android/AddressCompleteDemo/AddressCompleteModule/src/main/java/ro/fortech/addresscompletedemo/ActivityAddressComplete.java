package ro.fortech.addresscompletedemo;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.ActionBarActivity;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;


public class ActivityAddressComplete extends ActionBarActivity implements SearchView.OnQueryTextListener, View.OnClickListener, Response.ErrorListener, Response.Listener<String>, AdapterView.OnItemClickListener {

    public static final String DEBUG_TAG = "ActivityAddressComplete";
    public static final String COUNTRY_CODE = "CA";

    private RequestQueue mRequestQueue;
    private final static String REQUEST_TAG = "fetch_request_tag";

    private ListView mListView;
    private SearchView mSearchView;
    private AddressListAdapter mListAdapter;


    private Timer mTimer;
    private TimerTask mTimerTask;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_address_complete_main);

        mListView = (ListView) findViewById(R.id.listView);
        mSearchView = (SearchView) findViewById(R.id.searchView);

        // initialize the adapter with an empty list just to set it to the list view
        mListAdapter = new AddressListAdapter(this, new ArrayList<VendorAddressSuggestion>());

        mListView.setAdapter(mListAdapter);
        mListView.setOnItemClickListener(this);

        mSearchView.setOnQueryTextListener(this);
        mSearchView.setOnSearchClickListener(this);

    }


    @Override
    public boolean onQueryTextSubmit(String query) {

        performSearch(query, null);

        return false;
    }

    @Override
    public boolean onQueryTextChange(final String newText) {

        if (mTimer == null) {

            mTimer = new Timer();

        } else {

            mTimer.cancel();
            mTimer = new Timer();

        }

        mTimerTask = new TimerTask() {
            @Override
            public void run() {

                performSearch(newText, null);

            }
        };

        mTimer.schedule(mTimerTask, 500);

        return false;
    }

    @Override
    public void onClick(View view) {

        if (view == mSearchView) {

            // search button pressed
            performSearch(mSearchView.getQuery().toString(), null);

        }

    }

    /**
     * Performs the search on the webservice
     *
     * @param searchTherm the text to search for
     * @param lastID      the ID of a previous suggestion
     */
    public void performSearch(String searchTherm, String lastID) {

        String fullUrl = String.format("%1$s?key=%2$s&SearchTerm=%3$s&Country=%4$s&SearchFor=Everything&LanguagePreference=EN&LastId=%5$s",
                Constants.SEARCH_URL,
                Constants.API_KEY,
                searchTherm,
                COUNTRY_CODE,
                lastID);

        if (mRequestQueue == null) {
            mRequestQueue = Volley.newRequestQueue(ActivityAddressComplete.this.getApplicationContext());
        } else {
            // cancel all previous calls
            mRequestQueue.cancelAll(REQUEST_TAG);
        }

        StringRequest request = new StringRequest(Request.Method.GET, fullUrl, this, this);

        mRequestQueue.add(request);

    }

    @Override
    public void onErrorResponse(VolleyError error) {

        Log.d(DEBUG_TAG, error.getLocalizedMessage());

        Toast.makeText(ActivityAddressComplete.this, "Could not load data from webservice.", Toast.LENGTH_LONG).show();

    }

    @Override
    public void onResponse(String response) {

        Gson gson = new Gson();

        Log.d(DEBUG_TAG, response);

        // parse the data
        List<VendorAddressSuggestion> addressSuggestions = gson.fromJson(response, new TypeToken<List<VendorAddressSuggestion>>() {
        }.getType());

        mListAdapter.updateDataSet(new ArrayList<VendorAddressSuggestion>(addressSuggestions));

    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

        // get the selected address from the adapter
        VendorAddressSuggestion selectedAddress = (VendorAddressSuggestion) mListAdapter.getItem(position);

        if (selectedAddress.hasNext()) {

            // load the next suggestions
            performSearch(mSearchView.getQuery().toString(), selectedAddress.getId());

        } else {

            // create an intent to open the details activity
            Intent intent = new Intent(ActivityAddressComplete.this, ActivityVendorDetails.class);
            // add the selected address id to the intent to use it latter
            intent.putExtra(ActivityVendorDetails.BUNDLE_EXTRA_ADDRESS_ID, selectedAddress.getId());

            startActivity(intent);

        }

    }

}
