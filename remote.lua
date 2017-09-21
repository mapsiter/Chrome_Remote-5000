local keyboard = libs.keyboard;
local win = libs.win;
local device = libs.device;

events.detect = function ()
	return 
		libs.fs.exists("C:\\Program Files (x86)\\Google\\Chrome") or
		libs.fs.exists("C:\\Program Files\\Google\\Chrome");
end

--@help Focus Chrome application
actions.switch = function()
	if OS_WINDOWS then
		local hwnd = win.window("chrome.exe");
		if (hwnd == 0) then actions.launch(); end
		win.switchtowait("chrome.exe");
	end
end

--@help Launch Chrome application
actions.launch = function()
	if OS_WINDOWS then
		os.start("chrome");
	end
end

--@help Lower system volume
actions.volume_down = function()
	keyboard.press("volumedown");
end

--@help Raise system volume
actions.volume_up = function()
	keyboard.press("volumeup");
end

--@help Force system shutdown
--@param sec:number Timeout in seconds (default 5)
actions.shutdown = function (sec)
	if not sec then sec = 5; end
	os.execute("shutdown /s /f /t " .. sec);
end

--@help Naviagte back
actions.back = function()
	actions.switch();
	keyboard.stroke("menu", "left");
end

--@help Close current tab
actions.close_tab = function()
	actions.switch();
	keyboard.stroke("control", "W");
end

--@help Navigate forward
actions.forward = function()
	actions.switch();
	keyboard.stroke("menu", "right");
end

--@help Go to next tab
actions.next_tab = function()
	actions.switch();
	keyboard.stroke("control", "tab");
end

--@help Go to previous tab
actions.previous_tab = function()
	actions.switch();
	keyboard.stroke("control", "shift", "tab");
end

--@help Open new tab
actions.new_tab = function()
	actions.switch();
	keyboard.stroke("control", "T");
end

--@help Type address
actions.address = function()
	actions.switch();
	keyboard.stroke("control", "L");
	device.keyboard();
end

--@help Go to home page
actions.home = function()
	actions.switch();
	keyboard.stroke("menu", "home");
end

--@help Find on current page
actions.find = function()
	actions.switch();
	keyboard.stroke("control", "F");
	device.keyboard();
end

--@help Fullscreen view
actions.fullscreen = function()
	keyboard.stroke("f");
end

--@help Zoom page in
actions.zoom_in = function()
	actions.switch();
	keyboard.stroke("control", "oem_plus");
end

--@help Zoom page out
actions.zoom_out = function()
	actions.switch();
	keyboard.stroke("control", "oem_minus");
end

--@help Use normal zoom
actions.zoom_normal = function()
	actions.switch();
	keyboard.stroke("control", "0");
end

--@help Toggle playback state
actions.play_pause = function()
	keyboard.stroke("space");
end

--@help Scroll page down
actions.scroll_down = function()
	actions.switch();
	keyboard.stroke("space");
end

--@help Scroll page up
actions.scroll_up = function()
	actions.switch();
	keyboard.stroke("shift", "space");
end

--@help Refresh current page
actions.refresh = function()
	actions.switch();
	keyboard.stroke("F5");
end
