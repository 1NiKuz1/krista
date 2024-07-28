<template>
  <div class="dynamics-of-funds">
    <div id="dynamics-of-funds-container"></div>
  </div>
</template>

<script setup lang="ts">
import Highcharts from "highcharts";
import { onMounted } from "vue";
import { firstParametrData } from "../charts_data/first-parametr-data";
import { secondParametrData } from "../charts_data/second-parametr-data";

onMounted(() => {
  Highcharts.setOptions({
    lang: {
      months: [
        "Январь",
        "Февраль",
        "Март",
        "Апрель",
        "Май",
        "Июнь",
        "Июль",
        "Август",
        "Сентябрь",
        "Октябрь",
        "Ноябрь",
        "Декабрь",
      ],
      shortMonths: [
        "Янв",
        "Фев",
        "Март",
        "Апр",
        "Май",
        "Июн",
        "Июл",
        "Авг",
        "Сен",
        "Окт",
        "Ноя",
        "Дек",
      ],
    },
  });
  Highcharts.chart("dynamics-of-funds-container", {
    title: {
      text: "Динамика среднедневных остатков средств ",
      align: "left",
      margin: 50,
      style: {
        fontSize: "20px",
        fontFamily: "PT sans",
        fontWeight: "bold",
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
          return Number(this.value);
        },
      },
    },

    xAxis: {
      type: "datetime",
      tickInterval: 7 * 24 * 3600 * 1000,
      lineColor: "#DFDFDF",
      tickColor: "#DFDFDF",
      labels: {
        style: {
          fontSize: "16px",
          fontFamily: "PT sans",
          color: "#5E5E5E",
          formatter: function () {
            return Highcharts.dateFormat("%e %b", this.value);
          },
        },
      },
    },
    legend: {
      itemStyle: {
        color: "#5E5E5E",
        fontSize: "16px",
        fontFamily: "PT sans",
      },
    },
    series: [
      {
        name: "Показатель 1",
        data: firstParametrData,
        color: "#00D1A9",
        marker: {
          symbol: "square",
          fillColor: "white",
          lineWidth: 2,
          lineColor: "#00D1A9",
        },
      },
      {
        name: "Показатель 2",
        data: secondParametrData,
        color: "#9964FF",
        marker: {
          symbol: "circle",
          fillColor: "white",
          lineWidth: 2,
          lineColor: "#9964FF",
        },
      },
    ],
    credits: {
      enabled: false,
    },
  });
});
</script>

<style scoped>
.dynamics-of-funds {
  height: 100%;
  border: 1px solid var(--color-border);
}
</style>
