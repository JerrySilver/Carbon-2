<%--
  Created by IntelliJ IDEA.
  User: Jerry
  Date: 2023/4/19
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="zh-CN">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
  <title>数据分析维度统计</title>
  <link rel="stylesheet" href="./css/app.css" />
  <script src="./js//echarts.min.js"></script>
  <script src="./js//china.js"></script>
  <script src="./js/jquery-3.5.1.js"></script>
</head>

<body class="biao2">
<div class="header">
  <h1 class="header-title" style="color: #FFFFFF;">数据分析维度统计</h1>
</div>
<div class="wrapper">
  <div class="content">
    <div class="col col-l">
      <div class="xpanel-wrapper xpanel-wrapper-40">
        <div class="xpanel xpanel-l-t Bj">
          <div class="title">不同地区近十年最高温涨幅</div>
          <div class="xslb" id="xslb" style="width: 100%;height: 90%;" ></div>
        </div>
      </div>
      <div class="xpanel-wrapper xpanel-wrapper-60">
        <div class="xpanel xpanel-l-b Bj">
          <div class="title">高温低温</div>
          <div class="tu" id="tu1" style="width: 100%;height: 90%;" ></div>
        </div>
      </div>
    </div>
    <div class="col col-c">
      <div class="xpanel-wrapper xpanel-wrapper-65">
        <div class="xpanel DiTu1 Bj">
          <div class="title">全国气温分布</div>
          <div class="TuBiao" id="DiTu1" style="width: 100%;height: 90%;" ></div>
        </div>
      </div>

      <div class="xpanel-wrapper xpanel-wrapper-35">
        <div class="xpanel xpanel-c-b Bj">
          <div class="gzjg">
            <div class="title">毕业生工资结构展示</div>
            <div class="sdtu" id="sdtu" style="width: 100%;height: 84%;" ></div>
          </div>
          <div class="jxqk">
            <div class="title">奖项情况统计</div>
            <div class="tu" id="tu8" style="width: 100%;height: 84%;" ></div>
          </div>

        </div>
      </div>
    </div>
    <div class="col col-r">
      <div class="xpanel-wrapper xpanel-wrapper-25">
        <div class="xpanel xpanel-r-t Bj">
          <div class="title">不同地区近十年最大温差</div>
          <div class="xslb" id="tu7" style="width: 100%;height: 90%;" ></div>
        </div>
      </div>
      <div class="xpanel-wrapper xpanel-wrapper-30">
        <div class="xpanel xpanel-r-m Bj">
          <div class="title">量表测评</div>
          <div class="tu" id="tu6" style="width: 100%;height: 90%;" ></div>
        </div>
      </div>
      <div class="xpanel-wrapper xpanel-wrapper-45">
        <div class="xpanel xpanel-r-b Bj">
          <div class="title">北京2022年空气质量统计</div>
          <div class="tu" id="tu5" style="width: 100%;height: 90%;" ></div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
