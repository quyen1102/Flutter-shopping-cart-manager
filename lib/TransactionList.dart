import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  List<Transaction> transactionList;
  TransactionList({Key? key, required this.transactionList})
      : super(key: key); // contructor

  // hafm build list dùng map qua từng phần tử và in ra
  // List<Widget> _buildWidgetList() {
  //   int index = 0;
  //   return transactionList.map((transaction) {
  //     index++;
  //     return Card(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         color: (index - 1) % 2 == 0
  //             ? const Color.fromARGB(255, 61, 38, 135)
  //             : const Color.fromARGB(255, 26, 113, 60),
  //         elevation: 5,
  //         // margin: const EdgeInsets.all(5),
  //         child: ListTile(
  //           leading: const Icon(Icons.access_alarm),
  //           title: Text(
  //             '${transaction.content}',
  //             style: const TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.w600,
  //                 color: Color.fromARGB(255, 215, 215, 215)),
  //           ),
  //           subtitle: Text(
  //             'Price: \$${transaction.amount}',
  //             style: const TextStyle(color: Color.fromARGB(255, 215, 215, 215)),
  //           ),
  //           onTap: () {},
  //           trailing: const Icon(
  //             Icons.more_vert,
  //           ),
  //         ));
  //   }).toList();
  // }

  // Build ra list dùng list ListView
  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: (index) % 2 == 0
                ? const Color.fromARGB(255, 61, 38, 135)
                : const Color.fromARGB(255, 26, 113, 60),
            elevation: 5,
            // margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    // const Padding(padding: EdgeInsets.all(10)),
                    Text(
                      '${transactionList[index].content}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 215, 215, 215)),
                    ),
                    Text(
                      'Date: ${DateFormat.yMd().format(transactionList[index].createdDate as DateTime)}',
                      // '${transactionList[index].createdDate}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '\$${transactionList[index].amount}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 215, 215, 215)),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 10)),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  // String getCurrentDate(int index) {
  //   transactionList[index].createdDate = DateTime.now().toString() as DateTime?;
  //   var dateParse = DateTime.parse(date);
  //   var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  //   return formattedDate.toString();
  // }

  @override
  Widget build(BuildContext context) {
    // 1. ListView(chidren: <Widget>[]) => this load all children at the same
    //2. ListView(itemBuilder: ...) => this load only visible items
    return SizedBox(
      height: 600,
      child: _buildListView(),
    );
  }
}
