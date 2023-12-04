import 'package:flutter/material.dart';


class Kehinde extends StatefulWidget {
  const Kehinde({super.key});

  @override
  State<Kehinde> createState() => _KehindeState();
}

class _KehindeState extends State<Kehinde> {
  TextEditingController? controller ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY screen'),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.sunny)),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            
            decoration: InputDecoration(
              hintText: 'Input something here'

            ),
          ),
        ],
      ),


    );
  }
}