<script type="text/javascript">
  var myDiTu1 = echarts.init(document.getElementById('DiTu1'));
  var myxslb = echarts.init(document.getElementById('xslb'));
  var mysdtu = echarts.init(document.getElementById('sdtu'));
  var mytu4 = echarts.init(document.getElementById('tu1'));
  // var mytu5 = echarts.init(document.getElementById('tu5'));
  var mytu6 = echarts.init(document.getElementById('tu6'));
  var mytu7 = echarts.init(document.getElementById('tu7'));
  var mytu8 = echarts.init(document.getElementById('tu8'));
  var air = echarts.init(document.getElementById('tu5'));

  $.ajax(
          {
            type:"post",
            url:"/air",
            async:false,  //使用ajax同步提交数据
            success:function (response) {
              if (response.code=="ok"){
                liang = response.airList.get(0);
                you = response.airList.get(1);
                qingdu = response.airList.get(2);
                zhongdu = response.airList.get(3);
                zhonggdu = response.airList.get(4);
                yanzhong = response.airList.get(5);
              }else{
                alert("数据获取失败");
              }
            }
          }
  );

  var colorArr=["#218de0", "#01cbb3", "#85e647", "#5d5cda", "#05c5b0", "#c29927"];
  var colorAlpha=['rgba(60,170,211,0.1)','rgba(1,203,179,0.1)','rgba(133,230,71,0.1)','rgba(93,92,218,0.1)','rgba(5,197,176,0.1)','rgba(194,153,39,0.1)']
  var option1 = {
    // backgroundColor: "#05224d",
    tooltip: {},
    grid: {
      top: '8%',
      left: '4%',
      right: '4%',
      bottom: '4%',
      containLabel: true,
    },
    // legend: {
    //     itemGap: 50,
    //     data: ['社团人数'],
    //     textStyle: {
    //         color: '#f9f9f9',
    //         borderColor: '#fff'
    //     },
    // },
    xAxis: [{
      type: 'category',
      boundaryGap: true,
      axisLine: { //坐标轴轴线相关设置。数学上的x轴
        show: true,
        lineStyle: {
          color: '#0a3256',
          fontSize: 12,
        },
      },
      axisLabel: { //坐标轴刻度标签的相关设置
        textStyle: {
          color: '#d1e6eb',
          margin: 15,
          fontSize: 12,
        },
      },
      axisTick: {
        show: false,
      },
      data: ['北京' ,'成都','哈尔滨','西藏','吐鲁番'],
    }],
    yAxis: [{
      type: 'value',
      min: 0,
      // max: 140,
      splitNumber: 7,
      splitLine: {
        show: true,
        lineStyle: {
          color: '#0a3256'
        }
      },
      axisLine: {
        show: false,
      },
      axisLabel: {
        margin: 20,
        textStyle: {
          color: '#d1e6eb',

        },
      },
      axisTick: {
        show: false,
      },
    }],
    series: [{

      //   name: '社团人数',
      type: 'bar',
      barWidth: 16,
      tooltip: {
        show: false
      },
      label: {
        normal: {
          show: true,
          position: 'top',
          textStyle: {
            color: '#fff',
          },
        }
      },
      itemStyle: {
        normal: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
            offset: 0,
            color: '#41E1D4' // 0% 处的颜色
          }, {
            offset: 1,
            color: '#10A7DB' // 100% 处的颜色
          }], false),
          barBorderRadius: [30, 30, 0, 0],
          shadowBlur: 4,
        }
      },
      data: [1.03, 1.2, 1.06, 0.96, 1.02]
    }]
  };


  var option4 = {
    // backgroundColor: '#101736',
    color:['#4A99FF', '#4BFFFC'], //颜色
    legend: {
      orient:'vertical',
      icon: 'circle', //图例形状
      data: ['车辆数'],
      bottom:35,
      right:40,
      itemWidth: 14, // 图例标记的图形宽度。[ default: 25 ]
      itemHeight: 14, // 图例标记的图形高度。[ default: 14 ]
      itemGap: 21, // 图例每项之间的间隔。[ default: 10 ]横向布局时为水平间隔，纵向布局时为纵向间隔。
      textStyle: {
        fontSize: 14,
        color: '#00E4FF',
      },
    },
    radar: {
      // shape: 'circle',
      name: {
        textStyle: {
          color: '#fff',
          fontSize: 16
        },
      },
      indicator:  [{
        text: ' 活泼',
        max: 6000,
      },
        {
          text: '忧虑',
          max: 5000
        },
        {
          text: '稳定',
          max: 5000
        },
        {
          text: '情感',
          max: 5000,
          //  axisLabel: {show: true, textStyle: {fontSize: 18, color: '#333'}}
        },
        {
          text: '自律',
          max: 5000
        },
        {
          text: '聪慧',
          max: 5000
        }
      ],
      splitArea: { // 坐标轴在 grid 区域中的分隔区域，默认不显示。
        show: true,
        areaStyle: { // 分隔区域的样式设置。
          color: ['rgba(255,255,255,0)', 'rgba(255,255,255,0)'], // 分隔区域颜色。分隔区域会按数组中颜色的顺序依次循环设置颜色。默认是一个深浅的间隔色。
        }
      },
      axisLine: { //指向外圈文本的分隔线样式
        lineStyle: {
          color: '#153269'
        }
      },
      splitLine: {
        lineStyle: {
          color: '#113865', // 分隔线颜色
          width: 1, // 分隔线线宽
        }
      },
    },
    series: [{
      type: 'radar',
      symbolSize: 8,
      // symbol: 'angle',
      data: [{
        value: [4300, 4700, 3600, 3900, 3800, 4200],
        name: ['车辆数'],
        itemStyle: {
          normal: {
            lineStyle: {
              color: '#4A99FF',
              // shadowColor: '#4A99FF',
              // shadowBlur: 10,
            },
            shadowColor: '#4A99FF',
            shadowBlur: 10,
          },
        },
        areaStyle: {
          normal: { // 单项区域填充样式
            color: {
              type: 'linear',
              x: 0, //右
              y: 0, //下
              x2: 1, //左
              y2: 1, //上
              colorStops: [{
                offset: 0,
                color: '#4A99FF'
              }, {
                offset: 0.5,
                color: 'rgba(0,0,0,0)'
              }, {
                offset: 1,
                color: '#4A99FF'
              }],
              globalCoord: false
            },
            opacity: 1 // 区域透明度
          }
        }
      },

      ],
    }]
  };

  var option7= {
    // backgroundColor: '#00265f',
    tooltip : {
      trigger: 'axis',
      axisPointer : {            // 坐标轴指示器，坐标轴触发有效
        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
      }
    },
    legend: {
      data:['最高温','最低温'],
      textStyle: {
        color: '#fff'
      }
    },
    grid: {
      top: '4%',
      left: '4%',
      right: '4%',
      bottom: '14%',
      containLabel: true
    },
    xAxis : [
      {
        type : 'category',
        data : ['北京','成都 ','哈尔滨','西藏','吐鲁番'],
        splitLine: {
          show: false
        },
        axisLine: {
          lineStyle: {
            color: '#fff',
          }
        },
        axisLabel: {
          color:'#fff',
        }
      }
    ],
    yAxis : [
      {
        type : 'value',
        splitLine: {
          show: false
        },
        axisLine: {
          lineStyle: {
            color: '#fff',
          }
        }
      }
    ],
    series : [
      {
        name:'最高温',
        type:'bar',
        barWidth: 20,
        label: {
          normal: {
            show: true,
            formatter: '{c}',
            position: "top",
            textStyle: {
              color: "#fff",
              fontSize: 14
            }
          }
        },
        itemStyle: {
          normal: {
            barBorderRadius: 20,
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
              offset: 0,
              color: '#fccb05'
            }, {
              offset: 1,
              color: '#000'
            }]),
          },
        },
        data:[-19, -5, -35, -14,-25]
      },
      {
        name:'最低温',
        type:'bar',
        barWidth: 20,
        stack: '对比',
        label: {
          normal: {
            show: true,
            formatter: '{c}',
            position: "top",
            textStyle: {
              color: "#fff",
              fontSize: 14
            }
          }
        },
        itemStyle: {
          normal: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
              offset: 0,
              color: '#00C7E1'
            }, {
              offset: 1,
              color: '#000'
            }]),
            opacity: 1,
            barBorderRadius: 12,
          }
        },
        data:[40, 42, 37, 30,48]
      }

    ]
  };

  var option6 = {
    // backgroundColor:'#050d19',
    title:{
      textStyle:{
        color:"#6a9cd5",
      },
      // text:'量表测评',
      left:"center",
    },

    tooltip: {//鼠标悬浮弹出提示框
      trigger:'axis', //提示框弹出的触发时间，折线图和柱状图为axis
      formatter:"{a} <br/>{b} : {c} "//提示框提示的信息，{a}series内的名字，{b}为块状的名字，{c}为数值
    },
    grid: {//统计图距离边缘的距离
      top: '10%',
      left: '10%',
      right: '10%',
      bottom: '20%'
    },
    xAxis: [{//x轴
      type: 'category',//数据类型为不连续数据
      boundaryGap: false,//坐标轴两边是否留白
      axisLine: { //坐标轴轴线相关设置。数学上的x轴
        show: true,
        lineStyle: {
          color: '#233e64' //x轴颜色
        },
      },
      axisLabel: { //坐标轴刻度标签的相关设置
        textStyle: {
          color: '#fff',
        },
      },
      axisTick: { show: true,},//刻度点数轴
      data: ['勇猛老虎型', '温和考拉型', '聪明猫头鹰型', '天才可塑龙型'],
    }],
    yAxis: [{//y轴的相关设置
      type: 'value',//y轴数据类型为连续的数据
      min: 0,//y轴上的刻度最小值
      max:140,//y轴上的刻度最大值
      splitNumber: 7,//y轴上的刻度段数
      splitLine: {//y轴上的y轴线条相关设置
        show: true,
        lineStyle: {
          color: '#233e64'
        }
      },
      axisLine: {//y轴的相关设置
        show: true,
        lineStyle: {
          color: '#233e64' //y轴颜色
        },
      },
      axisLabel: {//y轴的标签相关设置
        textStyle: {
          color: '#6a9cd5',
        },
      },
      axisTick: { show: true,},  //刻度点数轴
    }],
    series: [{
      name: '潜能测评',
      type: 'line',//统计图类型为折线图
      smooth: true, //是否平滑曲线显示
      symbolSize:0,//数据点的大小，[0,0]//b表示宽度和高度
      lineStyle: {//线条的相关设置
        normal: {
          color: "#3deaff"   // 线条颜色
        }
      },
      areaStyle: { //区域填充样式
        normal: {
          //线性渐变，前4个参数分别是x0,y0,x2,y2(范围0~1);相当于图形包围盒中的百分比。如果最后一个参数是‘true’，则该四个值是绝对像素位置。
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0,  color: 'rgba(61,234,255, 0.9)'},
            { offset: 0.8,  color: 'rgba(61,234,255, 0)'}
          ], false),

          shadowColor: 'rgba(53,142,215, 0.9)', //阴影颜色
          shadowBlur: 20 //shadowBlur设图形阴影的模糊大小。配合shadowColor,shadowOffsetX/Y, 设置图形的阴影效果。
        }
      },
      data: [90, 105, 84, 125]
    }]
  };

  var option5 = {
    // backgroundColor:"#090e36",
    grid: {
      left: 40,
      top: 50,
      bottom: 30,
      right: 20,
      containLabel: true
    },
    tooltip: {
      trigger: 'item',
      formatter: "{b} : {c} ({d}%)"
    },
    legend: {
      show:false
    },

    polar: {},
    angleAxis: {
      interval: 1,
      type: 'category',
      data: [],
      z: 10,
      axisLine: {
        show: false,
        lineStyle: {
          color: "#0B4A6B",
          width: 1,
          type: "solid"
        },
      },
      axisLabel: {
        interval: 0,
        show: true,
        color: "#0B4A6B",
        margin: 8,
        fontSize: 16
      },
    },
    radiusAxis: {
      min: 20,
      max: 120,
      interval: 20,
      axisLine: {
        show: false,
        lineStyle: {
          color: "#0B3E5E",
          width: 1,
          type: "solid"
        },
      },
      axisLabel: {
        formatter: '{value} %',
        show: false,
        padding: [0, 0, 20, 0],
        color: "#0B3E5E",
        fontSize: 16
      },
      splitLine: {
        lineStyle: {
          color: "#07385e",
          width: 2,
          type: "dashed"
        }
      }
    },
    calculable: true,
    series: [ {
      stack: 'a',
      type: 'pie',
      radius: '70%',
      roseType: 'radius',
      zlevel:10,
      startAngle: 100,

      label: {
        normal: {
          textStyle: {
            color: "rgba(255, 255, 255)"
          },
          formatter: [ '{b}','{d}%'].join('\n'),
          rich: {
            b: {
              color: '#fff',
              fontSize: 14,
              lineHeight: 20
            },
            d: {
              color: '#fff',
              fontSize: 14,
              height: 20
            },
          },
        }
      },
      labelLine: {
        normal: {
          show: true,
          length: 10,
          length2: 45,
          lineStyle: {
            color: '#aaa'

          }
        },
        emphasis: {
          show: false
        }
      },
      data: [{
        value: you,
        name: '优',
        itemStyle: {
          normal: {
            borderColor: colorArr[0],
            borderWidth:2,
            shadowBlur: 20,
            shadowColor: "#41a8f8",
            shadowOffsetx: 25,
            shadowOffsety: 20,
            color:colorAlpha[0]
          },
        }
      },
        {
          value: liang,
          name: '良',
          itemStyle: {
            normal: {
              borderColor: colorArr[1],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[1],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[1]
            },
          }
        },
        {
          value: qingdu,
          name: '轻度',
          itemStyle: {
            normal: {
              borderColor: colorArr[2],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[2],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[2]
            },
          }
        },
        {
          value: zhongdu,
          name: '中度',
          itemStyle: {
            normal: {
              borderColor: colorArr[3],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[3],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[3]
            },
          }
        },
        {
          value: zhonggdu,
          name: '重度',
          itemStyle: {
            normal: {
              borderColor: colorArr[4],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[4],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[4]
            },
          }
        },
        {
          value: yanzhong,
          name: '严重',
          itemStyle: {
            normal: {
              borderColor: colorArr[5],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[5],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[5]
            },
          }
        }
      ]
    }, ]
  }


  var option8 = {
    tooltip: {},
    grid: {
      top: '10%',
      left: '4%',
      right: '4%',
      bottom: '4%',
      containLabel: true,
    },
    legend: {
      itemGap: 50,
      data: ['学生人数' ],
      textStyle: {
        color: '#f9f9f9',
        borderColor: '#fff'
      },
    },
    xAxis: [{
      type: 'category',
      boundaryGap: true,
      axisLine: { //坐标轴轴线相关设置。数学上的x轴
        show: true,
        lineStyle: {
          color: '#f9f9f9'
        },
      },
      axisLabel: { //坐标轴刻度标签的相关设置
        textStyle: {
          color: '#d1e6eb',
          margin: 15,
        },
      },
      axisTick: {
        show: false,
      },
      data: ['三好学生' ,'优秀团干部','社会实践优秀学员','朗诵比赛','舞蹈比赛','歌咏比赛','体操比赛','班级建设比赛'],
    }],
    yAxis: [{
      type: 'value',
      min: 0,
      // max: 140,
      splitNumber: 7,
      splitLine: {
        show: true,
        lineStyle: {
          color: '#0a3256'
        }
      },
      axisLine: {
        show: false,
      },
      axisLabel: {
        margin: 20,
        textStyle: {
          color: '#d1e6eb',

        },
      },
      axisTick: {
        show: false,
      },
    }],
    series: [{
      name: '学生人数',
      type: 'bar',
      barWidth:18,
      tooltip: {
        show: false
      },
      label: {
        show: true,
        position: 'top',
        textStyle: {
          color: '#fff',
        }
      },
      itemStyle: {
        normal: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
            offset: 0,
            color: '#41E1D4' // 0% 处的颜色
          }, {
            offset: 1,
            color: '#10A7DB' // 100% 处的颜色
          }], false),
          barBorderRadius: [30, 30, 0, 0],
          shadowBlur: 4,
        }
      },
      data: [200, 382, 102, 267, 186, 315, 316, 416]
    }
    ]
  };

  var option2 = {
    // backgroundColor:"#090e36",
    grid: {
      left: 30,
      top: 60,
      bottom:30,
      right: 10,
      containLabel: true
    },
    tooltip: {
      trigger: 'item',
      formatter: "{b} : {c} ({d}%)"
    },
    legend: {
      show:false
    },

    polar: {},
    angleAxis: {
      interval: 1,
      type: 'category',
      data: [],
      z: 10,
      axisLine: {
        show: false,
        lineStyle: {
          color: "#0B4A6B",
          width: 1,
          type: "solid"
        },
      },
      axisLabel: {
        interval: 0,
        show: true,
        color: "#0B4A6B",
        margin: 8,
        fontSize: 16
      },
    },
    radiusAxis: {
      min: 20,
      max: 120,
      interval: 20,
      axisLine: {
        show: false,
        lineStyle: {
          color: "#0B3E5E",
          width: 1,
          type: "solid"
        },
      },
      axisLabel: {
        formatter: '{value} %',
        show: false,
        padding: [0, 0, 20, 0],
        color: "#0B3E5E",
        fontSize: 16
      },
      splitLine: {
        lineStyle: {
          color: "#07385e",
          width: 2,
          type: "dashed"
        }
      }
    },
    calculable: true,
    series: [ {
      stack: 'a',
      type: 'pie',
      radius: '70%',
      roseType: 'radius',
      zlevel:10,
      startAngle: 100,
      label: {
        normal: {
          textStyle: {
            color: "rgba(255, 255, 255)"
          },
          formatter: [ '{b}','{d}%'].join('\n'),
          rich: {
            b: {
              color: '#fff',
              fontSize: 14,
              lineHeight: 20
            },
            d: {
              color: '#fff',
              fontSize: 14,
              height: 20
            },
          },
        }
      },
      labelLine: {
        normal: {
          show: true,
          length: 10,
          length2: 45,
          lineStyle: {
            color: '#aaa'

          }
        },
        emphasis: {
          show: false
        }
      },
      data: [{
        value: 8,
        name: '50k~30k',
        itemStyle: {
          normal: {
            borderColor: colorArr[0],
            borderWidth:2,
            shadowBlur: 20,
            shadowColor: "#41a8f8",
            shadowOffsetx: 25,
            shadowOffsety: 20,
            color:colorAlpha[0]
          },
        }
      },
        {
          value: 17,
          name: '25k~20k',
          itemStyle: {
            normal: {
              borderColor: colorArr[1],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[1],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[1]
            },
          }
        },
        {
          value: 37,
          name: '19k~15k',
          itemStyle: {
            normal: {
              borderColor: colorArr[2],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[2],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[2]
            },
          }
        },
        {
          value: 13,
          name: '14k~10k',
          itemStyle: {
            normal: {
              borderColor: colorArr[3],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[3],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[3]
            },
          }
        },
        {
          value: 10,
          name: '9k~7k',
          itemStyle: {
            normal: {
              borderColor: colorArr[4],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[4],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[4]
            },
          }
        },
        {
          value: 66,
          name: '6k~3k',
          itemStyle: {
            normal: {
              borderColor: colorArr[5],
              borderWidth:2,
              shadowBlur: 20,
              shadowColor: colorArr[5],
              shadowOffsetx: 25,
              shadowOffsety: 20,
              color:colorAlpha[5]
            },
          }
        }
      ]
    }, ]
  }
  // 地图
  var data = [
    {name:"北京市",value:224540},
    {name:"天津",value:66890},
    {name:"河北",value:51590},
    {name:"山西",value:27860},
    {name:"内蒙古",value:15410},
    {name:"辽宁",value:325920},
    {name:"吉林",value:15730},
    {name:"黑龙江",value:64030},
    {name:"上海",value:78230},
    {name:"江苏",value:571930},
    {name:"浙江",value:311410},
    {name:"安徽",value:20650},
    {name:"福建",value:55790},
    {name:"江西",value:6060},
    {name:"山东",value:741447},
    {name:"河南",value:73670},
    {name:"湖北",value:34080},
    {name:"湖南",value:189790},
    {name:"广东",value:131740},
    {name:"广西",value:2300},
    {name:"海南",value:9370},
    {name:"重庆",value:89630},
    {name:"四川",value:1473222},
    {name:"贵州",value:2650},
    {name:"云南",value:40290},
    {name:"西藏",value:44290},
    {name:"陕西",value:60450},
    {name:"甘肃",value:5620},
    {name:"青海",value:590},
    {name:"宁夏",value:180},
    {name:"新疆",value:4520},
    {name:"台湾",value:800},
    {name:"香港",value:2000},
    {name:"澳门",value:0},
  ];
  var geoCoordMap = {
    '北京市': [116.4551, 40.2539],
    "天津": [117.4219, 39.4189],
    "河北": [114.4995, 38.1006],
    "山西": [112.3352, 37.9413],
    '内蒙古': [110.3467, 41.4899],
    "辽宁": [123.1238, 42.1216],
    "吉林": [125.8154, 44.2584],
    '黑龙江': [127.9688, 45.368],
    '上海': [121.4648, 31.2891],
    "江苏": [118.8062, 31.9208],
    "浙江": [119.5313, 29.8773],
    "安徽": [117.29, 32.0581],
    "福建": [119.4543, 25.9222],
    "江西": [116.0046, 28.6633],
    "山东": [117.1582, 36.8701],
    "河南": [113.4668, 34.6234],
    "湖北": [114.3896, 30.6628],
    "湖南": [113.0823, 28.2568],
    "广东": [113.12244, 23.009505],
    "广西": [108.479, 23.1152],
    "海南": [110.3893, 19.8516],
    "重庆": [108.384366, 30.439702],
    "四川": [103.9526, 30.7617],
    "贵州": [106.6992, 26.7682],
    "云南": [102.9199, 25.4663],
    "西藏": [91.11, 29.97],
    "陕西": [109.1162, 34.2004],
    "甘肃": [103.5901, 36.3043],
    "青海": [101.4038, 36.8207],
    "宁夏": [106.3586, 38.1775],
    "新疆": [87.9236, 43.5883],
    '台湾': [121.5135,25.0308],
    "香港": [114.08, 22.20],
    '澳门': [113.33,22.13],

  };


  var max = 480, min = 9; // todo
  var maxSize4Pin = 100, minSize4Pin = 20;

  var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
      var geoCoord = geoCoordMap[data[i].name];
      if (geoCoord) {
        res.push({
          name: data[i].name,
          value: geoCoord.concat(data[i].value)
        });
      }
    }
    return res;
  };

  var option3 = {
    tooltip: {
      trigger: 'item',
      formatter: function (params) {
        if(typeof(params.value)[2] == "undefined"){
          return params.name + ' : ' + params.value;
        }else{
          return params.name + ' : ' + params.value[2];
        }
      }
    },
    legend: {
      left: 'left',
      data: ['强', '中', '弱'],
      textStyle: {
        color: '#ccc'
      }
    },

    geo: {
      map: 'china',
      show: true,
      roam: true,
      label: {
        normal: {
          show: false
        },
        emphasis: {
          show: false,
        }
      },
      itemStyle: {
        normal: {
          areaColor: '#3a7fd5',
          borderColor: '#0a53e9',//线
          shadowColor: '#092f8f',//外发光
          shadowBlur: 20
        },
        emphasis: {
          areaColor: '#0a2dae',//悬浮区背景
        }
      }
    },
    series : [
      {

        symbolSize: 5,
        label: {
          normal: {
            formatter: '{b}',
            position: 'right',
            show: true
          },
          emphasis: {
            show: true
          }
        },
        itemStyle: {
          normal: {
            color: '#fff'
          }
        },
        name: 'light',
        type: 'scatter',
        coordinateSystem: 'geo',
        data: convertData(data),

      },
      {
        type: 'map',
        map: 'china',
        geoIndex: 0,
        aspectScale: 0.75, //长宽比
        showLegendSymbol: false, // 存在legend时显示
        label: {
          normal: {
            show: false
          },
          emphasis: {
            show: false,
            textStyle: {
              color: '#fff'
            }
          }
        },
        roam: true,
        itemStyle: {
          normal: {
            areaColor: '#031525',
            borderColor: '#FFFFFF',
          },
          emphasis: {
            areaColor: '#2B91B7'
          }
        },
        animation: false,
        data: data
      },
      {
        name: 'Top 5',
        type: 'scatter',
        coordinateSystem: 'geo',
        symbol: 'pin',
        symbolSize: [50,50],
        label: {
          normal: {
            show: true,
            textStyle: {
              color: '#fff',
              fontSize: 9,
            },
            formatter (value){
              return value.data.value[2]
            }
          }
        },
        itemStyle: {
          normal: {
            color: '#D8BC37', //标志颜色
          }
        },
        data: convertData(data),
        showEffectOn: 'render',
        rippleEffect: {
          brushType: 'stroke'
        },
        hoverAnimation: true,
        zlevel: 1
      },

    ]
  };



  myxslb.setOption(option1);
  mysdtu.setOption(option2);
  myDiTu1.setOption(option3);
  mytu4.setOption(option4);
  // mytu5.setOption(option5);
  mytu6.setOption(option6);
  mytu7.setOption(option7);
  mytu8.setOption(option8);
  air.setOption(option5);
</script>

