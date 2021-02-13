/* This file contains general functions for display  */

function ToggleId(Id)
	{
		var aNode = document.getElementById(Id);
		if (aNode.style.display == 'none') 
			{aNode.style.display = 'block';}
		else 
			{aNode.style.display = 'none';}
	}

function ToggleSub(Id)
	{
		var aNode = document.getElementById(Id).parentNode;
		if (aNode.style.display == 'none') 
			{aNode.style.display = 'block';}
		else 
			{aNode.style.display = 'none';}
	}

function ShowElement(Id,Classname)
	/* Click a listlink and set sisplay none for all elements with 
		class "Classname" and display "" for the one with id "Id"*/
	{
		DisplayElements(Classname,'none','ToggleList');
		document.getElementById(Id).style.display = '';
	}

function ToggleElements(Class)
	/* Sets display type for Class depending on the value of the
	   "ToggleList" checkbox */
	{	
		var value = document.getElementById("ToggleList").checked;
		if (value == false)
			{DisplayElements(Class,'none');}
		else
			{DisplayElements(Class,'');}
	}

function DisplayElements(Class,DisplayType,ToggleId)
	/* Set display property 'DisplayType' for all elements
	   with CSS Class 'Class' and handles the toggle at 'ToggleId'
		*/
	{
		var cbox = document.getElementById(ToggleId);
		if (cbox) 
			{
				if (DisplayType == 'none') 
					{cbox.checked = false;}
				else 
					{cbox.checked = true;}
			}
		var elems = document.getElementsByClassName(Class);
		for (i = 0; i < elems.length; i++)
			{elems[i].style.display = DisplayType;}
	}

function Filter() 
	/* Filter list of hyperlink elements in container 'ListLinks'.
	   Expects filter having the Id "FilterItem"
	   */
	{
		var input, filter, ul, li, a, i;
		var cbox = document.getElementById("ToggleList");
		if (cbox) {cbox.checked = false;}
		
		input = document.getElementById("FilterItem");
		filter = input.value.toUpperCase();
		ul = document.getElementById("ListLinks");
		li = ul.getElementsByTagName("a");
		for (i = 0; i < li.length; i++) 
			{
				a = li[i];
				if (a.innerHTML.toUpperCase().indexOf(filter) > -1) 
					{
						li[i].style.display = "";
						document.getElementById(li[i].name).style.display = "";
					}
				else 
					{
						li[i].style.display = "none";
						document.getElementById(li[i].name).style.display = "none";
					}
			}
	}

function ClearFilter()
	/* Clear filter with id "FilterItem" and display all elements with Class "ListLink"
		*/
	{
		input = document.getElementById("FilterItem") ;
		input.value = '';
		DisplayElements('ListLink','')					
	}


function HighlightHash()
	/* Highlight target when jumped to it */
	{
		var Hash = location.hash;
		if (Hash.length > 0)
			{
				var n = Hash.lastIndexOf('#');
				var Id = Hash.substring(n);
				$("*").removeClass("highlight");
				$(Id).addClass("highlight");
			}
	}

function HighLightInPage(Id)
	{
		$("*").removeClass("highlight");
		var HId = '#'.concat(Id);
		$(HId).addClass("highlight");
	}