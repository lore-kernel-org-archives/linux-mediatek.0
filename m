Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7502C05023
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okUuje74vzD+Y9zic4CiaZbfAm7aoZh2cnF4259qKKM=; b=hNpquyRWQQEE/Rj6wZ0zxFSizu
	fbSoAma8dyzncxP8uDtHttXTvhVQUWqV6Os56cvLQw1sC1uVTc7UR+WvRyEjkDK2KC4uBKongh16s
	jqM8/txcNa8i/klT32ACtFYyKxcDM9jUVJ0zfihaAdti+b32dsNiSUk8hoCQBqgrnJ3nZN9hfOjpa
	ey7gpJSCbSLIlcPC2w6tw+aT14HAgJWb1J+10QDyORoNWZIjGsmDe0vFvJ7rdewpAv5tIME4n7xBa
	405M7zwvSK30z1AGI7DdhL6UcTYNCJ5vIGwrhMou4Fb+Z52IVCj+l9/4n7CqndGYFBEceUn4WDmBo
	C8g+WXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd48-0000000BDm3-0Vog;
	Tue, 16 Apr 2024 07:17:16 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwd1t-0000000BCKX-3nTe;
	Tue, 16 Apr 2024 07:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251696;
	bh=0Xu+A6DQSApUl+bx7dqAi1yjwT+TMZd9+xG6pwiMVK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQjwEv6ZWzF9Ay/bg3H0wAkkjqZxasipdTIvYhVpZ/etz69slrDOawj+7rLe8leTi
	 jhzD9FWjwOfwIW9vbN+3QZg+fY5Evgcy4u2QB53qzjh5ZsrPiNhy2pWUjj22RNYgAg
	 iu4HJ2tfwWJ0AOOMApNLzKOeN3klv1Ovo9FZswp37jYEE+ua1uG7zjIaWGxtMQYlPX
	 u5KvZVSK9sOg6yo7M9AeJrux48r7Mfm1g+F3jEYFMyg90ljJNnn+f9q0Iuu5jKCG4A
	 Sfod7S2Ci1MsL2hX0QaguHQ5Ai2L7ItQUsJuAmkcjpj7P2uofiVw5QO6/C5sYHsNXs
	 Sv/8uxymKcpEg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 71226378210B;
	Tue, 16 Apr 2024 07:14:54 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 16/18] ASoC: dt-bindings: mt8186: Document audio-routing and dai-link subnode
Date: Tue, 16 Apr 2024 09:14:08 +0200
Message-ID: <20240416071410.75620-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_001458_289314_A1CB760C 
X-CRM114-Status: GOOD (  13.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the dai-link subnodes and the audio-routing property, allowing
to describe machine specific audio hardware and links in device tree.

While at it, also deprecate the old properties which were previously
used with the driver's partially hardcoded configuration.

Also, since describing machine specific audio hardware and links replaces
the now deprecated old logic doing the same in a driver hardcoded fashion,
it is not allowed to have both the old and new properties together.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../sound/mt8186-mt6366-da7219-max98357.yaml  | 131 ++++++++++++++++--
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 120 ++++++++++++++--
 2 files changed, 233 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index 9853c11a1330..cbc641ecbe94 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -12,17 +12,46 @@ maintainers:
 description:
   This binding describes the MT8186 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - mediatek,mt8186-mt6366-da7219-max98357-sound
 
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
+    minItems: 2
+    items:
+      enum:
+        # Sinks
+        - HDMI1
+        - Headphones
+        - Line Out
+        - MIC
+        - Speakers
+
+        # Sources
+        - Headset Mic
+        - HPL
+        - HPR
+        - Speaker
+        - TX
+
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8186 ASoC platform.
 
   headset-codec:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -32,6 +61,7 @@ properties:
 
   playback-codecs:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -53,32 +83,115 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
-additionalProperties: false
+patternProperties:
+  ".*-dai-link$":
+    type: object
+    additionalProperties: false
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        items:
+          enum:
+            - I2S0
+            - I2S1
+            - I2S2
+            - I2S3
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      dai-format:
+        description: audio format
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        items:
+          enum:
+            - cpu
+            - codec
+
+    required:
+      - link-name
+
+unevaluatedProperties: false
 
 required:
   - compatible
   - mediatek,platform
-  - headset-codec
-  - playback-codecs
+
+# Disallow legacy properties if xxx-dai-link nodes are specified
+if:
+  not:
+    patternProperties:
+      ".*-dai-link$": false
+then:
+  properties:
+    headset-codec: false
+    speaker-codecs: false
 
 examples:
   - |
 
     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-da7219-max98357-sound";
-        mediatek,platform = <&afe>;
+        model = "mt8186_da7219_m98357";
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        mediatek,platform = <&afe>;
+
+        audio-routing =
+                "Headphones", "HPL",
+                "Headphones", "HPR",
+                "MIC", "Headset Mic",
+                "Speakers", "Speaker",
+                "HDMI1", "TX";
+
+        hs-playback-dai-link {
+                link-name = "I2S0";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&da7219>;
+                };
+        };
 
