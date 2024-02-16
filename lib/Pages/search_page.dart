import 'package:covid_app/service/patient_service.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController name2=new TextEditingController();
  List<Map<String,dynamic>> searchResult=[];

  void searchPatient() async{
    final response = await CovidApiService().searchData(name2.text);

    setState(() {
      print(response);
      searchResult=List<Map<String,dynamic>>.from(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("SEARCH PATIENT",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextField(
                controller: name2,
                decoration: InputDecoration(
                  labelText: "Patient Name",
                  hintText: "Enter patient name to be searched",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: searchPatient, 
                      icon: Icon(Icons.search))
                ),
              ),
              SizedBox(height: 20,),
              Expanded(child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder:(context,index){
                    return Card(
                      child: ListTile(
                        title: Text("Name: ${searchResult[index]['name']}"),
                        subtitle: Text("Phone: ${searchResult[index]['phone']}\n"
                            "Address: ${searchResult[index]['address']}\n"
                            "Symptom: ${searchResult[index]['symptom']}\n"
                            "Status: ${searchResult[index]['status']}"),
                      ),
                    );
                  } ))
            ],
          ),
        ),
      ),
    );
  }
}
