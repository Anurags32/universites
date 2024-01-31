class Universities_Model {
  List<String>? webPages;
  String? stateProvince;
  List<String>? domains;
  String? country;
  String? name;
  String? alphaTwoCode;

  Universities_Model(
      {this.webPages,
      this.stateProvince,
      this.domains,
      this.country,
      this.name,
      this.alphaTwoCode});

  Universities_Model.fromJson(Map<String, dynamic> json) {
    webPages = json['web_pages'].cast<String>();
    stateProvince = json['state-province'];
    domains = json['domains'].cast<String>();
    country = json['country'];
    name = json['name'];
    alphaTwoCode = json['alpha_two_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['web_pages'] = this.webPages;
    data['state-province'] = this.stateProvince;
    data['domains'] = this.domains;
    data['country'] = this.country;
    data['name'] = this.name;
    data['alpha_two_code'] = this.alphaTwoCode;
    return data;
  }
}
