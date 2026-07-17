import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:appli01/pages/appels.dart';
import 'package:appli01/pages/communautes.dart';
import 'package:appli01/pages/actus.dart';
import 'package:appli01/message.dart';

void main() {
  runApp(MaterialApp(home: Page()));
}

class Page extends StatefulWidget {
  const Page({super.key});
  @override
  State<Page> createState() {
    return MyHomePage();
  }
}

class MyHomePage extends State<Page> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const MessagePage(),
    const ActusPage(),
    const CommunautesPage(),
    const AppelsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text('Bienvenue dans mon application'),
        actions: [Icon(Icons.search), Icon(Icons.more_vert)],
        backgroundColor: Colors.blue,
        elevation: 12.0,
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Options du menu'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: const Text('Communautés'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: const Text('Appels'),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.message), label: 'message'),
          NavigationDestination(
            icon: Icon(Icons.filter_tilt_shift),
            label: 'actus',
          ),
          NavigationDestination(icon: Icon(Icons.group), label: 'communaute'),
          NavigationDestination(icon: Icon(Icons.phone), label: 'Appel'),
        ],
      ),
    );
  }
}

/*class Classroom {
  final String title;
  final String instructor;
  final Color color;
  final String imageUrl;

  Classroom({
    required this.title,
    required this.instructor,
    required this.color,
    required this.imageUrl,
  });
}

class ClassroomModel extends ChangeNotifier {
  final List<Classroom> _classes = [
    Classroom(
      title: 'Advanced Flutter Development',
      instructor: 'Dr. Jane Smith',
      color: Colors.blueAccent,
      imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    ),
    Classroom(
      title: 'UI/UX Design Principles',
      instructor: 'Prof. Alan Turing',
      color: Colors.teal,
      imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    ),
    Classroom(
      title: 'Computer Science Basics',
      instructor: 'Ada Lovelace',
      color: Colors.purple,
      imageUrl: 'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
    ),
  ];

  List<Classroom> get classes => _classes;
}

class GoogleClassroomClone extends StatelessWidget {
  const GoogleClassroomClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Google Classroom'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(child: Icon(Icons.person)),
          ),
        ],
      ),
      body: Consumer<ClassroomModel>(
        builder: (context, model, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: model.classes.length,
            itemBuilder: (context, index) {
              final c = model.classes[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 140,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        color: c.color,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              c.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              c.instructor,
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Active Class'),
                              Row(
                                children: [
                                  IconButton(icon: const Icon(Icons.folder_open), onPressed: () {}),
                                  IconButton(icon: const Icon(Icons.assignment_ind), onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}



class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.sentence, super.key});
  final Widget sentence;

  @override
  build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.green[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: null,
          ),
          Expanded(child: sentence),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const MyAppBar(
            sentence: Text(
              'Test Flutter',
              //    style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          Expanded(child: Center(child: Text('premier projet flutter'))),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue dans mon application'),
        backgroundColor: Colors.blue,
        elevation: 12.0,
      ),
      body: const Center(child: Text('Voici mon ecran principal!')),
      drawer: const Drawer(child: Center(child: Text('Options du menu'))),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});
  @override
  State<MyPage> createState() {
    return MyPageState();
  }

  // TODO: implement createElement
}

final List<String> images = [
  "assets/images/akira-Ais5yzfb6SE-unsplash.jpg",
  "assets/images/microsoft-copilot-Z38ADyUhN6s-unsplash.jpg",
  "assets/images/optimistic-black-woman-holding-dslr-camera-making-approval-hand-gesture-ready-client.jpg",
];

class MyPageState extends State<MyPage> {
  int counter = 0;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue dans mon application'),
        backgroundColor: Colors.blue,
        elevation: 20.0,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) =>
            Column(children: [Image.asset(images[index])]),
      ),

      drawer: const Drawer(child: Center(child: Text('Options du menu'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
            isChecked = !isChecked;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}*/
