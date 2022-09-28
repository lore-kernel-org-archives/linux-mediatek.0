Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A98C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B75kdSzqLQ5flgfbhQ6KWKRRYPNufbQY2QqXE0Dmm3I=; b=TYdQDOk8lP58vrxR1GLpk1jHtA
	ti0QVQO6RcxFTnI4/NJGHjQ+O9hC0ek9N4bG4EVuznu6unEo9IJLSVcmsp+f5pjUMvI3RG4QhPrF0
	XUP8mGeV2JWJJ6MoESis7VQ6hJvsOt9+YCzxV/KR5InDgl8IzklLUm9EzR0je/ttgT51qPMTieUfo
	56l1MPs5NqW/ecQD6TEdxsuLJyKVBjdTJL7HWnbmgRf1+xrbLUVLtrtsTHEa89sVFbsLldpctR4hz
	7/UTxdzukULwMmuKujBn8AR41ZDV3boRJB/Sll7PE6DqU2+SGD3/iES1HX75okB25yuHwExe1P2vF
	AKCXFJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTX2-00FHah-Go; Wed, 28 Sep 2022 09:39:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTSt-00FFHv-FF; Wed, 28 Sep 2022 09:34:53 +0000
X-UUID: e97864b6e0fc42f58043907bfccd164a-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B75kdSzqLQ5flgfbhQ6KWKRRYPNufbQY2QqXE0Dmm3I=;
	b=dKsAi6jPf0iiP6l8m2Ic6xTC1iTibKFywxg4xxCtVP03X2SA12h4B32JN4mr3sdZ5a3UOjgqG6DLGZM8jKbiBqXmYrSKzskgr2j70LC9LXW28JgwjCZyFyAqtRUAGmxIz7dPSVjTP5FGiTMziv+oLDetxK8p2rwZSZiTzyzYgmA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5645cb7b-cd23-45da-93bf-01c18832df1b,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d8804e07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e97864b6e0fc42f58043907bfccd164a-20220928
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1322407861; Wed, 28 Sep 2022 02:34:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 17:33:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 17:33:15 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>, kyrie wu
	<kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, irui wang
	<irui.wang@mediatek.com>, Rob Herring <robh@kernel.org>
Subject: [V16,08/15] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
Date: Wed, 28 Sep 2022 17:32:51 +0800
Message-ID: <20220928093258.32384-9-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928093258.32384-1-irui.wang@mediatek.com>
References: <20220928093258.32384-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_023451_581411_206A3233 
X-CRM114-Status: GOOD (  15.66  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add mediatek,mt8195-jpgdec compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
new file mode 100644
index 000000000000..1e81de4f1301
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder Device Tree Bindings
+
+maintainers:
+  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description:
+  MediaTek JPEG Decoder is the JPEG decode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    const: mediatek,mt8195-jpgdec
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 6
+    description:
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+# Required child node:
+patternProperties:
+  "^jpgdec@[0-9a-f]+$":
+    type: object
+    description:
+      The jpeg decoder hardware device node which should be added as subnodes to
+      the main jpeg node.
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgdec-hw
+
+      reg:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description:
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: jpgdec
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - iommus
+      - interrupts
+      - clocks
+      - clock-names
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - power-domains
+  - iommus
+  - dma-ranges
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8195-memory-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        jpgdec-master {
+            compatible = "mediatek,mt8195-jpgdec";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+            iommus = <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA0>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA0>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            jpgdec@1a040000 {
+                compatible = "mediatek,mt8195-jpgdec-hw";
+                reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
+                iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys CLK_VENC_JPGDEC>;
+                clock-names = "jpgdec";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+            };
+
+            jpgdec@1a050000 {
+                compatible = "mediatek,mt8195-jpgdec-hw";
+                reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
+                iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                         <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+                interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys CLK_VENC_JPGDEC_C1>;
+                clock-names = "jpgdec";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+            };
+
+            jpgdec@1b040000 {
+                compatible = "mediatek,mt8195-jpgdec-hw";
+                reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
+                iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
+                         <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
+                         <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
+                         <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA1>,
+                         <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET1>,
+                         <&iommu_vpp M4U_PORT_L20_JPGDEC_BUFF_OFFSET0>;
+                interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGDEC>;
+                clock-names = "jpgdec";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC2>;
+            };
+        };
+    };
-- 
2.18.0


