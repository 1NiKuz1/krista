<template>
  <table>
    <!--Поля таблиы-->
    <thead>
      <tr>
        <th v-for="fild in filds">{{ fild?.name }}</th>
        <th>Управление</th>
      </tr>
    </thead>
    <!--Записи таблицы-->
    <tbody v-if="fildsValue.length > 0">
      <tr v-for="record of fildsValue">
        <td v-for="[key, value] in Object.entries(record)">
          <input
            :type="filds[key]?.type"
            :name="filds[key]?.name"
            :value="value"
            @input="updateSelectedRecord(key, $event.target.value)"
            :readonly="record != selectedRecord ? true : filds[key]?.readonly"
            :required="filds[key]?.required"
            :maxlength="filds[key]?.maxlength"
            :max="filds[key]?.max"
            :min="filds[key]?.min"
          />
        </td>

        <!--Отображаемые кнопки когда запись не редактируется-->
        <td class="button-wrapper">
          <VueButton
            v-if="record != selectedRecord"
            @click="selectedRecord = record"
            >Редактировать</VueButton
          >
          <VueButton v-else @click="saveChanges">Сохранить</VueButton>
          <VueButton @click="$emit('delete-record', record)">Удалить</VueButton>
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script setup lang="ts">
import { ref, type Ref } from "vue";
import { type IFildObject } from "./TableTypes";

const props = defineProps<{
  filds: IFildObject;
  fildsValue: any[];
}>();
const emit = defineEmits(["delete-record", "save-changes"]);

let selectedRecord: Ref<any> = ref({});

function saveChanges(): void {
  for (const [key, fild] of Object.entries(props.filds)) {
    if (fild?.required && selectedRecord.value[key] === "") return;
    if (fild.hasOwnProperty("max") && selectedRecord.value[key] > fild?.max)
      return;
    if (fild.hasOwnProperty("min") && selectedRecord.value[key] < fild?.min)
      return;
  }
  emit("save-changes", selectedRecord.value);
  selectedRecord.value = {};
}

function updateSelectedRecord(key: string, value: string): void {
  selectedRecord.value[key] = value;
}
</script>

<style scoped>
table {
  border: 1px solid var(--color-devider);
  border-collapse: collapse;
  width: 100%;
  background-color: var(--color-background-table);
  color: var(--color-text-table);
}
th {
  border: 1px solid var(--color-devider);
  font-weight: bold;
  padding: 10px 5px;
}
td {
  border: 1px solid var(--color-devider);
  font-size: 0.9rem;
  padding: 5px;
}

input {
  width: 100%;
  border: none;
  padding: 10px 5px;
  min-width: max-content;
  border-radius: 5px;
}

input:focus-visible {
  outline: none;
  border: 2px solid var(--color-accent);
}

input:read-only {
  outline: none;
  border: none;
}

.button-wrapper {
  text-align: center;
  white-space: nowrap;
}

button:last-child {
  margin-left: 5px;
}

input:required:invalid {
  border: 2px solid red;
}
</style>
