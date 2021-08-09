Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275CEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDBDD60EC0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDBDD60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Iz2hibbgxIwfJriyeLfj7mbsMFI8zCmCWFsXt2Krfc=; b=UFEPkNuLZzDRRE
	iEeLG9bXeK0L9QfkruT6cO6lyVlxdSLVPoYyyRu+6CiXigohddyVlF2xZozGookjW10R0UJAh+9VO
	XsRE13WEWtWeUF+cP+gxg/KskTRvCE8lGfv9MNae0UHL5gDVso0+BIOIISU0xzHgpDbF16DPNn911
	Kwad/dcbecky5mPtE5cDAsHpb8nH8dWijx8iMLk38CdVRD8ElshI7tu2g9sqdZQkeXPRI+X37yD0+
	XMyIQdkj9A1/AkTjXfTB8txoiZmF5B84qcLE0X/JScxFRbf/+MCUwp7vbhrSemEFmlphFq50bBDmz
	B/Msv3SqgH/xwMp0fF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD1uL-0003zm-1K; Mon, 09 Aug 2021 09:49:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD1u7-0003uh-Eg; Mon, 09 Aug 2021 09:49:10 +0000
X-UUID: 0da846378d4541dba5ddaa4ed8b6b489-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jAACT/u3ryxjbgKwnVyDlaI5Uq379l6+zwVkwtXSpQQ=; 
 b=pTE2c1XKULWuR0ZJE2WlAHtR7kEO0FttCHnh+w1iuwla5X3M0dRyWL/YoQzsSqJxNV7qP2+HhqGyjsBy5KZut1LgJC1O8ZqLFMhnj/2hHFoP2frsjvJ1fmF+B+X0BdMGPKYWEOK857JnyDqDfVEwHagBPbJsJn0S86IAxkXVqNI=;
X-UUID: 0da846378d4541dba5ddaa4ed8b6b489-20210809
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 712798588; Mon, 09 Aug 2021 02:49:02 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 02:49:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 17:48:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 17:48:59 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>, <wenst@chromium.org>
Subject: [PATCH v3 7/9] dt-bindings: mediatek: mt8195: add audio afe document
Date: Mon, 9 Aug 2021 17:48:53 +0800
Message-ID: <20210809094855.7169-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210809094855.7169-1-trevor.wu@mediatek.com>
References: <20210809094855.7169-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_024907_592385_92433416 
X-CRM114-Status: GOOD (  15.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds mt8195 audio afe document.

In order to support dynamic clock reparenting for ADDA and ETDM, PLL
and MUX clocks are requested even though they are not consumed by afe
directly.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
This patch depends on the following series that have not been accepted.

[1] Mediatek MT8195 clock support
https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
(dt-bindings/clock/mt8195-clk.h is included)

[2] Mediatek MT8195 power domain support
https://patchwork.kernel.org/project/linux-mediatek/list/?series=500709
(dt-bindings/power/mt8195-power.h is included)
---
---
 .../bindings/sound/mt8195-afe-pcm.yaml        | 184 ++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
new file mode 100644
index 000000000000..53e9434a6d9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8195-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8195
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8195-audio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,topckgen:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
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
+      - description: audio infra 26M clock
+      - description: infra bus clock
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
+      - const: infra_ao_audio_26m_b
+      - const: scp_adsp_audiodsp
+
+  mediatek,etdm-in1-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 24
+    description: Specify which input channel should be disabled.
+
+  mediatek,etdm-in2-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 16
+    description: Specify which input channel should be disabled.
+
+patternProperties:
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
+  - mediatek,topckgen
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    afe: mt8195-afe-pcm@10890000 {
+        compatible = "mediatek,mt8195-audio";
+        reg = <0x10890000 0x10000>;
+        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+        mediatek,topckgen = <&topckgen>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+        clocks = <&clk26m>,
+                 <&topckgen CLK_TOP_APLL1>,
+                 <&topckgen CLK_TOP_APLL2>,
+                 <&topckgen CLK_TOP_APLL12_DIV0>,
+                 <&topckgen CLK_TOP_APLL12_DIV1>,
+                 <&topckgen CLK_TOP_APLL12_DIV2>,
+                 <&topckgen CLK_TOP_APLL12_DIV3>,
+                 <&topckgen CLK_TOP_APLL12_DIV9>,
+                 <&topckgen CLK_TOP_A1SYS_HP_SEL>,
+                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_AUDIO_H_SEL>,
+                 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS_SEL>,
+                 <&topckgen CLK_TOP_DPTX_M_SEL>,
+                 <&topckgen CLK_TOP_I2SO1_M_SEL>,
+                 <&topckgen CLK_TOP_I2SO2_M_SEL>,
+                 <&topckgen CLK_TOP_I2SI1_M_SEL>,
+                 <&topckgen CLK_TOP_I2SI2_M_SEL>,
+                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
+                 <&scp_adsp CLK_SCP_ADSP_AUDIODSP>;
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
+                      "infra_ao_audio_26m_b",
+                      "scp_adsp_audiodsp";
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
