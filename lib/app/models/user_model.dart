// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final Data data;

    UserModel({
        required this.data,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final int id;
    final String nama;
    final int nis;
    final String status;
    final String jenisKelamin;
    final dynamic tanggalMasuk;
    final dynamic tanggalKeluar;
    final GuruPembimbing guruPembimbing;
    final Jurusan jurusan;
    final Kelas kelas;
    final Alamat alamat;
    final dynamic dudi;
    final dynamic pembimbingDudi;

    Data({
        required this.id,
        required this.nama,
        required this.nis,
        required this.status,
        required this.jenisKelamin,
        required this.tanggalMasuk,
        required this.tanggalKeluar,
        required this.guruPembimbing,
        required this.jurusan,
        required this.kelas,
        required this.alamat,
        required this.dudi,
        required this.pembimbingDudi,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        nis: json["nis"],
        status: json["status"],
        jenisKelamin: json["jenis_kelamin"],
        tanggalMasuk: json["tanggal_masuk"],
        tanggalKeluar: json["tanggal_keluar"],
        guruPembimbing: GuruPembimbing.fromJson(json["guru_pembimbing"]),
        jurusan: Jurusan.fromJson(json["jurusan"]),
        kelas: Kelas.fromJson(json["kelas"]),
        alamat: Alamat.fromJson(json["alamat"]),
        dudi: json["dudi"],
        pembimbingDudi: json["pembimbing_dudi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nis": nis,
        "status": status,
        "jenis_kelamin": jenisKelamin,
        "tanggal_masuk": tanggalMasuk,
        "tanggal_keluar": tanggalKeluar,
        "guru_pembimbing": guruPembimbing.toJson(),
        "jurusan": jurusan.toJson(),
        "kelas": kelas.toJson(),
        "alamat": alamat.toJson(),
        "dudi": dudi,
        "pembimbing_dudi": pembimbingDudi,
    };
}

class Alamat {
    final int idSiswa;
    final String detailTempat;
    final String desa;
    final String kecamatan;
    final String kabupaten;
    final String provinsi;
    final String negara;

    Alamat({
        required this.idSiswa,
        required this.detailTempat,
        required this.desa,
        required this.kecamatan,
        required this.kabupaten,
        required this.provinsi,
        required this.negara,
    });

    factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
        idSiswa: json["id_siswa"],
        detailTempat: json["detail_tempat"],
        desa: json["desa"],
        kecamatan: json["kecamatan"],
        kabupaten: json["kabupaten"],
        provinsi: json["provinsi"],
        negara: json["negara"],
    );

    Map<String, dynamic> toJson() => {
        "id_siswa": idSiswa,
        "detail_tempat": detailTempat,
        "desa": desa,
        "kecamatan": kecamatan,
        "kabupaten": kabupaten,
        "provinsi": provinsi,
        "negara": negara,
    };
}

class GuruPembimbing {
    final int id;
    final String nama;
    final int nip;
    final String noTelepon;
    final String agama;
    final String jenisKelamin;
    final String tanggalLahir;
    final String tempatLahir;

    GuruPembimbing({
        required this.id,
        required this.nama,
        required this.nip,
        required this.noTelepon,
        required this.agama,
        required this.jenisKelamin,
        required this.tanggalLahir,
        required this.tempatLahir,
    });

    factory GuruPembimbing.fromJson(Map<String, dynamic> json) => GuruPembimbing(
        id: json["id"],
        nama: json["nama"],
        nip: json["nip"],
        noTelepon: json["no_telepon"],
        agama: json["agama"],
        jenisKelamin: json["jenis_kelamin"],
        tanggalLahir: json["tanggal_lahir"],
        tempatLahir: json["tempat_lahir"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nip": nip,
        "no_telepon": noTelepon,
        "agama": agama,
        "jenis_kelamin": jenisKelamin,
        "tanggal_lahir": tanggalLahir,
        "tempat_lahir": tempatLahir,
    };
}

class Jurusan {
    final int id;
    final String nama;

    Jurusan({
        required this.id,
        required this.nama,
    });

    factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        id: json["id"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
    };
}

class Kelas {
    final int id;
    final String nama;
    final String tahun;
    final int idJurusan;

    Kelas({
        required this.id,
        required this.nama,
        required this.tahun,
        required this.idJurusan,
    });

    factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        nama: json["nama"],
        tahun: json["tahun"],
        idJurusan: json["id_jurusan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "tahun": tahun,
        "id_jurusan": idJurusan,
    };
}
