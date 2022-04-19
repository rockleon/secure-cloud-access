<template>
  <div v-if="isDrizzleInitialized" class="light-border">
    <v-tabs center-active centered v-model="tab">
      <v-tab>Set File Hash ID</v-tab>
      <v-tab>Set Secret Key</v-tab>
      <v-tab>Set Cipher Text</v-tab>
      <v-tab>Set User Interval</v-tab>
    </v-tabs>
    <v-divider></v-divider>
    <v-tabs-items v-model="tab" class="mt-8 mb-3">
      <v-tab-item>
        <set-file-hash-id />
      </v-tab-item>
      <v-tab-item>
        <set-secret-key />
      </v-tab-item>
      <v-tab-item>
        <set-cipher-text />
      </v-tab-item>
      <v-tab-item>
        <set-user-interval />
      </v-tab-item>
    </v-tabs-items>
  </div>
  <div v-else>Loading application...</div>
</template>

<script>
import { mapGetters } from "vuex";
import SetSecretKey from "@/components/admin/setSecretKey.vue";
import setFileHashId from "../components/admin/setFileHashId.vue";
import SetCipherText from "@/components/admin/setCipherText.vue";
import SetUserInterval from "@/components/admin/setUserInterval.vue";

export default {
  components: { setFileHashId, SetSecretKey, SetCipherText, SetUserInterval },
  name: "AdminView",
  data() {
    return {
      hashId: null,
      tab: null,
    };
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
  },
  mounted() {},
  methods: {},
};
</script>

<style scoped>
</style>