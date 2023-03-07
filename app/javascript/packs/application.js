// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"
require("jquery")

Rails.start()
Turbolinks.start()

$(document).ready(function () {
    $('.throw-btn-js').click(function(e) {
       e.preventDefault();
       e.stopPropagation();
       let href = $(this).attr('href').split('?')[0];
       let value = $(this).data('value');
       $.post(href, {_method: 'post', remote: true, value: value}, null, 'script');
    });
});
