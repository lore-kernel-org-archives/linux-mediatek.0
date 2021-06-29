Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA238C11F64
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 01:58:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BECB61CD7
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 01:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BECB61CD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sa2MNQjZMCeZDIAWO+sT0EVETwTM5wQz3Qi4GfPXpv4=; b=Px/V+m+z1qA1Hw
	W61gRaeqFe3v8O5zvh8SmMX31NMBb994L6gqIqUtcAmOLlQAyKYj3GoUv20GxAfz2bXl+5CYZfgDy
	EMi2MShC4BnNG/JZgvZGkHRU4ATDH+Ss1uKL5izcDGBCOQ92f/ujaz2vvX1F7NZEm3eDc4c7Pecn3
	bnCJAMKQya496jKccFlKK5r8zMfTH4ns1v5QDGsh8LFcZS5RbUDIWZL4/s60U2+m3HcIIRh15ICQ6
	K2sd7eDIyef9lcy1qa+bMEq9j22Yi2bzjou+qcjNzj6r4Vrm27ot+rWhP1qW76hGJfAdE7eeN/Lja
	Y2Cp/TIucaefWxyONLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly30i-009ZkQ-74; Tue, 29 Jun 2021 01:58:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly30f-009Zjo-7W; Tue, 29 Jun 2021 01:57:59 +0000
X-UUID: 086b031200e940f2848a8e47b8e9394d-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Z/OJErYyINg1AW+StP8kO9w9kLcU0KrGmMsZtdWVCR0=; 
 b=aqVcPxiwc/SaKEG6DxOUmQxNEXlyqyufaJ2VThr/S7VstKXzO7FuGwOY5mEqq4y230OLUgcgw/L2cRDiI8zU7qDin0LgckZO1qJAXCaiT2a7aWIAaIrj2xC0zhaspzouJGU2UxOXJtbos+A32NFKNGPVky5kW0PcHDKJUZg6Oig=;
X-UUID: 086b031200e940f2848a8e47b8e9394d-20210628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 113625093; Mon, 28 Jun 2021 18:57:56 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 18:47:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 09:47:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 09:47:52 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>
Subject: [PATCH v2 6/8] dt-bindings: mediatek: mt8195: add audio afe document
Date: Tue, 29 Jun 2021 09:47:34 +0800
Message-ID: <20210629014736.31153-7-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210629014736.31153-1-trevor.wu@mediatek.com>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_185757_322954_4F28704F 
X-CRM114-Status: GOOD (  14.17  )
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
 .../bindings/sound/mt8195-afe-pcm.yaml        | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
new file mode 100644
index 000000000000..a4fb5c7dd022
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -0,0 +1,136 @@
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
+      - description: audio 26M clock
+      - description: AFE clock
+      - description: audio infra sys clock
+      - description: audio infra 26M clock
+
+  clock-names:
+    items:
+      - const: clk26m
+      - const: aud_afe
+      - const: infra_ao_audio
+      - const: infra_ao_audio_26m_b
+
+  etdm-in1-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 24
+    description: Specify which input channel should be disabled.
+
+  etdm-in2-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 16
+    description: Specify which input channel should be disabled.
+
+patternProperties:
+  "^etdm-in[1-2]-mclk-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm in mclk source clock.
+    enum:
+      - 0 # xtal_26m_ck
+      - 1 # apll1_ck
+      - 2 # apll2_ck
+      - 3 # apll3_ck
+      - 4 # apll4_ck
+      - 5 # apll5_ck
+      - 6 # hdmirx_apll_ck
+
+  "^etdm-out[1-3]-mclk-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm out mclk source clock.
+
+  "^etdm-in[1-2]-mclk-alwasys-on-rate$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm in mclk output rate for always on case.
+
+  "^etdm-out[1-3]-mclk-alwasys-on-rate$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm out mclk output rate for always on case.
+
+  "^etdm-in[1-2]-data-mode$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm in data mode.
+    enum:
+      - 0 # one pin (TDM)
+      - 1 # multi pin (I2S)
+
+  "^etdm-out[1-3]-data-mode$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm out data mode.
+
+  "^etdm-in[1-2]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm in moudule.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+      - 4 # etdm3_out
+
+  "^etdm-out[1-3]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm out moudule.
+
+required:
+  - compatible
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
+    afe: mt8195-afe-pcm {
+        compatible = "mediatek,mt8195-audio";
+        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+        mediatek,topckgen = <&topckgen>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+        clocks = <&clk26m>,
+                 <&audsys CLK_AUD_AFE>,
+                 <&infracfg_ao CLK_INFRA_AO_AUDIO>,
+                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
+        clock-names = "clk26m",
+                      "aud_afe",
+                      "infra_ao_audio",
+                      "infra_ao_audio_26m_b";
+    };
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
