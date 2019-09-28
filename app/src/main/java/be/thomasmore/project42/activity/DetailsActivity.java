package be.thomasmore.project42.activity;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

import be.thomasmore.project42.R;
import be.thomasmore.project42.fragment.SearchFragment;
import be.thomasmore.project42.model.Fine;
import be.thomasmore.project42.model.UserSettings;
import be.thomasmore.project42.my_interface.FineDataService;
import be.thomasmore.project42.service.LocalStorage;
import be.thomasmore.project42.service.RetrofitInstance;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class DetailsActivity extends AppCompatActivity {
    int fineId;
    Fine fine = new Fine();
    // Get service
    FineDataService service = RetrofitInstance.getRetrofitInstance().create(FineDataService.class);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details);

        // Init Toolbar
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(),MainActivity.class));
            }
        });

        // Change toolbar Title
        setTitle(getString(R.string.act_details));

        // Get bundle
        Bundle bundle = getIntent().getExtras();
        fineId = bundle.getInt("fineId");

        //init components
        final TextView licensePlateViewText, typeViewText, firstNameViewText, secondNameViewText, timeViewText, dateViewText, noteViewText, locationViewText;

        licensePlateViewText = (TextView) findViewById(R.id.licensePlateLabelDetails);
        typeViewText = (TextView) findViewById(R.id.typeLabelDetails);
        firstNameViewText = (TextView) findViewById(R.id.firstNameLabelDetails);
        secondNameViewText = (TextView) findViewById(R.id.secondLabelDetails);
        timeViewText = (TextView) findViewById(R.id.timeLabelDetails);
        dateViewText = (TextView) findViewById(R.id.dateLabelDetails);
        locationViewText = (TextView) findViewById(R.id.locationLabelDetails);
        noteViewText = (TextView) findViewById(R.id.noteLabelDetails);

        // Get service
        FineDataService service = RetrofitInstance.getRetrofitInstance().create(FineDataService.class);
        // Request fine
        Call<Fine> call = service.getFineData(fineId);
        call.enqueue(
                new Callback<Fine>() {
            @Override
            public void onResponse(Call<Fine> call, Response<Fine> response) {
                Fine fine = response.body();

                // Convert date
                String dateWrongOrder = fine.getCreatedTime().split(" ")[0];
                String date = dateWrongOrder.split("-")[2] + "-" + dateWrongOrder.split("-")[1] + "-" + dateWrongOrder.split("-")[0];

                licensePlateViewText.setText(fine.getLicensePlate());
                typeViewText.setText(fine.getType());
                dateViewText.setText(date);
                timeViewText.setText(fine.getCreatedTime().split(" ")[1]);
                firstNameViewText.setText(fine.getCreatorFirstName());
                secondNameViewText.setText(fine.getCreatorSecondName());
                locationViewText.setText(fine.getLocation());
                noteViewText.setText(fine.getNote());
                Log.d("licenses",fine.getLicensePlate() );
            }

            @Override
            public void onFailure(Call<Fine> call, Throwable t) {
                Toast.makeText(getApplicationContext(), "error :(" + t + ")", Toast.LENGTH_SHORT).show();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_details, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()) {
            case R.id.action_editFine:
                Intent intent = new Intent(this, EditDetailsActivity.class);
                Bundle bundle = new Bundle();
                bundle.putInt("fineId", fineId);
                intent.putExtras(bundle);
                startActivity(intent);
                return true;
            case R.id.action_deleteFine:
                // Request delete fine
                Bundle bundle2 = getIntent().getExtras();
                fineId = bundle2.getInt("fineId");
                fine.setId(fineId);
                Call<Fine> call = service.deleteFineData(fine);

                call.enqueue(new Callback<Fine>() {
                    @Override
                    public void onResponse(Call<Fine> call, Response<Fine> response) {
                        Toast.makeText(getApplicationContext(), "Boete verwijderd", Toast.LENGTH_SHORT).show();
                    }

                    @Override
                    public void onFailure(Call<Fine> call, Throwable t) {
                        Toast.makeText(getApplicationContext(), "Check je internet verbinding", Toast.LENGTH_SHORT).show();
                    }
                });

                // Go back to main menu
                Intent intent2 = new Intent(this, MainActivity.class);
                startActivity(intent2);
                return true;
            default:
                break;
        }

        return false;
    }

}
