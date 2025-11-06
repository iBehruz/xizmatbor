import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Map<String, String>> menuList = [
    {
      "title": "Мои карты",
      "icon": "icons/credit-card.svg",
      "subtitle": "UzCard ••••9023",
      "path": "my_cards",
    },
    {
      "title": "История заказов",
      "icon": "icons/clock.svg",
      "path": "orders_history",
    },
    {
      "title": "Служба поддержки",
      "icon": "icons/customer-support.svg",
      "path": "support",
    },
    {
      "title": "Стать мастером",
      "icon": "icons/taxi-driver-man.svg",
      "subtitle": "Предлагайте свои услуги",
      "path": "become_master",
    },
    {"title": "Настройки", "icon": "icons/settings.svg", "path": "settings"},
    {"title": "Информация", "icon": "icons/info-circle.svg", "path": "info"},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            padding: EdgeInsets.only(top: 18, left: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/user.svg'),
                Text(
                  "Пожалуйста, авторизуйтесь для \nпродолжения",
                  style: TextStyle(color: Color(0xFF667085), fontSize: 13),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    overlayColor: WidgetStateProperty.all(Colors.black12),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.all(Color(0xFFF79009)),
                  ),
                  onPressed: () {},
                  child: Text("Войти в аккаунт"),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xFFEAECF0), thickness: 4, height: 4),

          Column(
            children: List.generate(menuList.length, (index) {
              if (menuList[index]['path'] == "become_master") {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFDADDFA), Color(0xFFF5C8F5)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    minTileHeight: 62,
                    leading: Image.asset("assets/images/taxi-driver-man.png"),
                    title: Text(
                      menuList[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: menuList[index]['subtitle'] == null
                        ? null
                        : Text(
                            menuList[index]['subtitle']!,
                            style: TextStyle(color: Color(0xFF667085)),
                          ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    shape: Border(
                      bottom: BorderSide(color: Color(0xFFEAECF0), width: 1.0),
                    ),
                  ),
                );
              }
              return ListTile(
                onTap: () {},
                minTileHeight: 62,
                leading: SvgPicture.asset(
                  "assets/${menuList[index]['icon']!}",
                  width: 25,
                  color: Color(0xFF667085),
                ),
                title: Text(
                  menuList[index]['title']!,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: menuList[index]['subtitle'] == null
                    ? null
                    : Text(
                        menuList[index]['subtitle']!,
                        style: TextStyle(color: Color(0xFF667085)),
                      ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF667085),
                ),
                shape: Border(
                  bottom: BorderSide(
                    color: Color(0xFFEAECF0), // Customize the color
                    width: 1.0, // Customize the thickness
                  ),
                ),
              );
            }),
          ),
          Expanded(child: Container(color: Color(0xFFEAECF0))),
        ],
      ),
    );
  }
}
