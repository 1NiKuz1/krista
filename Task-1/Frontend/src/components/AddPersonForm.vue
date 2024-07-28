<template>
  <div @click="$emit('close-dialog')">
    <form @submit.prevent @click.stop>
      <label for="login">Логин</label>
      <input
        v-model.trim="login"
        name="login"
        type="text"
        maxlength="20"
        placeholder="Логин"
        required
      />
      <label for="age">Возраст</label>
      <input
        v-model.trim="age"
        name="age"
        type="number"
        min="0"
        max="100"
        placeholder="Возраст"
        required
      />
      <label for="email">E-mail</label>
      <input
        v-model.trim="email"
        name="email"
        type="email"
        placeholder="E-mail"
        maxlength="319"
        required
      />

      <VueButton type="button" @click="addPerson({ login, age, email })"
        >Добавить</VueButton
      >
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, type Ref } from "vue";
import {
  PeopleService,
  type IPeopleService,
  type IPerson,
} from "../services/service_people";

const emit = defineEmits(["close-dialog", "add-person"]);

const peopleService: IPeopleService = new PeopleService();
const login: Ref<string> = ref("");
const age: Ref<number> = ref(0);
const email: Ref<string> = ref("");

async function addPerson(person: IPerson) {
  try {
    if (login.value && age.value < 100 && email.value) {
      await peopleService.add(person);
      emit("add-person");
      emit("close-dialog");
    }
  } catch (error) {
    console.log(error);
  }
}
</script>

<style scoped>
div {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.2);
}

form {
  position: absolute;
  display: flex;
  flex-direction: column;
  gap: 5px;
  min-width: 200px;
  top: 50%;
  left: 50%;
  padding: 20px;
  transform: translate(-50%, -50%);
  background-color: var(--color-dark);
  border-radius: 10px;
}

input {
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  margin-bottom: 10px;
}

input:required:invalid {
  border: 1px solid red;
}
</style>
