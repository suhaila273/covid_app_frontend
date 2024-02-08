import 'package:covid_app/model/patient_model.dart';
import 'package:covid_app/service/patient_service.dart';
import 'package:flutter/material.dart';

class ViewPatient extends StatefulWidget {
  const ViewPatient({super.key});

  @override
  State<ViewPatient> createState() => _ViewPatientState();
}

class _ViewPatientState extends State<ViewPatient> {
  Future<List<Patient>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = CovidApiService().getData();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
          title: Text("VIEW PATIENT DETAILS",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue.shade800,
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Colors.blue.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Patient Name : "+snapshot.data![index].name),
                              subtitle: Text("Phone No : "+snapshot.data![index].phone + "\n"
                                  +"Address : "+ snapshot.data![index].address+ "\n"
                                  +"Symptoms : "+ snapshot.data![index].symptom+"\n"
                                  +"Status : "+snapshot.data![index].status
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
              else
              {
                return CircularProgressIndicator();
              }
            }),

      ),
    );
  }
}
