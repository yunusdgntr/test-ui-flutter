class Ticker {
  String? tickerCode;
  double? price;
  double? change;
  int? volume;
  String? tickerName;
  int? tickerType;
  int? currencyType;
  int? id;
  int? status;
  int? addedBy;
  String? addedDate;
  int? changedBy;
  String? changedDate;

  Ticker(
      {this.tickerCode,
      this.price,
      this.change,
      this.volume,
      this.tickerName,
      this.tickerType,
      this.currencyType,
      this.id,
      this.status,
      this.addedBy,
      this.addedDate,
      this.changedBy,
      this.changedDate});

  Ticker.fromJson(Map<String, dynamic> json) {
    tickerCode = json['tickerCode'];
    price = json['price'];
    change = json['change'];
    volume = json['volume'];
    tickerName = json['tickerName'];
    tickerType = json['tickerType'];
    currencyType = json['currencyType'];
    id = json['id'];
    status = json['status'];
    addedBy = json['addedBy'];
    addedDate = json['addedDate'];
    changedBy = json['changedBy'];
    changedDate = json['changedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tickerCode'] = this.tickerCode;
    data['price'] = this.price;
    data['change'] = this.change;
    data['volume'] = this.volume;
    data['tickerName'] = this.tickerName;
    data['tickerType'] = this.tickerType;
    data['currencyType'] = this.currencyType;
    data['id'] = this.id;
    data['status'] = this.status;
    data['addedBy'] = this.addedBy;
    data['addedDate'] = this.addedDate;
    data['changedBy'] = this.changedBy;
    data['changedDate'] = this.changedDate;
    return data;
  }
}
