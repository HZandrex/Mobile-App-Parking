package be.thomasmore.project42.fragment;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import be.thomasmore.project42.R;
import be.thomasmore.project42.adapter.FineAdapter;
import be.thomasmore.project42.model.EvidenceUrl;
import be.thomasmore.project42.model.Fine;

public class HistoryFragment extends Fragment {

    List<Fine> fines = new ArrayList<Fine>();
    List<EvidenceUrl> evidences = new ArrayList<EvidenceUrl>();
    Date date = new Date();

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        // Change toolbar Title
        getActivity().setTitle(getString(R.string.nav_history));

        fillFines();

        View rootView = inflater.inflate(R.layout.fragment_history, container, false);

        FineAdapter fineAdapter =
                new FineAdapter(getActivity().getApplicationContext(), fines);

        ListView listViewFines = (ListView)rootView.findViewById(R.id.listViewHistory);
        listViewFines.setAdapter(fineAdapter);

        return rootView;
    }


    public void fillFines()
    {
        fines.add(new Fine(1,"1-ABC-123", "papier", "Kristof",
                "Nuyts", "carpoolparking", "Eerste waarschuwing", date.toString(), evidences));
        fines.add(new Fine(2,"1-XYZ-789", "papier", "Kristof",
                "Nuyts", "carpoolparking", "Eerste waarschuwing", date.toString(), evidences));
    }

    public void useFineAdapter()
    {


//        listViewFines.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//            @Override
//            public void onItemClick(AdapterView parentView, View childView, int position, long id) {
//                onClick(landen.get(position).getId());
//            }
//        });
    }


}
