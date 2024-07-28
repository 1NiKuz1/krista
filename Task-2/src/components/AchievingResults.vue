<template>
  <div class="achieving-results">
    <div class="achieving-results__wrapper">
      <p class="achieving-results__text">
        Достигнуто значений результатов, ед.
      </p>
      <span class="achieving-results__values">6 155 из 10 237</span>
    </div>
    <div class="achieving-results__wrapper">
      <div class="achieving-results__text-icon">
        <span class="achieving-results__icon">%</span>
        <p class="achieving-results__text">Процент достижения</p>
      </div>
      <span class="achieving-results__values">71,3%</span>
    </div>
    <div class="achieving-results__wrapper">
      <div class="achieving-results__text-icon">
        <img src="../assets/icon_agree.svg" alt="" />
        <p class="achieving-results__text">Не представлены отчеты, ед.:</p>
      </div>
      <span class="achieving-results__values"></span>
    </div>
    <div class="achieving-results__wrapper">
      <p class="achieving-results__text">о достижении значений результатов</p>
      <span class="achieving-results__values">95 из 435</span>
    </div>
    <div class="achieving-results__wrapper">
      <p class="achieving-results__text">об осуществлении расходов</p>
      <span class="achieving-results__values">57 из 267</span>
    </div>
  </div>
</template>

<style scoped>
.achieving-results {
  height: 100%;
  padding: 75px 16px 26px;
  display: flex;
  flex-direction: column;
  border: 1px solid var(--color-border);
  row-gap: 20px;
}

.achieving-results__wrapper {
  display: flex;
  justify-content: space-between;
  align-items: center;
  column-gap: 10px;
}

.achieving-results__text {
  font-size: 18px;
  line-height: 1.2;
}

.achieving-results__values {
  font-size: 22px;
  font-weight: bold;
  white-space: nowrap;
}

.achieving-results__text-icon {
  display: flex;
  column-gap: 20px;
  align-items: center;
}
.achieving-results__icon {
  font-size: 24px;
  color: #fd9800;
}
</style>
