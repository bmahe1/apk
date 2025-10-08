package com.example.calculator;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.*;

public class MainActivity extends AppCompatActivity {

    EditText num1, num2;
    TextView result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        num1 = findViewById(R.id.num1);
        num2 = findViewById(R.id.num2);
        result = findViewById(R.id.result);

        findViewById(R.id.addBtn).setOnClickListener(v -> calculate('+'));
        findViewById(R.id.subBtn).setOnClickListener(v -> calculate('-'));
        findViewById(R.id.mulBtn).setOnClickListener(v -> calculate('*'));
        findViewById(R.id.divBtn).setOnClickListener(v -> calculate('/'));
    }

    private void calculate(char op) {
        try {
            double n1 = Double.parseDouble(num1.getText().toString());
            double n2 = Double.parseDouble(num2.getText().toString());
            double res = 0;

            switch (op) {
                case '+': res = n1 + n2; break;
                case '-': res = n1 - n2; break;
                case '*': res = n1 * n2; break;
                case '/': res = n2 != 0 ? n1 / n2 : 0; break;
            }

            result.setText("Result: " + res);
        } catch (Exception e) {
            result.setText("Error");
        }
    }
}
