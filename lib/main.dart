import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Demo Flutter',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => SecondPage(data: args),
          );
        }
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _showToast() {
    Fluttertoast.showToast(
      msg: "Ini adalah pesan Toast!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Dialog Peringatan'),
        content: Text('Apakah Anda yakin ingin melanjutkan?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tidak'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ini adalah pesan Snackbar')),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beranda')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Halaman Kedua'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: 'Halo dari HomePage!',
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showToast,
              child: Text('Tampilkan Toast'),
            ),
            ElevatedButton(
              onPressed: _showAlertDialog,
              child: Text('Tampilkan Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: _showSnackbar,
              child: Text('Tampilkan Snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: 'Data dari tombol di HomePage!',
                );
              },
              child: Text('Ke Halaman Kedua dengan Data'),
            ),
            ElevatedButton(
              onPressed: _pickDate,
              child: Text('Pilih Tanggal'),
            ),
            ElevatedButton(
              onPressed: _pickTime,
              child: Text('Pilih Waktu'),
            ),
            selectedDate != null
                ? Text('Tanggal Terpilih: ${selectedDate.toString()}')
                : Container(),
            selectedTime != null
                ? Text('Waktu Terpilih: ${selectedTime!.format(context)}')
                : Container(),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                    onTap: () {},
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(child: Text('Grid Item $index')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          // Navigasi berdasarkan index
        },
      ),
    );
  }
}
