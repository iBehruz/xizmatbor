import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F4F7),
      drawer: Drawer(child: Text("data")),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F4F7),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: SvgPicture.asset('assets/icons/menu.svg'),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset('assets/icons/customer-service.svg'),
          ),
        ],
        title: Row(
          children: [
            Spacer(),
            SvgPicture.asset('assets/images/logo.svg'),
            Spacer(),
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Color(0xFFF79009),
                    child: InkWell(
                      splashColor: Colors.black12,
                      onTap: () => {},
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 24,
                            ),
                            width: 300,
                            height: 134,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Присоединяйтесь к нам",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Зарегистрируйтесь и начните искать мастеров рядом с вами",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),

                          Positioned(
                            width: 110,
                            height: 150,
                            top: 0,
                            right: 0,
                            child: SvgPicture.asset('assets/images/vector.svg'),
                          ),
                          Positioned(
                            width: 150,
                            height: 150,
                            top: 0,
                            right: 0,
                            child: Image.asset("assets/images/greeting.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Color(0xFFF79009),
                    child: InkWell(
                      splashColor: Colors.black12,
                      onTap: () => {},
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 24,
                            ),
                            width: 300,
                            height: 134,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Пригласите друзей — получайте бонусы",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),

                                Spacer(),
                              ],
                            ),
                          ),

                          Positioned(
                            width: 110,
                            height: 150,
                            top: 0,
                            right: 0,
                            child: SvgPicture.asset('assets/images/vector.svg'),
                          ),
                          Positioned(
                            width: 150,
                            height: 150,
                            top: 0,
                            right: 0,
                            child: Image.asset("assets/images/megaphone.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Color(0xFFF79009),
                    child: InkWell(
                      splashColor: Colors.black12,
                      onTap: () => {},
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 24,
                            ),
                            width: 300,
                            height: 134,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Мастер за пару кликов",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Быстро и удобно из дома",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),

                          Positioned(
                            width: 110,
                            height: 150,
                            top: 0,
                            right: 0,
                            child: SvgPicture.asset('assets/images/vector.svg'),
                          ),
                          Positioned(
                            width: 150,
                            height: 150,
                            top: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/images/tapping-on-phone-screen.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(6),
              height: 271,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Быстрый вызова мастер",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 5),

                  Card(
                    color: Color(0xffF2F4F7),
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        height: 67,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/location.svg',
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ваше местоположение",
                                  style: TextStyle(
                                    color: Color(0xFF667085),
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "Где нужен мастер?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(8),
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/maps-location.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color: Color(0xffF2F4F7),
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        height: 67,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/credit-card.svg',
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Способ оплаты",
                                  style: TextStyle(
                                    color: Color(0xFF667085),
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "Как оплатите?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(8),
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.asset('assets/icons/edit.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.black12),
                        foregroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFF79009),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Быстрый поиск",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Text(
                      " Активные заказы",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  Card(
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/ava2.png'),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Alina Bekmurodova",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "Уборщица",
                                      style: TextStyle(
                                        color: Color(0xFF667085),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDCFAE6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "активный",
                                    style: TextStyle(
                                      color: Color(0xFF079455),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  height: 58,
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F4F7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Цена"),
                                      Text(
                                        "500 000 uzs",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  height: 58,
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F4F7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Рейтинг"),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/star.svg',
                                          ),
                                          Text(
                                            " 4.8",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Color(0xFFF2F4F7), thickness: 1.5),
                  ),
                  Card(
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/ava1.png'),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Timur Malikov",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "Сантехник",
                                      style: TextStyle(
                                        color: Color(0xFF667085),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDCFAE6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "активный",
                                    style: TextStyle(
                                      color: Color(0xFF079455),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  height: 58,
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F4F7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Цена"),
                                      Text(
                                        "500 000 uzs",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  height: 58,
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F4F7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Рейтинг"),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/star.svg',
                                          ),
                                          Text(
                                            " 4.5",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
