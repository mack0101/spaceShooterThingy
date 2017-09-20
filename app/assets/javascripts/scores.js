$(document).ready( function() {
  // get scores
  let scores;
  $.getJSON( 'scoreboard.json', function(res) {
    console.log(res);
    for (let s in res) {
      console.log(s);
      $('tbody').append(`<tr><td>${res[s].nickname}</td><td>${res[s].score}</td></tr>`);
    }
  });

  // for (let s in scores) {
  //   console.log(s);

})
