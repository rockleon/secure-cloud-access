<template>
  <div>
    <v-row justify="center" align="baseline" class="mt-0">
      <v-col cols="3">
        <v-text-field
          label="File Hash Id"
          v-model="hashId"
          background-color="white"
          outlined
        ></v-text-field>
      </v-col>
      <v-col cols="3">
        <v-btn color="primary" @click="showResponse = true" class="ml-5">
          Check
        </v-btn>
      </v-col>
    </v-row>
    <v-row v-if="showResponse" justify="center" align="baseline">
      <drizzle-contract
        :key="hashId + secretKey"
        contractName="CloudSystem"
        method="getCipherText"
        label="Cipher Key"
        :methodArgs="[utils.toHex(hashId)]"
      />
    </v-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "GetCipherText",
  data() {
    return {
      hashId: " ",
      secretKey: " ",
      showResponse: false,
    };
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    utils() {
      return this.drizzleInstance.web3.utils;
    },
  },
  mounted() {},
  methods: {},
};
</script>

<style scoped>
.dr {
  font-weight: 500;
  font-size: 1.5em;
}

.message {
  font-weight: 500;
  font-size: 1.3em;
}
</style>