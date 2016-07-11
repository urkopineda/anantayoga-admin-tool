function load_search(s, t) {
	$(s).keyup(function () {
		var data = this.value.split(" ");
		var jo = $(t).find("tr");
		if (this.value == "") {
			jo.show();
			return;
		}
		jo.hide();
		jo.filter(function (i, v) {
		var $t = $(this);
		for (var d = 0; d < data.length; ++d) {
			if ($t.text().toLowerCase().indexOf(data[d].toLowerCase()) > -1) {
				return true;
			} else if (normalize($t.text().toLowerCase()).indexOf(data[d].toLowerCase()) > -1) {
				return true;
			}
		}
		return false;
		})
		.show();
	});
}
var normalize = (function() {
	var from = "ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç";
	var to = "AAAAAEEEEIIIIOOOOUUUUaaaaaeeeeiiiioooouuuunncc";
	var mapping = {};
	for (var i = 0, j = from.length; i < j; i++)
		mapping[from.charAt(i)] = to.charAt(i);
	return function(str) {
		var ret = [];
		for (var i = 0, j = str.length; i < j; i++) {
			var c = str.charAt(i);
			if (mapping.hasOwnProperty(str.charAt(i)))
				ret.push(mapping[c]);
			else
				ret.push(c);
		}
		return ret.join('');
	}
})();
