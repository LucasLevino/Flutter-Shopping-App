import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterloja/bloc/utils.dart';
//import 'ui/android/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyhomePage(),
    );
  }
}

class MyhomePage extends StatefulWidget {
  MyhomePage({Key key}) : super(key : key);

  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            customAppBar(),
            productsHolder(),
            productsHolder(),

          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Container(
      color: Colors.pink[200],
      padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Linha Inicial
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Icon(
                Icons.menu,
               size: 32,
               color: Colors.white
              ),
              Icon(
                Icons.shopping_cart,
               size: 32,
               color: Colors.white
              )
            ],
          ),
          SizedBox(
            height: 28,
          ),
          _searchBox(),

          SizedBox(
            height: 32,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              menuText(Icons.check_box, 'Upp Stores'),
              menuText(Icons.filter_list, 'Filter'),
              menuText(Icons.arrow_upward, 'Popularity'),
            ],
          )
        ],    
      ),
    );
  }

  Widget _searchBox() {
    return TextField(
      textAlign: TextAlign.left,
      controller: null,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'vestido Feminino',
          hintStyle: TextStyle(
            fontSize: 18,
          color: Colors.black12
          ),
            prefixIcon: Icon(
              Icons.search,
             size: 26,
            color: Colors.grey[700]
            ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  )
              ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
    );
  }

  Widget menuText(icon, title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(icon,size: 22, color: Colors.grey[100]),
        SizedBox(
          width: 4
        ),
        Text(title, style: TextStyle(
          color: Colors.grey[100],
          fontSize: 18, fontWeight: FontWeight.w400
        ),)
      ],
    );
  }
}

Widget productsHolder() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(top: 24, left: 24, bottom: 24),
    margin: EdgeInsets.only(top: 8, bottom: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          spreadRadius: 4,
        )
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Categorias', style: TextStyle(
          color:  Colors.brown[900],
          fontSize: 20,
          fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 12),

        Text('Segundo texto aqui', style: TextStyle(
          color: Colors.brown[600],
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),),

        SizedBox(height: 12),  

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            shopRating(),
            SizedBox(width: 4),  
            Text('000 Comentarios', style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.brown[800]
              )
            )
          ],
        ),
      
        SizedBox(height: 12),

        Container(
          height: 400,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              singleProduct(imageOne),
              singleProduct(imageTwo),
              singleProduct(imageThree),
            ],
          ),
        )

      ],
    ),
  );
}
// Rating Stars             
Widget shopRating() {
  return RatingBar(
    onRatingUpdate: null,
    ignoreGestures: true,
    itemSize: 24,
    initialRating: 3,
    minRating: 1,
    direction: Axis.horizontal,
    itemCount: 5,
    itemPadding: EdgeInsets.only(left:4),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.brown[600],
    ),
  );
}

Widget singleProduct(imageUrl) {
  return Container(
   width: 200,
   margin: EdgeInsets.only(left: 8, right: 8),
   child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[300],
          ),
          child: Image.network(
            imageUrl, 
            height:300, 
            width: 200, 
            fit: BoxFit.contain,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Texto Produto', style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.brown[800],
              fontSize: 18,
            ),),
            Icon(Icons.bookmark_border, color: Colors.grey[800], size: 22),   
          ],
        ),

        SizedBox(height: 6),

        Text('Lista de Produtos 2', style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.brown[900],
          fontSize: 16,
        ),),

        SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('R\$300', style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
            Text('R\$600', style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.lineThrough,
            )),
            Text('15% Off', 
              style: TextStyle(
              color: Colors.red[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ))
          ],
        )
      ],
   ),
  );
}