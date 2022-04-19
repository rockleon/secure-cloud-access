<template>
  <div>
    <v-row justify="center" class="my-0">
      <h2>Set Secret Key</h2>
    </v-row>

    <v-row justify="center" class="mt-0">
      <v-col cols="12" sm="6" md="3">
        <drizzle-contract-form
          contractName="CloudSystem"
          method="setSecretKey"
          :placeholders="['User Address', 'Secret Key']"
          class="pa-20 drizzle"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  name: "SetSecretKey",
  data() {
    return {
      hashId: null,
    };
  },
  mounted() {},
  methods: {},
};
</script>

<style scoped>
.drizzle >>> input {
  border: 1px solid black !important;
  padding: 5px 20px !important;
  margin: 20px !important;
}

.drizzle >>> button {
  background-color: var(--v-primary-base) !important;
  border: none;
  color: white !important;
  padding: 10px 32px;
  margin-top: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 5px;
}
</style>