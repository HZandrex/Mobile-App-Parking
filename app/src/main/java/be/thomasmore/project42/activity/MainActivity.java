package be.thomasmore.project42.activity;

import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import be.thomasmore.project42.R;
import be.thomasmore.project42.fragment.AddFragment;
import be.thomasmore.project42.fragment.HistoryFragment;
import be.thomasmore.project42.fragment.SearchFragment;
import be.thomasmore.project42.fragment.SettingsFragment;
import be.thomasmore.project42.model.Fine;
import be.thomasmore.project42.model.UserSettings;
import be.thomasmore.project42.my_interface.FineDataService;
import be.thomasmore.project42.my_interface.UserSettingsService;
import be.thomasmore.project42.service.LocalStorage;
import be.thomasmore.project42.service.RetrofitInstance;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);

        getSupportFragmentManager().beginTransaction().replace(R.id.content_frame, new AddFragment()).commit();
        navigationView.setNavigationItemSelectedListener(this);

        // Get local userSettingsData
        UserSettings userSettingsLocal = LocalStorage.getUserSettingsLocal(getApplicationContext());

        // Get service
        UserSettingsService service = RetrofitInstance.getRetrofitInstance().create(UserSettingsService.class);

        if(userSettingsLocal.getId() == 0){
            // Request create userSettings
            Call<UserSettings> call = service.createUserSettingsData(userSettingsLocal);

            call.enqueue(new Callback<UserSettings>() {
                @Override
                public void onResponse(Call<UserSettings> call, Response<UserSettings> response) {
                    UserSettings userSettings = response.body();
                    Toast.makeText(getApplicationContext(), "Nieuw account aangemaakt", Toast.LENGTH_SHORT).show();
                    LocalStorage.setLocalUserSettings(userSettings, getApplicationContext());
                }

                @Override
                public void onFailure(Call<UserSettings> call, Throwable t) {
                    Toast.makeText(getApplicationContext(), "Check je internet verbinding", Toast.LENGTH_SHORT).show();
                }
            });
        }else{
            // Request create userSettings
            Call<UserSettings> call = service.getUserSettingsData(userSettingsLocal.getId());

            call.enqueue(new Callback<UserSettings>() {
                @Override
                public void onResponse(Call<UserSettings> call, Response<UserSettings> response) {
                    UserSettings userSettings = response.body();
                    LocalStorage.setLocalUserSettings(userSettings, getApplicationContext());
                }

                @Override
                public void onFailure(Call<UserSettings> call, Throwable t) {
                    Toast.makeText(getApplicationContext(), "Check je internet verbinding", Toast.LENGTH_SHORT).show();
                }
            });
        }

        // Update navigation header
        View hView =  navigationView.getHeaderView(0);
        TextView nav_user = (TextView)hView.findViewById(R.id.nav_name);
        nav_user.setText(userSettingsLocal.getFirstName() + " " + userSettingsLocal.getSecondName());
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Create a new fragment and specify the fragment to show based on nav item clicked
        Fragment fragment = null;
        Class fragmentClass;
        switch (item.getItemId()){
            case R.id.nav_add:
                    fragmentClass = AddFragment.class;
                break;
            case R.id.nav_search:
                fragmentClass = SearchFragment.class;
                break;
            case R.id.nav_settings:
                fragmentClass = SettingsFragment.class;
                break;
            default:
                fragmentClass = AddFragment.class;

        }

        // Insert the fragment by replacing any existing fragment
        try {
            fragment = (Fragment) fragmentClass.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Insert the fragment by replacing any existing fragment
        FragmentManager fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction().replace(R.id.content_frame, fragment).commit();

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public boolean sort(View view)
    {
        Fragment fragment = null;
        Class fragmentClass = SearchFragment.class;

        try {
            fragment = (Fragment) fragmentClass.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
