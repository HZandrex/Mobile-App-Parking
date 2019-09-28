package be.thomasmore.project42.fragment;

import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import be.thomasmore.project42.R;
import be.thomasmore.project42.model.Fine;
import be.thomasmore.project42.model.UserSettings;
import be.thomasmore.project42.my_interface.FineDataService;
import be.thomasmore.project42.my_interface.UserSettingsService;
import be.thomasmore.project42.service.LocalStorage;
import be.thomasmore.project42.service.RetrofitInstance;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SettingsFragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        final View view = inflater.inflate(R.layout.fragment_settings, container, false);

        // Change toolbar Title
        getActivity().setTitle(getString(R.string.nav_settings));

        // Get local userSettingsData
        final UserSettings userSettingsLocal = LocalStorage.getUserSettingsLocal(getContext());

        // Set name field
        EditText userName = (EditText) view.findViewById(R.id.username);
        userName.setText(userSettingsLocal.getFirstName() + " " + userSettingsLocal.getSecondName());

        Button btn = (Button) view.findViewById(R.id.opslagen);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                UserSettings userSettings = new UserSettings();
                EditText userName = (EditText) view.findViewById(R.id.username);

                userSettings.setId(userSettingsLocal.getId());
                userSettings.setFirstName(userName.getText().toString().split(" ")[0]);
                userSettings.setSecondName(userName.getText().toString().split(" ")[1]);

                // Get service
                UserSettingsService service = RetrofitInstance.getRetrofitInstance().create(UserSettingsService.class);

                // Request update user settings
                Call<UserSettings> call = service.updateUserSettingsData(userSettings);

                call.enqueue(new Callback<UserSettings>() {
                    @Override
                    public void onResponse(Call<UserSettings> call, Response<UserSettings> response) {
                        Toast.makeText(getContext(), "Gegevens upgedate", Toast.LENGTH_SHORT).show();
                    }

                    @Override
                    public void onFailure(Call<UserSettings> call, Throwable t) {
                        Toast.makeText(getContext(), "Check je internet verbinding", Toast.LENGTH_SHORT).show();
                    }
                });

                // save localy
                LocalStorage.setLocalUserSettings(userSettings, getContext());

                // Update Navigate Header
                NavigationView navigationView = (NavigationView) getActivity().findViewById(R.id.nav_view);
                View hView =  navigationView.getHeaderView(0);
                TextView nav_user = (TextView)hView.findViewById(R.id.nav_name);
                nav_user.setText(userSettings.getFirstName() + " " + userSettings.getSecondName());
            }
        });

        // Inflate the layout for this fragment
        return view;
    }
}
