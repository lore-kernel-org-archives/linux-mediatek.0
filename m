Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8091CC63703
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 03:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VG9jT5xqCzn1Y81lS+7BNjOae3DIvbVuRsqbf3joSs=; b=oRGAKKEqTh58N5bfHbt/BQTHnm
	l9BU/UOh7DqflKCc4cB9PjS8ehLYNXgYTITuaLyTh+++Dm9QE7LZoodqVelw/VX6mWNEkxPMoHKpw
	JcYQWBBXIfZ3ufO0+99wWNLyOuDtJEViIkcyQ6lHHDE1Ox9+VouTNMKLuSdHct4ndyEkStWdSEJow
	WT4sTkBuhBaVI+xX/u4occqVfWjEbL5PhV1LYKOQrWPUm01mCbJAZRz53YZbViKxmmJKwBd3/xQkb
	AL/HaYhkc5O6HYvewL20NJeXuxRIqnsGGmC9aCJSWccx+72yrD1KOxDcDeo82ex/WURsysZ6vyyNm
	VVFuAtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p37eE-000wLT-E9; Thu, 08 Dec 2022 03:32:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p37e1-000w1B-LL; Thu, 08 Dec 2022 03:32:23 +0000
X-UUID: e86233602eb54ac18af51e9c2bde8283-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1VG9jT5xqCzn1Y81lS+7BNjOae3DIvbVuRsqbf3joSs=;
	b=DZDti5N1ou44/FJQLD5HuZjTEauNCjKgtalJGrLgV57rDvavCONYfSB2EeYJ3uEHymPzmgEof7tjCZhjkOVK2SO6srTmONS4cNd6LvIflWvMxeMN1L60jZm48j6EC302VPs4cEbDciDHxwmlcL8xA8B1gHgxcfPm2orgy/Kk5R0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f4979487-a3ca-4d8f-bf54-a50f6354b32a,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:e417a524-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e86233602eb54ac18af51e9c2bde8283-20221207
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 470566236; Wed, 07 Dec 2022 20:32:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Dec 2022 11:32:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Dec 2022 11:32:14 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 10/12] dt-bindings: mediatek: mt8188: add audio afe document
Date: Thu, 8 Dec 2022 11:31:46 +0800
Message-ID: <20221208033148.21866-11-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221208033148.21866-1-trevor.wu@mediatek.com>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_193221_909262_7E981B6B 
X-CRM114-Status: GOOD (  14.38  )
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

