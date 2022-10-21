Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4C9C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvfWNSFxycEwY7XS039kQ3D+Wofpm1pIipc59irqP3g=; b=0SXDF2yY3Jzw7MGra2ZfQ//zbJ
	Mmuz43GJrAek/aaiEwCzVvPNKUD8Fdq+PFO9VKTWst8jAR89BPCBO490GZl06Ho5mIQtuhfWEQeDf
	2riQcHFZrfyIy0q+xGk0HqSDwCp6O1CSzhK373rYk8Lm36R0oAicopM3KQWFfHvxluFbmdDJuwgko
	q5Z2/0m4CFFjRLqvEoRWSdmyGLPKCG0LFG5i+Ft5Ch+2mIMqUEAykHZ99p8g7etp1dGva/5Zo+hZz
	TTo+vmaih0ZJfIEN5w4+aMVcCzcI2ozxqv7o75ylHlnS3RiPMlgTgrgbgR1f5bhhn+7iu0h5NBgpV
	npLcnpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloB4-006jtc-4s; Fri, 21 Oct 2022 09:18:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oloAp-006jpa-DJ; Fri, 21 Oct 2022 09:18:41 +0000
X-UUID: e67eb6714b034fb7bd141d2d92185f5b-20221021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZvfWNSFxycEwY7XS039kQ3D+Wofpm1pIipc59irqP3g=;
	b=F1gpr2UmJMW2yq64L9tIxAotydFWLst04fmIOkz/cge4twxJWpQZgn52NX6fegFpbX0b8ZsdUQaIObGZssK0ml2Aek0+sqy78KvGZ9SMkx7meBq6FA2X3DOR9edhrkrr+BKHoa0Hb9Uy2NwPRUVrezhI+YsBcGBtYTNByRvL/vM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:088e81b9-05d3-471e-aa27-b70d170028ad,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:ebe740e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e67eb6714b034fb7bd141d2d92185f5b-20221021
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1497210208; Fri, 21 Oct 2022 02:18:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 16:27:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 21 Oct 2022 16:27:25 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 10/12] dt-bindings: mediatek: mt8188: add audio afe document
Date: Fri, 21 Oct 2022 16:27:17 +0800
Message-ID: <20221021082719.18325-11-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221021082719.18325-1-trevor.wu@mediatek.com>
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_021839_472269_FFAD859A 
X-CRM114-Status: GOOD (  14.57  )
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
 .../bindings/sound/mt8188-afe-pcm.yaml        | 187 ++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
new file mode 100644
index 000000000000..b2c548c31e4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8188-afe-pcm.yaml#
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
+    maxItems: 16
+    description: |
+      Specify which input channel should be disabled, so the data of
+      specified channel won't be outputted to memory.
+    items:
+      enum: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
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
+    description: |
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


