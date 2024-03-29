package be.thomasmore.project42.service;

import android.content.Context;
import android.os.Environment;
import android.support.design.widget.NavigationView;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import be.thomasmore.project42.R;
import be.thomasmore.project42.model.UserSettings;

public class LocalStorage {

    public static UserSettings getUserSettingsLocal(Context context){
        UserSettings userSettings = new UserSettings();
        try {
            InputStream inputStream = context.openFileInput("userSettings.txt");

            if ( inputStream != null ) {
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
                String receiveString = "";
                StringBuilder stringBuilder = new StringBuilder();

                while ( (receiveString = bufferedReader.readLine()) != null ) {
                    stringBuilder.append(receiveString);
                }

                inputStream.close();
                String ret = stringBuilder.toString();
                userSettings = new Gson().fromJson(ret, UserSettings.class);
                Log.d("login activity", "Can read file: " + bufferedReader);
            }
        }
        catch (FileNotFoundException e) {
            Log.e("login activity", "File not found: " + e.toString());

            // Create userSettings.txt
            userSettings.setId(0);
            userSettings.setFirstName("Voornaam");
            userSettings.setSecondName("Naam");
            setLocalUserSettings(userSettings, context);
            Toast.makeText(context, "userSettings.txt created", Toast.LENGTH_SHORT).show();
        } catch (IOException e) {
            Log.e("login activity", "Can not read file: " + e.toString());
        }

        return userSettings;
    }

    public static boolean setLocalUserSettings(UserSettings userSettings, Context context){
        Gson gson = new Gson();
        try {
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(context.openFileOutput("userSettings.txt", Context.MODE_PRIVATE));
            outputStreamWriter.write(gson.toJson(userSettings));
            outputStreamWriter.close();
            getUserSettingsLocal(context);

            return true;
        }
        catch (IOException e) {
            Log.e("Exception", "File write failed: " + e.toString());
            return false;
        }
    }
}
