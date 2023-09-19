// will be triggered when (re-)loading the document
function performOnload() {
	scrollToNow();
}

// scrolls to the upcoming entry, allowing for 10min of overlay
// grays out all the past events
function scrollToNow() {
	console.log("scrollToNow()");

	var now = new Date();
	var foundNow = false;

	var entries = document.getElementsByClassName("entry");
	for (var entry of entries) {
		var time = Date.parse(entry.dataset.time);

		if ((time + 10*60*1000) < now) {
			var element = document.getElementById(entry.id);
			element.classList.add("pastEvent");

			var children = element.querySelectorAll("*");
			for (let child of children) {
				child.classList.add("pastEvent");
			};

			// Handle the dialogs -> borderColor
			var id = entry.id.split("_")[0] + "_dialog";
			console.log(id);
			var dialog = document.getElementById(id);
			// dialog.style.borderColor = "gray";
		};

		if (!foundNow) {
			if ((time + 10*60*1000) > now) {
				scrollToElementWith(entry.id);
				foundNow = true;
			};
		};
	};
};

function scrollToElementWith(ID) {
	var element = document.getElementById(ID);
	element.scrollIntoView({ behavior: "smooth", block: "start", inline: "start" });
	console.log("scrolling to", ID);
};

// expand and truncate an abstract
function toggleAbstract(entry, abstract, expand, collapse) {
	console.log("toggleAbstract()", entry, abstract, expand, collapse);
	var entryEl = document.getElementById(entry);
	var abstractEl = document.getElementById(abstract);

	var viewportOffset = abstractEl.getBoundingClientRect();
  var top = viewportOffset.top;

	if (abstractEl.style.maxHeight == "none") {
		console.log(top);
		if (top < 0) {
			console.log(entry);
			// entryEl.scrollIntoView({ behavior: "smooth", block: "end" });
			// entryEl.scrollIntoView(false);
			scrollToElementWith(entry);
			setTimeout(() => {
				abstractEl.style.maxHeight = "6.55rem";
			}, 500);
		} else {
			abstractEl.style.maxHeight = "6.55rem";
		};
	} else {
		abstractEl.style.maxHeight = "none";
	};

	// handle the buttons
	var expandEl = document.getElementById(expand);
	if (expandEl.style.display === "none") {
		expandEl.style.display = "inline-block";
	} else {
		expandEl.style.display = "none";
	};
	var collapseEl = document.getElementById(collapse);
  if (collapseEl.style.display === "inline-block") {
		collapseEl.style.display = "none";
	} else {
		collapseEl.style.display = "inline-block";
	};
};

function showBiography(dialogID, biographyID) {
	//alert(dialogID);
	var dialog = document.getElementById(dialogID);
	dialog.showModal();
	dialog.addEventListener(
		"click",
		function () {
			console.log("click");
			closeDialog(dialogID);
		},
		false,
	);
	
	// add noScroll class to body
	document.body.classList.add("noScroll");

	var biography = document.getElementById(biographyID);
	biography.addEventListener("click", (event) => event.stopPropagation());
};

function closeDialog(dialogID) {
	console.log("closeDialog", dialogID)
	var dialog = document.getElementById(dialogID);
	dialog.close();
	
	// remove noScroll class from body
	document.body.classList.remove("noScroll");
};
