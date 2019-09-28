package be.thomasmore.project42.fragment;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import be.thomasmore.project42.R;
import be.thomasmore.project42.model.Fine;
import be.thomasmore.project42.model.UserSettings;
import be.thomasmore.project42.my_interface.FineDataService;
import be.thomasmore.project42.service.LocalStorage;
import be.thomasmore.project42.service.RetrofitInstance;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class AddFragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        View view = inflater.inflate(R.layout.fragment_add, container, false);

        // Change toolbar Title
        getActivity().setTitle(getString(R.string.nav_add));

        final Calendar myCalendar = Calendar.getInstance();
        /*---------------
            TimePicker
        ---------------*/
        final SimpleDateFormat stf = new SimpleDateFormat("HH:mm", Locale.getDefault());
        final TimePickerDialog.OnTimeSetListener time;
        final EditText editTime = (EditText) view.findViewById(R.id.timeInput);

        // init - set date to current date
        long currenttime = System.currentTimeMillis();
        String timeString = stf.format(currenttime);
        editTime.setText(timeString);

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
        final EditText editDate = (EditText) view.findViewById(R.id.dateInput);

        // init - set date to current date
        long currentdate = System.currentTimeMillis();
        String dateString = sdf.format(currentdate);
        editDate.setText(dateString);

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

        // Inflate the layout for this fragment
        return view;

    }

    @Override
    public void onCreateOptionsMenu(Menu menu,MenuInflater inflater) {
        // Do something that differs the Activity's menu here
        super.onCreateOptionsMenu(menu, inflater);
        getActivity().getMenuInflater().inflate(R.menu.menu_add, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.action_addFine:

                // Get userSettingsData
                UserSettings userSettingsLocal = LocalStorage.getUserSettingsLocal(getContext());

                final EditText licensePlateInput = (EditText) getView().findViewById(R.id.licensePlateInput);
                EditText dateInput = (EditText) getView().findViewById(R.id.dateInput);
                EditText timeInput = (EditText) getView().findViewById(R.id.timeInput);
                EditText noteInput = (EditText) getView().findViewById(R.id.noteInput);
                Spinner typeSpinner = (Spinner) getView().findViewById(R.id.fineTypeSpinner);

                Fine fine = new Fine();
                fine.setLicensePlate(licensePlateInput.getText().toString());
                fine.setTypeId((int)typeSpinner.getSelectedItemId() + 1);
                fine.setCreatorId(userSettingsLocal.getId());
                fine.setCreatedTime(dateInput.getText()+ " " + timeInput.getText());
                fine.setLocation("");
                fine.setNote(noteInput.getText().toString());

                // Get service
                FineDataService service = RetrofitInstance.getRetrofitInstance().create(FineDataService.class);
                // Request fine
                Call<Fine> call = service.createFineData(fine);

                call.enqueue(new Callback<Fine>() {
                    @Override
                    public void onResponse(Call<Fine> call, Response<Fine> response) {
                        Fine fine = response.body();
                        Toast.makeText(getContext(), "Boete aangemaakt", Toast.LENGTH_SHORT).show();
                    }

                    @Override
                    public void onFailure(Call<Fine> call, Throwable t) {
                        Toast.makeText(getContext(), "Check je internet verbinding", Toast.LENGTH_SHORT).show();
                    }
                });

                licensePlateInput.setText("");
                noteInput.setText("");
                typeSpinner.setSelection(0);

                return true;
            default:
                break;
        }

        return false;
    }
}
