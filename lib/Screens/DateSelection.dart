import 'package:dailynewspaper/Models/NewsPaperModel.dart';
import 'package:dailynewspaper/Network/apiCall.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({Key? key, required this.paperKey}) : super(key: key);
  final String paperKey;
  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  List<NewsPaperModel> listofModel = [];
  var isNoInternet = false;
  var isLoading = true;
  var isPaperDeleted = false;
  var api = NewsPaperAPI();

  getNewsPaperList() async {
    var res = await api.getNewsPaper(widget.paperKey);
    if (res != "No Internet") {
      setState(() {
        listofModel = res;
        isLoading = false;
      });
    } else {
      setState(() {
        isNoInternet = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getNewsPaperList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Date'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : isNoInternet
                    ? RefreshIndicator(
                        onRefresh: () => getNewsPaperList(),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.wifi_off,
                                size: 100,
                                color: Colors.purple,
                              ),
                              Text("No Internet")
                            ],
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () => getNewsPaperList(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: listofModel.length,
                              itemBuilder: (context, index) {
                                var model = listofModel[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(model.date),
                                    onTap: () async {
                                      var url = await api.getpdf(model.link);
                                      if (url == 'Error') {
                                        setState(() {
                                          isPaperDeleted = true;
                                        });
                                      } else if (url == 'No Internet') {
                                        setState(() {
                                          isNoInternet = true;
                                        });
                                      } else {
                                        launchUrl(
                                          Uri.parse(url),
                                          mode: LaunchMode.externalApplication,
                                        );
                                      }
                                    },
                                  ),
                                );
                              }),
                        ),
                      ),
            const Text('For Chandni only!'),
          ],
        ));
  }
}
