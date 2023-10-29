import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Scaffold',
      home: Halaman(),
    );
  }
}

class Halaman extends StatelessWidget {
  const Halaman({super.key});

  @override
  Widget build(BuildContext context) {
    const int tabCount = 3;
    return DefaultTabController(
      length: tabCount,
      child: Scaffold(
        appBar: AppBar(
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.cloud_done_outlined),
              text: 'Hujan',
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
              text: 'Awan',
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
              text: 'Cerah',
            )
          ]),
          title: const Text('Belajar Scaffold'),
          actions: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ini adalah action AppBar')));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.red,
              ),
              tooltip: 'Pencarian',
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
              icon: const Icon(Icons.add_alert),
              tooltip: 'SnackBar',
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Hello'),
                      ),
                      body: const Center(
                        child: Text('Ini adalah halaman baru'),
                      ),
                    );
                  }));
                },
                icon: const Icon(Icons.navigate_next))
          ],
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.pink,
              )),
        ),
        body: const Center(
          child: Text(
            'Hello Flutter',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ini adalah Floating action')));
          },
          tooltip: 'ojol',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50,
          ),
        ),
      ),
    );
  }
}
