package be.thomasmore.project42.my_interface;

import java.util.List;

import be.thomasmore.project42.model.Fine;
import be.thomasmore.project42.model.UserSettings;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Query;

public interface UserSettingsService {   // Get fine by id
    @GET("user_settings/read_one.php")
    Call<UserSettings> getUserSettingsData(@Query("id") int Id);

    // Get user settings (niet getest)
    @GET("user_settings/read.php")
    Call<List<UserSettings>> getAllUserSettingsData();

    // Create user settings (niet getest)
    @POST("user_settings/create.php")
    Call<UserSettings> createUserSettingsData(@Body UserSettings userSettings);

    // Update user settings (niet getest)
    @POST("user_settings/update.php")
    Call<UserSettings> updateUserSettingsData(@Body UserSettings userSettings);

    // Delete user settings (niet getest)
    @POST("user_settings/delete.php")
    Call<UserSettings> deleteUserSettingsData(@Body UserSettings userSettings);
}
