import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:qubehealthtest/Controller/FeelinghistoryApi.dart';

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
      body: Padding(
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
              Container(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FeelingPercentWidget();
                  },
                ),
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
                child: Text("${DateTime.now().day} may, 2022"),
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
              TimeFeelingTile(dateTime: "9AM - 12PM", emoticons: "🥰 Love"),
              TimeFeelingTile(dateTime: "1PM - 4PM", emoticons: "😡 Love"),
              TimeFeelingTile(dateTime: "4PM - 6PM", emoticons: "😡 Love"),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(),
              ),
              Text(
                "You may find This intresting",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit euismod risus elementum magna scelerisque nunc sed varius. Tellus quis tristique adipiscing sed metus, sit ac adipiscing. Leo aenean sed eu purus maecenas posuere "),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 140.sp,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: thumbnail.length,
                    itemBuilder: (context, index) {
                      return VideoThubnail(
                        imagePath: thumbnail[index],
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
    );
  }
}

class FeelingPercentWidget extends StatelessWidget {
  const FeelingPercentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
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
                  "30%",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xff85C454),
                child: Image.asset(
                  "assets/happy.png",
                  height: 20,
                  width: 20,
                ),
              )
            ],
          ),
        ),
        Text(
          "   data",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
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
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text("${dateTime}"),
          SizedBox(
            width: 10,
          ),
          Text("${emoticons}")
        ],
      ),
    );
  }
}
