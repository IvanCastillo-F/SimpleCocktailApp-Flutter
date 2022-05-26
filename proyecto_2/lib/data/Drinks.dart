class Drinks {
  String? idDrink;
  String? strDrink;
  String? strCategory;
  String? strAlcoholic;
  String? strInstructions;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;

  Drinks(
      {this.idDrink,
      this.strDrink,
      this.strCategory,
      this.strAlcoholic,
      this.strInstructions,
      this.strDrinkThumb,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5
      });

  Drinks.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strCategory = json['strCategory'];
    strAlcoholic = json['strAlcoholic'];
    strInstructions = json['strInstructions'];
    strDrinkThumb = json['strDrinkThumb'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strIngredient5 = json['strIngredient5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDrink'] = this.idDrink;
    data['strDrink'] = this.strDrink;
    data['strCategory'] = this.strCategory;
    data['strAlcoholic'] = this.strAlcoholic;
    data['strInstructions'] = this.strInstructions;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['strIngredient1'] = this.strIngredient1 ?? "";
    data['strIngredient2'] = this.strIngredient2 ?? "";
    data['strIngredient3'] = this.strIngredient3 ?? "";
    data['strIngredient4'] = this.strIngredient4 ?? "";
    data['strIngredient5'] = this.strIngredient5 ?? "";
    return data;
  }
}
