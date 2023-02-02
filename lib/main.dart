import 'package:aritmia_mobile/pages/classification_page.dart';
import 'package:aritmia_mobile/pages/list_record_page.dart';
import 'package:aritmia_mobile/pages/login_page.dart';
import 'package:aritmia_mobile/pages/monitoring_page.dart';
import 'package:aritmia_mobile/pages/patient_page.dart';
import 'package:aritmia_mobile/pages/profile_page.dart';
import 'package:aritmia_mobile/pages/wrapper_page.dart';
import 'package:aritmia_mobile/provider/arrythmia_classify_provider.dart';
import 'package:aritmia_mobile/provider/patient_provider.dart';
import 'package:aritmia_mobile/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ArrythmiaClassifyProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PatientProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WrapperPage(),
        onGenerateRoute: (RouteSettings settings) {
          //routing to every pages. Add route to pages by defining in case condition
          switch (settings.name) {
            case ListRecordPage.routeName:
              final patient = settings.arguments as Map;
              return MaterialPageRoute(
                builder: (_) => ListRecordPage(
                  idPasien: patient['idPasien'],
                  namaPasien: patient['namaPasien'],
                ),
              );
            case MyHomePage.routeName:
              return MaterialPageRoute(
                builder: (_) => const MyHomePage(title: "Amonify"),
              );
            case LoginPage.routeName:
              return MaterialPageRoute(
                builder: (_) => const LoginPage(),
              );
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/main_page';
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ClassificationPage(),
    PatientPage(),
    ProfilePage(),
  ];

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.device_hub_sharp,
            ),
            label: 'Classify',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: 'Patient',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.stacked_line_chart_sharp),
          //   label: 'Monitor',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.black54,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        onTap: _onItemTapped,
        showSelectedLabels: true,
        backgroundColor: const Color(0xFFFF5252),
      ),
    );
  }
}
