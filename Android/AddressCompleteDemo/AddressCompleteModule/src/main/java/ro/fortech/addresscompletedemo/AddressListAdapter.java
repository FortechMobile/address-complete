package ro.fortech.addresscompletedemo;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Class used to
 *
 * @author Catalin Prata
 *         Date: 4/1/14
 */
public class AddressListAdapter extends BaseAdapter {

    /**
     * LayoutInflater instance for inflating the requested layout in the list view
     */
    private LayoutInflater mInflater;

    /**
     * Adapter's data set
     */
    private ArrayList<VendorAddressSuggestion> mDataSet;

    /**
     * Default constructor
     */
    public AddressListAdapter(Context context, ArrayList<VendorAddressSuggestion> dataSet) {

        // get an instance of LayoutInflater to inflate list items later in getView
        mInflater = LayoutInflater.from(context);

        mDataSet = dataSet;

    }

    /**
     * Update the data set and reload the list view
     *
     * @param dataSet the new data set
     */
    public void updateDataSet(ArrayList<VendorAddressSuggestion> dataSet) {
        mDataSet = dataSet;

        notifyDataSetChanged();
    }

    public int getCount() {
        return mDataSet.size();
    }

    public Object getItem(int index) {
        return mDataSet.size() < 1 ? null : mDataSet.get(index);
    }

    public long getItemId(int index) {
        return index;
    }

    public View getView(int position, View recycledView, ViewGroup parent) {

        ViewHolder holder;

        if (recycledView == null) {
            // if the recycled view is null (usually but not always), create a new one and return it to the ListView

            // create a new list item
            recycledView = mInflater.inflate(R.layout.result_item, parent, false);

            holder = new ViewHolder();

            // get the title TextView from the layout and save it for later use
            holder.title = (TextView) recycledView.findViewById(R.id.title);

            recycledView.setTag(holder);

        } else {

            // restore the holder
            holder = (ViewHolder) recycledView.getTag();

        }

        holder.title.setText(mDataSet.get(position).toString());

        return recycledView;
    }

    /**
     * Used to keep the layout components references so we won't call
     * the findViewById method each time in the getView method, this improves ListView's scroll performance
     */
    private static class ViewHolder {
        /**
         * Title of the list item
         */
        TextView title;
    }

}