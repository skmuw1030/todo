// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

document.addEventListener("turbo:load", () => {
  const fieldTitle =document.getElementById("title-field");
  const countTitle =document.getElementById("title-count");

  if (fieldTitle) {
    fieldTitle.addEventListener("input", () => {
      countTitle.innerText = fieldTitle.value.length + " / 20";
    });
  }
});

document.addEventListener("turbo:load", () => {
  const fieldMemo =document.getElementById("memo-field");
  const countMemo =document.getElementById("memo-count");

  if (fieldMemo) {
    fieldMemo.addEventListener("input", () => {
      countMemo.innerText = fieldMemo.value.length + " / 500";
    });
  }
});