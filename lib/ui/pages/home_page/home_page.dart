import 'package:flutter/material.dart';
import 'package:untitled/core/app_color.dart';
import 'package:untitled/core/helper/bottom_sheet_helper.dart';
import 'package:untitled/data/network/mqtt_client.dart';
import 'package:untitled/ui/pages/chart/chart_page.dart';
import 'package:untitled/ui/pages/home_page/components/choose_pumma_bottom_sheet.dart';
import 'package:untitled/ui/pages/webview/webview_page.dart';

import '../all/all_page.dart';
import '../data/data_page.dart';
import '../gauge/gauge_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // connectClientMtqq();
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  // connectClientMtqq() async {
  //   await connectClient();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    'Dashboard',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BottomSheetHelper.rounded(
                    context,
                    child: const ChoosePummaBottomSheet(
                      data: [
                        'PUMMA Canti',
                        'PUMMA Petengoran',
                      ],
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Pilih titik lokasi PUMMA',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_drop_down_outlined, color: Colors.white)
                    ],
                  ),
                ),
              ),
              TabBar(
                controller: tabController,
                isScrollable: false,
                indicatorColor: Colors.white,
                indicator: ShapeDecoration(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                onTap: (index) {
                  setState(() {});
                },
                tabs: [
                  Tab(
                    child: Text(
                      'All',
                      style: TextStyle(
                          color: (tabController?.index == 0)
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Data',
                      style: TextStyle(
                          color: (tabController?.index == 1)
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Gauge',
                      style: TextStyle(
                          color: (tabController?.index == 2)
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Chart',
                      style: TextStyle(
                          color: (tabController?.index == 3)
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'WebView',
                      style: TextStyle(
                          color: (tabController?.index == 4)
                              ? Colors.black
                              : Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          // TODO: Uncomment this for preview empty
          // EmptyPage(),
          AllPage(),
          DataPage(),
          GaugePage(),
          ChartPage(),
          WebViewPage()
        ],
      ),
    );
  }
}
