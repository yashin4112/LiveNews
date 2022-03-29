// import 'dart:html';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:livenews/core/browser.dart';
import 'package:livenews/model/article.dart';
import 'package:livenews/screens/qrshow/view.dart';
import 'package:share_plus/share_plus.dart';


// stateless view for data 

class ArticleWidget extends StatefulWidget {
  final Article article;  
  const ArticleWidget({ Key? key, required this.article }) : super(key: key);

  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {

  var box = Hive.box('preference');
  var isBookmarked = false;

  bool get getIsBookmarked{
    if (box.containsKey(widget.article.url)) {
      return box.get(widget.article.url);
    } else {
      return false;
    }
  }

  void bookmarkAdded(){
    widget.article.isBookmarked = true;
    box.put(widget.article.url, widget.article.toRawJson());
    setState(() => isBookmarked = true);
  }

  void bookmarkRemoved(){
     widget.article.isBookmarked = false;
    box.put(widget.article.url, widget.article.toRawJson());
    setState(() => isBookmarked = false);
  }

  @override
  void initState() {
    setState(() => isBookmarked = widget.article.isBookmarked);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      // splashColor: Colors.grey[300],
      onTap: (){
        Browser.launchURL(widget.article.url);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: widget.article.urlToImage.toString(),
                  fit: BoxFit.cover,
                ), 
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text(
                widget.article.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
                ),
            ),
            Visibility(
              visible: widget.article.description != null,
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  widget.article.description.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.article.source.name.toString()} • ${widget.article.timeAgo}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Visibility(
                    visible: widget.article.author!=null,
                    child: Text(
                      widget.article.author.toString(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      Share.share(widget.article.url);
                    }, 
                    icon: Icon(Icons.share_outlined),
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>QRShowView(
                          data: widget.article.url, 
                          title: widget.article.title,
                        )
                        )
                      );
                    }, 
                    icon: Icon(Icons.qr_code),
                  ),
                  isBookmarked ? IconButton(
                    onPressed: bookmarkRemoved, 
                    icon: Icon(Icons.bookmark_outlined)
                  ) : IconButton(
                    onPressed: bookmarkAdded,
                    icon: Icon(Icons.bookmark_border_outlined)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

