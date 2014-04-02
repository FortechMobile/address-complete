package ro.fortech.addresscompletedemo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

/**
 * Description
 *
 * @author Catalin Prata
 *         Date: 4/1/14
 */
public class VendorAddressSuggestion {

    private static final String ADDRESS_NEXT_RETRIEVE = "Retrieve";
    private static final String ADDRESS_NEXT_FIND = "Find";

    @SerializedName("Id")
    @Expose
    private String id;
    @SerializedName("Text")
    @Expose
    private String text;
    @SerializedName("Highlight")
    @Expose
    private String highlight;
    @SerializedName("Cursor")
    @Expose
    private String cursor;
    @SerializedName("Description")
    @Expose
    private String description;
    @SerializedName("Next")
    @Expose
    private String next;
    @SerializedName("Error")
    @Expose
    private String error;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getHighlight() {
        return highlight;
    }

    public void setHighlight(String highlight) {
        this.highlight = highlight;
    }

    public String getCursor() {
        return cursor;
    }

    public void setCursor(String cursor) {
        this.cursor = cursor;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNext() {
        return next;
    }

    public void setNext(String next) {
        this.next = next;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String toString() {
        return text;
    }

    public boolean isRetrievable() {
        if (next != null) {
            return next.equalsIgnoreCase(ADDRESS_NEXT_RETRIEVE);
        }
        return false;
    }

    public boolean hasNext() {
        if (next != null) {
            return next.equalsIgnoreCase(ADDRESS_NEXT_FIND);
        }
        return false;
    }

}
