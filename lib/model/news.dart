import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class News extends Equatable {

  final String name;
  final String image;
  final String content;
  final Timestamp time;
   const News({@required this.name,@required this.image,@required this.content,@required this.time});

  @override
  List<Object> get props => [name,image,content,time];
}
