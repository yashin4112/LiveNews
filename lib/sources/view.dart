import 'package:flutter/material.dart';
import 'package:livenews/model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class SourcesView extends StatelessWidget {
  final Article source;
  const SourcesView({ Key? key, required this.source }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        launch(source.url);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  source.urlToImage.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Text(
                source.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ),
            SizedBox(height: 5,),
            Container(
              child: Text(
                source.description.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900]
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2
              )
            ),
            SizedBox(height: 5,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      '${source.source.name} • 2h',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    )
                  ),
                  Container(
                    child: Text(
                      source.author.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    )
                  ),
                ]
              ),
            )
          ] 
        ),
      ),
    );
    
  }
}