package be.thomasmore.project42.activity;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

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

public class EditDetailsActivity extends AppCompatActivity {
    int fineId;
    public Fine fine = new Fine();
    // Get service
    FineDataService service = RetrofitInstance.getRetrofitInstance().create(FineDataService.class);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_details);
        //terugknop

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
        setSupportActionBar(toolbar);

        // Change toolbar Title
        setTitle(getString(R.string.act_edit));

        // Get bundle
        Bundle bundle = getIntent().getExtras();
        fineId = bundle.getInt("fineId");

        //init components
        final TextView firstNameViewText, secondNameViewText;
        final EditText licensePlateInput, locationInput, timeInput, dateInput, noteInput;
        final Spinner fineTypeSpinner;

        firstNameViewText = (TextView) findViewById(R.id.firstNameLabelDetails);
        secondNameViewText = (TextView) findViewById(R.id.secondLabelDetails);
        licensePlateInput = (EditText) findViewById(R.id.licensePlateInput);
        dateInput = (EditText) findViewById(R.id.dateInput);
        timeInput = (EditText) findViewById(R.id.timeInput);
        locationInput = (EditText) findViewById(R.id.locationInput);
        noteInput = (EditText) findViewById(R.id.noteInput);
        fineTypeSpinner = (Spinner) findViewById(R.id.fineTypeSpinner);


        // Request fine
        Call<Fine> call = service.getFineData(fineId);

        call.enqueue(
                new Callback<Fine>() {
            @Override
            public void onResponse(Call<Fine> call, Response<Fine> response) {
                 fine = response.body();

                // Convert date
                String dateWrongOrder = fine.getCreatedTime().split(" ")[0];
                String date = dateWrongOrder.split("-")[2] + "-" + dateWrongOrder.split("-")[1] + "-" + dateWrongOrder.split("-")[0];

                licensePlateInput.setText(fine.getLicensePlate());
                fineTypeSpinner.setSelection(fine.getTypeId() - 1);
                dateInput.setText(date);
                timeInput.setText(fine.getCreatedTime().split(" ")[1]);
                firstNameViewText.setText(fine.getCreatorFirstName());
                secondNameViewText.setText(fine.getCreatorSecondName());
                locationInput.setText(fine.getLocation());
                noteInput.setText(fine.getNote());

                Log.d("licenses",fine.getLicensePlate() );
            }

            @Override
            public void onFailure(Call<Fine> call, Throwable t) {
                Toast.makeText(getApplicationContext(), "error :(" + t + ")", Toast.LENGTH_SHORT).show();
            }
        });

        final Calendar myCalendar = Calendar.getInstance();
        /*---------------
            TimePicker
        ---------------*/
        final SimpleDateFormat stf = new SimpleDateFormat("HH:mm", Locale.getDefault());
        final TimePickerDialog.OnTimeSetListener time;
        final EditText editTime = (EditText) findViewById(R.id.timeInput);

        // init - set date to current date
        long currenttime = System.currentTimeMillis();
        String timeString = stf.format(currenttime);

        // set clock time and update editTime
        time = new TimePickerDialog.OnTimeSetListener() {
            @Override
            public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
                // TODO Auto-generated method stub
                myCalendar.set(Calendar.HOUR, hourOfDay);
                myCalendar.set(Calendar.MINUTE, minute);
                editTime.setText(stf.format(myCalendar.getTime()));
            }
        };

        // onclick - popup datepicker
        editTime.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View v){
                // TODO Auto-generated method stub
                new TimePickerDialog(v.getContext(), AlertDialog.THEME_DEVICE_DEFAULT_DARK, time,
                        myCalendar.get(Calendar.HOUR_OF_DAY),
                        myCalendar.get(Calendar.MINUTE), true).show();
            }
        });

        /*---------------
            DatePicker
        ---------------*/
        final SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy", Locale.getDefault());
        final DatePickerDialog.OnDateSetListener date;
        final EditText editDate = (EditText) findViewById(R.id.dateInput);

        // init - set date to current date
        long currentdate = System.currentTimeMillis();
        String dateString = sdf.format(currentdate);

        // set calendar date and update editDate
        date = new DatePickerDialog.OnDateSetListener() {

            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear,
                                  int dayOfMonth) {
                // TODO Auto-generated method stub
                myCalendar.set(Calendar.YEAR, year);
                myCalendar.set(Calendar.MONTH, monthOfYear);
                myCalendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                editDate.setText(sdf.format(myCalendar.getTime()));
            }

        };


        // onclick - popup datepicker
        editDate.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                new DatePickerDialog(v.getContext(),  AlertDialog.THEME_DEVICE_DEFAULT_DARK, date, myCalendar
                        .get(Calendar.YEAR), myCalendar.get(Calendar.MONTH),
                        myCalendar.get(Calendar.DAY_OF_MONTH)).show();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_edit_details, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()) {
            case R.id.action_updateFine:
                // Get userSettingsData
                UserSettings userSettingsLocal = LocalStorage.getUserSettingsLocal(getApplicationContext());

                Bundle bundle2 = getIntent().getExtras();
                fineId = bundle2.getInt("fineId");

                final TextView firstNameViewText, secondNameViewText;
                final EditText licensePlateInput, locationInput, timeInput, dateInput, noteInput;
                final Spinner fineTypeSpinner;

                licensePlateInput = (EditText) findViewById(R.id.licensePlateInput);
                dateInput = (EditText) findViewById(R.id.dateInput);
                timeInput = (EditText) findViewById(R.id.timeInput);
                locationInput = (EditText) findViewById(R.id.locationInput);
                noteInput = (EditText) findViewById(R.id.noteInput);
                fineTypeSpinner = (Spinner) findViewById(R.id.fineTypeSpinner);

                Fine fine = new Fine();
                fine.setId(fineId);
                fine.setLicensePlate(licensePlateInput.getText().toString());
                fine.setCreatorId(userSettingsLocal.getId());
                fine.setTypeId((int)fineTypeSpinner.getSelectedItemId() + 1);
                fine.setLocation(locationInput.getText().toString());
                fine.setNote(noteInput.getText().toString());

                // Request update fine
                Call<Fine> call = service.updateFineData(fine);

                call.enqueue(new Callback<Fine>() {
                    @Override
                    public void onResponse(Call<Fine> call, Response<Fine> response) {
                        Toast.makeText(getApplicationContext(), "Boete upgedate", Toast.LENGTH_SHORT).show();
                    }

                    @Override
                    public void onFailure(Call<Fine> call, Throwable t) {
                        Toast.makeText(getApplicationContext(), "Check je internet verbinding", Toast.LENGTH_SHORT).show();
                    }
                });

                // Go back to details activity
                Intent intent = new Intent(this, DetailsActivity.class);
                Bundle bundle = new Bundle();
                bundle.putInt("fineId", fineId);
                intent.putExtras(bundle);
                startActivity(intent);
                return true;
            default:
                break;
        }

        return false;
    }

}
