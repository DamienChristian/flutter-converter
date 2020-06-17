import 'package:converter/data.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final String mode;

  Body({Key key, this.mode}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String upperSel;
  String lowerSel;
  String selectedField = 'upper';
  FocusNode upperfocus = FocusNode();
  FocusNode lowerfocus = FocusNode();

  TextEditingController upperTextEditingController =
      TextEditingController(text: '0');
  TextEditingController lowerTextEditingController =
      TextEditingController(text: '0');

  Widget dropDownMenu(List values, String mode) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).backgroundColor,
          ),
          child: DropdownButton(
            isExpanded: true,
            isDense: true,
            elevation: 2,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
            items: values
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
            value: (mode == 'upper') ? upperSel : lowerSel,
            onChanged: (value) {
              setState(() {
                if (mode == 'upper') {
                  upperSel = value;
                  calculate(
                      upperTextEditingController.text,
                      lowerTextEditingController.text,
                      upperSel,
                      lowerSel,
                      'Upper');
                } else {
                  lowerSel = value;
                  calculate(
                      upperTextEditingController.text,
                      lowerTextEditingController.text,
                      upperSel,
                      lowerSel,
                      'Lower');
                }
              });
            },
          ),
        ),
      ),
    );
  }

  Widget textField(TextEditingController controller, String mode) {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 90,
            child: TextField(
              controller: controller,
              onTap: () {
                (controller == upperTextEditingController)
                    ? selectedField = 'upper'
                    : selectedField = 'lower';
              },
              expands: false,
              textInputAction: TextInputAction.none,
              readOnly: true,
              showCursor: false,
              autofocus: (mode == 'upper') ? true : false,
              focusNode: (mode == 'upper') ? upperfocus : lowerfocus,
              toolbarOptions: ToolbarOptions(
                copy: false,
                cut: false,
                paste: false,
                selectAll: false,
              ),
              cursorRadius: Radius.circular(10),
              cursorColor: Colors.orange,
              style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 30,
            height: 30,
            child: Text(
              (mode == 'upper')
                  ? dataObj.mainData[widget.mode][upperSel][2]
                  : dataObj.mainData[widget.mode][lowerSel][2],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  double parseString(String fn, double val) {
    List fnl = fn.split(' ');
    for (var item in fnl) {
      if (item[0] == '+') {
        val += double.parse(item.substring(1));
      } else if (item[0] == '-') {
        val -= double.parse(item.substring(1));
      } else if (item[0] == '*') {
        val *= double.parse(item.substring(1));
      } else if (item[0] == '/') {
        val /= double.parse(item.substring(1));
      }
    }
    return val;
  }

  void calculate(String upperNo, String lowerNo, String upperString,
      String lowerString, String imode) {
    if (upperNo.endsWith('.')) {
      upperNo = upperNo.substring(0, upperNo.length - 1);
    }
    if (lowerNo.endsWith('.')) {
      lowerNo = lowerNo.substring(0, lowerNo.length - 1);
    }
    String ans;
    if (imode == 'Upper') {
      ans = parseString(dataObj.mainData[widget.mode][lowerString][1],
              double.parse(lowerNo))
          .toString();
      ans = parseString(
              dataObj.mainData[widget.mode][upperString][0], double.parse(ans))
          .toString();
      if (double.parse(ans) % 1 == 0) {
        ans = double.parse(ans).toInt().toString();
      } else {
        double.parse(ans).toStringAsFixed(5);
      }
      upperTextEditingController.value = TextEditingValue(text: ans);
    } else if (imode == 'Lower') {
      ans = parseString(dataObj.mainData[widget.mode][upperString][1],
              double.parse(upperNo))
          .toString();
      ans = parseString(
              dataObj.mainData[widget.mode][lowerString][0], double.parse(ans))
          .toString();
      if (double.parse(ans) % 1 == 0) {
        ans = double.parse(ans).toInt().toString();
      } else {
        double.parse(ans).toStringAsFixed(5);
      }
      lowerTextEditingController.value = TextEditingValue(text: ans);
    }
  }

  Widget numpad(BuildContext context, String val) {
    return GestureDetector(
      onTap: () {
        String curVal;
        (selectedField == 'upper')
            ? curVal = upperTextEditingController.text
            : curVal = lowerTextEditingController.text;
        if (val == 'C') {
          if (curVal.length == 1) {
            (selectedField == 'upper')
                ? upperTextEditingController.value = TextEditingValue(text: '0')
                : lowerTextEditingController.value =
                    TextEditingValue(text: '0');
          } else {
            (selectedField == 'upper')
                ? upperTextEditingController.value = TextEditingValue(
                    text: curVal.substring(0, curVal.length - 1))
                : lowerTextEditingController.value = TextEditingValue(
                    text: curVal.substring(0, curVal.length - 1));
          }
        } else if (val == 'CE') {
          upperTextEditingController.value = TextEditingValue(text: '0');
        } else if (val == '.') {
          if (selectedField == 'upper' &&
              !upperTextEditingController.text.contains('.')) {
            upperTextEditingController.value =
                TextEditingValue(text: '$curVal$val');
          } else if (selectedField == 'lower' &&
              !lowerTextEditingController.text.contains('.')) {
            lowerTextEditingController.value =
                TextEditingValue(text: '$curVal$val');
          }
        } else if (val == '0') {
          if (curVal != '0') {
            (selectedField == 'upper')
                ? upperTextEditingController.value =
                    TextEditingValue(text: '$curVal$val')
                : lowerTextEditingController.value =
                    TextEditingValue(text: '$curVal$val');
          } else {
            (selectedField == 'upper')
                ? upperTextEditingController.value =
                    TextEditingValue(text: '$val')
                : lowerTextEditingController.value =
                    TextEditingValue(text: '$val');
          }
        } else if (val == '+-') {
          if (curVal != '0') {
            (selectedField == 'upper')
                ? (upperTextEditingController.text.startsWith('-'))
                    ? upperTextEditingController.value =
                        TextEditingValue(text: curVal.substring(1))
                    : upperTextEditingController.value =
                        TextEditingValue(text: '-$curVal')
                : (lowerTextEditingController.text.startsWith('-'))
                    ? lowerTextEditingController.value =
                        TextEditingValue(text: curVal.substring(1))
                    : lowerTextEditingController.value =
                        TextEditingValue(text: '-$curVal');
          }
        } else if (val == '^') {
          upperfocus.requestFocus();
        } else if (val == 'v') {
          lowerfocus.requestFocus();
        } else {
          if (curVal == '0') {
            (selectedField == 'upper')
                ? upperTextEditingController.value =
                    TextEditingValue(text: '$val')
                : lowerTextEditingController.value =
                    TextEditingValue(text: '$val');
          } else {
            (selectedField == 'upper')
                ? upperTextEditingController.value =
                    TextEditingValue(text: '$curVal$val')
                : lowerTextEditingController.value =
                    TextEditingValue(text: '$curVal$val');
          }
        }
        if (!(val == '.')) {
          if (selectedField == 'upper') {
            calculate(upperTextEditingController.text,
                lowerTextEditingController.text, upperSel, lowerSel, 'Lower');
          } else {
            calculate(upperTextEditingController.text,
                lowerTextEditingController.text, upperSel, lowerSel, 'Upper');
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height / 12 - 5,
        width: MediaQuery.of(context).size.width / 5,
        alignment: Alignment.center,
        child: Text(
          val,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orangeAccent, width: 1.5),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (upperSel == null) {
      upperSel = dataObj.mainData[widget.mode].keys.toList()[0];
    }
    if (lowerSel == null) {
      lowerSel = dataObj.mainData[widget.mode].keys.toList()[1];
    }
    calculate(upperTextEditingController.text, lowerTextEditingController.text,
        upperSel, lowerSel, 'Lower');

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              dropDownMenu(
                  dataObj.mainData[widget.mode].keys.toList(), 'upper'),
              textField(upperTextEditingController, 'upper'),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              dropDownMenu(
                  dataObj.mainData[widget.mode].keys.toList(), 'lower'),
              textField(lowerTextEditingController, 'lower'),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: Colors.orange,
          endIndent: 10,
          indent: 10,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10),
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  numpad(context, '7'),
                  numpad(context, '8'),
                  numpad(context, '9'),
                  numpad(context, 'CE'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  numpad(context, '4'),
                  numpad(context, '5'),
                  numpad(context, '6'),
                  numpad(context, 'C'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  numpad(context, '1'),
                  numpad(context, '2'),
                  numpad(context, '3'),
                  numpad(context, '^'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  numpad(context, '+-'),
                  numpad(context, '0'),
                  numpad(context, '.'),
                  numpad(context, 'v'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
