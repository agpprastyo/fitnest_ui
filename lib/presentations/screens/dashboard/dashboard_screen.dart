import 'package:fitnest_ui/core/routes/routes.dart';
import 'package:fitnest_ui/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class PageCubit extends Cubit<int> {
  int _previousIndex = 0;

  PageCubit() : super(0);

  int get previousIndex => _previousIndex;

  void changePage(BuildContext context, int index) {
    _previousIndex = state; // Store the current index as the previous index
    switch (index) {
      case 0:
        context.goNamed(RoutesName.home.name);
        break;
      case 1:
        context.goNamed('explore');
        break;
      case 2:
        context.goNamed('bookmark');
        break;
      case 3:
        context.goNamed('profile');
        break;
      default:
        context.goNamed('home');
        break;
    }
    emit(index);
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return BlocProvider(
      create: (context) => PageCubit(),
      child: _DashboardScreenContent(
        child: child,
      ),
    );
  }
}

class _DashboardScreenContent extends StatelessWidget {
  const _DashboardScreenContent({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentPageIndex) {
        return Scaffold(
            extendBody: true,
            backgroundColor: Colors.white.withOpacity(0.2),
            // extendBody: true,
            // extendBodyBehindAppBar: true,
            body: SafeArea(child: child),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  gradient: AppColors.blueLinear,
                  borderRadius: BorderRadius.circular(99)),
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                focusElevation: 0,
                hoverElevation: 0,
                highlightElevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                ),
                onPressed: () {
                  // context.read<PageCubit>().changePage(context, 0);
                },
                child: const Icon(
                  IconlyLight.search,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              surfaceTintColor: Colors.white,
              shadowColor: Colors.transparent,
              color: Colors.white,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navItem(context, currentPageIndex,
                      index: 0,
                      icon: IconlyLight.home,
                      selectedIcon: IconlyBold.home),
                  navItem(context, currentPageIndex,
                      index: 1,
                      icon: IconlyLight.activity,
                      selectedIcon: IconlyBold.activity),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  navItem(context, currentPageIndex,
                      index: 2,
                      icon: IconlyLight.camera,
                      selectedIcon: IconlyBold.camera),
                  navItem(context, currentPageIndex,
                      index: 3,
                      icon: IconlyLight.profile,
                      selectedIcon: IconlyBold.profile),
                ],
              ),
            ));
      },
    );
  }

  IconButton navItem(BuildContext context, int currentPageIndex,
      {required IconData icon,
      required IconData selectedIcon,
      required int index}) {
    return IconButton(
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      onPressed: () {
        context.read<PageCubit>().changePage(context, index);
      },
      icon: currentPageIndex == index
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => LinearGradient(
                    colors: AppColors.logoLinear.colors,
                  ).createShader(bounds),
                  child: Icon(
                    selectedIcon,
                    size: 30,
                  ),
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    gradient: AppColors.logoLinear,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            )
          : Icon(
              icon,
              color: AppColors.gray2,
              size: 30,
            ),
    );
  }
}
