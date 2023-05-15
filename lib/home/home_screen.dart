import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod_flutter/di/service_locator.dart';
import 'package:riverpod_flutter/home/home_bloc.dart';
import 'package:riverpod_flutter/home/home_event.dart';
import 'package:riverpod_flutter/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeBloc homeBloc = serviceLocator.get<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => homeBloc,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (ctx,state){
              return state.navScreenList[state.pos];
            },
          ),

          bottomNavigationBar: BlocBuilder<HomeBloc,HomeState>(
            builder: (ctx,state){
              return BottomNavigationBar(
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                currentIndex: state.pos,
                onTap: (index){
                  ctx.read<HomeBloc>().add(NavigationPositionChangeEvent(index));
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
              );
            },
          )
      ),
    );
  }

  _bottomNavItem({required String title, required IconData icon}) {
    return BottomNavigationBarItem(
        icon: Icon(icon),
        tooltip: title,
        label: title,
    );
  }
}
