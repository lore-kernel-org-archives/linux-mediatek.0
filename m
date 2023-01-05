Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA6EC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 19:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFWPA+OaiDvrbNYBvr/4+UjDkXUdsp++0J+VolUNkrM=; b=G7L1UEgsKBaJjybSjfqZIDjwbn
	84+KZUE4jrQ7Dn8sA/Q/7DQPrWwfp+uiEJWzYF3CXafYxoZEsAMwtcrNEenMXf7H7qjh/wEd5o7mq
	gax4Yrg4T+i0/7A5i1Gqkc0hgRado8l3eRB4rJW4We/HaQXWeED5P820cvpBdzfseIXCIre83QOA/
	mfEY0X1W2gLxwm49WJoSTROwILpTz60sMlHScrDO3HYo7ostP+rrEHiUkTzEn0xDUOUo8/Ro57+jB
	CPn3kp7TkJfZfN2kb7yX7jlmhjB3nZa3TT7BSPTAYpMm10qqa3k1cG062DkJHQxpHrNmUM6INBsuF
	zYrc39bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVsm-00E6ch-6b; Thu, 05 Jan 2023 19:26:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDLRL-008TRL-37; Thu, 05 Jan 2023 08:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dFWPA+OaiDvrbNYBvr/4+UjDkXUdsp++0J+VolUNkrM=; b=goMZTY8Krmffupe0SWBIG8TccS
	HPsryLxZQvgTnBmeAI1hZhwmygGq/D9fywT2N0fhovMFUIRccp1T3WlasPxxttvkBNgs5nV740FcY
	vxKcJNhdE3wLo/Y01ru553Rl9az/A5u+1ofYcMleqwiO5D3enFXccst+acLwHQydW3ycoFP2Ad8Gj
	Z6GH6rkqfMhbNBrC8Rmx7SVatilq86eU8GgoGaqM6yq6acPTzluu6JJhVm1KB2nb5xIxc3FY9hxiv
	0tbEJHgkE502Js4EI8zjHMbQyQ7YJnnPTURAYqkAKfKFToAn119RVxPqbmGBOa1I/VmWQfF8nr0l7
	XWsNdbVg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDLRA-001Fev-0y;
	Thu, 05 Jan 2023 08:17:23 +0000
X-UUID: 0024b9ff33824813a1af874b70b0431f-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dFWPA+OaiDvrbNYBvr/4+UjDkXUdsp++0J+VolUNkrM=;
	b=QNMwLr+4Gn8m8HrCbtV3TDCjyCRsBaB24FwYBhmy5nEIFkUgPFFW4z8Pm0WkgN7t4AWjsdBe8VcpagFhodA1eTATJk3WkGwifKZ05eAGUjUl6IvBmjQsY+7hEd309lIPuvCFFFaWQ9BSpVvXE7KMhARLUmcrEEqUoF4ar4YRtmM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:13814f7c-c72c-4539-8868-6e63d07ae8a9,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:6c38b953-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 0024b9ff33824813a1af874b70b0431f-20230105
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 674761123; Thu, 05 Jan 2023 01:17:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 16:16:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 16:16:15 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 10/13] ASoC: dt-bindings: mediatek,mt8188-afe: add audio afe document
Date: Thu, 5 Jan 2023 16:16:03 +0800
Message-ID: <20230105081606.6582-11-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105081606.6582-1-trevor.wu@mediatek.com>
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_081721_647557_E4262120 
X-CRM114-Status: GOOD (  15.02  )
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
 .../bindings/sound/mediatek,mt8188-afe.yaml   | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
new file mode 100644
index 000000000000..82ccb32f08f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8188-afe.yaml#
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
+      - const: apll1
+      - const: apll2
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
+  mediatek,etdm-in1-cowork-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm in module.
+    enum:
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+
+  mediatek,etdm-in2-cowork-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm in module.
+    enum:
+      - 0 # etdm1_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+
+  mediatek,etdm-out1-cowork-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm out module.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 3 # etdm2_out
+
+  mediatek,etdm-out2-cowork-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm out module.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+
+patternProperties:
+  "^mediatek,etdm-in[1-2]-chn-disabled$":
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 16
+    description:
+      This is a list of channel IDs which should be disabled.
+      By default, all data received from ETDM pins will be outputed to
+      memory. etdm in supports disable_out in direct mode(w/o interconn),
+      so user can disable the specified channels by the property.
+    uniqueItems: true
+    items:
+      minimum: 0
+      maximum: 15
+
+  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
+    type: boolean
+    description: if present, the etdm data mode is I2S.
+
+  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
+    type: boolean
+    description: if present, the etdm data mode is I2S.
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
+    afe@10b10000 {
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
+                 <&apmixedsys 9>, //CLK_APMIXED_APLL1
+                 <&apmixedsys 10>, //CLK_APMIXED_APLL2
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
+                      "apll1",
+                      "apll2",
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


