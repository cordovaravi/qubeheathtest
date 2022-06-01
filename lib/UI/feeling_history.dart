import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:qubehealthtest/Controller/FeelinghistoryApi.dart';
import 'package:url_launcher/url_launcher.dart';

class FeelingHistory extends StatefulWidget {
  const FeelingHistory({Key? key}) : super(key: key);

  @override
  _FeelingHistoryState createState() => _FeelingHistoryState();
}

class _FeelingHistoryState extends State<FeelingHistory> {
  List<String> thumbnail = ["assets/banner1.png", "assets/banner2.png"];

  final FeelingApiController feelingApiController =
      Get.put(FeelingApiController());

  @override
  Widget build(BuildContext context) {
    feelingApiController.fetchfeelingsHistory();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Your Feeling history",
            style: TextStyle(fontSize: 20, color: Colors.black)),
      ),
      body: Obx(
        () => feelingApiController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(left: 14, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your feelings from last 30 days",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FeelingPercentWidget(
                            active: feelingApiController.feelingHistoryData
                                        ?.data?.feelingPercentage?.happy ==
                                    "0"
                                ? false
                                : true,
                            feelingType: "happy",
                            feelingPercent: feelingApiController
                                    .feelingHistoryData
                                    ?.data
                                    ?.feelingPercentage
                                    ?.happy
                                    .toString() ??
                                "",
                          ),
                          FeelingPercentWidget(
                            active: feelingApiController.feelingHistoryData
                                        ?.data?.feelingPercentage?.happy ==
                                    "0"
                                ? false
                                : true,
                            feelingType: "sad",
                            feelingPercent: feelingApiController
                                    .feelingHistoryData
                                    ?.data
                                    ?.feelingPercentage
                                    ?.happy
                                    .toString() ??
                                "",
                          ),
                          FeelingPercentWidget(
                            active: feelingApiController.feelingHistoryData
                                        ?.data?.feelingPercentage?.happy ==
                                    "0"
                                ? false
                                : true,
                            feelingType: "energy",
                            feelingPercent: feelingApiController
                                    .feelingHistoryData
                                    ?.data
                                    ?.feelingPercentage
                                    ?.happy
                                    .toString() ??
                                "",
                          ),
                          FeelingPercentWidget(
                            active: feelingApiController.feelingHistoryData
                                        ?.data?.feelingPercentage?.happy ==
                                    "0"
                                ? false
                                : true,
                            feelingType: "calm",
                            feelingPercent: feelingApiController
                                    .feelingHistoryData
                                    ?.data
                                    ?.feelingPercentage
                                    ?.happy
                                    .toString() ??
                                "",
                          ),
                          FeelingPercentWidget(
                            active: feelingApiController.feelingHistoryData
                                        ?.data?.feelingPercentage?.happy ==
                                    "0"
                                ? false
                                : true,
                            feelingType: "angry",
                            feelingPercent: feelingApiController
                                    .feelingHistoryData
                                    ?.data
                                    ?.feelingPercentage
                                    ?.happy
                                    .toString() ??
                                "",
                          ),
                          FeelingPercentWidget(
                            active: feelingApiController.feelingHistoryData
                                        ?.data?.feelingPercentage?.happy ==
                                    "0"
                                ? false
                                : true,
                            feelingType: "boared",
                            feelingPercent: feelingApiController
                                    .feelingHistoryData
                                    ?.data
                                    ?.feelingPercentage
                                    ?.happy
                                    .toString() ??
                                "",
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffC6E5F7),
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.all(5),
                        child: Text("${DateTime.now().day} jun, 2022"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Colors.black,
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      if (feelingApiController
                              .feelingHistoryData?.data?.feelingList?.length !=
                          0) ...{
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: feelingApiController
                                .feelingHistoryData?.data?.feelingList?.length,
                            itemBuilder: (context, index) {
                              return TimeFeelingTile(
                                  dateTime: "9 AM - 12 PM",
                                  emoticons: feelingApiController
                                      .feelingHistoryData!
                                      .data!
                                      .feelingList![index]
                                      .feelingName
                                      .toString());
                            },
                          ),
                        )
                      },
                      // TimeFeelingTile(
                      //     dateTime: "1PM - 4PM", emoticons: "😡 Love"),
                      // TimeFeelingTile(
                      //     dateTime: "4PM - 6PM", emoticons: "😡 Love"),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Divider(),
                      ),
                      Text(
                        feelingApiController
                            .feelingHistoryData!.data!.videoArr!.first.title!,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(feelingApiController.feelingHistoryData!.data!
                          .videoArr!.first.description!),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 140.sp,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: feelingApiController
                                .feelingHistoryData!.data!.videoArr!.length,
                            itemBuilder: (context, index) {
                              final viobj = feelingApiController
                                  .feelingHistoryData!.data!.videoArr![index];
                              return InkWell(
                                onTap: () async {
                                  await launchUrl(
                                      Uri.parse(viobj.youtubeUrl.toString()));
                                },
                                child: VideoThubnail(
                                  imagePath: thumbnail[index],
                                ),
                              );
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class FeelingPercentWidget extends StatelessWidget {
  final String feelingType;
  final String feelingPercent;
  final bool active;
  FeelingPercentWidget({
    required this.feelingPercent,
    required this.feelingType,
    required this.active,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getImagePath({required String nameOfFeeling}) {
      switch (nameOfFeeling) {
        case "happy":
          return "assets/happy.png";

        case "sad":
          return "assets/sad.png";

        case "energy":
          return "assets/energy.png";

        case "calm":
          return "assets/calm.png";

        case "boared":
          return "assets/bored.png";

        case "angry":
          return "assets/angry.png";
      }
    }

    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(left: 10),
            height: 80,
            width: 40,
            decoration: BoxDecoration(
                color: Color(0xffF1F2F3),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    this.active ? "${this.feelingPercent}%" : "",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      this.active ? Color(0xff85C454) : Colors.green.shade100,
                  child: Image.asset(
                    getImagePath(nameOfFeeling: this.feelingType)!,
                    height: 20,
                    width: 20,
                  ),
                )
              ],
            ),
          ),
          Text(
            "${this.feelingType}",
            style: TextStyle(
                fontSize: 12,
                color: this.active ? Colors.black : Colors.grey.shade300),
          ),
        ],
      ),
    ]);
  }
}

class VideoThubnail extends StatelessWidget {
  final String imagePath;
  const VideoThubnail({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 140.sp,
      width: 240.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("${imagePath}"), fit: BoxFit.cover)),
      child: Image.asset("assets/yticon.png"),
    );
  }
}

class TimeFeelingTile extends StatelessWidget {
  final String dateTime;
  final String emoticons;
  const TimeFeelingTile(
      {required this.dateTime, required this.emoticons, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    getImagePath({required String nameOfFeeling}) {
      switch (nameOfFeeling) {
        case "happy":
          return "assets/happy.png";

        case "sad":
          return "assets/sad.png";

        case "energy":
          return "assets/energy.png";

        case "calm":
          return "assets/calm.png";

        case "bored":
          return "assets/bored.png";

        case "angry":
          return "assets/angry.png";
      }
    }

    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text("${dateTime}"),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
              radius: 10,
              child: Image.asset(
                  getImagePath(nameOfFeeling: emoticons.toLowerCase())!)),
          Text("\t${emoticons}")
        ],
      ),
    );
  }
}
