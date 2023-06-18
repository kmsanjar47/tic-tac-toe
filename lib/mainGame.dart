import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainGame extends StatefulWidget {
  const MainGame({Key? key}) : super(key: key);

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  void resetBoard() {
    mainBoxInfo = {
      0: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.red.withOpacity(0.1)
      },
      1: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.green.withOpacity(0.1)
      },
      2: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.blue.withOpacity(0.1)
      },
      3: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.pink.withOpacity(0.1)
      },
      4: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.teal.withOpacity(0.1)
      },
      5: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.yellow.withOpacity(0.1)
      },
      6: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.cyan.withOpacity(0.1)
      },
      7: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.lightGreen.withOpacity(0.1)
      },
      8: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.tealAccent.withOpacity(0.1)
      },
    };
    containerClicked = false;
    optionClicked = false;
    playerTurn = 1;
    boxRemaining = 9;
    winnerDecided = false;
    selectedIdx = null;
  }

  bool checkIfWinConditionsMet() {
    if (mainBoxInfo[0]["icon"] != null &&
        mainBoxInfo[0]["icon"] == mainBoxInfo[4]["icon"] &&
        mainBoxInfo[0]["icon"] == mainBoxInfo[8]["icon"]) {
      return true;
    } else if (mainBoxInfo[0]["icon"] != null &&
        mainBoxInfo[0]["icon"] == mainBoxInfo[3]["icon"] &&
        mainBoxInfo[0]["icon"] == mainBoxInfo[6]["icon"]) {
      return true;
    } else if (mainBoxInfo[0]["icon"] != null &&
        mainBoxInfo[0]["icon"] == mainBoxInfo[1]["icon"] &&
        mainBoxInfo[0]["icon"] == mainBoxInfo[2]["icon"]) {
      return true;
    } else if (mainBoxInfo[6]["icon"] != null &&
        mainBoxInfo[6]["icon"] == mainBoxInfo[7]["icon"] &&
        mainBoxInfo[6]["icon"] == mainBoxInfo[8]["icon"]) {
      return true;
    } else if (mainBoxInfo[3]["icon"] != null &&
        mainBoxInfo[3]["icon"] == mainBoxInfo[4]["icon"] &&
        mainBoxInfo[3]["icon"] == mainBoxInfo[5]["icon"]) {
      return true;
    } else if (mainBoxInfo[2]["icon"] != null &&
        mainBoxInfo[2]["icon"] == mainBoxInfo[5]["icon"] &&
        mainBoxInfo[2]["icon"] == mainBoxInfo[8]["icon"]) {
      return true;
    } else if (mainBoxInfo[2]["icon"] != null &&
        mainBoxInfo[2]["icon"] == mainBoxInfo[3]["icon"] &&
        mainBoxInfo[2]["icon"] == mainBoxInfo[6]["icon"]) {
      return true;
    }

    return false;
  }
  void mainBoxFunction(int index){
    if (mainBoxInfo[index]["containerColor"] ==
        Colors.green.shade200 &&
        mainBoxInfo[index]["alreadySelected"] ==
            false) {
      mainBoxInfo[index]["containerColor"] =
          Colors.grey.shade200;
      containerClicked = false;
      selectedIdx = null;
    } else if (containerClicked == true &&
        mainBoxInfo[index]["containerColor"] !=
            Colors.green.shade200 &&
        mainBoxInfo[index]["alreadySelected"] ==
            false) {
      mainBoxInfo[selectedIdx]["containerColor"] =
          Colors.grey.shade200;
      mainBoxInfo[index]["containerColor"] =
          Colors.green.shade200;
      containerClicked = true;
      selectedIdx = index;
    } else {
      if (mainBoxInfo[index]["alreadySelected"] ==
          false) {
        mainBoxInfo[index]["containerColor"] =
            Colors.green.shade200;
        containerClicked = true;
        selectedIdx = index;
      }
    }
  }
  void lockFunction(){
    mainBoxInfo[selectedIdx]
    ["alreadySelected"] = true;
    boxRemaining = boxRemaining - 1;
    mainBoxInfo[selectedIdx]
    ["containerColor"] =
        Colors.grey.shade200;
    containerClicked = false;
    optionClicked = false;

    bool temp = checkIfWinConditionsMet();
    temp == true
        ? winnerDecided = true
        : winnerDecided = false;
    playerTurn == 1
        ? playerTurn = 2
        : playerTurn = 1;
    if (boxRemaining == 0) {
      winnerDecided == true;
      playerTurn = -1;
    }
  }

  bool containerClicked = false;
  bool optionClicked = false;
  int playerTurn = 1;
  int? selectedIdx;
  int boxRemaining = 9;
  bool winnerDecided = false;
  Map mainBoxInfo = {

  };

  @override
  void initState() {
    super.initState();
    resetBoard();

    containerClicked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Tic-Tac-Toe",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: winnerDecided == false
            ? Column(
          children: [
            Text(
              "Player $playerTurn turn",
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.sp,
            ),
            SizedBox(
              height: 600.h,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mainBoxInfo.length,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1/1,
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.sp,
                      crossAxisSpacing: 10.sp),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          mainBoxFunction(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: mainBoxInfo[index]["color"]),
                        child: mainBoxInfo[index]["icon"] != null
                            ? Center(
                          child: Icon(
                            mainBoxInfo[index]["icon"],
                            color: mainBoxInfo[index]["iconColor"],
                            size: 100.sp,
                          ),
                        )
                            : Container(),
                      ),
                    );
                  }),
            ),
            containerClicked
                ? Expanded(
              child: Column(
                children: [
                  optionClicked
                      ? Padding(
                        padding: EdgeInsets.only(left: 15.0.w,right: 15.0.w),
                        child: InkWell(
                    onTap: () {
                        setState(() {
                          lockFunction();
                          // dynamic height = MediaQuery.of(context).size.height;
                          // dynamic width = MediaQuery.of(context).size.width;
                          // print(height);
                          // print(width);
                        });
                    },
                    child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                        ),
                        child: Center(
                            child: Text(
                              "LOCK",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                    ),
                  ),
                      )
                      : Container(),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              mainBoxInfo[selectedIdx]["icon"] =
                                  Icons.close;
                              mainBoxInfo[selectedIdx]
                              ["iconColor"] = Colors.red;
                              optionClicked = true;
                            });
                          },
                          child: Container(
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              mainBoxInfo[selectedIdx]["icon"] =
                                  Icons.circle_outlined;
                              mainBoxInfo[selectedIdx]
                              ["iconColor"] = Colors.green;
                              optionClicked = true;
                            });
                          },
                          child: Container(
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.circle_outlined,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
                : Container()
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            playerTurn != -1
                ? Center(
                child: Text(
                  "Player $playerTurn won!!!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.sp),
                ))
                : Center(
                child: Text(
                  "Match Draw",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.sp),
                )),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      winnerDecided = false;
                      resetBoard();
                    });
                  },
                  child: Text("Try Again??",style: TextStyle(fontSize: 20.sp),)),
            )
          ],
        ),
      ),
    );
  }
}
