class MessageModel {

  late String dateTime;
  late String text;
  late String senderId;
  late String receiverId;

  MessageModel({

    required this.dateTime,
    required this.senderId,
    required this.receiverId,
    required this.text});


  MessageModel.fromJson(Map<String, dynamic>json){

    senderId = json['sender'];
    receiverId = json['receiver'];
    dateTime = json['dateTime'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {

      'sender': senderId,
      'receiver': receiverId,
      'dateTime': dateTime,
      'text': text,


    };
  }

}