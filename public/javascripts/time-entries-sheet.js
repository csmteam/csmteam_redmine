function weekPicked(){

  

  // fillHeaders(this);
  // console.log(this);
  //
  // var day = new Date(this);
  // console.log(day); // Apr 30 2000
  //
  // var nextDay = new Date(day);
  // nextDay.setDate(day.getDate()+1);
  // console.log(nextDay); // May 01 2000

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
