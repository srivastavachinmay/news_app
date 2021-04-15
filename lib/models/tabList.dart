import 'package:flutter/material.dart';
import 'package:news_app/models/categoryEnum.dart';

class TabList{
  List<Tab> tabList = [
    Tab(
        child: Chip(
            backgroundColor: Colors.teal,
            label: Text(
              CategoryEnum.values[0]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.greenAccent,
            label: Text(
              CategoryEnum.values[1]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[2]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.redAccent,
            label: Text(
              CategoryEnum.values[3]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[4]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[5]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[6]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
  ];
}