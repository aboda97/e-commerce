/*-------------------------------------------  Circle Image  -------------------------------------------------
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpg'),
                  fit: BoxFit.fill,),),),
     OR -------------->
          CircleAvatar(
            radius: 100,
            backgroundImage:AssetImage('assets/images/logo.jpg',),),
     OR -------------->
          ClipRRect(
             borderRadius: BorderRadius.circular(300.0),
                child: AssetImage('assets/images/logo.jpg'),
                fit: BoxFit.fill,),
          --------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------  Text  ----------------------------------------------------------
Text('Ahmed Aboda',
style: TextStyle(
color: Color(0xff744913),
fontSize: 30.0,
fontFamily: 'Pacifico',),),
           --------------------------------------------------------------------------------------------------------------- */
/*-----------------------  Container include icon and text with padding  --------------------------------------
Padding(
padding: const EdgeInsets.all(15.0),
child: Container(
height: 65.0,
decoration: BoxDecoration(
color: Color(0xff744913),
borderRadius: BorderRadius.circular(10.0)
),
child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,  //ده علشان ابعدهم مسافات متساوية عن بعض
children: [
Padding(
padding: const EdgeInsets.only(left: 15.0),
child: Icon(Icons.phone,
color: Color(0xffA8A8A8),
size: 34.0,
),
),
// spacer widget make space between widgets
Spacer(flex: 1,),
Text('(+20) 1023261868',
style: TextStyle(
color: Colors.black54,
fontSize: 22.0,),
),
Spacer(flex: 3,),
],
),
),
),
           --------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------  Divider  ----------------------------------------------------------
Divider(
            color: Colors.black54,
            indent: 50,              //المسافة بين الخط وجهه اليسار
            endIndent: 50,           //المسافة بين الخط وجهه اليمين
            height: 10,              //المسافه بين الخط والwidgets
            thickness: 2,            //سمك الخط
          ),
           --------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------  ListTile with Card  ----------------------------------------------------------
Card(
//خلي بالك هو اللون الطبيعي اخده ابيض ولو عاوز اغيره بغيره عادي
            margin: EdgeInsets.symmetric(horizontal: 13.0,vertical: 8.0),
            shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            child: ListTile(
              leading: Icon(Icons.phone,
                color: Color(0xffA8A8A8),
                size: 34.0,
              ),
              title: Text('(+20) 1023261868',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                ),
              ),
            ),
          )
           --------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------  ElevatedButton  -----------------------------------------------
ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      minimumSize: Size(150.0, 50.0),
                    ),
                    onPressed: (){},
                      child: Text('Add 1 Point',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      ),
                  ),
           --------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------  TextField  -----------------------------------------------
TextField(
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(''),
        labelStyle: TextStyle(
            color: Colors.white
        ),
        hintStyle: TextStyle(
          color: Colors.white
        ),
        border: OutlineInputBorder(
          // border دي الحاله الجينرال للبوردر
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          // enabledBorder دي علشان اللون يظهرلي لما بعطي لون للفورم
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    )
           --------------------------------------------------------------------------------------------------------------- */
