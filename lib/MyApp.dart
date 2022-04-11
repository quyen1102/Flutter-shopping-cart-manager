import 'package:flutter/material.dart';
import 'transaction.dart';
import 'TransactionList.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  // moi the text co mot doi tuong rieng
  final _contenController = TextEditingController();
  final _amountController = TextEditingController();
  //define states
  Transaction _transaction = Transaction();
  final List<Transaction> _listTransaction = <Transaction>[];
  void _insertTransaction() {
    if (_transaction.content!.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount!.isNaN) {
      return;
    }
    _transaction.createdDate = DateTime.now();
    _listTransaction.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contenController.text = '';
    _amountController.text = '';
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // phan giao dien cua modal sheet
        return Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Content',
                contentPadding: EdgeInsets.all(10.0),
              ),
              controller: _contenController,
              onChanged: (text) {
                setState(() {
                  _transaction.content = text;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount(money)',
                contentPadding: EdgeInsets.all(10.0),
              ),
              controller: _amountController,
              onChanged: (text) {
                setState(() {
                  _transaction.amount = double.tryParse(text) ?? 0;
                });
              },
            ),
            Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 10,
                          textStyle: const TextStyle(fontSize: 30),
                          primary: const Color.fromARGB(255, 122, 27, 27),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 10,
                          textStyle: const TextStyle(fontSize: 30),
                          primary: const Color.fromARGB(255, 16, 104, 70),
                        ),
                        onPressed: () {
                          setState(() {
                            _insertTransaction();
                            // print(_transaction.createdDate);
                          });
                        },
                        child: const Text(
                          'SAVE',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaction manager',
              style: TextStyle(fontSize: 18, fontFamily: 'Roboto')),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  _onButtonShowModalSheet();
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add transtaction',
          onPressed: () {
            _onButtonShowModalSheet();
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green[900],
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
                scrollDirection:
                    Axis.vertical, // xac dinh scroll theo chieu doc
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      // ButtonTheme(
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         primary: Colors.green,
                      //         minimumSize: const Size.fromHeight(50)),
                      //     onPressed: () {
                      //       _onButtonShowModalSheet();
                      //     },
                      //     child: const Text(
                      //       'Add',
                      //       style: TextStyle(fontSize: 24),
                      //     ),
                      //   ),
                      // ),
                      // const Padding(
                      //     padding: EdgeInsets.symmetric(vertical: 10)),
                      // // build listtile with class TransactionList
                      TransactionList(transactionList: _listTransaction),
                    ]))));
  }
}
