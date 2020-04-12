$(function () {
  $('#file').on('change', function (e) {
    // 1枚だけ表示する
    var file = e.target.files[0];

    //画像でない場合は処理終了
    if (file.type.indexOf("image") < 0) {
      alert("画像ファイルを指定してください。");
      return false;
    }

    // ファイルのブラウザ上でのURLを取得する
    var blobUrl = window.URL.createObjectURL(file);

    // img要素に表示
    $('#file-preview').attr('src', blobUrl);
  });
});
