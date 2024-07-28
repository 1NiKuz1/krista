<template>
  <div class="dynamics-period"><div id="dynamics-period-container"></div></div>
</template>

<script setup lang="ts">
import Highcharts from "highcharts";
import { onMounted } from "vue";

const chartData = [
  { name: "2020", y: 1150.23, color: "#FFAB59" },
  { name: "2021", y: 3345.36, color: "#F0625E" },
];

onMounted(() => {
  Highcharts.chart("dynamics-period-container", {
    chart: {
      type: "column",
    },
    title: {
      text: "Динамика среднедневных остатков средств федерального бюджета 2020-2021 г.",
      align: "left",
      style: {
        fontSize: "20px",
        fontFamily: "PT sans",
        fontWeight: "bold",
      },
      margin: 45,
    },
    xAxis: {
      type: "category",
      gridLineColor: "#fff",
      gridLineWidth: 10,
      lineColor: "#DFDFDF",
      labels: {
        style: {
          fontSize: "16px",
          fontFamily: "PT sans",
          color: "#5E5E5E",
        },
      },
    },
    yAxis: {
      title: {
        text: "",
      },
      gridLineColor: "#DFDFDF",
      labels: {
        style: {
          fontSize: "16px",
          fontFamily: "PT sans",
          color: "#5E5E5E",
        },
        formatter: function () {
          return Number(this.value) / 1000 + " тыс.";
        },
      },
    },
    series: [
      {
        name: "Остаток",
        data: chartData,
        dataLabels: {
          enabled: true,
          style: {
            fontSize: "22px",
            fontFamily: "PT sans",
          },
        },
      },
    ],
    legend: {
      enabled: false,
    },
    credits: {
      enabled: false,
    },
  });
});
</script>

<style scoped>
.dynamics-period {
  height: 100%;
  border: 1px solid var(--color-border);
}
</style>
