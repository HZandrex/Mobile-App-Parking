package be.thomasmore.project42.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

//http://www.jsonschema2pojo.org/
public class EvidenceUrl {@SerializedName("id")
@Expose
private int id;
    @SerializedName("url")
    @Expose
    private String url;

    public EvidenceUrl(int id, String url) {
        this.id = id;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
