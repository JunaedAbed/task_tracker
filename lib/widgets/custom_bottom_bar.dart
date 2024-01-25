import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/theme/custom_text_styles.dart';
import 'package:task_tracker/widgets/custom_image_view.dart';

class CustomBottomBar extends StatelessWidget {
  Function(BottomBarEnum)? onChanged;

  CustomBottomBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt selectedIndex = 0.obs;

    List<BottomMenuModel> bottomMenuList = [
      BottomMenuModel(
        icon: ImageConstants.houseUnselected,
        activeIcon: ImageConstants.houseSelected,
        title: "Home",
        type: BottomBarEnum.Home,
      ),
      BottomMenuModel(
        icon: ImageConstants.taskUnselected,
        activeIcon: ImageConstants.taskSelected,
        title: "Tasks",
        type: BottomBarEnum.Tasks,
      ),
      BottomMenuModel(
        icon: ImageConstants.profileUnselected,
        activeIcon: ImageConstants.profileSelected,
        title: "Profile",
        type: BottomBarEnum.Profile,
      )
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: double.maxFinite,
          child: Divider(),
        ),
        Container(
          height: 59.v,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          ),
          child: Obx(
            () => Stack(
              children: [
                BottomNavigationBar(
                  backgroundColor: Colors.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedFontSize: 0,
                  elevation: 2,
                  currentIndex: selectedIndex.value,
                  type: BottomNavigationBarType.fixed,
                  items: List.generate(bottomMenuList.length, (index) {
                    return BottomNavigationBarItem(
                      icon: buildBottomBarItem(
                        bottomMenuList[index].icon,
                        bottomMenuList[index].title,
                        bottomMenuList[index].type,
                      ),
                      activeIcon: buildBottomBarItem(
                        bottomMenuList[index].activeIcon,
                        bottomMenuList[index].title,
                        bottomMenuList[index].type,
                        selected: true,
                      ),
                      label: '',
                    );
                  }),
                  onTap: (index) {
                    selectedIndex.value = index;
                    onChanged!.call(bottomMenuList[index].type);
                  },
                ),
                Positioned(
                  top: 0,
                  left: selectedIndex.value *
                          (MediaQuery.of(context).size.width /
                              bottomMenuList.length) +
                      ((MediaQuery.of(context).size.width /
                                  bottomMenuList.length) -
                              (MediaQuery.of(context).size.width /
                                  (2 * bottomMenuList.length))) /
                          2,
                  child: Container(
                    width: MediaQuery.of(context).size.width /
                        (2 * bottomMenuList.length),
                    height: 4,
                    color: theme.colorScheme.primary.withOpacity(1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBottomBarItem(String imagePath, String? title, BottomBarEnum type,
      {bool selected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: imagePath,
          height: 18.v,
          width: 18.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: selected ? 4.v : 5.v),
          child: Text(
            title ?? "",
            style: selected
                ? CustomTextStyles.labelMediumPrimary.copyWith(
                    color: theme.colorScheme.primary.withOpacity(1),
                  )
                : CustomTextStyles.bodySmall10.copyWith(
                    color: appTheme.blueGray300,
                  ),
          ),
        ),
      ],
    );
  }
}

enum BottomBarEnum {
  Home,
  Tasks,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
