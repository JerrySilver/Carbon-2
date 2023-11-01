
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
        div::-webkit-scrollbar {
            width: 0;
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
    function randomData() {
        now = new Date(+now + oneDay);
        value = value + Math.random() * 21 - 10;
        return {
            name: now.toString(),
            value: [
                [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                Math.round(value)
            ]
        };
    }
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom);
    var option;

    // let data = [];
    let now = new Date(2013,1,1);
    // let oneDay = 24 * 3600 * 1000;
    // let value = Math.random() * 1000;
    // for (var i = 0; i < 1000; i++) {
    //     data.push(randomData());
    // }
    $.ajax(
        {
        type:"post",
        url:"/line",
        async:false,
        success:function (response){
            if(response.code=='ok'){
                maxList = response.maxList;
            }else {
                alert("数据获取失败");
            }
        }

    }
    );
    option = {
        title: {
            text: '北京近十年来气温走向'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return (
                    date.getDate() +
                    '/' +
                    (date.getMonth() + 1) +
                    '/' +
                    date.getFullYear() +
                    ' : ' +
                    params.value[1]
                );
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [
            {
                name: 'Fake Data',
                type: 'line',
                showSymbol: false,
                data: maxList
            }
        ]
    };
    setInterval(function () {
        for (var i = 0; i < 5; i++) {
            maxList.shift();
            maxList.push(randomData());
        }
        myChart.setOption({
            series: [
                {
                    data: maxList
                }
            ]
        });
    }, 1000);

    option && myChart.setOption(option);
</script>

