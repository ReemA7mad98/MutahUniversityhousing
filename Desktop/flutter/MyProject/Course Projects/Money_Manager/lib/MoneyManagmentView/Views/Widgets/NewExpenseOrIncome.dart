import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helloworld/MoneyManagmentView/providers/money_provider.dart';
import 'package:provider/provider.dart';

import '../../data/Categories.dart';
import '../../models/CategoriesChoice.dart';
import '../Screen/CategoryScreen.dart';
import '../Screen/calculater.dart';
import 'SelectCategory.dart';

class NewExpenseOrIncome extends StatefulWidget {
  late String? type;
  NewExpenseOrIncome(this.type);
  @override
  State<NewExpenseOrIncome> createState() => _NewExpenseOrIncomeState(type);
}

class _NewExpenseOrIncomeState extends State<NewExpenseOrIncome> {
  late String? type;
  _NewExpenseOrIncomeState(this.type);
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int lettersCounter = 0;
  late DateTime today;
  void initState() {
    // TODO: implement initState
    super.initState();

    today = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != today) {
      setState(() {
        today = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, provider, x) {
      return SingleChildScrollView(
          child: Container(
              height: 1500.h,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Center(
                    child: Row(children: [
                  SizedBox(width: 108.w),
                  //متغيرة حسب المستخدم البيانات المخزنة في قاعدة البيانات

                  Ink(
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => Calculater(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "image/Calculater.png",
                            fit: BoxFit.cover,
                            height: 80.h,
                          ))),

                  Text(' ILS',
                      style: new TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Noto Naskh Arabic",
                          fontSize: 32.0)),
                  Expanded(
                      child: Form(
                          child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        controller.text = '0';
                        return 'أدخل مبلغ المعاملة';
                      }
                    },
                    textAlign: TextAlign.center,
                    controller: controller,
                    style: new TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Noto Naskh Arabic",
                        fontSize: 28.0),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 50, 136, 99)),
                      ),
                    ),
                  ))),
                  SizedBox(width: 176.w),
                ])),
                SizedBox(height: 63.h),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('حساب\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 138, 139, 131),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 22.0)),
                    Text('رئيسي\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 50, 136, 99),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 28.0)),
                    Text('الفئات\n',
                        style: new TextStyle(
                            color: Color.fromARGB(255, 138, 139, 131),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Noto Naskh Arabic",
                            fontSize: 22.0)),
                    SizedBox(
                        height: 443.h,
                        child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2.0,
                            children: List.generate(
                                type == 'Expense'
                                    ? Expensechoices.length - 6
                                    : Incomechoices.length, (index) {
                              if ((index == 3 && type == 'Expense')) {
                                return Ink(
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  CategoryScreen(type!),
                                            ),
                                          );
                                          provider.setBackColor();
                                        },
                                        child: Center(
                                          child: SelectCard(
                                              choice: Choice(
                                                  title: 'أكثر',
                                                  icon: 'image/plus.png',
                                                  colorsValues: {
                                                    'r': 164,
                                                    'g': 183,
                                                    'b': 177
                                                  }),
                                              pageName: 'default'),
                                        )));
                              }
                              if (type == 'Expense') {
                                return Ink(
                                    child: InkWell(
                                  child: Center(
                                    child: SelectCard(
                                        choice: Expensechoices[index],
                                        pageName: 'default'),
                                  ),
                                ));
                              } else {
                                if (index == 3 && type == 'Income') {
                                  return Center();
                                } else if (index == 4 && type == 'Income') {
                                  return Ink(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    CategoryScreen(type!),
                                              ),
                                            );
                                            provider.setBackColor();
                                          },
                                          child: Center(
                                            child: SelectCard(
                                                choice: Choice(
                                                    title: 'أكثر',
                                                    icon: 'image/plus.png',
                                                    colorsValues: {
                                                      'r': 164,
                                                      'g': 183,
                                                      'b': 177
                                                    }),
                                                pageName: 'default'),
                                          )));
                                } else {
                                  return Ink(
                                      child: InkWell(
                                          child: Center(
                                    child: SelectCard(
                                        choice: Incomechoices[index],
                                        pageName: 'default'),
                                  )));
                                }
                              }
                            }))),
                    SizedBox(
                        child: Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: Image.asset(
                                      'image/Calender.png',
                                      height: 60.h,
                                      width: 63.w,
                                    ))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 130.h,
                                        width: 160.w,
                                        child: Center(
                                            child: Text(
                                          today.month!.toString() +
                                              '/' +
                                              today.day!.toString() +
                                              '\nالأخير',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 138, 139, 131),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Noto Nask Arabic',
                                              fontSize: 18),
                                        ))))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 130.h,
                                        width: 160.w,
                                        child: Center(
                                            child: Text(
                                                today.month!.toString() +
                                                    '/' +
                                                    (today.day! - 1)
                                                        .toString() +
                                                    '\nأمس',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 138, 139, 131),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'Noto Nask Arabic',
                                                    fontSize: 18)))))),
                            Expanded(child: SizedBox()),
                            Ink(
                                child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 130.h,
                                        width: 160.w,
                                        child: Center(
                                            child: Text(
                                          today.month!.toString() +
                                              '/' +
                                              today.day!.toString() +
                                              '\nاليوم',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 138, 139, 131),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Noto Nask Arabic',
                                              fontSize: 18),
                                        ))))),
                          ],
                        ),
                        width: double.infinity),
                    Text('تعليق',
                        style: TextStyle(
                            fontFamily: 'Noto Nask Arabic', fontSize: 18)),
                    Container(
                        margin: EdgeInsets.all(25),
                        child: Form(
                            child: TextFormField(
                          onChanged: (value) {
                            lettersCounter = value.length;
                            setState(() {});
                          },
                          textAlign: TextAlign.end,
                          // controller: controller2,
                          style: new TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "Noto Naskh Arabic",
                              fontSize: 20.0),
                          decoration: InputDecoration(
                            hintText: 'تعليق',
                            hintStyle: TextStyle(
                                fontFamily: "Noto Naskh Arabic",
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 204, 205, 197)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 158, 175, 176)),
                            ),
                          ),
                        ))),
                    Row(
                      children: [
                        Text('       ' + lettersCounter.toString() + '/4096'),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Center(
                        child: Container(
                      width: 409.w,
                      height: 89.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(41),
                          color: Color.fromARGB(255, 249, 250, 244),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 228, 234, 224),
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(41),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(
                                  255, 253, 194, 42), // Background color
                              // Text Color (Foreground color)
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('ExpensesScreen');
                            },
                            child: Text(
                              'إضافة',
                              style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 77, 79, 66),
                                fontFamily: 'Noto Naskh Arabic',
                              ),
                            ),
                          )),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 35.h,
                    )),
                  ],
                ))
              ])));
    });
  }
}
