function selectReminderColorOnLoad() {
  var color = $("#reminder_color").val()
  resetReminderColorSelection()
  selectReminderColor(color)
}
function resetReminderColorSelection() {
  $(".colors .color").each(function() { $(this).removeClass("selected") })
}
function selectReminderColor(color) {
  $(".color.[data-color="+color+"]").addClass("selected")
  $("#reminder_color").val(color)
}
function updateFieldOnReminderColorChange(color) {
  resetReminderColorSelection()
  selectReminderColor(color)
}

$(function() {
  //select right color on load
  selectReminderColorOnLoad()
  //update hidden field when clicking a color
  $(".color").on("click", function() {
    updateFieldOnReminderColorChange($(this).data("color"))
  })
})
