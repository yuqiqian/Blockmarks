var blocmetrics = {

  report: function(event_name){
    var _bm_event = {
      event_name: event_name,
    }

    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST","http://blocmetrics-yuqi.herokuapp.com//api/events.json", true);
    _bm_request.setRequestHeader('Content-Type', 'application/json');
    _bm_request.onreadystatechange = function(){};

    _bm_request.send(JSON.stringify(_bm_event));

  }
}
