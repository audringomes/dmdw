/* This file contains general functions for display  */

function ToggleId(Id)
{
    var aNode = document.getElementById(Id);

    if (aNode == null)
	return;
    
    if (aNode.style.display == 'none') 
    {aNode.style.display = 'block';}
    else 
    {aNode.style.display = 'none';}
}

function ToggleSub(Id)
{
    var aNode = document.getElementById(Id).parentNode;
    if (aNode == null)
	return;

    if (aNode.style.display == 'none') 
    {aNode.style.display = 'block';}
    else 
    {aNode.style.display = 'none';}
}

function ToggleCo()
/* Toggles visibility of <g id="case_objects"> in SVG */
{
    ToggleId('case_objects');
}
function ToggleCrel()
/* Toggles visibility of <g id="case_relationships"> in SVG */
{
    ToggleId('case_relationships');
}
function ToggleCHrel()
/* Toggles visibility of <g id="case_hetero_relations"> in SVG */
{
    ToggleId('case_hetero_relations');
}

function ShowElement(Id,Classname)
/* Click a listlink and set Display none for all elements with 
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
    if (input == null)
	return;

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
	var Id = Hash.substring(n+1);
	$("*").removeClass("highlight");
	/* $(Id).addClass("highlight"); */
	var Elem = document.getElementById(Id);
	Elem.classList.add('highlight');
    }
}

function HighLightInPage(Id)
{
    $("*").removeClass("highlight");
    /*		var HId = '#'.concat(Id);
		$(HId).addClass("highlight");
    */
    var Elem = document.getElementById(Id);
    if (Elem == null)
	return;
    Elem.classList.add('highlight');
    
}

function ShowMyGeoms(Table,Classname)
/* 
   Topology
   Show the geometry fields of the selected table in the left column.
   Table = table name
   Classname = Style class
*/
{
    var elems = document.getElementsByClassName(Table+' '+Classname);
    ToggleDisplayElements(elems,'inline-table');
    ClearRightColumn();
}

function ShowThyGeoms(Table,Geom,Classname,Description)
/*  
    Topology
    Displays the interactions of GEOM. Called when a geom link was clicked. 
    Act as a toggle
    
    Parameters:
    Description - External names
*/
{
    // Clear visibility of all elements
    ClearRightColumn();

    // Make the collections visible
    var elems = document.getElementsByClassName(Table+' '+Geom+' '+Classname);
    var show = ToggleDisplayElements(elems,'inline-table');
    
    if (show == true)
	DisplaySelectedGeom(Table,Geom,Description);
    else
	DisplaySelectedGeom();
}

function ClearRightColumn()
/*
  Topology
  Clear visib of all topological interactions
*/
{
    var elems = document.getElementsByClassName('col2s');
    for (i = 0; i < elems.length; i++)
    {elems[i].style.display = 'none'}

    DisplaySelectedGeom();
}

function DisplaySelectedGeom(Table,Geom,Description)
/* Topology
   Displays the selection of Table TABLE and Geometry GEOM
*/
{
    var rhe = document.getElementById('righthead');
    if (Table == null)
	rhe.innerHTML = '';
    else
	/* rhe.innerHTML = Table+'.'+Geom+' - all interactions'; */
	rhe.innerHTML = Description + ' - all interactions';
}

function ToggleDisplayElements(Elements, DisplayType)
/* Basic routine that toggles visibility of all Elements 
   The DisplayType is used to set visibility.
   Returns VISIBLE? (true or false)
*/
{
    var show = false;
    for (i = 0; i < Elements.length; i++)
    {
	if (Elements[i].style.display == 'none') 
	{Elements[i].style.display = DisplayType;
	 show = true;}
	else 
	{Elements[i].style.display = 'none';
	 show = false;}
    }
    return show;
}

function ToggleAndHighlightField(Fname)
{
    var aNode = document.getElementById(Fname);
    if (aNode.style.display == 'none') 
    {
	aNode.style.display = 'table-row';
	aNode.style.backgroundColor = 'yellow';
    }
    else 
    {
	aNode.style.display = 'none';
	aNode.style.backgroundColor = 'inherit';
    }
}

