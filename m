Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFE1C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFSJwcz5k3psK6wQn9vHAxcjXrXfl1v982u8Lf3cp2U=; b=KIrjPYC7C188Pgt4APfuULdg+Z
	pPft7UmlyWgSgEDgNBzkVNPHfkpxbWpb4qGBzlWQZhCv8BZ6gQHQ17hWjHODnIlykNn8SGBWIBxHE
	BnniLuGA5fudfbQ0z6DbZ+R8xDJAtdfeJK/+NNegUZ4lUlyA+74xUHx/H+Pd4xxT3o7Qsk0b5ctkp
	WUwsERGUMUAB9yF0rJyBb7KD9ByOR7dWXpQmCcrkNFLGJ84xLEK1bifrfRqYTjqzeO5PJgPkHSCRl
	BXJGEg6Z4229p1RHGjN1qQ8pibhAMAVZai5/AYUqtxTkT6f+ey2tBhBtZkdvfD4ve1XmUL30hMHO/
	5tCYiVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCDN-00000004P7T-3ghx;
	Thu, 07 Mar 2024 11:47:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCBt-00000004O0j-15OJ;
	Thu, 07 Mar 2024 11:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709811935;
	bh=IBBs8wsWLVP6Y6LCDKxs6KnJVjZKYs0pi1oC6afZdDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VMLHOpi8HO3X1y/V0VmnYZCb1fHKBWd925C6HvZOlchCNfCFBPUlrK9FN1B/hv9C5
	 GxkdIhiBS+PepU/wyAXGdpCHre5xzD8z75CFQn6gtLOiqDe8SfbDjVUFtwLJXp7rtq
	 zrhiSAUiQ8EdBIyhB5MJNsz4D0YCzj1V1Cc56c7Bw6uh4FD5xlOwSXRx+tNOcdhLWh
	 YN12PusIM0Z9Vdv2xZ6hMqWnjTQqGv7qCyNo0Clt/hnNwtg2B1dEN8wYp16e1aipHy
	 NyM+RPicXgkitW4GvB4ZJLl9pIMlw+BnYpskGTUxOO5s/T2nA8hivl0ZcdnGqT53UZ
	 5UOhwN3a/J+BQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BE55737820F5;
	Thu,  7 Mar 2024 11:45:33 +0000 (UTC)
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
Subject: [PATCH v2 18/22] ASoC: dt-bindings: mt8195: Document audio-routing and dai-link subnode
Date: Thu,  7 Mar 2024 12:44:41 +0100
Message-ID: <20240307114445.196981-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_034537_721333_38786B4F 
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
used with driver hardcoded configuration.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/sound/mt8195-mt6359.yaml         | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index c1ddbf672ca3..dfd6e61935ab 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -12,6 +12,9 @@ maintainers:
 description:
   This binding describes the MT8195 sound card.
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -23,6 +26,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User specified audio sound card name
 
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
     description: The phandle of MT8195 ASoC platform.
@@ -30,10 +41,12 @@ properties:
   mediatek,dptx-codec:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 Display Port Tx codec node.
+    deprecated: true
 
   mediatek,hdmi-codec:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 HDMI codec node.
+    deprecated: true
 
   mediatek,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -45,20 +58,122 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
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
+        enum:
+          - DPTX_BE
+          - ETDM1_IN_BE
+          - ETDM2_IN_BE
+          - ETDM1_OUT_BE
+          - ETDM2_OUT_BE
+          - ETDM3_OUT_BE
+          - PCM1_BE
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
 
+# Disallow legacy properties if xxx-dai-link nodes are specified
+if:
+  not:
+    patternProperties:
+      ".*-dai-link$": false
+then:
+  properties:
+    mediatek,dptx-codec: false
+    mediatek,hdmi-codec: false
+
 examples:
   - |
 
     sound: mt8195-sound {
         compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
+        model = "mt8195_r1019_5682";
         mediatek,platform = <&afe>;
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
+
+        audio-routing =
+                "Headphone", "HPOL",
+                "Headphone", "HPOR",
+                "IN1P", "Headset Mic",
+                "Ext Spk", "Speaker";
+
+        mm-dai-link {
+                link-name = "ETDM1_IN_BE";
+                mediatek,clk-provider = "cpu";
+        };
+
+        hs-playback-dai-link {
+                link-name = "ETDM1_OUT_BE";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&headset_codec>;
+                };
+        };
+
+        hs-capture-dai-link {
+                link-name = "ETDM2_IN_BE";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&headset_codec>;
+                };
+        };
+
+        spk-playback-dai-link {
+                link-name = "ETDM2_OUT_BE";
+                mediatek,clk-provider = "cpu";
+                codec {
+                        sound-dai = <&spk_amplifier>;
+                };
+        };
+
+        hdmi-dai-link {
+                link-name = "ETDM3_OUT_BE";
+                codec {
+                        sound-dai = <&hdmi_tx>;
+                };
+        };
+
+        displayport-dai-link {
+                link-name = "DPTX_BE";
+                codec {
+                        sound-dai = <&dp_tx>;
+                };
+        };
     };
 
 ...
-- 
2.44.0


