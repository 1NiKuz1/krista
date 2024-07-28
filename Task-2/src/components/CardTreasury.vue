<template>
  <div class="card-treasury">
    <h2>Казначейское сопровождение БС/МБ</h2>
    <div class="card-treasury__positions">
      <div class="card-treasury__text-wrapper">
        <p class="card-treasury__positions-text">
          СУММА ГОС. (МУНИЦ.) КОНТРАКТОВ (КОНТРАКТОВ) /СОГЛАШЕНИЙ (ДОГОВОРОВ)
        </p>
        <p class="card-treasury__values-text card-treasury__values-text--big">
          857,4
        </p>
      </div>
      <div class="card-treasury__text-wrapper">
        <p class="card-treasury__positions-text">
          Кол-во гос. (муниц.) контрактов (контрактов)/соглашений (договоров)
        </p>
        <p class="card-treasury__values-text">6 290</p>
      </div>
      <div class="card-treasury__text-wrapper">
        <p class="card-treasury__positions-text">Кассовый расход</p>
        <p class="card-treasury__values-text">5,0</p>
      </div>
      <div class="card-treasury__text-wrapper">
        <p class="card-treasury__positions-text">
          На счета в кредитные организации
        </p>
        <p class="card-treasury__values-text">0,0</p>
      </div>
      <div class="card-treasury__text-wrapper">
        <p class="card-treasury__positions-text">Остаток средств</p>
        <p class="card-treasury__values-text">73,1</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.card-treasury {
  width: 100%;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  padding: 5px 16px 32px;
  border: 1px solid var(--color-border);
}

.card-treasury__text-wrapper {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  gap: 20px;
}

h2 {
  width: 100%;
  font-size: 18px;
  font-weight: bold;
}

.card-treasury__positions {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
}

.card-treasury__positions-text {
  display: flex;
  align-items: end;
  font-size: 18px;
  white-space: normal;
}

.card-treasury__values {
  display: flex;
  text-align: right;
  flex-direction: column;
  gap: 2px;
}

.card-treasury__values-text {
  font-size: 22px;
  font-weight: bold;
  line-height: 1.2;
  white-space: nowrap;
}

.card-treasury__values-text--big {
  font-size: 48px;
}
</style>
