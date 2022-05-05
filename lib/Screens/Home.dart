import 'package:dailynewspaper/Network/apiCall.dart';
import 'package:dailynewspaper/Screens/DateSelection.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var listOfAkhbar = [
    {
      'name': 'Navbharat Times',
      'image': 'assets/images/NBTLogo.png',
      'key': "NBT"
    },
    {
      'name': 'Hindustan',
      'image': 'assets/images/hindustanLogo.png',
      'key': 'hindustan'
    },
    {
      'name': 'Dainik Jagran',
      'image': 'assets/images/dainikJagranLogo.png',
      'key': 'DJ'
    },
    {
      'name': 'Amar Ujala',
      'image': 'assets/images/AmarUjalaLogo.png',
      'key': 'Amar'
    },
  ];

  var listOfNewsPaper = [
    {
      'name': 'Times of India',
      'image': 'assets/images/TheTimesofIndiaLogo.png',
      'key': 'Times'
    },
    {
      'name': 'Hindustan Times',
      'image': 'assets/images/HindustanTimesLogo.png',
      'key': 'HT'
    },
    {
      'name': 'The Telegraph',
      'image': 'assets/images/TheTelegraphLogo.png',
      'key': 'Telegraph'
    },
    {
      'name': 'Economic Times',
      'image': 'assets/images/EconomicTimesLogo.png',
      'key': 'ET'
    },
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _selectedIndex == 0 ? "अख़बार" : 'News Paper',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.orange[800],
            onTap: _onItemTapped,
            elevation: 5,
            items: const [
              BottomNavigationBarItem(
                  icon: Text(
                    'हिन्दी',
                    style: TextStyle(fontSize: 18),
                  ),
                  label: "अख़बार"),
              BottomNavigationBarItem(
                  icon: Text(
                    'Eng',
                    style: TextStyle(fontSize: 18),
                  ),
                  label: 'News Paper')
            ]),
        body: ListView.builder(
            itemCount: _selectedIndex == 0
                ? listOfAkhbar.length
                : listOfNewsPaper.length,
            itemBuilder: (context, index) {
              var newsPaper = _selectedIndex == 0
                  ? listOfAkhbar[index]
                  : listOfNewsPaper[index];
              return Container(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DateScreen(paperKey: newsPaper['key']!)));
                  },
                  child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                color: Colors.white,
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(newsPaper['image']!)),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "${newsPaper['name']}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              );
            }));
  }
}


// Container(
//         padding: const EdgeInsets.all(8),
//         child: Card(
//             elevation: 5,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                       color: Colors.white,
//                       child: Image.asset('assets/images/NBTLogo.png')),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       "Navbharat Times News Paper",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ),