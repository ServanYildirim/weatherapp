class SearchCityResponseModel {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;

  SearchCityResponseModel({this.name, this.localNames, this.lat, this.lon, this.country});

  SearchCityResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null ? LocalNames.fromJson(json['local_names']) : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (localNames != null) {
      data['local_names'] = localNames!.toJson();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    return data;
  }
}

class LocalNames {
  String? de;
  String? it;
  String? es;
  String? sr;
  String? bo;
  String? mr;
  String? zh;
  String? mk;
  String? yi;
  String? ru;
  String? ml;
  String? tg;
  String? eo;
  String? bg;
  String? fa;
  String? ug;
  String? av;
  String? sv;
  String? eu;
  String? pt;
  String? ku;
  String? el;
  String? te;
  String? mn;
  String? gl;
  String? bn;
  String? ka;
  String? ky;
  String? he;
  String? ps;
  String? ko;
  String? tt;
  String? tr;
  String? nl;
  String? ar;
  String? ie;
  String? os;
  String? uk;
  String? th;
  String? oc;
  String? kn;
  String? la;
  String? hi;
  String? hy;
  String? ab;
  String? pl;
  String? br;
  String? ja;
  String? fr;
  String? kk;
  String? en;
  String? ta;
  String? be;
  String? no;
  String? mi;
  String? am;
  String? hu;
  String? ur;

  LocalNames({
    this.de,
    this.it,
    this.es,
    this.sr,
    this.bo,
    this.mr,
    this.zh,
    this.mk,
    this.yi,
    this.ru,
    this.ml,
    this.tg,
    this.eo,
    this.bg,
    this.fa,
    this.ug,
    this.av,
    this.sv,
    this.eu,
    this.pt,
    this.ku,
    this.el,
    this.te,
    this.mn,
    this.gl,
    this.bn,
    this.ka,
    this.ky,
    this.he,
    this.ps,
    this.ko,
    this.tt,
    this.tr,
    this.nl,
    this.ar,
    this.ie,
    this.os,
    this.uk,
    this.th,
    this.oc,
    this.kn,
    this.la,
    this.hi,
    this.hy,
    this.ab,
    this.pl,
    this.br,
    this.ja,
    this.fr,
    this.kk,
    this.en,
    this.ta,
    this.be,
    this.no,
    this.mi,
    this.am,
    this.hu,
    this.ur,
  });

  LocalNames.fromJson(Map<String, dynamic> json) {
    de = json['de'];
    it = json['it'];
    es = json['es'];
    sr = json['sr'];
    bo = json['bo'];
    mr = json['mr'];
    zh = json['zh'];
    mk = json['mk'];
    yi = json['yi'];
    ru = json['ru'];
    ml = json['ml'];
    tg = json['tg'];
    eo = json['eo'];
    bg = json['bg'];
    fa = json['fa'];
    ug = json['ug'];
    av = json['av'];
    sv = json['sv'];
    eu = json['eu'];
    pt = json['pt'];
    ku = json['ku'];
    el = json['el'];
    te = json['te'];
    mn = json['mn'];
    gl = json['gl'];
    bn = json['bn'];
    ka = json['ka'];
    ky = json['ky'];
    he = json['he'];
    ps = json['ps'];
    ko = json['ko'];
    tt = json['tt'];
    tr = json['tr'];
    nl = json['nl'];
    ar = json['ar'];
    ie = json['ie'];
    os = json['os'];
    uk = json['uk'];
    th = json['th'];
    oc = json['oc'];
    kn = json['kn'];
    la = json['la'];
    hi = json['hi'];
    hy = json['hy'];
    ab = json['ab'];
    pl = json['pl'];
    br = json['br'];
    ja = json['ja'];
    fr = json['fr'];
    kk = json['kk'];
    en = json['en'];
    ta = json['ta'];
    be = json['be'];
    no = json['no'];
    mi = json['mi'];
    am = json['am'];
    hu = json['hu'];
    ur = json['ur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['de'] = de;
    data['it'] = it;
    data['es'] = es;
    data['sr'] = sr;
    data['bo'] = bo;
    data['mr'] = mr;
    data['zh'] = zh;
    data['mk'] = mk;
    data['yi'] = yi;
    data['ru'] = ru;
    data['ml'] = ml;
    data['tg'] = tg;
    data['eo'] = eo;
    data['bg'] = bg;
    data['fa'] = fa;
    data['ug'] = ug;
    data['av'] = av;
    data['sv'] = sv;
    data['eu'] = eu;
    data['pt'] = pt;
    data['ku'] = ku;
    data['el'] = el;
    data['te'] = te;
    data['mn'] = mn;
    data['gl'] = gl;
    data['bn'] = bn;
    data['ka'] = ka;
    data['ky'] = ky;
    data['he'] = he;
    data['ps'] = ps;
    data['ko'] = ko;
    data['tt'] = tt;
    data['tr'] = tr;
    data['nl'] = nl;
    data['ar'] = ar;
    data['ie'] = ie;
    data['os'] = os;
    data['uk'] = uk;
    data['th'] = th;
    data['oc'] = oc;
    data['kn'] = kn;
    data['la'] = la;
    data['hi'] = hi;
    data['hy'] = hy;
    data['ab'] = ab;
    data['pl'] = pl;
    data['br'] = br;
    data['ja'] = ja;
    data['fr'] = fr;
    data['kk'] = kk;
    data['en'] = en;
    data['ta'] = ta;
    data['be'] = be;
    data['no'] = no;
    data['mi'] = mi;
    data['am'] = am;
    data['hu'] = hu;
    data['ur'] = ur;
    return data;
  }
}
