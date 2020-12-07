

class orders_get{
  int order_id;
  int customer_id;
  String hash;
  String time_stamp;
  String order_status;
  

  orders_get.fromJson(Map<String,dynamic> json){
   
    order_id=json["order_id"];
    customer_id=json["customer_id"];
    hash=json["hash"];
    time_stamp=json["time_stamp"];
    order_status=json["order_status"];
  }
  
  orders_get(this.order_id,this.customer_id,this.hash,this.time_stamp,this.order_status);

  toJson() => {
    'order_id':order_id,
    'customer_id': customer_id,
    'hash': hash,
    'time_stamp':time_stamp,
    'order_status':order_status,
    
    
      };

}

class orders_post{
  int customer_id;
  String hash;
  String time_stamp;
  String order_status;
  

  orders_post.fromJson(Map<String,dynamic> json){
    customer_id=json["customer_id"];
    hash=json["hash"];
    time_stamp=json["time_stamp"];
    order_status=json["order_status"];
   
  }
  
  orders_post(this.customer_id, this.hash,this.time_stamp,this.order_status);

  toJson() => {
    'hash': hash,
    'customer_id': customer_id,
    'time_stamp': time_stamp,
    'order_status': order_status,
    
    
      };

}
