// ==UserScript==
// @name myUserJS
// @description Подсвечивает немедленные задачи в redmine
// @author Александр Фролов a.k.a. thephilosoft (thephilosoft at gmail.com)
// @license GPLv3
// @version 1.0
// @include http://redmine.ded.devpulse.ru/*
// ==/UserScript==
(function (window, undefined) {
	"use strict";

	var elements = document.querySelectorAll("td.priority");
	Array.prototype.forEach.call(elements, function(el){
		if (el.textContent === "Немедленный" ){
			el.style.background = "red";
			el.style.color = "white";
		}
	});
})(window);
