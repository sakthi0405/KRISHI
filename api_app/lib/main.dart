import 'dart:convert';
import 'package:fullscreen/fullscreen.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
  
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
  
    home: BodyLayout(),
      
    );
  }
}
class BodyLayout extends StatefulWidget {
  const BodyLayout({ Key? key }) : super(key: key);

  @override
  _BodyLayoutState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.white,
    appBar:AppBar(backgroundColor:Colors.white ,
    title: Text("Wallpaper API",
    style: TextStyle(color: Colors.purple),),
    actions: [
      Padding(padding:EdgeInsets.symmetric(
        horizontal: 16),
        child: Icon(Icons.search,
        color:Colors.purple),)
    ],),
    
  //body

  body: WallPaper(),
      
    );
  }
}
class WallPaper extends StatefulWidget {
  const WallPaper({ Key? key }) : super(key: key);

  @override
  _WallPaperState createState() => _WallPaperState();
}

class _WallPaperState extends State<WallPaper> {
  List images=[];
  int page=1;

  get http => null;
  @override
  void initState(){
    super.initState();
    fetchapi();
  }
fetchapi() async{
  await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
  headers:{
     'Authorization':
              '563492ad6f9170000100000159006c2fce414f90b3712bfd5c13c971 '

  }).then((value){
    Map result=jsonDecode(value.body);
    setState(() {
      images=result['photos'];
    });
    print(images[0]);
  });
}
 loadmore() async {
    setState(() {
      page = page + 1;
    });

 String url =
        'https://api.pexels.com/v1/curated?per_page=80&page=' + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization: 563492ad6f9170000100000159006c2fce414f90b3712bfd5c13c971'
}).then(
        (value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }




  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FullScreen(
                                        imageurl: images[index]['src']['large2x'],
                                      )));
                        },
                        child: Container(
                          color: Colors.white,
                          child: ClipRRect(borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            images[index]['src']['tiny'],
                            fit: BoxFit.cover,
                          ),)
                        ),
                      );
                    }),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              loadmore();
            },
            child: Container(
              height: 60,
              width: double.infinity,
             
              child: Center(
                child: Text('Load More',
                    style: TextStyle(fontSize: 20, color: Colors.purple)),
              ),
            ),
          )
        ],
      ),

      
    );
  }
}
class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({Key? key, required this.imageurl}) : super(key: key);
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async {
    var WallpaperManager;
    int location = WallpaperManager.HOME_SCREEN;

    var file = await newMethod().getSingleFile(widget.imageurl);
    final String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  newMethod() => DefaultCacheManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.network(widget.imageurl),
            ),
          ),
          InkWell(
            onTap: () {
              setwallpaper();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              
              child: Center(
                child: Text('Set Wallpaper',
                    style: TextStyle(fontSize: 20, color: Colors.purple)),
              ),
            ),
          )
        ],
      )),
    );
  }

  DefaultCacheManager() {}
}
