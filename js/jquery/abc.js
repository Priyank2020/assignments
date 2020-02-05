$(document).ready(function(){
  $("#button0").click(function(){
    $("#Q0").hide();
  });
  $("#button0").click(function(){
    $("#Q1").show();
  });
});

$(document).ready(function(){
  var mark=0;
  $("#button1").click(function(){
    var radioValue = $("input[name='Q1']:checked").val();
    if(radioValue!=null)
    {
      $("#Q1").hide();
      $("#Q2").show();
      if(radioValue==2)
      {
        mark++;
      }
    }
    
    else
    {
      alert("Select an option");
    }
  });

  $("#button2").click(function(){
    var radioValue = $("input[name='Q2']:checked").val();
    if(radioValue!=null)
    {
      $("#Q2").hide();
      $("#Q3").show();
      if(radioValue==4)
      {
        mark++;
      }
    }
    else
    {
      alert("Select an option");
    }
  });

  $("#button3").click(function(){
    var radioValue = $("input[name='Q3']:checked").val();
    if(radioValue!=null)
    {
      $("#Q3").hide();
      $("#Q4").show();
      if(radioValue==6)
      {
        mark++;
      }
    }
    else
    {
      alert("Select an option");
    }
  });

  $("#button4").click(function(){
  var radioValue = $("input[name='Q4']:checked").val();
  if(radioValue!=null)
  {
    $("#Q4").hide();
    $("#Q5").show();
    if(radioValue==4)
    {
      mark++;  
    }
  }
  else
  {
    alert("Select an option");
  }
  });

  $("#button5").click(function(){
    var radioValue = $("input[name='Q5']:checked").val();
    if(radioValue!=null)
    {
      $("#Q5").hide();
      $("#Q6").show();
      if(radioValue==4)
      {
        mark++;
      }
      $("#result").html(mark);
    }
    else
    {
      alert("Select an option");
    }
  });

  $("#button6").click(function(){
    $("#Q6").hide();
    $("#Q1").show();
  });  
});  
