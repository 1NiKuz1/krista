<template>
  <div class="reallocation-requests">
    <h2>Запросы на перераспределение</h2>
    <div class="container-fluid g-0">
      <div class="row gx-3">
        <div class="col-4 ms-auto">
          <div class="reallocation-requests__total">
            <h3>ВСЕГО</h3>
            <p
              class="reallocation-requests__text reallocation-requests__text--margin-bottom"
            >
              из них:
            </p>
            <div class="reallocation-requests__total-wrapper">
              <img src="../assets/Egle-vector.svg" alt="" />
              <p class="reallocation-requests__text">
                на межведомственном согласовании
              </p>
            </div>
            <div class="reallocation-requests__total-wrapper">
              <img src="../assets/Doc-vector.svg" alt="" />
              <p class="reallocation-requests__text">
                в координационных органах
              </p>
            </div>
          </div>
        </div>
        <div class="col-3 col-xl-3 col-lg-4">
          <div class="reallocation-requests__wrapper">
            <p class="reallocation-requests__text">
              Документы на изменении /<br />из них просрочено, ед.
            </p>
            <div class="reallocation-requests__wrapper-text-parameters">
              <p class="reallocation-requests__text-parameters">
                142 <span>/</span> <span>31</span>
              </p>
              <p class="reallocation-requests__text-parameters">
                424 <span>/</span> <span>35</span>
              </p>
            </div>
          </div>
        </div>
        <div class="col-5 col-xl-5 col-lg-4">
          <div class="reallocation-requests__wrapper">
            <p class="reallocation-requests__text">
              Суммы изменений / <br />
              из них просрочено согласование, млн ₽
            </p>
            <div class="reallocation-requests__wrapper-text-parameters">
              <p class="reallocation-requests__text-parameters">
                1 254,5 <span>/</span> <span>1 127,3</span>
              </p>
              <p class="reallocation-requests__text-parameters">
                3 745,5 <span>/</span> <span>1 972,7</span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
h2 {
  width: 100%;
  font-size: 22px;
  font-weight: bold;
  margin-bottom: 30px;
}

h3 {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 20px;
}

.reallocation-requests {
  height: 100%;
  border: 1px solid var(--color-border);
  padding: 16px;
  padding-bottom: 32px;
}

.reallocation-requests__total {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  height: 100%;
}

.reallocation-requests__total-wrapper {
  display: flex;
  align-items: center;
  gap: 10px;
}

.reallocation-requests__text {
  font-size: 18px;
  line-height: 1.2;
}

.reallocation-requests__text--margin-bottom {
  margin-bottom: 10px;
}

.reallocation-requests__wrapper {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: flex-end;
  height: 270px;
}

.reallocation-requests__wrapper .reallocation-requests__text {
  color: #5e5e5e;
  text-align: right;
}
.reallocation-requests__wrapper
  .reallocation-requests__text-parameters:first-child {
  margin-bottom: 30px;
}

.reallocation-requests__text-parameters {
  font-size: 28px;
  font-weight: bold;
  white-space: nowrap;
}
.reallocation-requests__text-parameters span:first-child {
  color: var(--color-gray);
}
.reallocation-requests__text-parameters span:last-child {
  color: var(--color-red);
  font-weight: bold;
}

@media (min-width: 1280px) and (max-width: 1420px) {
  .reallocation-requests__total .reallocation-requests__text {
    word-break: break-all;
  }
}
</style>
