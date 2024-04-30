class SiswaModel {
  Data? data;

  SiswaModel({this.data});

  SiswaModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nama;
  int? nis;
  String? status;
  String? jenisKelamin;
  Null tanggalMasuk;
  Null tanggalKeluar;
  GuruPembimbing? guruPembimbing;
  Jurusan? jurusan;
  Kelas? kelas;
  Alamat? alamat;
  Null dudi;
  Null pembimbingDudi;

  Data(
      {this.id,
      this.nama,
      this.nis,
      this.status,
      this.jenisKelamin,
      this.tanggalMasuk,
      this.tanggalKeluar,
      this.guruPembimbing,
      this.jurusan,
      this.kelas,
      this.alamat,
      this.dudi,
      this.pembimbingDudi});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nis = json['nis'];
    status = json['status'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalMasuk = json['tanggal_masuk'];
    tanggalKeluar = json['tanggal_keluar'];
    guruPembimbing = json['guru_pembimbing'] != null
        ? new GuruPembimbing.fromJson(json['guru_pembimbing'])
        : null;
    jurusan =
        json['jurusan'] != null ? new Jurusan.fromJson(json['jurusan']) : null;
    kelas = json['kelas'] != null ? new Kelas.fromJson(json['kelas']) : null;
    alamat =
        json['alamat'] != null ? new Alamat.fromJson(json['alamat']) : null;
    dudi = json['dudi'];
    pembimbingDudi = json['pembimbing_dudi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['nis'] = this.nis;
    data['status'] = this.status;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tanggal_masuk'] = this.tanggalMasuk;
    data['tanggal_keluar'] = this.tanggalKeluar;
    if (this.guruPembimbing != null) {
      data['guru_pembimbing'] = this.guruPembimbing!.toJson();
    }
    if (this.jurusan != null) {
      data['jurusan'] = this.jurusan!.toJson();
    }
    if (this.kelas != null) {
      data['kelas'] = this.kelas!.toJson();
    }
    if (this.alamat != null) {
      data['alamat'] = this.alamat!.toJson();
    }
    data['dudi'] = this.dudi;
    data['pembimbing_dudi'] = this.pembimbingDudi;
    return data;
  }
}

class GuruPembimbing {
  int? id;
  String? nama;
  int? nip;
  String? noTelepon;
  String? agama;
  String? jenisKelamin;
  String? tanggalLahir;
  String? tempatLahir;

  GuruPembimbing(
      {this.id,
      this.nama,
      this.nip,
      this.noTelepon,
      this.agama,
      this.jenisKelamin,
      this.tanggalLahir,
      this.tempatLahir});

  GuruPembimbing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nip = json['nip'];
    noTelepon = json['no_telepon'];
    agama = json['agama'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    tempatLahir = json['tempat_lahir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['nip'] = this.nip;
    data['no_telepon'] = this.noTelepon;
    data['agama'] = this.agama;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['tempat_lahir'] = this.tempatLahir;
    return data;
  }
}

class Jurusan {
  int? id;
  String? nama;

  Jurusan({this.id, this.nama});

  Jurusan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    return data;
  }
}

class Kelas {
  int? id;
  String? nama;
  String? tahun;
  int? idJurusan;

  Kelas({this.id, this.nama, this.tahun, this.idJurusan});

  Kelas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    tahun = json['tahun'];
    idJurusan = json['id_jurusan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['tahun'] = this.tahun;
    data['id_jurusan'] = this.idJurusan;
    return data;
  }
}

class Alamat {
  int? idSiswa;
  String? detailTempat;
  String? desa;
  String? kecamatan;
  String? kabupaten;
  String? provinsi;
  String? negara;

  Alamat(
      {this.idSiswa,
      this.detailTempat,
      this.desa,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      this.negara});

  Alamat.fromJson(Map<String, dynamic> json) {
    idSiswa = json['id_siswa'];
    detailTempat = json['detail_tempat'];
    desa = json['desa'];
    kecamatan = json['kecamatan'];
    kabupaten = json['kabupaten'];
    provinsi = json['provinsi'];
    negara = json['negara'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_siswa'] = this.idSiswa;
    data['detail_tempat'] = this.detailTempat;
    data['desa'] = this.desa;
    data['kecamatan'] = this.kecamatan;
    data['kabupaten'] = this.kabupaten;
    data['provinsi'] = this.provinsi;
    data['negara'] = this.negara;
    return data;
  }
}
