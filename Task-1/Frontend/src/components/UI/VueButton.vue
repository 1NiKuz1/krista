<template>
  <button><slot></slot></button>
</template>

<style scoped>
button {
  background: var(--color-accent);
  color: var(--color-light);
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
  transition: background 0.25s ease;
}

button:active {
  background: var(--color-dark-accent);
}

button:hover {
  background: var(--color-light-accent);
}
</style>
