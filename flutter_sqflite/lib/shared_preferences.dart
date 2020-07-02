import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPre extends StatefulWidget {
  SharedPre({Key key}) : super(key: key);

  @override
  _SharedPreState createState() => _SharedPreState();
}

class _SharedPreState extends State<SharedPre> {

  String name;
  int password;
  bool cinsiyet;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  SharedPreferences mySharedPreferences;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((sp) =>mySharedPreferences=sp );
        
  }

  @override
  void dispose() {
    // TODO: implement dispose
    (mySharedPreferences as State).dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
       appBar:AppBar(),
       body:SingleChildScrollView(
         child:Form(
           key: formkey,
           child:Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
            Padding(padding: EdgeInsets.all(10),
            
            child: TextFormField(
              key: formkey,
              onSaved: (namevalue){
     
                   name=namevalue;


              },
              decoration:InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),labelText: "User Name")

            ),
            ),
           
           Padding(padding: EdgeInsets.all(10),
            
            child: TextFormField(
              onSaved: (passwordvalue){

              password=int.parse(passwordvalue);         //   passwordvalue  Sting tipnde geldigi için tip degeğişim yapıyoruz int.parse metoduyla

              },
              keyboardType: TextInputType.number,
              decoration:InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),labelText: "Password")

            ),
            ),
           Padding(padding: EdgeInsets.symmetric(vertical:40,horizontal:125),
           child:RadioListTile(value: true, groupValue: cinsiyet, onChanged: (gender){

                 setState(() {
                         cinsiyet=gender;
                     
                    });
             

            },title:Text("Man"),), 
           ),
            
           Padding(padding: EdgeInsets.symmetric(vertical:0,horizontal:125),
           child:RadioListTile(value: false, groupValue: cinsiyet, onChanged: (gender){

                 setState(() {
                         cinsiyet=gender;
                     
                    });
             

            },title:Text("Woman"),)),
            


            RaisedButton(onPressed: _ekle, child: Text("Ekle"),),
            
            RaisedButton(onPressed: goster, child:Text("Göster"),),


            RaisedButton(onPressed: sil,child:Text("Sil"),)
],
                                              
                                    
                                    
),
                                               
                                               
                                               
                                               
                                               
),
)
                                    
                                    
);
  
}
                                    
  void _ekle() async{
    formkey.currentState.save();
    await mySharedPreferences.setString("name",name );
    await mySharedPreferences.setInt("password", password);
    await mySharedPreferences.setBool("cinsiyet", cinsiyet);

         }
                        
void goster() {

debugPrint(mySharedPreferences.getString("name")?? "NULL");
debugPrint(mySharedPreferences.getInt("password").toString()?? "NULL");
debugPrint(mySharedPreferences.getBool("cinsiyet").toString()?? "NULL");




  }
void sil() {

  mySharedPreferences.remove("name");
    mySharedPreferences.remove("password");
      mySharedPreferences.remove("cinsiyet");
 

  }
}