Add mt8188 audio afe document.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../devicetree/bindings/sound/mt8188-afe.yaml | 196 ++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe.yaml
new file mode 100644
index 000000000000..6ab26494d924
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8188-afe.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8188-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AFE PCM controller for mt8188
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8188-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: audiosys
+
+  mediatek,topckgen:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek topckgen controller
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26M clock
+      - description: audio pll1 clock
+      - description: audio pll2 clock
+      - description: clock divider for i2si1_mck
+      - description: clock divider for i2si2_mck
+      - description: clock divider for i2so1_mck
+      - description: clock divider for i2so2_mck
+      - description: clock divider for dptx_mck
+      - description: a1sys hoping clock
+      - description: audio intbus clock
+      - description: audio hires clock
+      - description: audio local bus clock
+      - description: mux for dptx_mck
+      - description: mux for i2so1_mck
+      - description: mux for i2so2_mck
+      - description: mux for i2si1_mck
+      - description: mux for i2si2_mck
+      - description: audio 26m clock
+
+  clock-names:
+    items:
+      - const: clk26m
+      - const: apll1_ck
+      - const: apll2_ck
+      - const: apll12_div0
+      - const: apll12_div1
+      - const: apll12_div2
+      - const: apll12_div3
+      - const: apll12_div9
+      - const: a1sys_hp_sel
+      - const: aud_intbus_sel
+      - const: audio_h_sel
+      - const: audio_local_bus_sel
+      - const: dptx_m_sel
+      - const: i2so1_m_sel
+      - const: i2so2_m_sel
+      - const: i2si1_m_sel
+      - const: i2si2_m_sel
+      - const: adsp_audio_26m
+
+patternProperties:
+  "^mediatek,etdm-in[1-2]-chn-disabled$":
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 16
+    description:
+      By default, all data received from ETDM pins will be outputed to
+      memory. etdm in supports disable_out in direct mode(w/o interconn).
+      User can specify the channel ID which they hope dropping and then
+      the specified channel won't be seen on memory.
+    uniqueItems: true
+    items:
+      minimum: 0
+      maximum: 15
+
+  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
+    description: Specify etdm in mclk output rate for always on case.
+
+  "^mediatek,etdm-out[1-3]-mclk-always-on-rate-hz$":
+    description: Specify etdm out mclk output rate for always on case.
+
+  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
+    type: boolean
+    description: if present, the etdm data mode is I2S.
+
+  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
+    type: boolean
+    description: if present, the etdm data mode is I2S.
+
+  "^mediatek,etdm-in[1-2]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm in moudule.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+
+  "^mediatek,etdm-out[1-2]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm out moudule.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+  - mediatek,topckgen
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe: afe@10b10000 {
+        compatible = "mediatek,mt8188-afe";
+        reg = <0x10b10000 0x10000>;
+        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+        resets = <&watchdog 14>;
+        reset-names = "audiosys";
+        mediatek,topckgen = <&topckgen>;
+        power-domains = <&spm 13>; //MT8188_POWER_DOMAIN_AUDIO
+        mediatek,etdm-in2-cowork-source = <2>;
+        mediatek,etdm-out2-cowork-source = <0>;
+        mediatek,etdm-in1-multi-pin-mode;
+        mediatek,etdm-in1-chn-disabled = /bits/ 8 <0x0 0x2>;
+        clocks = <&clk26m>,
+                 <&topckgen 72>, //CLK_TOP_APLL1
+                 <&topckgen 73>, //CLK_TOP_APLL2
+                 <&topckgen 186>, //CLK_TOP_APLL12_CK_DIV0
+                 <&topckgen 187>, //CLK_TOP_APLL12_CK_DIV1
+                 <&topckgen 188>, //CLK_TOP_APLL12_CK_DIV2
+                 <&topckgen 189>, //CLK_TOP_APLL12_CK_DIV3
+                 <&topckgen 191>, //CLK_TOP_APLL12_CK_DIV9
+                 <&topckgen 83>, //CLK_TOP_A1SYS_HP
+                 <&topckgen 31>, //CLK_TOP_AUD_INTBUS
+                 <&topckgen 32>, //CLK_TOP_AUDIO_H
+                 <&topckgen 69>, //CLK_TOP_AUDIO_LOCAL_BUS
+                 <&topckgen 81>, //CLK_TOP_DPTX
+                 <&topckgen 77>, //CLK_TOP_I2SO1
+                 <&topckgen 78>, //CLK_TOP_I2SO2
+                 <&topckgen 79>, //CLK_TOP_I2SI1
+                 <&topckgen 80>, //CLK_TOP_I2SI2
+                 <&adsp_audio26m 0>; //CLK_AUDIODSP_AUDIO26M
+        clock-names = "clk26m",
+                      "apll1_ck",
+                      "apll2_ck",
+                      "apll12_div0",
+                      "apll12_div1",
+                      "apll12_div2",
+                      "apll12_div3",
+                      "apll12_div9",
+                      "a1sys_hp_sel",
+                      "aud_intbus_sel",
+                      "audio_h_sel",
+                      "audio_local_bus_sel",
+                      "dptx_m_sel",
+                      "i2so1_m_sel",
+                      "i2so2_m_sel",
+                      "i2si1_m_sel",
+                      "i2si2_m_sel",
+                      "adsp_audio_26m";
+    };
+
+...
-- 
2.18.0


