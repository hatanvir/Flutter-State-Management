import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/home/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    var selectedTab = ref.watch(selectedNavigationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: navScreenList[selectedTab],

      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedTab,

        onTap: (index){
          ref.read(selectedNavigationProvider.notifier).state=index;
        },
        items: [
          _bottomNavItem(
              title: "Posts",
              icon: CupertinoIcons.arrow_up_doc_fill
          ),

          _bottomNavItem(
              title: "Photos",
              icon: CupertinoIcons.photo
          ),
        ],
      )
    );
  }

  _bottomNavItem({required String title, required IconData icon}) {
    return BottomNavigationBarItem(
        icon: Icon(icon),
        tooltip: title,
        label: title
    );
  }
}
