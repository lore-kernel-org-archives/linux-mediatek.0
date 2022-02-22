Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8185AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ei4NEXNj/95ALM3HuTYk7vIVazbNUbIpZRKiJt/S6WE=; b=e9/JzHJNt+2pKP
	H34LGlWgqNSVsgUZ62cu3wPaXF59x6FES1iDH8RV9P7mhkI+227G98Y5MrKkMKm7GJt7FWOV/H37m
	q13nEWEyeDB4mz6+rogxP5mKHu14hzCLQdBpiFta0QgCgnn/vp/fsSFLIY3+gLSWftSlitbEtbD+r
	tu7LtYuw8SDZSFSh4Xbj7SanZhq8z6eP3RjsMrKyPpl5efKCl52f1K5vmkf8OL/RwXayMjJgXmoH4
	Idrbytrt7gKd1M5ym1e/l2ljqOPUiSPcfzlf59wLP2xWLjlqgX1ma5un7e6eQuHtkkCRsbb71f5q3
	I2W5ewZ+RDnze4EBmYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMSBI-008v3H-WA; Tue, 22 Feb 2022 10:14:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMSAI-008ubQ-Lc; Tue, 22 Feb 2022 10:13:05 +0000
X-UUID: 710d8ba9fe694c4783e80b8e07c08f8e-20220222
X-UUID: 710d8ba9fe694c4783e80b8e07c08f8e-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 192288553; Tue, 22 Feb 2022 03:12:54 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 02:07:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Feb 2022 18:07:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Feb 2022 18:07:42 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v12 03/23] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Tue, 22 Feb 2022 18:07:21 +0800
Message-ID: <20220222100741.30138-4-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220222100741.30138-1-nancy.lin@mediatek.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_021302_744456_91DC5BE3 
X-CRM114-Status: GOOD (  16.16  )
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

Add vdosys1 ETHDR definition.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../display/mediatek/mediatek,ethdr.yaml      | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
new file mode 100644
index 000000000000..131eed5eeeb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Ethdr Device Tree Bindings
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  ETHDR is designed for HDR video and graphics conversion in the external display path.
+  It handles multiple HDR input types and performs tone mapping, color space/color
+  format conversion, and then combine different layers, output the required HDR or
+  SDR signal to the subsequent display path. This engine is composed of two video
+  frontends, two graphic frontends, one video backend and a mixer. ETHDR has two
+  DMA function blocks, DS and ADL. These two function blocks read the pre-programmed
+  registers from DRAM and set them to HW in the v-blanking period.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-disp-ethdr
+  reg:
+    maxItems: 7
+  reg-names:
+    items:
+      - const: mixer
+      - const: vdo_fe0
+      - const: vdo_fe1
+      - const: gfx_fe0
+      - const: gfx_fe1
+      - const: vdo_be
+      - const: adl_ds
+  interrupts:
+    minItems: 1
+  iommus:
+    description: The compatible property is DMA function blocks.
+      Should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
+      details.
+    minItems: 1
+    maxItems: 2
+  clocks:
+    items:
+      - description: mixer clock
+      - description: video frontend 0 clock
+      - description: video frontend 1 clock
+      - description: graphic frontend 0 clock
+      - description: graphic frontend 1 clock
+      - description: video backend clock
+      - description: autodownload and menuload clock
+      - description: video frontend 0 async clock
+      - description: video frontend 1 async clock
+      - description: graphic frontend 0 async clock
+      - description: graphic frontend 1 async clock
+      - description: video backend async clock
+      - description: ethdr top clock
+  clock-names:
+    items:
+      - const: mixer
+      - const: vdo_fe0
+      - const: vdo_fe1
+      - const: gfx_fe0
+      - const: gfx_fe1
+      - const: vdo_be
+      - const: adl_ds
+      - const: vdo_fe0_async
+      - const: vdo_fe1_async
+      - const: gfx_fe0_async
+      - const: gfx_fe1_async
+      - const: vdo_be_async
+      - const: ethdr_top
+  power-domains:
+    maxItems: 1
+  resets:
+    maxItems: 5
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The register of display function block to be set by gce.
+      There are 4 arguments in this property, gce node, subsys id, offset and
+      register size. The subsys id is defined in the gce header of each chips
+      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
+      display function block.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+
+    disp_ethdr@1c114000 {
+            compatible = "mediatek,mt8195-disp-ethdr";
+            reg = <0 0x1c114000 0 0x1000>,
+                  <0 0x1c115000 0 0x1000>,
+                  <0 0x1c117000 0 0x1000>,
+                  <0 0x1c119000 0 0x1000>,
+                  <0 0x1c11A000 0 0x1000>,
+                  <0 0x1c11B000 0 0x1000>,
+                  <0 0x1c11C000 0 0x1000>;
+            reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                        "vdo_be", "adl_ds";
+            mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
+                                      <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;
+            clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+                     <&vdosys1 CLK_VDO1_26M_SLOW>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+                     <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+                     <&topckgen CLK_TOP_ETHDR_SEL>;
+            clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                          "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+                          "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
+                          "ethdr_top";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+            iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
+                     <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
+            interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
+            resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
+                     <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
+    };
+
+...
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
