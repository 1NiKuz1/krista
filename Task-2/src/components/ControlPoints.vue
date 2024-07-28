<template>
  <div class="control-points">
    <h2>Контрольные точки (контрольные события)</h2>
    <div class="control-points__container">
      <div class="control-points__row">
        <div class="control-points__date-wrapper">
          <img class="control-points__flag" src="../assets/flag.svg" alt="" />
          <div class="control-points__circle"></div>
          <p class="control-points__date">07.09.2020</p>
        </div>
        <div class="control-points__card-execution">
          <div class="control-points__card-wrapper">
            <span>% исполнения</span>
            <span>68,7%</span>
          </div>
          <p class="control-points__text">
            25 ГРБС из 30 не достигли целевого значения
          </p>
        </div>
      </div>
      <div class="control-points__row">
        <div
          class="control-points__date-wrapper control-points__date-wrapper--lazure"
        >
          <div
            class="control-points__circle control-points__circle--lazure"
          ></div>
          <p class="control-points__date">01.10.2020</p>
        </div>
        <p class="control-points__text-end-points">
          Контрольная точка «Исполнение бюджета на 75%»
        </p>
      </div>
    </div>
  </div>
</template>

<style scoped>
h2 {
  width: 100%;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 32px;
}

.control-points {
  width: 100%;
  height: 100%;
  padding: 5px 16px 32px;
  border: 1px solid var(--color-border);
}

.control-points__container {
  position: relative;
  padding: 16px;
  display: flex;
  flex-direction: column;
  row-gap: 34px;
  justify-content: center;
}
.control-points__container::before {
  content: "";
  position: absolute;
  left: 52px;
  height: 100%;
  width: 1px;
  z-index: -1;
  background-image: linear-gradient(#5e5e5e 22%, var(--color-background) 0%);
  background-position: right;
  background-size: 1px 10px;
  background-repeat: repeat-y;
}

.control-points__row {
  display: flex;
  column-gap: 15px;
}

.control-points__card-execution {
  position: relative;
  padding: 8px 16px 16px;
  background-color: #e0e0e0;
  border: 2px solid var(--color-gray);
  border-radius: 8px;
}
.control-points__card-execution::before {
  position: absolute;
  left: 0;
  top: 50%;
  content: "";
  display: block;
  height: 2px;
  width: 48px;
  margin-left: -48px;
  background-color: var(--color-gray);
}
.control-points__card-execution span {
  font-weight: bold;
  line-height: 1;
}
.control-points__card-execution .control-points__text,
.control-points__text-end-points {
  padding: 19px 16px;
  border: 2px solid var(--color-red);
  border-radius: 6px;
  background-color: var(--color-background);
  line-height: 1.2;
}

.control-points__card-wrapper {
  display: flex;
  justify-content: space-between;
  margin-bottom: 6px;
  align-items: flex-end;
}

.control-points__text {
  font-size: 18px;
}

.control-points__text-end-points {
  position: relative;
  border-color: #00aaa9;
  border-radius: 8px;
}

.control-points__text-end-points::before {
  position: absolute;
  left: 0;
  top: 50%;
  content: "";
  display: block;
  height: 1px;
  width: 49px;
  margin-left: -49px;
  background-color: #00aaa9;
}

.control-points__date-wrapper {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 1px;
}

.control-points__date-wrapper--lazure {
  margin-top: 26px;
}

.control-points__circle {
  width: 10px;
  height: 10px;
  background-color: var(--color-text);
  border-radius: 50%;
}

.control-points__circle--lazure {
  background-color: #00aaa9;
}

.control-points__date {
  color: #5e5e5e;
  background-color: var(--color-background);
}

.control-points__flag {
  margin-right: -24px;
  margin-bottom: 2px;
}

@media (min-width: 1280px) and (max-width: 1400px) {
  .control-points__container {
    padding: 16px 0;
  }
}
</style>
