import 'package:flutter/material.dart';

class KonversiUang extends StatefulWidget {
  const KonversiUang({super.key});

  @override
  State<KonversiUang> createState() => _KonversiUangState();
}

class _KonversiUangState extends State<KonversiUang> {
  double amount = 0.0;
  String selectedCurrency = 'IDR';

  Map<String, double> exchangeRates = {
    'IDR': 1,
    'USD': 15447.30,
    'EUR': 16934.65,
    'GBP': 19362.01,
    'JPY': 0.0095,
    // Tambahkan mata uang lain sesuai kebutuhan
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Konversi Uang',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Masukkan Nominal',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'From: IDR',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "To: ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 16.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    clipBehavior: Clip.antiAlias,
                    child: DropdownButton<String>(
                      value: selectedCurrency,
                      items: exchangeRates.keys.map((String currency) {
                        return DropdownMenuItem<String>(
                            value: currency,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Text(currency),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCurrency = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              double result = amount / exchangeRates[selectedCurrency]!;
              String formattedResult = result.toStringAsFixed(2);
              String formattedAmount = amount.toStringAsFixed(0);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Hasil Konversi'),
                    content: Text(
                        'Rp$formattedAmount adalah $formattedResult $selectedCurrency'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child:
                const Text('Konversi', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
