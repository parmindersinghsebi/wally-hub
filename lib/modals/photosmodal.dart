class PhotosModal {
  String imgsrc;
  String imgname;
  PhotosModal({required this.imgsrc, required this.imgname});
  static fromapp(Map<String, dynamic> photomap) {
    return PhotosModal(
        imgname: photomap['photographer'],
        imgsrc: (photomap['src'])['portrait']);
  }
}
