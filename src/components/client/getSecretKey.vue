<template>
  <div>
    <v-row justify="center" align="baseline" class="mt-0">
      <v-btn color="primary" @click="showResponse = true" class="ml-5 mt-4">
        Get Secret Key
      </v-btn>
    </v-row>
    <v-row v-if="showResponse" justify="center" align="baseline" class="mt-10">
      <div class="messag">Secret Key </div>
      <drizzle-contract
        :key="hashId"
        contractName="CloudSystem"
        method="getSecretKey"
      />
    </v-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "GetSecretKey",
  data() {
    return {
      hashId: " ",
      showResponse: false,
    };
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
  },
  created() {},
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