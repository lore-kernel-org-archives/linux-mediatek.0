Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A44C5478C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37IRL9Y9n3JSJCK3M8aKplApsRQVAmXzC8HBkWbpEo8=; b=Kmu5FNML/OL9cUOvInEGdypP0O
	etFwcvUHy515cRwPyw+sZXfirX+ZeS7MzpStsIDbD5xnb7hCB6WCz1u5t9RfI0Pe7AAeIVkkFCrZo
	nwJ5CPBHSfecjkUZ1f/u6lIHjSezhUmmtzhCV/2EPtgi3kvHQPl+oE4gj5uPdxIvkrV9JcE6VtxqP
	nkK8ocf9LCOR1wqJQlGDhWyglnlXtutWb/DTyaKcDUxmYOXi6Gek9EGFKsMJ58wO5HamIgrCsg5Wj
	qgE3KFmMy8fd3uxPHf8y67atNlsC09H9SR1LDUPmK3fVd+Mh4Q3ya4hsvWehnaDGMPScpiLsZrLkT
	BN2zvBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewLD-000000056Vr-1yxE;
	Tue, 27 Feb 2024 12:13:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewIU-000000054qY-16r0;
	Tue, 27 Feb 2024 12:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035856;
	bh=FpZkwYdVfTF+bMDobFvJQk2yvXp+Z6trPflZm3oUlZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MhrmIBZLuCengucGyVl5DGZeBRydUYfybL6TrY4t6sGpxblPW+mvRL19oezNk+jKk
	 46ghplWyhBYbjSefmsDbsOwfDzfePMAyUbfrvdX0891mgBiwgOVhqgc+FZvULUw+2Y
	 tdLypUTgv2LLXSKMvgLgyZyBqVzVZrs3juZA0U0iqWrcYjKNi+ppf1emP8dxrARRkO
	 2mG6T1wg1MftZZZhJGKPwc9fcwbmSziaQ7AtqEnsqu9dqIGLDNSu4S3MSzSsRsr8KH
	 45RfU4PAr3E48BVj4MAa0tLm3IWDfLYalbp+W/az/Fow8/6epWSeA+dl/OL0uMgq/c
	 oeWtYrhmwuC1g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A78BE37820ED;
	Tue, 27 Feb 2024 12:10:54 +0000 (UTC)
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
Subject: [PATCH 19/22] ASoC: dt-bindings: mt8192: Document audio-routing and dai-link subnode
Date: Tue, 27 Feb 2024 13:09:36 +0100
Message-ID: <20240227120939.290143-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041058_869524_3D5BF4E8 
X-CRM114-Status: GOOD (  11.54  )
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
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 129 ++++++++++++++++--
 1 file changed, 121 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 7e50f5d65c8f..78e221003750 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -20,6 +20,15 @@ properties:
       - mediatek,mt8192_mt6359_rt1015p_rt5682
       - mediatek,mt8192_mt6359_rt1015p_rt5682s
 
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
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
@@ -27,10 +36,12 @@ properties:
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
@@ -41,6 +52,7 @@ properties:
   speaker-codecs:
     type: object
     additionalProperties: false
+    deprecated: true
 
     properties:
       sound-dai:
@@ -51,13 +63,83 @@ properties:
     required:
       - sound-dai
 
+patternProperties:
+  ".*-dai-link$":
+    type: object
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
+            - I2S4
+            - I2S5
+            - I2S6
+            - I2S7
+            - I2S8
+            - I2S9
+            - TDM
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
+    additionalProperties: false
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
+allOf:
+  # Disallow dai-link-xxx nodes if the legacy properties are specified
+  - if:
+      patternProperties:
+        ".*-dai-link$": false
+    then:
+      required:
+        - headset-codec
+        - speaker-codecs
+    else:
+      properties:
+        headset-codec: false
+        speaker-codecs: false
+        mediatek,hdmi-codec: false
 
 examples:
   - |
@@ -65,19 +147,50 @@ examples:
     sound: mt8192-sound {
         compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
         mediatek,platform = <&afe>;
-        mediatek,hdmi-codec = <&anx_bridge_dp>;
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
 
-        headset-codec {
-            sound-dai = <&rt5682>;
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
+
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


