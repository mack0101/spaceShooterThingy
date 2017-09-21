$(document).ready( function() {
  // get scores
  $.getJSON( 'scoreboard.json', function(res) {
    console.log(res);
    for (let s in res[0]) {
      $('tbody').append(`<tr><td>${parseInt(s) + parseInt(1)}</td><td>${res[0][s].nickname}</td><td>${res[0][s].score}</td></tr>`);
    }
    colorCells();
  });

  // color cells
  function colorCells() {
    let colors = ['#f80c12', '#ff4422', '#feae2d', '#ccbb33', '#aacc22', '#69d025',
    '#22ccaa', '#12bdb9', '#4444dd', '#442299'];
    
    let rows = $('table tbody tr');

    for (let i = 0; i < rows.length; i++) {
      $(rows[i]).css('background-color', colors[i]);
    }
  }

  // update game count
  function getGameCount() {
    $.getJSON( 'scoreboard.json', function(res) {
      $('#gameCounter').html(`Total Games Played: ${res[1]}`);
    })
  }
  setInterval( getGameCount, 2000);
})
