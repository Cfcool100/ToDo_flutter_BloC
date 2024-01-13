import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_flutter_bloc/gen/assets.gen.dart';
import 'package:to_do_flutter_bloc/gen/colors.gen.dart';
import 'package:to_do_flutter_bloc/src/features/home/bloc/home_bloc.dart';
import 'package:to_do_flutter_bloc/src/features/widget/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> bottomNavScreen = <Widget>[
    const Text('Index 0: Home'),
    const Text('Index 1: ToDo'),
    const Text('Index 2: Complete'),
  ];

  final List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.today_outlined), label: 'ToDo'),
    BottomNavigationBarItem(
        icon: Icon(Icons.view_list_rounded), label: 'Completed'),
  ];

  final homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          endDrawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColor.darkcyan.withOpacity(.2),
                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(MyImage.images.profile),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              'Hello Yusuf',
              style: GoogleFonts.urbanist(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: false,
            actions: [
              Builder(
                builder: (BuildContext builderContext) {
                  return GestureDetector(
                    onTap: () => Scaffold.of(builderContext).openEndDrawer(),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.sp),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(MyImage.images.profile),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Center(child: bottomNavScreen.elementAt(state.currentIndex)),
          bottomNavigationBar: BottomNavigationBarWidget(
              homeBloc: homeBloc, bottomNavItems: bottomNavItems),
        );
      },
    );
  }
}
