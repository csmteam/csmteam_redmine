function weekPicked(){
  window.alert(this);
}

$(document).ready(function(){

  $("#week-picker").scrollableCalendar({
      touch: false,
      startDate: "2016-01-01",
      endDate: "2018-03-18",
      currentWeek: "2018-02-18",
      onClick: weekPicked
  });

})
