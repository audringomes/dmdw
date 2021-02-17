/* Functions to hide and show elements by Id or class */

function ToggleTechtop()
{ToggleSub('techtop');}

function ToggleDMHistory()
{$(".dmHistory").toggle();}

function ToggleDetail()
{$(".technical").toggle();}

function ToggleInVisField()
{$(".VisFalse").toggle();}

function ToggleMapped()
{$(".MappedTo").toggle();}

function ToggleTopology()
{$(".TopologyList").toggle();}

function ToggleExplicitTopologyRules()
{$(".RuleTypeexplicit").toggle();
 $(".RuleTypedefault").toggle();}

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
