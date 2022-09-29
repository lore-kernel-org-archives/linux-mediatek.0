Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54D2C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 10:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAN+yaYHQx/FPPYq8F8mxQWc3mQ5C+K0HlQq1xIBa7g=; b=gsfGIa8CIYp29bc/v3wRBwkBUR
	meDOFTmhqnGdIg/EzT2yk6++vl9gu6t+DeCQ66SOFESg4+4HQjY3VDHRuIXKB6jCp7Hp4JYK53RLm
	tzNldbKxJorvqL0U77iNl/g0GXlogZMrm6rgFaQJ2uj5e6SzdxGmJLBnr2wXDLpo9hhYkmeMGvA0m
	T+Fc9S57CRIZfFRqmxHFUN6DuHueOczA1XeWB/g64xvi52ynRmTkvWOnd65AsS5WNbfGfYdBQ3wZq
	OJEiiLRFe/zqnAGL6W+jLGr/gDAd63EVxmSXfnEAPLdVF54q7Syowgmg7RfgKgLKY1VaZ0C+Ve9fS
	TTx5bpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqUE-002KOk-6h; Thu, 29 Sep 2022 10:09:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqU2-002KMl-At; Thu, 29 Sep 2022 10:09:36 +0000
X-UUID: 355d295e2a024d3780339743aff06423-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KAN+yaYHQx/FPPYq8F8mxQWc3mQ5C+K0HlQq1xIBa7g=;
	b=PWff7+wLXVr5PwFwGI5b3fIYuhoeG2GC1ebEEJpKHIc2g3t9QPgj96dhq+mTZ56ZG9zf1ejNHxOSf3g7uEx9H6EcyWdeczwFLuDeOK97L7tnfdGtD700eWrKoO4m9Ge7bnW91rV4eAVW+ioKVzMmwNfvrIBug+UyHMErVW+/W9s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:97957885-dd6d-4b59-8e75-82293c45d5b7,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:6781a5e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 355d295e2a024d3780339743aff06423-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 334290654; Thu, 29 Sep 2022 03:09:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 29 Sep 2022 17:08:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 29 Sep 2022 17:08:19 +0800
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
	<irui.wang@mediatek.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [V17,01/15] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
Date: Thu, 29 Sep 2022 17:08:03 +0800
Message-ID: <20220929090817.24272-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929090817.24272-1-irui.wang@mediatek.com>
References: <20220929090817.24272-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_030934_414396_C26ED713 
X-CRM114-Status: GOOD (  15.20  )
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

Add mediatek,mt8195-jpgenc compatible to binding document.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../media/mediatek,mt8195-jpegenc.yaml        | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
new file mode 100644
index 000000000000..95990539f7c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder
+
+maintainers:
+  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
+
+description:
+  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    const: mediatek,mt8195-jpgenc
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 4
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
+  "^jpgenc@[0-9a-f]+$":
+    type: object
+    description:
+      The jpeg encoder hardware device node which should be added as subnodes to
+      the main jpeg node.
+
+    properties:
+      compatible:
+        const: mediatek,mt8195-jpgenc-hw
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
+          - const: jpgenc
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
+        jpgenc-master {
+            compatible = "mediatek,mt8195-jpgenc";
+            power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+            iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+                     <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+                     <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+                     <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            jpgenc@1a030000 {
+                compatible = "mediatek,mt8195-jpgenc-hw";
+                reg = <0 0x1a030000 0 0x10000>;
+                iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
+                         <&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
+                         <&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
+                         <&iommu_vdo M4U_PORT_L19_JPGENC_BSDMA>;
+                interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys CLK_VENC_JPGENC>;
+                clock-names = "jpgenc";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+            };
+
+            jpgenc@1b030000 {
+                compatible = "mediatek,mt8195-jpgenc-hw";
+                reg = <0 0x1b030000 0 0x10000>;
+                iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
+                         <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
+                         <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
+                         <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
+                interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH 0>;
+                clocks = <&vencsys_core1 CLK_VENC_CORE1_JPGENC>;
+                clock-names = "jpgenc";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
+            };
+        };
+    };
-- 
2.18.0


