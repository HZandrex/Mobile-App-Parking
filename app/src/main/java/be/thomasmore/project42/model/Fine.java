package be.thomasmore.project42.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;

//http://www.jsonschema2pojo.org/
public class Fine {
    @SerializedName("id")
    @Expose
    private int id;
    @SerializedName("license_plate")
    @Expose
    private String licensePlate;
    @SerializedName("creator_id")
    @Expose
    private int creatorId;
    @SerializedName("creator_first_name")
    @Expose
    private String creatorFirstName;
    @SerializedName("creator_second_name")
    @Expose
    private String creatorSecondName;
    @SerializedName("fine_type_id")
    @Expose
    private int typeId;
    @SerializedName("type")
    @Expose
    private String type;
    @SerializedName("location")
    @Expose
    private String location;
    @SerializedName("note")
    @Expose
    private String note;
    @SerializedName("created_time")
    @Expose
    private String createdTime;
    @SerializedName("evidence_urls")
    @Expose
    private List<EvidenceUrl> evidenceUrls = null;

    public Fine(){ }

    public Fine(int id, String licensePlate, int creatorId, String creatorFirstName, String creatorSecondName, int typeId, String type, String location, String note, String createdTime, List<EvidenceUrl> evidenceUrls) {
        this.id = id;
        this.licensePlate = licensePlate;
        this.creatorId = creatorId;
        this.creatorFirstName = creatorFirstName;
        this.creatorSecondName = creatorSecondName;
        this.typeId = typeId;
        this.type = type;
        this.location = location;
        this.note = note;
        this.createdTime = createdTime;
        this.evidenceUrls = evidenceUrls;
    }

    public Fine(int id, String licensePlate, String creatorFirstName, String creatorSecondName, String type, String location, String note, String createdTime, List<EvidenceUrl> evidenceUrls) {
        this.id = id;
        this.licensePlate = licensePlate;
        this.creatorFirstName = creatorFirstName;
        this.creatorSecondName = creatorSecondName;
        this.type = type;
        this.location = location;
        this.note = note;
        this.createdTime = createdTime;
        this.evidenceUrls = evidenceUrls;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public String getCreatorFirstName() {
        return creatorFirstName;
    }

    public void setCreatorFirstName(String creatorFirstName) {
        this.creatorFirstName = creatorFirstName;
    }

    public String getCreatorSecondName() {
        return creatorSecondName;
    }

    public void setCreatorSecondName(String creatorSecondName) {
        this.creatorSecondName = creatorSecondName;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    public List<EvidenceUrl> getEvidenceUrls() {
        return evidenceUrls;
    }

    public void setEvidenceUrls(List<EvidenceUrl> evidenceUrls) {
        this.evidenceUrls = evidenceUrls;
    }
}
