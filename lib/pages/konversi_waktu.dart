import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({Key? key}) : super(key: key);

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  DateTime _selectedTime = DateTime.now().toUtc(); // Menggunakan waktu UTC sebagai acuan

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Konversi Waktu",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Text(
            'Waktu Terpilih: ${DateFormat('HH:mm:ss').format(_selectedTime.toLocal())} WIB',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              _showTimePicker();
            },
            child: const Text(
              'Pilih Waktu',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          _buildConvertedTimes(),
        ],
      ),
    );
  }

  Widget _buildConvertedTimes() {
    return Column(
      children: [
        _buildConvertedTime('WITA', _selectedTime, const Duration(hours: 8)),
        _buildConvertedTime('WIT', _selectedTime, const Duration(hours: 7)),
        _buildConvertedTime('London', _selectedTime, const Duration(hours: 0)),
      ],
    );
  }

  Widget _buildConvertedTime(
      String label, DateTime originalTime, Duration offset) {
    DateTime convertedTime = originalTime.add(offset);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$label: ${DateFormat('HH:mm:ss').format(convertedTime.toLocal())}',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime.toLocal()),
      initialEntryMode: TimePickerEntryMode.inputOnly,
      cancelText: 'Cancel',
    );

    if (picked != null) {
      setState(() {
        _selectedTime = DateTime(
          _selectedTime.year,
          _selectedTime.month,
          _selectedTime.day,
          picked.hour,
          picked.minute,
        ).toUtc();
      });
    }
  }
}
