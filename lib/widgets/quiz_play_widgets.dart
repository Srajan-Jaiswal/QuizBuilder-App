import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;
  OptionTile(
      {@required this.optionSelected,@required this.correctAnswer,@required this.description,@required this.option});
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
             width: 25,
            height: 25,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: (widget.description==widget.optionSelected) ? // if description of option and selected option is equal
                      widget.optionSelected == widget.correctAnswer ? // doing that option green 
                      Colors.green:Colors.red:
                      Colors.grey, width: 1.5,            // else leave the option grey
                      
                      ),
                      borderRadius: BorderRadius.circular(30)),
                      alignment: Alignment.center,
              child: Text("${widget.option}",
                  style: TextStyle(color:widget.optionSelected == widget.description? //check the one for which user is interated with 
                  widget.correctAnswer==widget.optionSelected?  // if the user is interated with the option then it becomes geen or blue
                  Colors.green:Colors.red:Colors.grey)  // else it become grey
                  )),
                  SizedBox(width:8,),

                  Text(widget.description,style:TextStyle(fontSize:17, fontWeight: FontWeight.w400,color: Colors.black),)
        ],
      ),
    );
  }
}
   
  // In this tile we have to make the questions options 4 times with spaces and text   

