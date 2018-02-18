function weekPicked(){
  $("#time-entries-form").attr("action","/time_entries_sheet/" + this)
  $("#time-entries-form").submit()
}


$(document).ready(function(){

  $("#week-picker").scrollableCalendar({
      touch: false,
      startDate: "2018-02-05",
      endDate: "2018-04-01",
      currentWeek: "2018-02-19",
      onClick: weekPicked
  });

})
