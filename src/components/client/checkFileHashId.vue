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
      <v-btn color="primary" @click="showResponse = true" class="ml-5">
        Check
      </v-btn>
    </v-row>
    <v-row v-if="showResponse" justify="center" align="baseline">
      <div class="message">File Exists</div>
      <drizzle-contract
        :key="hashId"
        contractName="CloudSystem"
        method="checkHashFileId"
        :methodArgs="[utils.toHex(hashId)]"
        class="dr"
      />
    </v-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "CheckFileHashId",
  data() {
    return {
      hashId: " ",
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