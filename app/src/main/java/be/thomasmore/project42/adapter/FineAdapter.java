package be.thomasmore.project42.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

import be.thomasmore.project42.R;
import be.thomasmore.project42.model.Fine;

public class FineAdapter extends ArrayAdapter<Fine>{

    private final Context context;
    private final List<Fine> values;

    public FineAdapter(Context context, List<Fine> values) {
        super(context, R.layout.fine_listview, values);
        this.context = context;
        this.values = values;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View rowView = inflater.inflate(R.layout.fine_listview, parent, false);

        // hier vervolledigen

        final TextView textViewNumberplate = (TextView) rowView.findViewById(R.id.numberplate);
        final TextView textViewDate = (TextView) rowView.findViewById(R.id.date);

        textViewNumberplate.setText(values.get(position).getLicensePlate());
        textViewDate.setText(values.get(position).getCreatedTime());

        return rowView;
    }



}
