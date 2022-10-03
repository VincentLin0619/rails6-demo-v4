window.Dropzone = require("dropzone");

Dropzone.options.myDropzone = {
  paramName: "file",
  maxFilesize: 2,
  acceptedFiles: "image/*",
  init: function () {
    this.on("complete", function (file) {
      location.reload();
    });
  },
};
