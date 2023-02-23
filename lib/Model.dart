class Model
{
  String? name,price,cname,ccall,cadd;


  Model({this.name, this.price, this.cname, this.ccall, this.cadd});
}

class ModelData
{
  Model? m1;
  List<Model> productList =[];

  ModelData({this.m1,required this.productList});
}