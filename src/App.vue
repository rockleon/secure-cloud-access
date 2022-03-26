<template>
  <div v-if="isDrizzleInitialized" id="app">
    <h1>Set Secret Key</h1>
    <drizzle-contract-form
      contractName="CloudSystem"
      method="setSecretKey"
      :placeholders="['User Address', 'Secret Key']"
      class="pa-20"
    />
    <h2>Keys:</h2>
    <ul v-if="getNames">
      <!-- <li v-for="(name, i) in getNames" :key="i">{{ utils.toUtf8(name) }}</li> -->
      <li>{{ utils.toUtf8(getNames) }}</li>
    </ul>
  </div>
  <div v-else>Loading application...</div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "App",
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    ...mapGetters("contracts", ["getContractData"]),
    getNames() {
      let data = this.getContractData({
        contract: "CloudSystem",
        method: "getSecretKey",
      });
      if (data === "loading") return false;
      return data;
    },
    utils() {
      return this.drizzleInstance.web3.utils;
    },
  },
  created() {
    this.$store.dispatch("drizzle/REGISTER_CONTRACT", {
      contractName: "CloudSystem",
      method: "getSecretKey",
      methodArgs: [],
    });
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.pa-20 {
  padding: 20px !important;
}
</style>
