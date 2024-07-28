<template>
  <main>
    <div class="container-fluid">
      <div class="row gx-3 gy-3">
        <h1>Структура остатков средств федерального бюджета</h1>
        <div class="col-xl-6">
          <CardTreasury />
        </div>
        <div class="col-xl-6"><AccountTable /></div>
        <div class="col-xl-6"><DynamicsPeriod /></div>
        <div class="col-xl-6"><DynamicsOfFunds /></div>
        <div class="col-xl-6">
          <ReallocationRequests />
        </div>
        <div class="col-xl-3">
          <ControlPoints />
        </div>
        <div class="col-xl-3">
          <AchievingResults />
        </div>
      </div>
    </div>
  </main>
</template>

<script setup lang="ts">
import CardTreasury from "@/components/CardTreasury.vue";
import AccountTable from "@/components/AccountTable.vue";
import ReallocationRequests from "@/components/ReallocationRequests.vue";
import ControlPoints from "@/components/ControlPoints.vue";
import AchievingResults from "@/components/AchievingResults.vue";
import DynamicsOfFunds from "@/components/DynamicsOfFunds.vue";
import DynamicsPeriod from "@/components/DynamicsPeriod.vue";
</script>

<style scoped>
h1 {
  width: 100%;
}
main {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
  justify-content: stretch;
  align-items: stretch;
}
</style>
