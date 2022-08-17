import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function fun;

  NewTransaction(this.fun);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //const NewTransaction({Key? key}) : super(key: key);
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    widget.fun(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop() ;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                  labelText: "Title: ",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                      width: 3,
                    ),
                  ),
                ),
                controller: titleController,
                // onChanged: (val){
                //   titleInput = val ;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                  labelText: "Amount: ",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                      width: 3,
                    ),
                  ),
                ),
                controller: amountController,
                // onChanged: (val){
                //   amountInput = val ;
                // },
              ),
            ),
            FlatButton(
              onPressed: () {
                widget.fun(
                  titleController.text,
                  double.parse(amountController.text),
                );
                print(titleController.text);
                print(amountController.text);
              },
              textColor: Colors.red,
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
