<template>
  <VueButton class="add-user-button" @click="isShowDialog = true"
    >Добавить пользователя</VueButton
  >
  <AddPersonForm
    @close-dialog="isShowDialog = false"
    @add-person="loadPeople"
    v-if="isShowDialog"
  />
  <Table
    :filds="filds"
    :fildsValue="fildsValue"
    @save-changes="updatePerson($event)"
    @delete-record="deletePerson($event)"
  />
</template>

<script setup lang="ts">
import { onMounted, ref, type Ref } from "vue";
import Table from "../components/table/Table.vue";
import { type IFildObject } from "../components/table/TableTypes";
import AddPersonForm from "../components/AddPersonForm.vue";
import {
  PeopleService,
  type IPeopleService,
  type IPerson,
} from "../services/service_people";
const peopleService: IPeopleService = new PeopleService();
const filds: IFildObject = {
  id_person: {
    name: "id_person",
    type: "number",
    required: true,
    readonly: true,
  },
  login: {
    name: "login",
    type: "text",
    required: true,
    readonly: false,
    maxlength: 20,
  },
  age: {
    name: "age",
    type: "number",
    required: true,
    readonly: false,
    max: 100,
    min: 0,
  },
  email: {
    name: "email",
    type: "email",
    required: true,
    readonly: false,
    maxlength: 319,
  },
};
const fildsValue: Ref<IPerson[]> = ref([]);
const isShowDialog: Ref<boolean> = ref(false) as Ref<boolean>;

async function loadPeople(): Promise<void> {
  try {
    fildsValue.value = await peopleService.getAll();
  } catch (error) {
    console.log(error);
  }
}

async function deletePerson(person: IPerson): Promise<void> {
  try {
    if (person.id_person) {
      await peopleService.delete(person.id_person);
      await loadPeople();
    }
  } catch (error) {
    console.log(error);
  }
}

async function updatePerson(person: IPerson): Promise<void> {
  try {
    if (person.id_person) {
      await peopleService.update(person.id_person, person);
      await loadPeople();
    }
  } catch (error) {
    console.log(error);
  }
}

onMounted(async () => {
  loadPeople();
});
</script>

<style scoped>
.add-user-button {
  margin-bottom: 20px;
}
</style>
