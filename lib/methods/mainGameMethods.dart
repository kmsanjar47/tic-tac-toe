import 'package:flutter/material.dart';

class Methods{

  static void resetBoard() {
    Map mainBoxInfo = {};
    mainBoxInfo = {
      0: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.red.withOpacity(0.2)
      },
      1: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.green.withOpacity(0.2)
      },
      2: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.blue.withOpacity(0.2)
      },
      3: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.pink.withOpacity(0.2)
      },
      4: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.teal.withOpacity(0.2)
      },
      5: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.yellow.withOpacity(0.2)
      },
      6: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.cyan.withOpacity(0.2)
      },
      7: {
        "icon": null,
        "iconColor": Colors.green,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.lightGreen.withOpacity(0.2)
      },
      8: {
        "icon": null,
        "iconColor": Colors.red,
        "containerColor": Colors.grey.shade200,
        "alreadySelected": false,
        "color" : Colors.tealAccent.withOpacity(0.2)
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
        Colors.green.shade100 &&
        mainBoxInfo[index]["alreadySelected"] ==
            false) {
      mainBoxInfo[index]["containerColor"] =
          Colors.grey.shade200;
      containerClicked = false;
      selectedIdx = null;
    } else if (containerClicked == true &&
        mainBoxInfo[index]["containerColor"] !=
            Colors.green.shade100 &&
        mainBoxInfo[index]["alreadySelected"] ==
            false) {
      mainBoxInfo[selectedIdx]["containerColor"] =
          Colors.grey.shade200;
      mainBoxInfo[index]["containerColor"] =
          Colors.green.shade100;
      containerClicked = true;
      selectedIdx = index;
    } else {
      if (mainBoxInfo[index]["alreadySelected"] ==
          false) {
        mainBoxInfo[index]["containerColor"] =
            Colors.green.shade100;
        containerClicked = true;
        selectedIdx = index;
      }
    }
  }
  void static lockFunction(){
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
}
