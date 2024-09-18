class number{
  String? NumberPlate;
  String? Make;
  String? Model;
  String? State;
  String? Year;

  number({
    this.NumberPlate,
    this.Make,
    this.Model,
    this.State,
    this.Year
  });

  number.fromJson(Map<String,dynamic>json){
    NumberPlate=json['NumberPlate'];
    Make=json['Make'];
    Model=json['Model'];
    State=json['State'];
    Year=json['Year'];

  }
}