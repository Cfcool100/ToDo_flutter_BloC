import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_flutter_bloc/gen/colors.gen.dart';
import 'package:to_do_flutter_bloc/src/features/home/bloc/home_bloc.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.homeBloc,
    required this.bottomNavItems,
  });

  final HomeBloc homeBloc;
  final List<BottomNavigationBarItem> bottomNavItems;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.easternBlue.withOpacity(.1)),
            child: BottomNavigationBar(
              onTap: (index) {
                homeBloc.add(BottomNavigationItemClicked(itemIndex: index));
              },
              backgroundColor: AppColor.easternBlue.withOpacity(0),
              currentIndex: state.currentIndex,
              elevation: 0,
              selectedItemColor: AppColor.lightpink,
              unselectedItemColor: AppColor.darkcyan,
              type: BottomNavigationBarType.fixed,
              items: bottomNavItems,
            ),
          ),
        );
      },
    );
  }
}
