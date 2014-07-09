<!-- jqModal Dependencies --><html><head><script type="text/javascript" src="jqmenu/jquery-1.js"></script>
<script type="text/javascript" src="jqmenu/jqModal.js"></script>



<!--  jqModal Styling -->
<link type="text/css" rel="stylesheet" media="all" href="jqmenu/jqModal.css">


<script type="text/javascript">$().ready(function(){$('#nav').css('opacity',0.68);});</script>
</head><body>


    <em>AJAX</em> -- <a href="#" class="ex2trigger" onmousedown=windowURL("login.jsp")>view</a>

<script type="text/javascript">
    url="#";
    function windowURL(value)
    {
        url=value;
      $().ready(function() {
	$('#ex2').jqm({ajax: url, trigger: 'a.ex2trigger'});

});
    }

</script>

<div class="jqmWindow" id="ex2">
Please wait... <img src="jqmenu/busy.gif" alt="loading">
</div>

</body></html>