

class sales_get{
  int sale_id;
  int order_id;
  String time_stamp;


  sales_get.fromJson(Map<String,dynamic> json){

    sale_id=json["sale_id"];
    order_id=json["order_id"];
    time_stamp=json["order_time_stamp"];
  }

  sales_get(this.sale_id,this.order_id,this.time_stamp);

  toJson() => {
    'sale_id':sale_id,
    'order_id': order_id,
    'order_time_stamp':time_stamp,


  };

}

class sales_post{
  int order_id;
  String time_stamp;
  //String order_status;


  sales_post.fromJson(Map<String,dynamic> json){
    order_id=json["order_id"];
    time_stamp=json["order_time_stamp"];
    //time_stamp=json["time_stamp"];
    //order_status=json["order_status"];

  }

  sales_post(this.order_id,this.time_stamp);

  toJson() => {

    'order_id': order_id,
    'order_time_stamp': time_stamp,



  };

}
