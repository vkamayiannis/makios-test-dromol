# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#route_customer_name").autocomplete({
    source: '/customers',
    delay: 500
  });
$.fn.extend {
  integrateDatepicker: (selector)->
    selector = selector || '.datepicker'
    $(@).find(selector).datepicker({format: 'dd/mm/yyyy'})
}
$(document).ready () ->
  $('body').integrateDatepicker()
