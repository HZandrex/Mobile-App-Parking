package be.thomasmore.project42.my_interface;

import java.util.List;

import be.thomasmore.project42.model.Fine;
import be.thomasmore.project42.model.UserSettings;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Query;

public interface FineDataService {

    // Get fine by id
    @GET("fine/read_one.php")
    Call<Fine> getFineData(@Query("id") int fineId);

    // Get fines
    @GET("fine/read.php")
    Call<List<Fine>> getAllFineData();

    // Get fines by date DESC
    @GET("fine/readByDateDesc.php")
    Call<List<Fine>> getAllFineDataByDateDESC();

    // Create fine
    @POST("fine/create.php")
    Call<Fine> createFineData(@Body Fine fine);

    // Update fine (niet getest)
    @POST("fine/update.php")
    Call<Fine> updateFineData(@Body Fine fine);

    // Delete fine (niet getest)
    @POST("fine/delete.php")
    Call<Fine> deleteFineData(@Body Fine fine);
}

