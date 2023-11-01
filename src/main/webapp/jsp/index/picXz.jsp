
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script src="${pageContext.request.contextPath}/style/js/echarts.js"></script>
  <title>大数据图表展示</title>
  <jsp:include page="../common_css.jsp"/>

  <style>
    #main{
      position: absolute;
      left:10%;
      margin-left:-50px;
    }
  </style>

</head>
<body>
<div class="container-scroller">
  <!-- partial:partials/_navbar.html -->
  <jsp:include page="../top.jsp"/>

  <!-- partial -->
  <div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <jsp:include page="left.jsp"/>
    <!-- partial -->
    <div class="main-panel" >
      <div class="row">
        <div class="col-md-12 stretch-card">
          <div class="card">
            <div class="card-body">
              <h2 class="card-title">近十年天气数据图表展示</h2>
              <div id="main" style="width: 1200px;height:800px;"></div>

            </div>
          </div>
        </div>
      </div>
    </div>


    <jsp:include page="../footer.jsp"/>
  </div>
  <!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<jsp:include page="../common_js.jsp"/>
</body>

</html>
<script>
  function doSearch(pageNum) {
    var code=$("#code").val();
    var name=$("#name").val();
    window.location.href="/admin/fang/list?pageNum="+pageNum+"&code="+code+"&name="+name;
  }
</script>
<script type="text/javascript">
  // 基于准备好的dom，初始化echarts实例
  var chartDom = document.getElementById('main');
  var myChart = echarts.init(chartDom);
  var option;


  $.ajax(
          {
            type:"post",
            url:"/echarts4",
            async:false,  //使用ajax同步提交数据
            success:function (response) {
              if (response.code=="ok"){
                year = response.year;
                maxList = response.maxList;
                minList = response.minList;
              }else{
                alert("数据获取失败");
              }
            }
          }
  );

  option = {
    title: {
      text: '西藏近十年气温变化'
    },
    tooltip: {
      trigger: 'axis'
    },
    legend: {},
    toolbox: {
      show: true,
      feature: {
        dataZoom: {
          yAxisIndex: 'none'
        },
        dataView: { readOnly: false },
        magicType: { type: ['line', 'bar'] },
        restore: {},
        saveAsImage: {}
      }
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: year
    },
    yAxis: {
      type: 'value',
      axisLabel: {
        formatter: '{value} °C'
      }
    },
    series: [
      {
        name: '最高温',
        type: 'line',
        data: maxList,
        markPoint: {
          data: [
            { type: 'max', name: 'Max' }
          ]
        },
        markLine: {
          data: [{ type: 'average', name: 'Avg' }]
        }
      },
      {
        name: '最低温',
        type: 'line',
        data: minList,
        markPoint: {
          data: [{ type: 'min', name: 'min' }]
        },
        markLine: {
          data: [
            { type: 'average', name: 'Avg' },
            [
              {
                symbol: 'none',
                x: '90%',
                yAxis: 'max'
              },
              {
                symbol: 'circle',
                label: {
                  position: 'start',
                  formatter: 'Max'
                },
                type: 'max',
                name: '最高点'
              }
            ]
          ]
        }
      }
    ]
  };

  option && myChart.setOption(option);
</script>

