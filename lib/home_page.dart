import 'package:flutter/material.dart';
import 'package:work_with_api/api.dart';
import 'package:work_with_api/province.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<Province> provices = List();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() => isLoading = true);
      await Api().getAllProvincesOfVietNam(onSuccess: (values) {
        setState(() {
          isLoading = false;
          provices = values;
        });
      }, onError: (msg) {
        setState(() => isLoading = false);
        print(msg);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROVINCES OF VIET NAM"),
        backgroundColor: Colors.green[300],
      ),
      body: isLoading
          ? Center(
              child: Text("loading..."),
            )
          : provices.isEmpty
              ? Center(
                  child: Text("empty"),
                )
              : ListView(
                  children: provices.map((province) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      color: Colors.green[100],
                      child: Text(province.name),
                    );
                  }).toList(),
                ),
    );
  }
}
