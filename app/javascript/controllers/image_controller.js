import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input"];
  preview() {
    const input = this.inputTarget;
    const files = input.files;
    const imgLoc = document.getElementById("previewImgSection");
    for (let i = 0; i < files.length; i++) {
      let reader = new FileReader();
      reader.onload = function () {
        let image = document.createElement("div");
        imgLoc.appendChild(image);
        image.src = reader.result;
        image.id = "previewImg";
        image.innerHTML = `<img src='${image.src}' /><input type="button" value="刪除" data-action="click->image#delete" class="inline-flex justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2" />`;
      };
      reader.readAsDataURL(files[i]);
    }
  }
  delete(input) {}
}
