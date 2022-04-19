<template>
  <div>
    <v-row class="ma-0" align="baseline">
      <v-col cols="4" class="pl-10 pr-5">
        <v-text-field
          label="File Id"
          v-model="hashId"
          solo
          hide-details
        ></v-text-field>
      </v-col>
      <v-col cols="4" class="pl-5 pr-10">
        <v-text-field
          label="Cipher Text"
          v-model="cipher"
          solo
          hide-details
        ></v-text-field>
      </v-col>
      <v-col cols="4" align="left">
        <v-btn color="primary" @click="decipherText" class="ml-5">
          Decipher
        </v-btn>
      </v-col>
    </v-row>
    <v-row class="ma-0">
      <v-col cols="12" class="px-10 pb-0" align="start">File -</v-col>
      <v-col cols="8" class="px-10">
        <v-textarea solo v-model="resultText" readonly></v-textarea>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "DecipherFile",
  data() {
    return {
      hashId: undefined,
      cipher: undefined,
      resultText: "",
      files: [
        {
          id: 1,
          hash: "123",
          ciphertext: "zyxwvutsrqponmlkjihgfedcba",
          text: "the quick brown fox jumps over thirteen lazy dogs",
          encrypted: "gsv jfrxp yildm ulc qfnkh levi gsrigvvm ozab wlth",
        },
        {
          id: 2,
          hash: "456",
          ciphertext: "azertyuiopqsdfghjklmwxcvbn",
          text: "Most of the people of our country are farmers, workers, and day laborers who live below the poverty line. But the price of essential commodities is soaring higher and higher.All these have made the life of the common man miserable.",
          encrypted:
            "Dglm gy mit htghst gy gwk egwfmkb akt yakdtkl, cgkqtkl, afr rab sazgktkl cig soxt ztsgc mit hgxtkmb soft. Zwm mit hkoet gy tlltfmoas egddgromotl ol lgakofu iouitk afr iouitk.Ass mitlt iaxt dart mit soyt gy mit egddgf daf doltkazst.",
        },
        {
          id: 1,
          hash: "789",
          ciphertext: "cdefghijklmnopqrstuvwxyzab",
          text: "Early men did not know how to grow food and use fire. Now we are totally dependent on the gifts of Science. Science had made our life easier and enjoyable with vehicles, TV, radio, telephones, lights, media, computers, etc. Space flight is another wonder of science.",
          encrypted:
            "Gctna ogp fkf pqv mpqy jqy vq itqy hqqf cpf wug hktg. Pqy yg ctg vqvcnna fgrgpfgpv qp vjg ikhvu qh Uekgpeg. Uekgpeg jcf ocfg qwt nkhg gcukgt cpf gplqacdng ykvj xgjkengu, VX, tcfkq, vgngrjqpgu, nkijvu, ogfkc, eqorwvgtu, gve. Urceg hnkijv ku cpqvjgt yqpfgt qh uekgpeg.",
        },
      ],
    };
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    utils() {
      return this.drizzleInstance.web3.utils;
    },
  },
  methods: {
    decipherText() {
      if (!this.hashId || !this.cipher)
        this.resultText = "Enter both File Hash ID and Cipher Text!!";
      else {
        let file = this.files.filter((obj) => obj.hash == this.hashId);
        if (!file) this.resultText = "File not found!!";

        this.resultText = this.decrypt(
          file[0].encrypted,
          this.utils.toUtf8(this.cipher)
        );
      }
    },
    decrypt(cipherText, lastKey) {
      var _key = lastKey,
        _cipherText = cipherText.toLowerCase(),
        _plainText = "",
        _regex = /[a-z]/;

      if (_cipherText.length < 1) {
        throw "Blank text!";
      }

      for (var i = 0, len = _cipherText.length; i < len; i++) {
        if (_regex.test(_cipherText.charAt(i)))
          _plainText += String.fromCharCode(
            _key.indexOf(_cipherText.charAt(i)) + 97
          );
        else _plainText += _cipherText.charAt(i);
      }

      return _plainText;
    },
  },
};
</script>

<style scoped>
</style>