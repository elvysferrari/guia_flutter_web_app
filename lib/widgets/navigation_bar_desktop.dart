import 'package:flutter/material.dart';
import 'package:guia_flutter_web_app/constants/app_constants.dart';
import 'package:guia_flutter_web_app/constants/app_themes.dart';
import 'package:guia_flutter_web_app/models/menu_item_model.dart';
import 'package:guia_flutter_web_app/models/user_model.dart';

import 'navigation_bar_mobile.dart';

class NavigationBarDesktop extends StatelessWidget {

  final UserModel user;
  final List<MenuItemModel> menuItems;
  final int selectedTabIndex;
  final Function(int) onTap;

  const NavigationBarDesktop({
    Key? key,
    required this.user,
    required this.menuItems,
    required this.selectedTabIndex,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 4
            )
          ]
      ),
      child: Row(
        children: [
          const Expanded(
              child: Text(
                appTitle,
                style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    letterSpacing: -1.2
                ),
              )
          ),
          Expanded(
              child: NavigationBarMobile(
                menuItems: menuItems,
                selectedTabIndex: selectedTabIndex,
                onTap: onTap,
                bottomIndicator: true,
              )
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  /*BotaoImagemPerfil(
                    usuario: usuario,
                    onTap: (){},
                  ),
                  BotaoCirculo(
                    icone: Icons.search,
                    iconeTamanho: 30,
                    onPressed: (){},
                  ),
                  BotaoCirculo(
                    icone: LineIcons.facebookMessenger,
                    iconeTamanho: 30,
                    onPressed: (){},
                  )*/
                ],
              )
          ),
        ],
      ),
    );
  }
}
