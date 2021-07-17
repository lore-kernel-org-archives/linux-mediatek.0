Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B4AC636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9D8613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9D8613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2umCbKiUAQ+1OWfvja5BfEBizt1Jl9e/LGbP1GdTrsg=; b=TTqlFSfvFRam5d
	vQXCvdHNPJ2I4Ggjc4LqZarFLATDbFZpjzAVUrzugsVUVGWUsBvasfP4MSYdSZFHdLVOjIAOND+KY
	VRLP/MR7Bcd2TuL0sLYznWrtzJIMDZ80WyiXbCEMdbLZTctQotBoWGKQXASdFml/Mpb+eXkIlqmcU
	cP6bP4EMDZ8CqSSBZKynbBZ4kIA+xlPrnf982KBwbDXKHRvOnV8R0jwxQWla87KrQ0yTAEOVq6h+p
	83cVaepk517oLQax7ZXAdQfVvYdi8LqYhOWeEMoKDKY8G7N4WP8ztUfdtH0stTbfGLd4gmR28rv4/
	0ewb9lKSbK5N4TiqncyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gFj-006Gs3-PL; Sat, 17 Jul 2021 09:04:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gFK-006GmE-OI; Sat, 17 Jul 2021 09:04:32 +0000
X-UUID: a9ee215521d649eba6667d33e80f025e-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=s+F0oXdISmcRxU4CWmgnLfMpUouC5LuMbTso4wRn5iY=; 
 b=Uefu4/yUBlyq8kuHAQoDFm4+IfZFshvr7dO5rZHpAVoUgN56JJiRURIfFflRR2xsjXItyKQJoS4jElfNMk5wtx/ZSI4WIEPnqK3rfWlALteW8KnT9jQyHrlqxhYFkuZLGTH2fVgJ73hacefqvvzS8Diz/Mq8+Nvdl5Vui2OJMEk=;
X-UUID: a9ee215521d649eba6667d33e80f025e-20210717
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 674143582; Sat, 17 Jul 2021 02:04:27 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:04:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:24 +0800
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
Subject: [PATCH v1 02/10] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Sat, 17 Jul 2021 17:04:00 +0800
Message-ID: <20210717090408.28283-3-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_020430_843598_A615C886 
X-CRM114-Status: GOOD (  16.93  )
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

1. Add ethdr definition file for mt8195 display.
2. Add mediatek,ethdr.yaml to decribe ethdr module in details.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.yaml       |   5 +
 .../display/mediatek/mediatek,ethdr.yaml      | 137 ++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index bb6d28572b48..a339c8be8225 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -235,6 +235,11 @@ properties:
       - items:
           - const: mediatek,mt8195-disp-pseudo-ovl
 
+      # ETHDR: see Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+      # for details.
+      - items:
+          - const: mediatek,mt8195-disp-ethdr
+
   reg:
     description: Physical base address and length of the function block register space.
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
new file mode 100644
index 000000000000..7320350910be
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek ethdr Device Tree Bindings
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Nancy.Lin <nancy.lin@mediatek.com>
+
+description: |
+  ETHDR is designed for HDR video and graphics conversion in the external display path.
+  It handles multiple HDR input types and performs tone mapping, color space/color
+  format conversion, and then combine different layers, output the required HDR or
+  SDR signal to the subsequent display path. This engine is composed of two video
+  frontends, two graphic frontends, one video backend and a mixer.
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
+            mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x4000 0x1000>,
+                                      <&gce1 SUBSYS_1c11XXXX 0x5000 0x1000>,
+                                      <&gce1 SUBSYS_1c11XXXX 0x7000 0x1000>,
+                                      <&gce1 SUBSYS_1c11XXXX 0x9000 0x1000>,
+                                      <&gce1 SUBSYS_1c11XXXX 0xA000 0x1000>,
+                                      <&gce1 SUBSYS_1c11XXXX 0xB000 0x1000>,
+                                      <&gce1 SUBSYS_1c11XXXX 0xC000 0x1000>;
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
+    };
+
+
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
