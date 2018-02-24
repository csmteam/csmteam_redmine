function weekPicked(){
  $("#time-entries-form").attr("action","/time_entries_sheet/" + this)
  $("#time-entries-form").submit()
}

window.formReloaded = function(){
  $('.submit-form-button').click(submitForm)
}

function validateForm(){
  console.log("validateForm")

  var isValid = true

  $(".time-entry-input").each(function(index, element){
    var value  = $(element).val()
    if(!value){
      $(element).removeClass("red")
      return
    }
    console.log("value",value)
    var value_float = parseFloat(value)
    if(isNaN(value_float)){
      $(element).addClass("red")
      isValid = false
      return
    }

    console.log("float_value",value_float)
    if(value_float > 24.0){
      $(element).addClass("red")
      isValid = false
    } else {
      $(element).removeClass("red")
    }
  })

  return isValid

}

function submitForm(){
  if(validateForm()){
    $(".wrong-value-notice").hide()
    $(".time-entries-form").submit()
  } else {
    $(".wrong-value-notice").show()
  }
}

$(document).ready(function(){

  formReloaded()
  $("#week-picker").scrollableCalendar({
      touch: false,
      startDate: "2018-01-01",
      endDate: "2018-12-30",
      currentWeek: $("#week-picker").data("current-date"),
      onClick: weekPicked
  });

})
