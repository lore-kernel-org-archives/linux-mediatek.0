Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8D4C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IcLA+L5cJYec3f2Od6TLTHDy8Fss42h4H7vqUnr2l0=; b=pfvOzpg/G1N9WixelLtrVwg8AM
	2/7qJbpfzKyVcQbW0VQpouwTks71U408CCP74jBA7Hak0zo3aFFdN2x086apgZTAPK6wncuXaCvl6
	FwbHq6VwAqDLFB/eUbjKslSIfgMIr/uEI5TxsmFX2f8PpJWF5YVXaJZdYGVKy0SoPOlAFXqxrGsyT
	Wz0TgOTjublU0yxUDdv9PC2ColfWKmxb+C4I609rlM9lu9CPRLSmnfGej1QhXXLa5+fnHbl6gBsJ/
	s7vjzAamUqDGyTxML71sn9euYQHwksgxnNAv62K05OvjK1HjaTdSxeOa3M/dKqPnN/+sVPjfYfv9w
	rGw0Ei1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCDP-00000004P8b-1uVf;
	Thu, 07 Mar 2024 11:47:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCBv-00000004O2a-2QtT;
	Thu, 07 Mar 2024 11:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709811938;
	bh=PhUbcVjfbDZRFpij5bSKc+8hvWDLh0jAfdYGXhyvfGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1yQDhPJXTzad1FHuZjnONMxRAtgjyRo58y2Us1LAou+ipgfsUngaCvQxyz7EskJ30
	 Q/MaBlE86nDpnMd5gwHQm9ocfkVdeJQI/bT4kOawcZGSPOMyzwlqTykfPWxfP/m7Ml
	 HSMSkhWJ7wKPOfDOTTacR1xa4DaAByINXCU8uuhVUKJCF/pfqHlXrR70eifHl542vx
	 r3ZTs6lstS3CsGi87sTbfzk1TCIcCKntceigvRChou7vSb4Hqa7G0Qzb6EKDQRqvPQ
	 NqtJts/8D1HUPtbenV32pKOw5DbPIhBmo6cOc/kZBP0nYOc2nZBHr+yEip0Xf2sCfm
	 /h65wCBg1HvLg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25E1137820EE;
	Thu,  7 Mar 2024 11:45:36 +0000 (UTC)
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
Subject: [PATCH v2 19/22] ASoC: dt-bindings: mt8192: Document audio-routing and dai-link subnode
Date: Thu,  7 Mar 2024 12:44:42 +0100
Message-ID: <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_034540_679827_4B04A722 
X-CRM114-Status: GOOD (  11.40  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 124 ++++++++++++++++--
 1 file changed, 115 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 7e50f5d65c8f..449454c50dcc 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -13,6 +13,9 @@ maintainers:
 description:
   This binding describes the MT8192 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -20,6 +23,14 @@ properties:
       - mediatek,mt8192_mt6359_rt1015p_rt5682
       - mediatek,mt8192_mt6359_rt1015p_rt5682s
 
+  audio-routing:
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
+
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8192 ASoC platform.
@@ -27,10 +38,12 @@ properties:
   mediatek,hdmi-codec:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of HDMI codec.
+    deprecated: true
 
   headset-codec:
     type: object
     additionalProperties: false
+    deprecated: true
 
     properties:
       sound-dai:
@@ -41,6 +54,7 @@ properties:
   speaker-codecs:
     type: object
     additionalProperties: false
+    deprecated: true
 
     properties:
       sound-dai:
@@ -51,33 +65,125 @@ properties:
     required:
       - sound-dai
 
+patternProperties:
+  ".*-dai-link$":
+    type: object
+    additionalProperties: false
+
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name
+        enum:
+          - I2S0
+          - I2S1
+          - I2S2
+          - I2S3
+          - I2S4
+          - I2S5
+          - I2S6
+          - I2S7
+          - I2S8
+          - I2S9
+          - TDM
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
 additionalProperties: false
 
 required:
   - compatible
   - mediatek,platform
-  - headset-codec
-  - speaker-codecs
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
+    mediatek,hdmi-codec: false
+else:
+  required:
+    - headset-codec
+    - speaker-codecs
 
 examples:
   - |
 
     sound: mt8192-sound {
         compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
-        mediatek,platform = <&afe>;
-        mediatek,hdmi-codec = <&anx_bridge_dp>;
+        model = "mt8192_mt6359_rt1015_rt5682";
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        mediatek,platform = <&afe>;
+
+        audio-routing =
+                "Headphone Jack", "HPOL",
+                "Headphone Jack", "HPOR",
+                "IN1P", "Headset Mic",
+                "Speakers", "Speaker";
+
+        spk-playback-dai-link {
+                link-name = "I2S3";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt1015p>;
+                };
+        };
+
+        hs-playback-dai-link {
+                link-name = "I2S8";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682 0>;
+                };
+        };
 
-        headset-codec {
-            sound-dai = <&rt5682>;
+        hs-capture-dai-link {
+                link-name = "I2S9";
+                dai-format = "i2s";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&rt5682 0>;
+                };
         };
 
-        speaker-codecs {
-            sound-dai = <&rt1015_l>,
-                        <&rt1015_r>;
+        displayport-dai-link {
+                link-name = "TDM";
+                dai-format = "dsp_a";
+                codec {
+                        sound-dai = <&anx_bridge_dp>;
+                };
         };
     };
 
-- 
2.44.0


