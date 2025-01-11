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
  // Daftar buku
  final List<Map<String, String>> books = [
    {'title': 'Flutter for Beginners', 'author': 'John Doe'},
    {'title': 'Dart Programming', 'author': 'Jane Smith'},
    {'title': 'Advanced Flutter', 'author': 'Alice Johnson'},
    {'title': 'Mobile App Development', 'author': 'Bob Brown'},
    {'title': 'UI/UX Design for Developers', 'author': 'Charlie Davis'},
  ];

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
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(book['title']!),
              subtitle: Text('Penulis: ${book['author']}'),
              leading: Icon(Icons.book),
              onTap: () {
                // Aksi ketika buku diklik
              },
            ),
          );
        },
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
