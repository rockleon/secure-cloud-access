<template>
  <div v-if="isDrizzleInitialized">
    <v-stepper v-model="tab" vertical>
      <v-stepper-step :complete="tab > 1" step="1">
        Check File Hash ID
      </v-stepper-step>
      <v-stepper-content step="1">
        <v-card color="#f8f8f8" class="mb-12" height="170px">
          <check-file-hash-id />
        </v-card>
        <v-btn color="primary" @click="tab = 2"> Continue </v-btn>
      </v-stepper-content>

      <v-stepper-step :complete="tab > 2" step="2">
        Get Secret Key
      </v-stepper-step>
      <v-stepper-content step="2">
        <v-card color="#f8f8f8" class="mb-12" height="200px">
          <get-secret-key />
        </v-card>
        <v-btn color="primary" @click="tab = 3"> Continue </v-btn>
        <v-btn text @click="tab = 1"> Cancel </v-btn>
      </v-stepper-content>

      <v-stepper-step :complete="tab > 3" step="3">
        Get Cipher Text
      </v-stepper-step>
      <v-stepper-content step="3">
        <v-card color="#f8f8f8" class="mb-12" height="200px">
          <get-cipher-text />
        </v-card>
        <v-btn color="primary" @click="tab = 4"> Continue </v-btn>
        <v-btn text @click="tab = 2"> Cancel </v-btn>
      </v-stepper-content>

      <v-stepper-step :complete="tab > 4" step="4">
        Decipher file
      </v-stepper-step>
      <v-stepper-content step="4">
        <v-card color="#f8f8f8" class="mb-12" height="285px">
          <decipher-file />
        </v-card>
        <v-btn color="primary" @click="tab = 1"> Continue </v-btn>
        <v-btn text @click="tab = 3"> Cancel </v-btn>
      </v-stepper-content>
    </v-stepper>
  </div>
  <div v-else>Loading application...</div>
</template>

<script>
import { mapGetters } from "vuex";
import CheckFileHashId from "@/components/client/checkFileHashId.vue";
import GetSecretKey from "@/components/client/getSecretKey.vue";
import DecipherFile from "@/components/client/decipherFile.vue";
import GetCipherText from "@/components/client/getCipherText.vue";

export default {
  name: "ClientView",
  components: { CheckFileHashId, GetSecretKey, DecipherFile, GetCipherText },
  data() {
    return {
      tab: 1,
    };
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
  },
  mounted() {},
  methods: {},
};
</script>

<style>
</style>