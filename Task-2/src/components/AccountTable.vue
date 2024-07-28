<template>
  <table class="account-table">
    <thead class="account-table__thead">
      <tr class="account-table__tr">
        <th>Код строки</th>
        <th>Наименование показателя</th>
        <th>Значение</th>
        <th>Процент</th>
      </tr>
      <tr class="account-table__tr">
        <th>1</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
      </tr>
    </thead>
    <tbody class="account-table__tbody">
      <tr class="account-table__tr">
        <td>1</td>
        <td>Всего остатков, из них:</td>
        <td>5 383, 77</td>
        <td style="color: #fa432b">
          3, 77
          <img src="../assets/Arrow-red.svg" alt="" />
        </td>
      </tr>
      <tr class="account-table__tr">
        <td>1.1</td>
        <td>в валюте Российской Федерации</td>
        <td>2 499, 57</td>
        <td style="color: #36b600">
          9, 57 <img src="../assets/Arrow-green.svg" alt="" />
        </td>
      </tr>
      <tr class="account-table__tr selected">
        <td>1.2</td>
        <td>в ин. валютах, в том числе:</td>
        <td>2 884, 20</td>
        <td style="color: #fd9800">
          4, 20 <img src="../assets/Arrow-orange.svg" alt="" />
        </td>
      </tr>
      <tr class="account-table__tr">
        <td>1.2.1</td>
        <td>доп. НГД на спец. счетах</td>
        <td>2 096, 93</td>
        <td style="padding-right: 34px">6, 93</td>
      </tr>
      <tr class="account-table__tr">
        <td>1.2.1</td>
        <td>Свободные остатки средств</td>
        <td>3 286, 843</td>
        <td style="padding-right: 34px">6, 84</td>
      </tr>
    </tbody>
  </table>
</template>

<style scoped>
.account-table {
  width: 100%;
  border-collapse: collapse;
}

.account-table__tr:first-child th {
  padding: 8px;
}

td {
  font-size: 18px;
}

.account-table__tr {
  border: 1px solid var(--color-background);
}

.account-table__thead th {
  border: 1px solid var(--color-background);
}
.account-table__thead .account-table__tr:first-child {
  background-color: #e8e4de;
}
.account-table__thead .account-table__tr:last-child {
  background-color: #f4f1ef;
}
.account-table__thead .account-table__tr:last-child th {
  text-align: center;
}

.account-table__tbody td {
  padding: 1px 20px;
}
.account-table__tbody .account-table__tr {
  transition: background-color 0.15s ease-out;
}
.account-table__tbody .account-table__tr td:nth-child(3) {
  text-align: right;
  background-color: #e2d4ff;
  padding: 1px 8px;
}
.account-table__tbody .account-table__tr td:nth-child(4) {
  text-align: right;
  font-style: italic;
  padding: 1px 16px;
  white-space: nowrap;
}
.account-table__tbody .account-table__tr:nth-child(even) {
  background-color: #f7f7f7;
}
.account-table__tbody .account-table__tr:nth-child(odd) {
  background-color: var(--color-background);
}
.account-table__tbody .account-table__tr:hover {
  background-color: #dff1ff;
}
.account-table__tbody .account-table__tr + .selected {
  background-color: var(--color-selected);
  color: var(--color-background);
}
.account-table__tbody .account-table__tr + .selected td:nth-child(3) {
  background-color: var(--color-selected);
}
</style>