-        headset-codec {
-            sound-dai = <&da7219>;
+        hs-capture-dai-link {
+                link-name = "I2S1";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&da7219>;
+                };
         };
 
-        playback-codecs {
-            sound-dai = <&anx_bridge_dp>,
-                        <&max98357a>;
+        spk-dp-playback-dai-link {
+                link-name = "I2S3";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&anx_bridge_dp>, <&max98357a>;
+                };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index bdf7b0960533..ed93f18ef985 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -12,6 +12,9 @@ maintainers:
 description:
   This binding describes the MT8186 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -19,6 +22,34 @@ properties:
       - mediatek,mt8186-mt6366-rt5682s-max98360-sound
       - mediatek,mt8186-mt6366-rt5650-sound
 
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
+    minItems: 2
+    items:
+      enum:
+        # Sinks
+        - HDMI1
+        - Headphone
+        - IN1P
+        - IN1N
+        - Line Out
+        - Speakers
+
+        # Sources
+        - Headset Mic
+        - HPOL
+        - HPOR
+        - Speaker
+        - SPOL
+        - SPOR
+        - TX
+
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8186 ASoC platform.
@@ -32,6 +63,7 @@ properties:
 
   headset-codec:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -41,6 +73,7 @@ properties:
 
   playback-codecs:
     type: object
+    deprecated: true
     additionalProperties: false
     properties:
       sound-dai:
@@ -62,13 +95,56 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
-additionalProperties: false
+patternProperties:
+  ".*-dai-link$":
+    type: object
+    additionalProperties: false
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        enum: [ I2S0, I2S1, I2S2, I2S3 ]
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      dai-format:
+        description: audio format
+        enum: [ i2s, right_j, left_j, dsp_a, dsp_b ]
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        enum: [ cpu, codec ]
+
+    required:
+      - link-name
+
+unevaluatedProperties: false
 
 required:
   - compatible
   - mediatek,platform
-  - headset-codec
-  - playback-codecs
+
+# Disallow legacy properties if xxx-dai-link nodes are specified
+if:
+  not:
+    patternProperties:
+      ".*-dai-link$": false
+then:
+  properties:
+    headset-codec: false
+    speaker-codecs: false
 
 examples:
   - |
@@ -76,23 +152,49 @@ examples:
 
     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
-        mediatek,platform = <&afe>;
+        model = "mt8186_rt1019_rt5682s";
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on",
                         "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
         pinctrl-2 = <&aud_gpio_dmic_sec>;
+        mediatek,platform = <&afe>;
 
         dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;
 
-        headset-codec {
-            sound-dai = <&rt5682s>;
+        audio-routing =
+                "Headphone", "HPOL",
+                "Headphone", "HPOR",
+                "IN1P", "Headset Mic",
+                "Speakers", "Speaker",
+                "HDMI1", "TX";
+
+        hs-playback-dai-link {
+                link-name = "I2S0";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682s 0>;
+                };
+        };
+
+        hs-capture-dai-link {
+                link-name = "I2S1";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682s 0>;
+                };
         };
 
-        playback-codecs {
-             sound-dai = <&it6505dptx>,
-                         <&rt1019p>;
+        spk-hdmi-playback-dai-link {
+                link-name = "I2S3";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&it6505dptx>, <&rt1019p>;
+                };
         };
     };
 
-- 
2.44.0


