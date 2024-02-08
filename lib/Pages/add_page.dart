import 'package:covid_app/service/patient_service.dart';
import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  TextEditingController name1= new TextEditingController();
  TextEditingController phone1= new TextEditingController();
  TextEditingController address1= new TextEditingController();
  TextEditingController symptom1= new TextEditingController();
  TextEditingController status1= new TextEditingController();


  void SendValuesToApi() async {

    final response = await CovidApiService().sendData(name1.text, phone1.text, address1.text, symptom1.text, status1.text);
    if(response["status"]=="success")
    {
      print("successfully added");
    }
    else
    {
      print("Error");
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("ADD PATIENT",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue.shade800,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: name1,
                  decoration: InputDecoration(
                      labelText: "Patient Name",
                      hintText: "Enter patient name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: phone1,
                  decoration: InputDecoration(
                      labelText: "Phone No",
                      hintText: "Enter phone number",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: address1,
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Enter patient address",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: symptom1,
                  decoration: InputDecoration(
                      labelText: "Symptom",
                      hintText: "Enter if any symptoms",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: status1,
                  decoration: InputDecoration(
                      labelText: "Status",
                      hintText: "Enter status of patient",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: SendValuesToApi, child: Text("ADD"))),

              ],
            ),
          ),
        ),


      ),
    );
  }
}
