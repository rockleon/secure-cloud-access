<template>
  <div>
    <h2>File List</h2>
    <v-data-table
      :headers="headers"
      :items="list"
      :items-per-page="5"
      class="elevation-1 mt-10"
    ></v-data-table>
  </div>
</template>

<script>
export default {
  name: "FileList",
  data() {
    return {
      list: [
        { id: 1, name: "Account Details", hash: "123" },
        { id: 2, name: "Secret Source File", hash: "456" },
        { id: 3, name: "Miscellaneous Details", hash: "789" },
      ],
      headers: [
        { text: "Name", value: "name" },
        { text: "Hash Id", value: "hash" },
      ],
    };
  },
};
</script>

<style>
</style>