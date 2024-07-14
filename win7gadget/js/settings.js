function winclosing(event) {
    if (event.closeAction == event.Action.commit) {	
		if (! event.cancel) {
			System.Gadget.Settings.writeString('showSeconds', ( $('#showSeconds').get(0).checked ? 'yes' : 'no'));
			switch ($("#sizeClock").val()) { 
				case 'sizeMin' : System.Gadget.Settings.writeString('size', '2'); break;
				case 'sizeNorm': System.Gadget.Settings.writeString('size', '3'); break;
				case 'sizeMax' : System.Gadget.Settings.writeString('size', '4'); break
			}
		}
    }
}

$(document).ready(function(){
    System.Gadget.onSettingsClosing = winclosing;
	$('#showSeconds').get(0).checked = (System.Gadget.Settings.readString('showSeconds') == 'yes');
	switch (System.Gadget.Settings.readString('size')) {
		case '2': $("#sizeClock").val('sizeMin');  break;
		case '3': $("#sizeClock").val('sizeNorm'); break;
		case '4': $("#sizeClock").val('sizeMax');  break;
	}
});