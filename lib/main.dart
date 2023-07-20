import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive app',
      home: HomeResponsive(),
    );
  }
}

class HomeResponsive extends StatefulWidget {
  @override
  State<HomeResponsive> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeResponsive> {

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
        builder: (context, orientation){
          final isPortrait = orientation == Orientation.portrait;

          return Scaffold(
            appBar: AppBar(
              title: const Text('News Feed'),
            ),
            body: GridView.count(
                crossAxisCount: isPortrait ? 1:2,
                childAspectRatio: isPortrait ? (1/.4):(1/.6),
                children: List.generate(
                  6, (index) => Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: ColoredBox(color: Colors.grey,child: Center(child: Text('150 x 150',style: TextStyle(color: Colors.blueGrey)),),),
                      ),
                    ],
                  ),
                ),
                )
            ),
          );
        }

      // appBar: AppBar(
      //   title: const Text('Profile'),
      // ),
      // body: MediaQuery.of(context).orientation == Orientation.portrait
      //     ?Container(
      //   color: Colors.blue,
      //   child: const Center(child: Text("Portrait"),),
      // )
      //     :
      // Container(
      //   color: Colors.green,
      //   child: const Center(child: Text("Landscape"),),
      // )
    );
  }
}
