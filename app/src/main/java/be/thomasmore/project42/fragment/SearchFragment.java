package be.thomasmore.project42.fragment;

import android.app.Notification;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import be.thomasmore.project42.R;
import be.thomasmore.project42.activity.DetailsActivity;
import be.thomasmore.project42.adapter.FineAdapter;
import be.thomasmore.project42.model.Fine;
import be.thomasmore.project42.my_interface.FineDataService;
import be.thomasmore.project42.service.RetrofitInstance;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SearchFragment extends Fragment {

    // Get service
    FineDataService service = RetrofitInstance.getRetrofitInstance().create(FineDataService.class);
    // Request fine
    Call<List<Fine>> call = service.getAllFineData();

    List<Fine> fines;

    FineAdapter fineAdapter;

    ListView listViewFines;

    ArrayList<Fine> listFines;

    private View view;

    int length;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_search, container, false);

        // Change toolbar Title
        getActivity().setTitle(getString(R.string.nav_search));

        initList();

        final EditText editText = (EditText) view.findViewById(R.id.txtsearch);

        doSearch();

        return view;
    }

    public void initList() {
        call.enqueue(new Callback<List<Fine>>() {
            @Override
            public void onResponse(Call<List<Fine>> call, Response<List<Fine>> response) {

                if (!response.isSuccessful()) {
                    Toast.makeText(getContext(), "Code: " + response.code(), Toast.LENGTH_SHORT).show();
                    return;
                }

                fines = response.body();

                listFines = new ArrayList<Fine>();
                listFines.addAll(fines);

                fineAdapter = new FineAdapter(getActivity().getApplicationContext(), listFines);

                listViewFines = (ListView) getView().findViewById(R.id.listViewFines);

                listViewFines.setAdapter(fineAdapter);

                listViewFines.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView parentView, View childView, int position, long id) {
                        Bundle bundle = new Bundle();

                        bundle.putInt("fineId", fines.get(position).getId());

                        Intent intent = new Intent(childView.getContext(), DetailsActivity.class);
                        intent.putExtras(bundle);

                        startActivity(intent);
                    }
                });

            }

            @Override
            public void onFailure(Call<List<Fine>> call, Throwable t) {
                Toast.makeText(getContext(), "error :(" + t + ")", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void doSearch() {
        final EditText et = (EditText) view.findViewById(R.id.txtsearch);
        et.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                length=s.toString().length();
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                String text = et.getText().toString().toLowerCase(Locale.getDefault());
                searchItem(text);
            }

            @Override
            public void afterTextChanged(Editable s) {

            }
        });

    }

    public void searchItem(String text) {
        ArrayList<Fine> itemsToRemove = new ArrayList<>();

        for (Fine fine : fines) {
            if (!fine.getLicensePlate().toLowerCase().contains(text.toLowerCase())) {
                listFines.remove(fine);
            }

        }

        fineAdapter.notifyDataSetChanged();

    }

}


